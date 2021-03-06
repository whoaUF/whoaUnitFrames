---------------------------------------------------
-- whoa UnitFrames 7.1-u1 - 30/10/2016
---------------------------------------------------
-- Configuration -> config.lua
-- NOT HERE!
---------------------------------------------------
local whoa = {}
local config = whoaUnitFrames.config
local color = nil
local h, hMax, hPercent, m, mMax, mPercent = 0

-- aura positioning constants
local AURA_START_X = 5;
local AURA_START_Y = 28;
local AURA_OFFSET_Y = 3;
local LARGE_AURA_SIZE = config.largeAuraSize
local SMALL_AURA_SIZE = config.smallAuraSize
local AURA_ROW_WIDTH = 122;
local TOT_AURA_ROW_WIDTH = 101;
local NUM_TOT_AURA_ROWS = 2;

-- focus frame scales
local LARGE_FOCUS_SCALE = 1;
local SMALL_FOCUS_SCALE = 0.75;
local SMALL_FOCUS_UPSCALE = 1.333;

---------------------------------------------------
-- Custom Fons Size
---------------------------------------------------
local customFontSize = config.customFontSize
if not config.customFontSize then
    customFontSize = 10
end

---------------------------------------------------
-- Hit Indicators
---------------------------------------------------
if not config.hitIndicators then
    PlayerHitIndicator:SetText(nil)
    PlayerHitIndicator.SetText = function() end
    PetHitIndicator:SetText(nil)
    PetHitIndicator.SetText = function() end
end

---------------------------------------------------
-- Pet frame
---------------------------------------------------
if config.petFrameOnTop then
    PetFrame:ClearAllPoints()
    PetFrame:SetPoint("CENTER", PlayerFrame, "CENTER", -20, 60)
    PetFrame.SetPoint = function() end
end

---------------------------------------------------
-- CVAR
---------------------------------------------------
function whoa:showPercent()
    if GetCVar("statusTextDisplay") == "NUMERIC" then
        return false
    else
        return true
    end
end

---------------------------------------------------
-- Class Color
---------------------------------------------------
-- if config.classColor then
    -- local function color(statusbar, unit)
        -- local _, class, c
        -- if UnitIsPlayer(unit) and UnitIsConnected(unit) and unit == statusbar.unit and UnitClass(unit) then
                -- _, class = UnitClass(unit)
                -- c = CUSTOM_CLASS_COLORS and CUSTOM_CLASS_COLORS[class] or RAID_CLASS_COLORS[class]
                -- statusbar:SetStatusBarColor(c.r, c.g, c.b)
        -- end
    -- end
    -- hooksecurefunc("UnitFrameHealthBar_Update", color)
    -- hooksecurefunc("HealthBar_OnValueChanged", function(self)
        -- color(self, self.unit)
    -- end)
-- end

---------------------------------------------------
-- PowerBar Animation
---------------------------------------------------
if config.disableStatusGlow == false or not config.disableStatusGlow then
    PowerBarColor["RAGE"] = { r = 1.00, g = 0.00, b = 0.00, fullPowerAnim=true };
    PowerBarColor["FOCUS"] = { r = 1.00, g = 0.50, b = 0.25, fullPowerAnim=true };
    PowerBarColor["ENERGY"] = { r = 1.00, g = 1.00, b = 0.00, fullPowerAnim=true };
    PowerBarColor["RUNIC_POWER"] = { r = 0.00, g = 0.82, b = 1.00, fullPowerAnim=true };
    PowerBarColor["MAELSTROM"] = { r = 0.00, g = 0.50, b = 1.00, atlas = "_Shaman-MaelstromBar", fullPowerAnim=true };
    PowerBarColor["INSANITY"] = { r = 0.40, g = 0, b = 0.80, atlas = "_Priest-InsanityBar"};
    PowerBarColor["FURY"] = { r = 0.788, g = 0.259, b = 0.992, atlas = "_DemonHunter-DemonicFuryBar", fullPowerAnim=true };
    PowerBarColor["PAIN"] = { r = 255/255, g = 156/255, b = 0, atlas = "_DemonHunter-DemonicPainBar", fullPowerAnim=true };
elseif config.disableStatusGlow == true then
    PowerBarColor["RAGE"] = { r = 1.00, g = 0.00, b = 0.00, fullPowerAnim=false };
    PowerBarColor["FOCUS"] = { r = 1.00, g = 0.50, b = 0.25, fullPowerAnim=false };
    PowerBarColor["ENERGY"] = { r = 1.00, g = 1.00, b = 0.00, fullPowerAnim=false };
    PowerBarColor["RUNIC_POWER"] = { r = 0.00, g = 0.82, b = 1.00, fullPowerAnim=false };
    PowerBarColor["MAELSTROM"] = { r = 0.00, g = 0.50, b = 1.00, atlas = "_Shaman-MaelstromBar", fullPowerAnim=false };
    PowerBarColor["INSANITY"] = { r = 0.40, g = 0, b = 0.80, atlas = "_Priest-InsanityBar"};
    PowerBarColor["FURY"] = { r = 0.788, g = 0.259, b = 0.992, atlas = "_DemonHunter-DemonicFuryBar", fullPowerAnim=false };
    PowerBarColor["PAIN"] = { r = 255/255, g = 156/255, b = 0, atlas = "_DemonHunter-DemonicPainBar", fullPowerAnim=false };
end

if config.disableStatusPred == false or not config.disableStatusPred then
    PlayerFrameManaBar.FeedbackFrame:Show()
elseif config.disableStatusPred == true then
    PlayerFrameManaBar.FeedbackFrame:Hide()
end

---------------------------------------------------
-- Classification
---------------------------------------------------
function whoa_CheckClassification (self, forceNormalTexture)
    local classification = UnitClassification(self.unit);
    self.nameBackground:Hide();
    self.threatIndicator:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Flash");
    if ( forceNormalTexture ) then
        self.borderTexture:SetTexture("Interface\\Addons\\whoaUnitFrames\\media\\UI-TargetingFrame");
    elseif ( classification == "minus" ) then
        self.borderTexture:SetTexture("Interface\\Addons\\whoaUnitFrames\\media\\UI-TargetingFrame");
        forceNormalTexture = true;
    elseif ( classification == "worldboss" or classification == "elite" ) then
        self.borderTexture:SetTexture("Interface\\Addons\\whoaUnitFrames\\media\\UI-TargetingFrame-Elite");
    elseif ( classification == "rareelite" ) then
        self.borderTexture:SetTexture("Interface\\Addons\\whoaUnitFrames\\media\\UI-TargetingFrame-Rare-Elite");
    elseif ( classification == "rare" ) then
        self.borderTexture:SetTexture("Interface\\Addons\\whoaUnitFrames\\media\\UI-TargetingFrame-Rare");
    else
        self.borderTexture:SetTexture("Interface\\Addons\\whoaUnitFrames\\media\\UI-TargetingFrame");
        forceNormalTexture = true;
    end
    if ( self.threatIndicator ) then
        if ( classification == "minus" ) then
            self.threatIndicator:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Flash");
            self.threatIndicator:SetTexCoord(0, 0.9453125, 0, 0.181640625);
            self.threatIndicator:SetWidth(242);
            self.threatIndicator:SetHeight(93);
            self.threatIndicator:SetPoint("TOPLEFT", self, "TOPLEFT", -24, 0);
        end
    end
end

---------------------------------------------------
-- Player Frame
---------------------------------------------------
function whoa:playerFrame()
    if not UnitHasVehicleUI("player") then
        PlayerFrameTexture:SetTexture("Interface\\Addons\\whoaUnitFrames\\media\\UI-TargetingFrame")
        PlayerName:Hide()
        PlayerFrameGroupIndicatorText:ClearAllPoints()
        PlayerFrameGroupIndicatorText:SetPoint("BOTTOMLEFT", PlayerFrame,"TOP",0,-20)
        PlayerFrameGroupIndicatorLeft:Hide()
        PlayerFrameGroupIndicatorMiddle:Hide()
        PlayerFrameGroupIndicatorRight:Hide()
        PlayerFrameHealthBar:SetPoint("TOPLEFT",106,-24)
        PlayerFrameHealthBar:SetHeight(18)
        PlayerFrameHealthBar.LeftText:ClearAllPoints()
        PlayerFrameHealthBar.LeftText:SetPoint("LEFT",PlayerFrameHealthBar,"LEFT",5,0)
        PlayerFrameHealthBar.RightText:ClearAllPoints()
        PlayerFrameHealthBar.RightText:SetPoint("RIGHT",PlayerFrameHealthBar,"RIGHT",-5,0)
        PlayerFrameHealthBarText:SetPoint("CENTER", PlayerFrameHealthBar, "CENTER", 0, 0)
        PlayerFrameHealthBarText:SetFont(STANDARD_TEXT_FONT, customFontSize, "OUTLINE")
        PlayerFrameManaBar:SetPoint("TOPLEFT",106,-45)
        PlayerFrameManaBar:SetHeight(18)
        PlayerFrameManaBar.LeftText:ClearAllPoints()
        PlayerFrameManaBar.LeftText:SetPoint("LEFT",PlayerFrameManaBar,"LEFT",5,0)
        PlayerFrameManaBar.RightText:ClearAllPoints()
        PlayerFrameManaBar.RightText:SetPoint("RIGHT",PlayerFrameManaBar,"RIGHT",-5,0)
        PlayerFrameManaBarText:SetPoint("CENTER",PlayerFrameManaBar,"CENTER",0,0)
        PlayerFrameManaBarText:SetFont(STANDARD_TEXT_FONT, customFontSize, "OUTLINE")
        PlayerFrameManaBar.FeedbackFrame:ClearAllPoints()
        PlayerFrameManaBar.FeedbackFrame:SetPoint("CENTER",PlayerFrameManaBar,"CENTER",0,0)
        PlayerFrameManaBar.FeedbackFrame:SetHeight(18)
        PlayerFrameManaBar.FullPowerFrame.SpikeFrame.AlertSpikeStay:ClearAllPoints()
        PlayerFrameManaBar.FullPowerFrame.SpikeFrame.AlertSpikeStay:SetPoint("CENTER", PlayerFrameManaBar.FullPowerFrame, "RIGHT", -6, -3)
        PlayerFrameManaBar.FullPowerFrame.SpikeFrame.AlertSpikeStay:SetSize(30,29)
        PlayerFrameManaBar.FullPowerFrame.PulseFrame:ClearAllPoints()
        PlayerFrameManaBar.FullPowerFrame.PulseFrame:SetPoint("CENTER", PlayerFrameManaBar.FullPowerFrame,"CENTER",-6,-2)
        PlayerFrameManaBar.FullPowerFrame.SpikeFrame.BigSpikeGlow:ClearAllPoints()
        PlayerFrameManaBar.FullPowerFrame.SpikeFrame.BigSpikeGlow:SetPoint("CENTER",PlayerFrameManaBar.FullPowerFrame,"RIGHT",5,-4)
        PlayerFrameManaBar.FullPowerFrame.SpikeFrame.BigSpikeGlow:SetSize(30,50)
        else
        PlayerFrameHealthBar:SetHeight(12)
        PlayerFrameManaBar:SetHeight(12)
    end

    if ( config.classColor == true ) then
        color = RAID_CLASS_COLORS[select(2, UnitClass("player"))]
        PlayerFrameHealthBar:SetStatusBarColor(color.r, color.g, color.b)
        PlayerFrameHealthBar.lockColor = true
    end

    if config.scale then
        PlayerFrame:SetScale(config.scale)
    end
end
local function whoa_playerFrame()
    whoa:playerFrame()
end
hooksecurefunc("PlayerFrame_UpdateArt", whoa_playerFrame)
hooksecurefunc("PlayerFrame_SequenceFinished", whoa_playerFrame)

---------------------------------------------------
-- Target Frame
---------------------------------------------------
function whoa:targetFrame()
    TargetFrame.deadText:ClearAllPoints()
    TargetFrame.deadText:SetPoint("CENTER", TargetFrameHealthBar, "CENTER",0,0)
    TargetFrameTextureFrameName:SetPoint("BOTTOMRIGHT", TargetFrame, "TOP",0,-20)
    TargetFrameHealthBar:SetPoint("TOPLEFT", 5, -24)
    TargetFrameHealthBar:SetHeight(18)
    TargetFrameTextureFrameHealthBarText:ClearAllPoints()
    TargetFrameTextureFrameHealthBarText:SetPoint("CENTER", TargetFrameHealthBar, "CENTER", 0, 0)
    TargetFrameManaBar:ClearAllPoints()
    TargetFrameManaBar:SetPoint("TOPLEFT", 5, -45)
    TargetFrameManaBar:SetHeight(18)
    TargetFrameTextureFrameManaBarText:SetPoint("CENTER", TargetFrameManaBar, "CENTER", 0, 0)
    TargetFrame.threatNumericIndicator:SetPoint("BOTTOM", PlayerFrame, "TOP", 75, -22)
    TargetFrameHealthBar.LeftText:ClearAllPoints()
    TargetFrameHealthBar.LeftText:SetPoint("LEFT", TargetFrameHealthBar, "LEFT", 5, 0)
    TargetFrameHealthBar.RightText:ClearAllPoints()
    TargetFrameHealthBar.RightText:SetPoint("RIGHT", TargetFrameHealthBar, "RIGHT", -5, 0)
    TargetFrameManaBar.LeftText:ClearAllPoints()
    TargetFrameManaBar.LeftText:SetPoint("LEFT", TargetFrameManaBar, "LEFT", 5, 0)
    TargetFrameManaBar.RightText:ClearAllPoints()
    TargetFrameManaBar.RightText:SetPoint("RIGHT", TargetFrameManaBar, "RIGHT", -3, 0)
    TargetFrameTextureFrameHealthBarText:SetFont(STANDARD_TEXT_FONT, customFontSize, "OUTLINE")
    TargetFrameTextureFrameManaBarText:SetFont(STANDARD_TEXT_FONT, customFontSize, "OUTLINE")
    if config.scale then
        TargetFrame:SetScale(config.scale)
    end
end

function whoa:targetChanged()
    TargetFrameBackground:SetHeight(40)
    TargetFrameBackground:ClearAllPoints()
    TargetFrameBackground:SetPoint("RIGHT", TargetFrame, "CENTER",9,7)
    if ( config.classColor == true ) then
        if UnitIsPlayer("target") then
            color = RAID_CLASS_COLORS[select(2, UnitClass("target"))]
        else
            color = FACTION_BAR_COLORS[UnitReaction("target", "player")]
        end
        if ( not UnitPlayerControlled("target") and UnitIsTapDenied("target") ) then
            TargetFrameHealthBar:SetStatusBarColor(0.5, 0.5, 0.5)
        else
            if color then
                TargetFrameHealthBar:SetStatusBarColor(color.r, color.g, color.b)
                TargetFrameHealthBar.lockColor = true
            end
        end
    end
end

local function whoa_targetChanged()
    whoa:targetChanged()
end
hooksecurefunc("TargetFrame_CheckFaction", whoa_targetChanged)
hooksecurefunc("TargetFrame_CheckClassification", whoa_CheckClassification)

---------------------------------------------------
-- Focus Frame
---------------------------------------------------
function whoa:focusFrame()
    FocusFrame.deadText:ClearAllPoints()
    FocusFrame.deadText:SetPoint("CENTER", FocusFrameHealthBar, "CENTER", 0, 0)
    FocusFrameHealthBar:SetPoint("TOPLEFT", 5, -24)
    FocusFrameHealthBar:SetHeight(18)
    FocusFrameManaBar:SetPoint("TOPLEFT", 5, -45)
    FocusFrameManaBar:SetHeight(18)
    FocusFrame.threatNumericIndicator:SetWidth(0.01)
    FocusFrame.threatNumericIndicator.bg:Hide()
    FocusFrame.threatNumericIndicator.text:Hide()
    FocusFrameTextureFrameHealthBarText:ClearAllPoints()
    FocusFrameTextureFrameHealthBarText:SetPoint("CENTER", FocusFrameHealthBar, "CENTER", 0, 0)
    FocusFrameTextureFrameManaBarText:ClearAllPoints()
    FocusFrameTextureFrameManaBarText:SetPoint("CENTER", FocusFrameManaBar, "CENTER", 0, 0)
    FocusFrameHealthBar.LeftText:ClearAllPoints()
    FocusFrameHealthBar.LeftText:SetPoint("LEFT", FocusFrameHealthBar, "LEFT", 5, 0)
    FocusFrameHealthBar.RightText:ClearAllPoints()
    FocusFrameHealthBar.RightText:SetPoint("RIGHT", FocusFrameHealthBar, "RIGHT", -5, 0)
    FocusFrameManaBar.LeftText:ClearAllPoints()
    FocusFrameManaBar.LeftText:SetPoint("LEFT", FocusFrameManaBar, "LEFT", 5, 0)
    FocusFrameManaBar.RightText:ClearAllPoints()
    FocusFrameManaBar.RightText:SetPoint("RIGHT", FocusFrameManaBar, "RIGHT", -5, 0)
    FocusFrameTextureFrameHealthBarText:SetFont(STANDARD_TEXT_FONT, customFontSize, "OUTLINE")
    FocusFrameTextureFrameManaBarText:SetFont(STANDARD_TEXT_FONT, customFontSize, "OUTLINE")
    if config.scale then
        FocusFrame:SetScale(config.scale)
    end
end

function whoa:focusChanged()
    FocusFrameBackground:SetHeight(42)
    FocusFrameBackground:ClearAllPoints()
    FocusFrameBackground:SetPoint("RIGHT", FocusFrame, "CENTER",9,7)
    if ( config.classColor == true ) then
        if UnitIsPlayer("focus") then
            color = RAID_CLASS_COLORS[select(2, UnitClass("focus"))]
        else
            color = FACTION_BAR_COLORS[UnitReaction("focus", "player")]
        end
        if ( not UnitPlayerControlled("focus") and UnitIsTapDenied("focus") ) then
            FocusFrameHealthBar:SetStatusBarColor(0.5, 0.5, 0.5)
        else
            if color then
                FocusFrameHealthBar:SetStatusBarColor(color.r, color.g, color.b)
                FocusFrameHealthBar.lockColor = true
            end
        end
    end
end

---------------------------------------------------
-- Target of Target/Focus Frame
---------------------------------------------------
function whoa:totFrame()
    -- # TargetOfTarget
    TargetFrameToTHealthBar:ClearAllPoints()
    TargetFrameToTHealthBar:SetPoint("TOPLEFT", 44, -15)
    TargetFrameToTHealthBar:SetHeight(10)
    TargetFrameToTManaBar:ClearAllPoints()
    TargetFrameToTManaBar:SetPoint("TOPLEFT", 44, -25)
    TargetFrameToTManaBar:SetHeight(5)
    -- # TargetOfFocus
    FocusFrameToTHealthBar:ClearAllPoints()
    FocusFrameToTHealthBar:SetPoint("TOPLEFT", 45, -15)
    FocusFrameToTHealthBar:SetHeight(10)
    FocusFrameToTManaBar:ClearAllPoints()
    FocusFrameToTManaBar:SetPoint("TOPLEFT", 45, -25)
    FocusFrameToTManaBar:SetHeight(5)
    FocusFrameToT.deadText:SetWidth(0.01)
end

---------------------------------------------------
-- Text
---------------------------------------------------
function whoa:createFrame(name, parent, point, xOffset, yOffset, width, alignment)
    local f = CreateFrame("Frame", name, parent)
    f:SetPoint(point, parent, point, xOffset, yOffset)
    f:SetWidth(width)
    f:SetHeight(20)
    f.text = f:CreateFontString(name.."text", "OVERLAY")
    f.text:SetAllPoints(f)
    f.text:SetFontObject(TextStatusBarText)
    f.text:SetJustifyH(alignment)
end

---------------------------------------------------
-- TOT FRAME FIX
---------------------------------------------------
if config.showToTName then
    whoa:createFrame("ftot", TargetFrame, "RIGHT", 170, -15, 200, "LEFT")
    -- local tot = CreateFrame("Button","whoaToT",TargetFrame,"TargetofTargetFrameTemplate")
    -- tot:SetPoint("CENTER",0,0)
    -- tot:SetWidth(80)
    -- tot:SetHeight(22)
    -- tot:Show()
    -- TargetFrame.totFrame:Show()
    -- TargetofTargetFrame.Show()
    function whoa:targetoftarget()
        if (UnitName("targettarget") ~= nil) then
            _G["ftot"].text:SetText(UnitName("targettarget"))
        else
            _G["ftot"].text:SetText("")
        end
    end
    -- TargetFrame:HookScript("OnUpdate", function(self, ...)
        -- whoa:targetoftarget()
    -- end)
    local total = 0
    local function onUpdate(self,elapsed)
        total = total + elapsed
        if total >= 0.2 then
            whoa:targetoftarget()
            total = 0
        end
    end
    _G["ftot"]:SetScript("OnUpdate", onUpdate)
end

whoa:createFrame("fplayerdead",			PlayerFrameHealthBar, "CENTER", 0, 0, 200, "CENTER")
whoa:createFrame("fplayerpercent",		PlayerFrameHealthBar, "LEFT", 0, 0, 40, "RIGHT")
if config.showMaxHealth then
    whoa:createFrame("fplayerhealth",	PlayerFrameHealthBar, "RIGHT", -5, 5, 75, "RIGHT")
else
    whoa:createFrame("fplayerhealth",	PlayerFrameHealthBar, "RIGHT", -5, 0, 75, "RIGHT")
end
whoa:createFrame("fplayerhealthmax",	PlayerFrameHealthBar, "RIGHT", -5, -5, 75, "RIGHT")
whoa:createFrame("fplayermanapercent",	PlayerFrameManaBar, "LEFT",	0, 0, 40, "RIGHT")
whoa:createFrame("fplayermana",			PlayerFrameManaBar, "RIGHT", -5, 0, 75, "RIGHT")
whoa:createFrame("ftargetdead",			TargetFrameHealthBar, "CENTER", 0, 0, 200, "CENTER")
whoa:createFrame("ftargetoffline",		TargetFrameManaBar, "CENTER", 0, 0, 200, "CENTER")
whoa:createFrame("ftargetpercent",		TargetFrameHealthBar, "LEFT", 0, 0, 40, "RIGHT")
if config.showMaxHealth then
    whoa:createFrame("ftargethealth",	TargetFrameHealthBar, "RIGHT", -5, 5, 75, "RIGHT")
else
    whoa:createFrame("ftargethealth",	TargetFrameHealthBar, "RIGHT", -5, 0, 75, "RIGHT")
end
whoa:createFrame("ftargethealthmax",	TargetFrameHealthBar, "RIGHT", -5, -5, 75, "RIGHT")
whoa:createFrame("ftargetmanapercent",	TargetFrameManaBar, "LEFT", 0, 0, 40, "RIGHT")
whoa:createFrame("ftargetmana",			TargetFrameManaBar, "RIGHT", -5, 0, 75, "RIGHT")
whoa:createFrame("ffocusdead",			FocusFrameHealthBar, "CENTER", 0, 0, 200, "CENTER")
whoa:createFrame("ffocusoffline",		FocusFrameManaBar, "CENTER", 0, 0, 200, "CENTER")
whoa:createFrame("ffocuspercent",		FocusFrameHealthBar, "LEFT", 0, 0, 40, "RIGHT")
if config.showMaxHealth then
    whoa:createFrame("ffocushealth",	FocusFrameHealthBar, "RIGHT", -5, 5, 75, "RIGHT")
else
    whoa:createFrame("ffocushealth",	FocusFrameHealthBar, "RIGHT", -5, 0, 75, "RIGHT")
end
whoa:createFrame("ffocushealthmax",		FocusFrameHealthBar, "RIGHT", -5, -5, 75, "RIGHT")
whoa:createFrame("ffocusmanapercent",	FocusFrameManaBar, "LEFT", 0, 0, 40, "RIGHT")
whoa:createFrame("ffocusmana",			FocusFrameManaBar, "RIGHT", -5, 0, 75, "RIGHT")

if config.customStatusText then
    ftargetoffline.text:SetText(config.phrases["Offline"])
    ffocusoffline.text:SetText(config.phrases["Offline"])
end

function whoa:round(n, dp)
    return math.floor((n * 10^dp) + .5) / (10^dp)
end

function whoa:format(n)
    if not config.customStatusText then
        return n
    end
    local strLen = strlen(n)
--  if config.simpleHealth and n > 999999999 then
    if config.simpleHealth and strLen > 20 then
        return whoa:round(n/1e9, 1)..config.phrases["giga"]
--  elseif config.simpleHealth and n > 999999 then
    elseif config.simpleHealth and strLen > 6 then
        return whoa:round(n/1e6, 1)..config.phrases["mega"]
--  elseif config.simpleHealth and strLen > 6 then -- no simpleHealth under 100.000
    elseif config.simpleHealth and n > 99999 then -- no simpleHealth under 199.999
        return whoa:round(n/1e3, 0)..config.phrases["kilo"]
    elseif config.thousandSeparators then
        local left, num, right = string.match(n, '^([^%d]*%d)(%d*)(,-)')
        return left..(num:reverse():gsub('(%d%d%d)', '%1'..config.phrases["1000 separator"]):reverse())..right
    else
        return n
    end
end

function whoa:unitText(unit)
    if config.customStatusText and (unit == "player" or unit == "target" or unit == "focus") then
        h = UnitHealth(unit)
        hMax = UnitHealthMax(unit)
        if UnitIsDeadOrGhost(unit) then
            _G["f"..unit.."health"]:Hide()
            _G["f"..unit.."healthmax"]:Hide()
            _G["f"..unit.."percent"]:Hide()
            _G["f"..unit.."dead"]:Show()
            if UnitIsGhost(unit) then
                _G["f"..unit.."dead"].text:SetText(config.phrases["Ghost"])
            else
                _G["f"..unit.."dead"].text:SetText(config.phrases["Dead"])
            end
        else
            _G["f"..unit.."dead"]:Hide()
            if (unit == "player" and GetCVarBool("statusText"))
            or (not (unit == "player") and GetCVarBool("statusText"))
            then
                _G["f"..unit.."health"]:Show()
                _G["f"..unit.."health"].text:SetText(whoa:format(h))
                if config.showMaxHealth then
                    _G["f"..unit.."healthmax"]:Show()
                    _G["f"..unit.."healthmax"].text:SetText(whoa:format(hMax))
                end
                if whoa:showPercent() then
                    if hMax > 0 then
                        hPercent = math.floor((h / hMax) * 100)
                        _G["f"..unit.."percent"]:Show()
                        _G["f"..unit.."percent"].text:SetText(hPercent.."%")
                    end
                else
                    _G["f"..unit.."percent"]:Hide()
                end
            else
                _G["f"..unit.."health"]:Hide()
                _G["f"..unit.."healthmax"]:Hide()
                _G["f"..unit.."percent"]:Hide()
            end
        end
        m = UnitPower(unit)
        if m > 0 then
            if UnitIsDeadOrGhost(unit) then
                _G["f"..unit.."mana"]:Hide()
                _G["f"..unit.."manapercent"]:Hide()
            elseif (unit == "player" and GetCVarBool("statusText"))
                or (not (unit == "player") and GetCVarBool("statusText"))
            then
                _G["f"..unit.."mana"]:Show()
                _G["f"..unit.."mana"].text:SetText(whoa:format(m))
                local showManaPercent = false
                if config.autoManaPercent then
                    if UnitPowerType(unit) == 0 then
                        showManaPercent = true
                    end
                end
                if whoa:showPercent() and showManaPercent then
                    mMax = UnitPowerMax(unit)
                    if mMax > 0 then
                        mPercent = math.floor((m / mMax) * 100)
                        _G["f"..unit.."manapercent"]:Show()
                        _G["f"..unit.."manapercent"].text:SetText(mPercent.."%")
                    end
                else
                    _G["f"..unit.."manapercent"]:Hide()
                end
            else
                _G["f"..unit.."mana"]:Hide()
                _G["f"..unit.."manapercent"]:Hide()
            end
        else
            _G["f"..unit.."mana"]:Hide()
            _G["f"..unit.."manapercent"]:Hide()
        end
        if unit == "target" or unit == "focus" then
            if UnitIsConnected(unit) then
                _G["f"..unit.."offline"]:Hide()
            else
                _G["f"..unit.."offline"]:Show()
                _G["f"..unit.."mana"]:Hide()
                _G["f"..unit.."manapercent"]:Hide()
            end
        end
    end
end

---------------------------------------------------
-- TARGETBUFFS
---------------------------------------------------
function whoa:targetUpdateAuraPositions(self, auraName, numAuras, numOppositeAuras, largeAuraList, updateFunc, maxRowWidth, offsetX, mirrorAurasVertically)
    local size
    local offsetY = AURA_OFFSET_Y
    local rowWidth = 0
    local firstBuffOnRow = 1
    for i=1, numAuras do
        if ( largeAuraList[i] ) then
            size = LARGE_AURA_SIZE
            offsetY = AURA_OFFSET_Y + AURA_OFFSET_Y
        else
            size = SMALL_AURA_SIZE
        end
        if ( i == 1 ) then
            rowWidth = size
            self.auraRows = self.auraRows + 1
        else
            rowWidth = rowWidth + size + offsetX
        end
        if ( rowWidth > maxRowWidth ) then
            updateFunc(self, auraName, i, numOppositeAuras, firstBuffOnRow, size, offsetX, offsetY, mirrorAurasVertically)
            rowWidth = size
            self.auraRows = self.auraRows + 1
            firstBuffOnRow = i
            offsetY = AURA_OFFSET_Y
        else
            updateFunc(self, auraName, i, numOppositeAuras, i - 1, size, offsetX, offsetY, mirrorAurasVertically)
        end
    end
end

local function whoa_targetUpdateAuraPositions(self, auraName, numAuras, numOppositeAuras, largeAuraList, updateFunc, maxRowWidth, offsetX, mirrorAurasVertically)
    whoa:targetUpdateAuraPositions(self, auraName, numAuras, numOppositeAuras, largeAuraList, updateFunc, maxRowWidth, offsetX, mirrorAurasVertically)
end
hooksecurefunc("TargetFrame_UpdateAuraPositions", whoa_targetUpdateAuraPositions)

function whoa:targetUpdateBuffAnchor(self, buffName, index, numDebuffs, anchorIndex, size, offsetX, offsetY, mirrorVertically)
    local point, relativePoint
    local startY, auraOffsetY
    if ( mirrorVertically ) then
        point = "BOTTOM"
        relativePoint = "TOP"
        startY = -8
        offsetY = -offsetY
        auraOffsetY = -AURA_OFFSET_Y
    else
        point = "TOP"
        relativePoint="BOTTOM"
        startY = AURA_START_Y
        auraOffsetY = AURA_OFFSET_Y
    end

    local buff = _G[buffName..index]
    if ( index == 1 ) then
        if ( UnitIsFriend("player", self.unit) or numDebuffs == 0 ) then
            -- unit is friendly or there are no debuffs...buffs start on top
            buff:SetPoint(point.."LEFT", self, relativePoint.."LEFT", AURA_START_X, startY)
        else
            -- unit is not friendly and we have debuffs...buffs start on bottom
            buff:SetPoint(point.."LEFT", self.debuffs, relativePoint.."LEFT", 0, -offsetY)
        end
        self.buffs:SetPoint(point.."LEFT", buff, point.."LEFT", 0, 0)
        self.buffs:SetPoint(relativePoint.."LEFT", buff, relativePoint.."LEFT", 0, -auraOffsetY)
        self.spellbarAnchor = buff
    elseif ( anchorIndex ~= (index-1) ) then
        -- anchor index is not the previous index...must be a new row
        buff:SetPoint(point.."LEFT", _G[buffName..anchorIndex], relativePoint.."LEFT", 0, -offsetY)
        self.buffs:SetPoint(relativePoint.."LEFT", buff, relativePoint.."LEFT", 0, -auraOffsetY)
        self.spellbarAnchor = buff
    else
        -- anchor index is the previous index
        buff:SetPoint(point.."LEFT", _G[buffName..anchorIndex], point.."RIGHT", offsetX, 0)
    end

    buff:SetWidth(size)
    buff:SetHeight(size)
end

local function whoa_targetUpdateBuffAnchor(self, buffName, index, numDebuffs, anchorIndex, size, offsetX, offsetY, mirrorVertically)
    whoa:targetUpdateBuffAnchor(self, buffName, index, numDebuffs, anchorIndex, size, offsetX, offsetY, mirrorVertically)
end
hooksecurefunc("TargetFrame_UpdateBuffAnchor", whoa_targetUpdateBuffAnchor)

function whoa:targetUpdateDebuffAnchor(self, debuffName, index, numBuffs, anchorIndex, size, offsetX, offsetY, mirrorVertically)
    local buff = _G[debuffName..index];
    local isFriend = UnitIsFriend("player", self.unit);

    --For mirroring vertically
    local point, relativePoint;
    local startY, auraOffsetY;
    if ( mirrorVertically ) then
        point = "BOTTOM";
        relativePoint = "TOP";
        startY = -8;
        offsetY = - offsetY;
        auraOffsetY = -AURA_OFFSET_Y;
    else
        point = "TOP";
        relativePoint="BOTTOM";
        startY = AURA_START_Y;
        auraOffsetY = AURA_OFFSET_Y;
    end

    if ( index == 1 ) then
        if ( isFriend and numBuffs > 0 ) then
            -- unit is friendly and there are buffs...debuffs start on bottom
            buff:SetPoint(point.."LEFT", self.buffs, relativePoint.."LEFT", 0, -offsetY);
        else
            -- unit is not friendly or there are no buffs...debuffs start on top
            buff:SetPoint(point.."LEFT", self, relativePoint.."LEFT", AURA_START_X, startY);
        end
        self.debuffs:SetPoint(point.."LEFT", buff, point.."LEFT", 0, 0);
        self.debuffs:SetPoint(relativePoint.."LEFT", buff, relativePoint.."LEFT", 0, -auraOffsetY);
        if ( ( isFriend ) or ( not isFriend and numBuffs == 0) ) then
            self.spellbarAnchor = buff;
        end
    elseif ( anchorIndex ~= (index-1) ) then
        -- anchor index is not the previous index...must be a new row
        buff:SetPoint(point.."LEFT", _G[debuffName..anchorIndex], relativePoint.."LEFT", 0, -offsetY);
        self.debuffs:SetPoint(relativePoint.."LEFT", buff, relativePoint.."LEFT", 0, -auraOffsetY);
        if ( ( isFriend ) or ( not isFriend and numBuffs == 0) ) then
            self.spellbarAnchor = buff;
        end
    else
        -- anchor index is the previous index
        buff:SetPoint(point.."LEFT", _G[debuffName..(index-1)], point.."RIGHT", offsetX, 0);
    end
 
    -- Resize
    buff:SetWidth(size);
    buff:SetHeight(size);
    local debuffFrame =_G[debuffName..index.."Border"];
    debuffFrame:SetWidth(size+2);
    debuffFrame:SetHeight(size+2);
end

local function whoa_targetUpdateDebuffAnchor(self, debuffName, index, numBuffs, anchorIndex, size, offsetX, offsetY, mirrorVertically)
    whoa:targetUpdateDebuffAnchor(self, debuffName, index, numBuffs, anchorIndex, size, offsetX, offsetY, mirrorVertically)
end
hooksecurefunc("TargetFrame_UpdateDebuffAnchor", whoa_targetUpdateDebuffAnchor)

---------------------------------------------------
-- CVAR_UPDATES
---------------------------------------------------
if config.customStatusText then
    function PlayerFrameHealthBar.LeftText:Show() end
    function PlayerFrameManaBar.LeftText:Show() end
    function PlayerFrameHealthBar.RightText:Show() end
    function PlayerFrameManaBar.RightText:Show() end
    function PlayerFrameHealthBarText:Show() end
    function PlayerFrameManaBarText:Show() end
    function TargetFrameTextureFrameHealthBarText:Show() end
    function TargetFrameTextureFrameManaBarText:Show() end
    function TargetFrameHealthBar.LeftText:Show() end
    function TargetFrameManaBar.LeftText:Show() end
    function TargetFrameHealthBar.RightText:Show() end
    function TargetFrameManaBar.RightText:Show() end
    function FocusFrameTextureFrameHealthBarText:Show() end
    function FocusFrameTextureFrameManaBarText:Show() end
    function FocusFrameHealthBar.LeftText:Show() end
    function FocusFrameManaBar.LeftText:Show() end
    function FocusFrameHealthBar.RightText:Show() end
    function FocusFrameManaBar.RightText:Show() end
    PlayerFrameHealthBar.LeftText:Hide()
    PlayerFrameManaBar.LeftText:Hide()
    PlayerFrameHealthBar.RightText:Hide()
    PlayerFrameManaBar.RightText:Hide()
    TargetFrameHealthBar.LeftText:Hide()
    TargetFrameManaBar.LeftText:Hide()
    TargetFrameHealthBar.RightText:Hide()
    TargetFrameManaBar.RightText:Hide()
    FocusFrameHealthBar.LeftText:Hide()
    FocusFrameManaBar.LeftText:Hide()
    FocusFrameHealthBar.RightText:Hide()
    FocusFrameManaBar.RightText:Hide()
    PlayerFrameHealthBarText:Hide()
    PlayerFrameManaBarText:Hide()
    TargetFrameTextureFrameHealthBarText:Hide()
    TargetFrameTextureFrameManaBarText:Hide()
    FocusFrameTextureFrameHealthBarText:Hide()
    FocusFrameTextureFrameManaBarText:Hide()
end

function whoa:cvarUpdate()
    if GetCVarBool("fullSizeFocusFrame") then
        FocusFrameTextureFrameName:SetPoint("BOTTOMRIGHT", FocusFrame, "TOP", 0, -20)
    else
        FocusFrameTextureFrameName:SetPoint("BOTTOMRIGHT", FocusFrame, "TOP", 10, -20)
    end
    whoa:unitText("player")
    whoa:unitText("target")
    whoa:unitText("focus")
end

---------------------------------------------------
-- EVENTS
---------------------------------------------------
local w = CreateFrame("Frame")
w:RegisterEvent("PLAYER_ENTERING_WORLD")
w:RegisterEvent("PLAYER_REGEN_ENABLED")
w:RegisterEvent("PLAYER_TARGET_CHANGED")
w:RegisterEvent("PLAYER_FOCUS_CHANGED")
w:RegisterEvent("CVAR_UPDATE")
w:RegisterEvent("GROUP_ROSTER_UPDATE")
w:RegisterEvent("UNIT_FACTION")
w:RegisterEvent("UNIT_HEALTH")
w:RegisterEvent("UNIT_POWER")
w:RegisterEvent("PARTY_MEMBERS_CHANGED")
function w:OnEvent(event, ...)
    if event == "PLAYER_ENTERING_WORLD" then
        SlashCmdList['RELOAD'] = function() ReloadUI() end
        SLASH_RELOAD1 = '/rl'
        whoa:playerFrame()
        whoa:targetFrame()
        whoa:focusFrame()
        whoa:totFrame()
        whoa:cvarUpdate()
        whoa:unitText("player")
    elseif event == "PLAYER_REGEN_ENABLED" then
        whoa:playerFrame()
    elseif event == "PLAYER_TARGET_CHANGED" then
        whoa:targetChanged()
        whoa:unitText("target")
    elseif event == "PLAYER_FOCUS_CHANGED" then
        whoa:focusChanged()
        whoa:unitText("focus")
    elseif event == "UNIT_FACTION" then
        if arg1 == "focus" then
            whoa:focusChanged()
        end
    elseif event == "GROUP_ROSTER_UPDATE" then
        whoa:focusChanged()
    elseif event == "UNIT_HEALTH" or event == "UNIT_POWER" then
        local unit = ...
        whoa:unitText(unit)
    elseif event == "CVAR_UPDATE" then
        whoa:cvarUpdate()
    elseif event == "PARTY_MEMBERS_CHANGED" then
        whoa:partyMembersChanged()
    end
end
w:SetScript("OnEvent", w.OnEvent)

