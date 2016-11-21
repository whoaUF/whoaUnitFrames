


local sliderGroupY = -300


-- UI PANELS
whoaGUI = {};
whoaGUI.panel = CreateFrame( "Frame", "whoaGUI", UIParent );
whoaGUI.panel.name = "whoa UnitFrames";
InterfaceOptions_AddCategory(whoaGUI.panel);

-- whoaGUI.childpanel = CreateFrame( "Frame", "General",  whoaGUI.panel);
-- whoaGUI.childpanel.name = "General";
-- whoaGUI.childpanel.parent = whoaGUI.panel.name;
-- InterfaceOptions_AddCategory(whoaGUI.childpanel);

SlashCmdList.whoaGUI = function()
    InterfaceOptionsFrame_OpenToCategory(whoaGUI.panel)
    InterfaceOptionsFrame_OpenToCategory(whoaGUI.panel)
end
SLASH_whoaGUI1 = "/whoaGUI"
SLASH_whoaGUI1 = "/wuf"

SlashCmdList['RELOAD'] = function() ReloadUI() end
LASH_RELOAD1 = '/rl'


-- LOAD
function whoa:Init(event, addon, ...)
    if (event == "ADDON_LOADED" and addon == "whoaUnitFrames") then
        print("whoa UnitFrames is now loaded. Use /wuf to open options.")
        whoa:CreateGUI(whoaUI)
    --
        if ( whoaSaves.customStatusText == 1 ) then
            whoaCheckButton2:SetChecked(true)				-- CUSTOM STATUS TEXT
        end
        if ( whoaSaves.whoaClassColor == 1 ) then
            whoaCheckButton3:SetChecked(true)				-- CLASSCOLOR
        end
        if ( whoaSaves.whoaShowMaxHealth == 1 ) then
            whoaCheckButton4:SetChecked(true)				-- SHOW MAX HEALTH
        end
        if ( whoaSaves.hitIndicators == 1 ) then
            whoaCheckButton5:SetChecked(true)				-- HIT INDICATORS
        end
        if ( whoaSaves.disableStatusPred == 1 ) then
            whoaCheckButton6:SetChecked(true)				-- POWERBAR ANIMATIONS
        end
        if ( whoaSaves.disableStatusGlow == 1 ) then
            whoaCheckButton7:SetChecked(true)				-- REST GLOW
        end
        if ( whoaSaves.classPortraits == 1 ) then
            whoaCheckButton8:SetChecked(true)				-- CLASS ICON PORTRAIT
        end
        if ( whoaSaves.castbarFix == 1 ) then
            whoaCheckButton9:SetChecked(true)				-- CASTBAR FIX
        end
        -- if ( whoaSaves.whoaBuffSize == 1 ) then
            -- whoaCheckButton10:SetChecked(true)				-- CUSTOM BUFF SIZE
        -- end


    PlayerFrame:SetScale(whoaSaves.scale)
    TargetFrame:SetScale(whoaSaves.scale)
    FocusFrame:SetScale(whoaSaves.scale)

-- FRAMES DARK OPTION
    for i, v in pairs({
    -- Frames
        PlayerFrameTexture, PlayerFrameAlternateManaBarBorder, PlayerFrameAlternateManaBarLeftBorder, PlayerFrameAlternateManaBarRightBorder,
        PetFrameTexture, TargetFrameTextureFrameTexture,  FocusFrameTextureFrameTexture, TargetFrameToTTextureFrameTexture,
        FocusFrameToTTextureFrameTexture, CastingBarFrame.Border,  FocusFrameSpellBar.Border, TargetFrameSpellBar.Border,
    -- Pary Frames
        PartyMemberFrame1Texture, PartyMemberFrame2Texture, PartyMemberFrame3Texture, PartyMemberFrame4Texture, PartyMemberFrame1PetFrameTexture,
        PartyMemberFrame2PetFrameTexture, PartyMemberFrame3PetFrameTexture, PartyMemberFrame4PetFrameTexture,
    -- Pary Frames
        -- CompactRaidFrameContainerBorderFrameTopTexture, CompactRaidFrame
    -- DK
        RuneButtonIndividual1Texture, RuneButtonIndividual2Texture,  RuneButtonIndividual3Texture,  RuneButtonIndividual4Texture,  RuneButtonIndividual5Texture,
        RuneButtonIndividual6Texture,  RuneButtonIndividual7Texture,
    -- Paladin
        -- PaladinPowerBarFrameRune1Texture, PaladinPowerBarFrameRune2Texture, PaladinPowerBarFrameRune3Texture, PaladinPowerBarFrameRune4Texture, PaladinPowerBarFrameRune5Texture, PaladinPowerBarFrameRune6Texture,
    -- rogu / Druid
        ComboPointPlayerFrame.Background, ComboPointPlayerFrame.Combo1.PointOff, ComboPointPlayerFrame.Combo2.PointOff, ComboPointPlayerFrame.Combo3.PointOff,
        ComboPointPlayerFrame.Combo4.PointOff, ComboPointPlayerFrame.Combo5.PointOff, ComboPointPlayerFrame.Combo6.PointOff,
    -- Shaman
        TotemFrameTotem1Background, TotemFrameTotem1Texture,
        PartyMemberFrame1Texture, PartyMemberFrame2Texture, PartyMemberFrame3Texture,PartyMemberFrame4Texture, PartyMemberFrame1PetFrameTexture,
        PartyMemberFrame2PetFrameTexture, PartyMemberFrame3PetFrameTexture, PartyMemberFrame4PetFrameTexture,
    -- Warlock
        -- WarlockPowerFrameShard1Texture,

        })
    do
        v:SetVertexColor(whoaSaves.darkentextures, whoaSaves.darkentextures, whoaSaves.darkentextures)
    end
    -- Compact Raid Frame
    -- for _, region in pairs({CompactRaidFrameContainerBorderFrame:GetRegions()}) do
        -- if region:IsObjectType("Texture") then
            -- region:SetVertexColor(whoaSaves.darkentextures, whoaSaves.darkentextures, whoaSaves.darkentextures)
        -- end
    -- end

if ( whoaSaves.customStatusText == 1 ) then
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

-- TARGET / FOCUS CASTBAR FIX
    -- if ( whoaSaves.castbarFix == 1 ) then
        -- TargetFrameSpellBar:ClearAllPoints()
        -- TargetFrameSpellBar:SetPoint("CENTER", TargetFrame, "CENTER", -15,-100)
        -- TargetFrameSpellBar.SetPoint = function() end
        -- FocusFrameSpellBar:ClearAllPoints()
        -- FocusFrameSpellBar:SetPoint("CENTER", FocusFrame, "CENTER", -15,-100)
        -- FocusFrameSpellBar.SetPoint = function() end
    -- else
        -- TargetFrameSpellBar:ClearAllPoints()
        -- TargetFrameSpellBar:SetPoint("CENTER", TargetFrame, "CENTER", -15,-60)
        -- TargetFrameSpellBar.SetPoint = function() end
        -- FocusFrameSpellBar:ClearAllPoints()
        -- FocusFrameSpellBar:SetPoint("CENTER", FocusFrame, "CENTER", -15,-60)
        -- FocusFrameSpellBar.SetPoint = function() end
    -- end


        for i, v in pairs({	PlayerFrameAlternateManaBar, PlayerFrameHealthBar, PlayerFrameManaBar, TargetFrameHealthBar, TargetFrameManaBar,
            FocusFrameHealthBar, FocusFrameManaBar, TargetFrameToTHealthBar, TargetFrameToTManaBar, FocusFrameToTHealthBar, FocusFrameToTManaBar,
            PetFrameManaBar, PetFrameHealthBar
            })
        do
            if ( whoaSaves.whoaBackgroundTxt == 1 ) then
                v:SetStatusBarTexture("Interface\\AddOns\\whoaUnitFrames\\media\\bg\\status")
            elseif ( whoaSaves.whoaBackgroundTxt == 2 ) then
                v:SetStatusBarTexture("Interface\\AddOns\\whoaUnitFrames\\media\\bg\\blizzard")
            elseif ( whoaSaves.whoaBackgroundTxt == 3 ) then
                v:SetStatusBarTexture("Interface\\AddOns\\whoaUnitFrames\\media\\bg\\Ace")
            elseif ( whoaSaves.whoaBackgroundTxt == 4 ) then
                v:SetStatusBarTexture("Interface\\AddOns\\whoaUnitFrames\\media\\bg\\Aluminium")
            elseif ( whoaSaves.whoaBackgroundTxt == 5 ) then
                v:SetStatusBarTexture("Interface\\AddOns\\whoaUnitFrames\\media\\bg\\banto")
            elseif ( whoaSaves.whoaBackgroundTxt == 6 ) then
                v:SetStatusBarTexture("Interface\\AddOns\\whoaUnitFrames\\media\\bg\\Charcoal")
            elseif ( whoaSaves.whoaBackgroundTxt == 7 ) then
                v:SetStatusBarTexture("Interface\\AddOns\\whoaUnitFrames\\media\\bg\\glaze")
            elseif ( whoaSaves.whoaBackgroundTxt == 8 ) then
                v:SetStatusBarTexture("Interface\\AddOns\\whoaUnitFrames\\media\\bg\\LiteStep")
            elseif ( whoaSaves.whoaBackgroundTxt == 9 ) then
                v:SetStatusBarTexture("Interface\\AddOns\\whoaUnitFrames\\media\\bg\\Minimalist")
            elseif ( whoaSaves.whoaBackgroundTxt == 10 ) then
                v:SetStatusBarTexture("Interface\\AddOns\\whoaUnitFrames\\media\\bg\\otravi")
            elseif ( whoaSaves.whoaBackgroundTxt == 11 ) then
                v:SetStatusBarTexture("Interface\\AddOns\\whoaUnitFrames\\media\\bg\\perl")
            elseif ( whoaSaves.whoaBackgroundTxt == 12 ) then
                v:SetStatusBarTexture("Interface\\AddOns\\whoaUnitFrames\\media\\bg\\smooth")
            elseif ( whoaSaves.whoaBackgroundTxt == 13 ) then
                v:SetStatusBarTexture("Interface\\AddOns\\whoaUnitFrames\\media\\bg\\striped")
            elseif ( whoaSaves.whoaBackgroundTxt == 14 ) then
                v:SetStatusBarTexture("Interface\\AddOns\\whoaUnitFrames\\media\\bg\\Swag")
            end
        end


-- END OF whoa
    end
end
-- create addon frame
local whoaUIframe = CreateFrame("Frame", "whoaUI", UIParent)
whoaUIframe:SetScript("OnEvent", whoa.Init)
whoaUIframe:RegisterEvent("ADDON_LOADED")







-- PORTRAIT FUNC
function whoa_Portrait (self)
    if ( whoaSaves.classPortraits == 1 ) then
        local t = CLASS_ICON_TCOORDS[select(2, UnitClass(self.unit))]
        if t then
                self.portrait:SetTexture("Interface\\TargetingFrame\\UI-Classes-Circles")
                self.portrait:SetTexCoord(unpack(t))
        end
    end
end
hooksecurefunc("UnitFramePortrait_Update", whoa_Portrait)
hooksecurefunc("PlayerFrame_ToPlayerArt", whoa_Portrait)





-- CREATE UI
-- //

    function whoa:CreateGUI(frame)
    -- General
    local title = whoa:CreateFont(whoaGUI.panel, "title", "whoa UnitFrames Panel", 0, 0 + sliderGroupY, 20)
    title:ClearAllPoints()
    title:SetPoint("CENTER",whoaGUI.panel,"TOP",0,-25)
    -- local line = whoa:CreateTexture()
    -- line:SetTexture(.6 ,.6, .6, .2)
    -- line:SetSize(100, 1)
    -- line:SetPoint("CENTER", whoa)


-- BUFF SACLER SLIDER
    local CreateSliderBuff = whoa:CreateSliderBuff(whoaGUI.panel, "whoaBuffScaler", "General Frame Scale", 17, 30, whoaSaves.smallAuraSize, 60, -290)
        whoaBuffScaler:SetScript("OnValueChanged", function(self, value)
        whoaSaves.smallAuraSize = (value)
        whoaSaves.largeAuraSize = (value+4)
        getglobal(whoaBuffScaler:GetName() .. 'Text'):SetText("Buff Size: (" .. format("%.2f",whoaSaves.smallAuraSize) .. ")");
    end)

-- BUFF SACLER SLIDER - [RESET]
    local whoaBuffScalerReset = whoa:CreateButton(whoaGUI.panel, "whoaBuffScalerReset", "Reset", 55, 22, 100, -320)
        whoaBuffScalerReset:SetScript("OnClick", function(self)
        whoaSaves.smallAuraSize = 17
        whoaSaves.largeAuraSize = 21
    end)

-- /script TargetFrameSpellBar.Border:Hide()
-- FRAMES DARK SLIDER
    local darkSlider = whoa:CreateSliderx(whoaGUI.panel, "darkSlider", "Darken Frame Textures", 0, 1, (whoaSaves.darkentextures), 60,-155 + sliderGroupY)
    darkSlider:SetScript("OnValueChanged", function(self, value)
        for i, v in pairs({
    -- Frames
        PlayerFrameTexture, PlayerFrameAlternateManaBarBorder, PlayerFrameAlternateManaBarLeftBorder, PlayerFrameAlternateManaBarRightBorder,
        PetFrameTexture, TargetFrameTextureFrameTexture,  FocusFrameTextureFrameTexture, TargetFrameToTTextureFrameTexture,
        FocusFrameToTTextureFrameTexture, CastingBarFrame.Border,  FocusFrameSpellBar.Border, TargetFrameSpellBar.Border,
    -- Pary Frames
        PartyMemberFrame1Texture, PartyMemberFrame2Texture, PartyMemberFrame3Texture, PartyMemberFrame4Texture, PartyMemberFrame1PetFrameTexture,
        PartyMemberFrame2PetFrameTexture, PartyMemberFrame3PetFrameTexture, PartyMemberFrame4PetFrameTexture,
    -- Pary Frames
        -- CompactRaidFrameContainerBorderFrameTopTexture, CompactRaidFrame
    -- DK
        RuneButtonIndividual1Texture, RuneButtonIndividual2Texture,  RuneButtonIndividual3Texture,  RuneButtonIndividual4Texture,  RuneButtonIndividual5Texture,
        RuneButtonIndividual6Texture,  RuneButtonIndividual7Texture,
    -- Paladin
        -- PaladinPowerBarFrameRune1Texture, PaladinPowerBarFrameRune2Texture, PaladinPowerBarFrameRune3Texture, PaladinPowerBarFrameRune4Texture, PaladinPowerBarFrameRune5Texture, PaladinPowerBarFrameRune6Texture,
    -- rogu / Druid
        ComboPointPlayerFrame.Background, ComboPointPlayerFrame.Combo1.PointOff, ComboPointPlayerFrame.Combo2.PointOff, ComboPointPlayerFrame.Combo3.PointOff,
        ComboPointPlayerFrame.Combo4.PointOff, ComboPointPlayerFrame.Combo5.PointOff, ComboPointPlayerFrame.Combo6.PointOff,
    -- Shaman
        TotemFrameTotem1Background, TotemFrameTotem1Texture,
        PartyMemberFrame1Texture, PartyMemberFrame2Texture, PartyMemberFrame3Texture,PartyMemberFrame4Texture, PartyMemberFrame1PetFrameTexture,
        PartyMemberFrame2PetFrameTexture, PartyMemberFrame3PetFrameTexture, PartyMemberFrame4PetFrameTexture,
    -- Warlock
        -- WarlockPowerFrameShard1Texture,
            })
        do
            v:SetVertexColor(value, value, value)
            -- whoaSaves.darkentextures = (value)
        end
        -- CompactPartyFrameBorderFrame
        for _, region in pairs({CompactRaidFrameContainerBorderFrame:GetRegions()}) do
            if region:IsObjectType("Texture") then
                region:SetVertexColor(value, value, value)
            end
        end

        -- for _, region in pairs({CompactPartyFrameBorderFrame:GetRegions()}) do
            -- if region:IsObjectType("Texture") then
                -- region:SetVertexColor(value, value, value)
            -- end
        -- end
        -- for i = 1, 5 do
                -- local shard = _G["WarlockPowerFrameShard"..i]
                -- for _, region in pairs({shard:GetRegions()}) do
                    -- if region:GetDrawLayer() == "BORDER" then
                        -- region:SetVertexColor(value, value, value)
                    -- end
                -- end
        -- end

        for i = 1, 5 do
                local shard = _G["WarlockPowerFrameShard"..i]
                for _, region in pairs({shard:GetRegions()}) do
                    if region:GetDrawLayer() == "BORDER" then
                        region:SetVertexColor(value, value, value)
                    end
                end
        end
        -- for i = 1, 5 do
                -- local shard = _G["MonkHarmonyBarFrame"..i]
                -- for _, region in pairs({shard:GetRegions()}) do
                    -- if region:GetDrawLayer() == "BORDER" then
                        -- region:SetVertexColor(.05, .05, .05)
                    -- end
                -- end
            -- end
        whoaSaves.darkentextures = value
        getglobal(darkSlider:GetName() .. 'Text'):SetText("Darkness Value");
    end)

-- FRAMES DARK SLIDER - [RESET]
    local darkSliderReset = whoa:CreateButton(whoaGUI.panel, "darkSliderResetx", "Reset", 55, 22, 100, -180 + sliderGroupY)
    darkSliderResetx:SetScript("OnClick", function(self)
        for i, v in pairs({PlayerFrameTexture, PetFrameTexture, TargetFrameTextureFrameTexture,  FocusFrameTextureFrameTexture,
        TargetFrameToTTextureFrameTexture, FocusFrameToTTextureFrameTexture,
        RuneButtonIndividual1Texture, RuneButtonIndividual2Texture,  RuneButtonIndividual3Texture,  RuneButtonIndividual4Texture,  RuneButtonIndividual5Texture,  RuneButtonIndividual6Texture,  RuneButtonIndividual7Texture,
        PaladinPowerBarRune1, PaladinPowerBarRune2, PaladinPowerBarRune3, PaladinPowerBarRune4, PaladinPowerBarRune5, PaladinPowerBarRune6,
            })
        do
            v:SetVertexColor(1, 1, 1)
        end
        whoaSaves.darkentextures = 1
    end)



-- FRAMES SIZE SLIDER
    local BuffSizeSlider = whoa:CreateSlider(whoaGUI.panel, "BuffSizeSlider", "General Frame Scale", 0.5, 1.5, whoaSaves.scale, 60, -80  + sliderGroupY)
        BuffSizeSlider:SetScript("OnValueChanged", function(self, value)
        PlayerFrame:SetScale(value)
        TargetFrame:SetScale(value)
        FocusFrame:SetScale(value)
        whoaSaves.scale=value
        getglobal(BuffSizeSlider:GetName() .. 'Text'):SetText("Current Scale: (" .. format("%.2f",whoaSaves.scale) .. ")");
    end)

-- FRAMES SIZE SLIDER - [RESET]
    local BuffSizeReset = whoa:CreateButton(whoaGUI.panel, "BuffSizeReset", "Reset", 55, 22, 100, -110 + sliderGroupY)
        BuffSizeReset:SetScript("OnClick", function(self)
        PlayerFrame:SetScale(1)
        TargetFrame:SetScale(1)
        FocusFrame:SetScale(1)
        whoaSaves.scale = 1
    end)


-- CUSTOM STATUS TEXT (3)
    myCheckButton = createCheckbutton(whoaGUI.panel, 40, -70, "Whoa status text");
    myCheckButton.tooltip = "If this is checked, 'whoa status text' will display unit frames values in Millions.";
    myCheckButton:SetScript("OnClick",
   function(self)
        if whoaCheckButton2:GetChecked() then
            whoaSaves.customStatusText = 1
            whoa:unitText()
        else
            whoaSaves.customStatusText = 0
            whoa:unitText()
        end
   end );
    -- myCheckButton:SetScript("OnClick", whoa_Portrait)

-- CLASS COLOR CHECKBUTTON (2)
    myCheckButton = createCheckbutton(whoaGUI.panel, 40, -100, "Class colored HP bars.");
    myCheckButton.tooltip = "If this is checked, will display class colored HP bars..";
    myCheckButton:SetScript("OnClick",
    function(self, unit, class)
        if whoaCheckButton3:GetChecked() then
            whoaSaves.whoaClassColor = 1
            _, class = UnitClass(unit)
            pc = RAID_CLASS_COLORS[select(2, UnitClass("player"))]
            PlayerFrameHealthBar:SetStatusBarColor(pc.r, pc.g, pc.b)
            if UnitExists("target") and UnitIsPlayer("target") then
                tc = RAID_CLASS_COLORS[select(2, UnitClass("target"))]
                TargetFrameHealthBar:SetStatusBarColor(tc.r, tc.g, tc.b)
            elseif UnitExists("target") and not UnitIsPlayer("target") then
                if UnitIsTapDenied("target") then
                    TargetFrameHealthBar:SetStatusBarColor(0.5,0.5,0.5)
                else
                    c = FACTION_BAR_COLORS[UnitReaction("target", "player")]
                    TargetFrameHealthBar:SetStatusBarColor(c.r, c.g, c.b);
                end
            end
            if UnitExists("focus") and UnitIsPlayer("focus") then
                tc = RAID_CLASS_COLORS[select(2, UnitClass("focus"))]
                FocusFrameHealthBar:SetStatusBarColor(tc.r, tc.g, tc.b)

            elseif UnitExists("focus") and not UnitIsPlayer("focus") then
                if UnitIsTapDenied("focus") then
                    FocusFrameHealthBar:SetStatusBarColor(0.5,0.5,0.5)
                else
                    c = FACTION_BAR_COLORS[UnitReaction("focus", "player")]
                    FocusFrameHealthBar:SetStatusBarColor(c.r, c.g, c.b);
                end
            end
        else
            whoaSaves.whoaClassColor = 0
            PlayerFrameHealthBar:SetStatusBarColor(0.0, 1.0, 0.0)
            if UnitExists("target") then
                TargetFrameHealthBar:SetStatusBarColor(0.0, 1.0, 0.0)
            end
            if UnitExists("focus") then
                FocusFrameHealthBar:SetStatusBarColor(0.0, 1.0, 0.0)
            end
            if UnitExists("targettarget") then
                TargetFrameToTHealthBar:SetStatusBarColor(0.0, 1.0, 0.0)
            end
            if UnitExists("focustarget") then
                FocusFrameToTHealthBar:SetStatusBarColor(0.0, 1.0, 0.0)
            end
        end
    end );

-- SHOW MAX HEALTH
    myCheckButton = createCheckbutton(whoaGUI.panel, 40, -130, "Show max health - DISABLED");
    -- myCheckButton.tooltip = "If this is checked, 'whoa status text' will display units max. HP.";
    myCheckButton.tooltip = "Function temporary disabled.";
    myCheckButton:SetScript("OnClick",
   function(self)
        if whoaCheckButton4:GetChecked() then
            whoaSaves.whoaShowMaxHealth = 1
        else
            whoaSaves.whoaShowMaxHealth = 0
        end
    end
    );
    -- whoaCheckButton4:Disable(true)


-- ///

-- HIT INDICATORS CHECKBOX
    myCheckButton = createCheckbutton(whoaGUI.panel, 320, -70, "Hide Hit Indicators");
    myCheckButton.tooltip = "If this is checked, 'whoa status text' will display units max. HP.";
    myCheckButton:SetScript("OnClick",
    function(self)
        if whoaCheckButton5:GetChecked() then
            whoaSaves.hitIndicators = 1
        else
            whoaSaves.hitIndicators = 0
        end
    end
    );
    -- whoaCheckButton5:Disable(true)

-- DISABLE POWERBAR ANIMATIONS
    myCheckButton = createCheckbutton(whoaGUI.panel, 320, -100, "Disable statusbar animations");
    myCheckButton.tooltip = "If this is checked, 'whoa status text' will hide Player frame status bar animations.";
    myCheckButton:SetScript("OnClick",
    function(self)
        if whoaCheckButton6:GetChecked() then
            whoaSaves.disableStatusPred = 1
            PowerBarColor["RAGE"] = { r = 1.00, g = 0.00, b = 0.00, fullPowerAnim=false };
            PowerBarColor["FOCUS"] = { r = 1.00, g = 0.50, b = 0.25, fullPowerAnim=false };
            PowerBarColor["ENERGY"] = { r = 1.00, g = 1.00, b = 0.00, fullPowerAnim=false };
            PowerBarColor["RUNIC_POWER"] = { r = 0.00, g = 0.82, b = 1.00, fullPowerAnim=false };
            PowerBarColor["MAELSTROM"] = { r = 0.00, g = 0.50, b = 1.00, atlas = "_Shaman-MaelstromBar", fullPowerAnim=false };
            PowerBarColor["INSANITY"] = { r = 0.40, g = 0, b = 0.80, atlas = "_Priest-InsanityBar"};
            PowerBarColor["FURY"] = { r = 0.788, g = 0.259, b = 0.992, atlas = "_DemonHunter-DemonicFuryBar", fullPowerAnim=false };
            PowerBarColor["PAIN"] = { r = 255/255, g = 156/255, b = 0, atlas = "_DemonHunter-DemonicPainBar", fullPowerAnim=false };
            PlayerFrameManaBar.FeedbackFrame:Hide()
            PlayerFrameManaBar.FullPowerFrame:Hide()
        else
            whoaSaves.disableStatusPred = 0
            PowerBarColor["RAGE"] = { r = 1.00, g = 0.00, b = 0.00, fullPowerAnim=true };
            PowerBarColor["FOCUS"] = { r = 1.00, g = 0.50, b = 0.25, fullPowerAnim=true };
            PowerBarColor["ENERGY"] = { r = 1.00, g = 1.00, b = 0.00, fullPowerAnim=true };
            PowerBarColor["RUNIC_POWER"] = { r = 0.00, g = 0.82, b = 1.00, fullPowerAnim=true };
            PowerBarColor["MAELSTROM"] = { r = 0.00, g = 0.50, b = 1.00, atlas = "_Shaman-MaelstromBar", fullPowerAnim=true };
            PowerBarColor["INSANITY"] = { r = 0.40, g = 0, b = 0.80, atlas = "_Priest-InsanityBar"};
            PowerBarColor["FURY"] = { r = 0.788, g = 0.259, b = 0.992, atlas = "_DemonHunter-DemonicFuryBar", fullPowerAnim=true };
            PowerBarColor["PAIN"] = { r = 255/255, g = 156/255, b = 0, atlas = "_DemonHunter-DemonicPainBar", fullPowerAnim=true };
            PlayerFrameManaBar.FeedbackFrame:Show()
            PlayerFrameManaBar.FullPowerFrame:Show()
        end
    end
    );
    -- whoaCheckButton6:Disable(true)


-- DISABLE REST GLOW
    myCheckButton = createCheckbutton(whoaGUI.panel, 320, -130, "Disable rest glow");
    myCheckButton.tooltip = "If this is checked, 'whoa status text' will hide Player frame rest glow.";
    myCheckButton:SetScript("OnClick",
    function(self)
        if whoaCheckButton7:GetChecked() then
            PlayerStatusTexture:Hide()
            whoaSaves.disableStatusGlow = 1
        else
            PlayerStatusTexture:Show()
            whoaSaves.disableStatusGlow = 0
        end
    end
    );
    -- whoaCheckButton7:Disable(true)

    -- UnitFrame_Initialize

-- CLASS PORTRAIT CHECKBOX
    myCheckButton = createCheckbutton(whoaGUI.panel, 320, -160, "Class icons portraits");
    myCheckButton.tooltip = "If this is checked, 'whoa status text' will display Class Icons instead of starndar portrait.";
    myCheckButton:SetScript("OnClick",
    function(self)
        if whoaCheckButton8:GetChecked() then
            whoaSaves.classPortraits = 1
        else
            whoaSaves.classPortraits = 0
        end
        -- myCheckButton:RegisterEvent("PLAYER_ENTERING_WORLD");
        -- whoaCheckButton8:RegisterEvent("PLAYER_ENTERING_WORLD");
    end
    );
    -- whoaCheckButton8:Disable(true)

    function whoa_Portrait_Update (self)
        if ( self.portrait ) then
            SetPortraitTexture(self.portrait, self.unit);
        end
    end







-- TARGET / FOCUS FRAME CASTBAR FIX
    myCheckButton = createCheckbutton(whoaGUI.panel, 320, -190, "Target / Focus castbar fix - DISABLED");
    myCheckButton.tooltip = "If this is checked, will set target / focus frames castbar below ToT / Fot.";
    myCheckButton:SetScript("OnClick",
    function(self)
        if whoaCheckButton9:GetChecked() then
            whoaSaves.castbarFix = 1
        else
            whoaSaves.castbarFix = 0
        end
    end
    );
    whoaCheckButton9:Disable(true)




-- BAR TEXTURE - from GhettoFrames addon.
    local title = whoa:CreateFont(whoaGUI.panel, "title", "Bar Texture Style", 345, -360, 15)
    CreateFrame("Frame", "whoaBGselect", whoaGUI.panel, "UIDropDownMenuTemplate")
    whoaBGselect:SetPoint("CENTER", 100, -120)
    -- whoaBGselect:ClearAllPoints()
    -- whoaBGselect:Show()

    local items = {
        "whoa",			-- 1
        "Blizzard",		-- 2
        "Ace",			-- 3
        "Aluminium",	-- 4
        "Banto",		-- 5
        "Charcoal",		-- 6
        "Glaze",		-- 7
        "LiteStep",		-- 8
        "Minimalist",	-- 9
        "Otravi",		-- 10
        "Perl",			-- 11
        "Smooth",		-- 12
        "Striped",		-- 13
        "Swag",			-- 14
    }

    local function OnClick(self)
    UIDropDownMenu_SetSelectedID(whoaBGselect, self:GetID())

        for i, v in pairs({	PlayerFrameAlternateManaBar, PlayerFrameHealthBar, PlayerFrameManaBar, TargetFrameHealthBar, TargetFrameManaBar,
            FocusFrameHealthBar, FocusFrameManaBar, TargetFrameToTHealthBar, TargetFrameToTManaBar, FocusFrameToTHealthBar, FocusFrameToTManaBar,
            PetFrameManaBar, PetFrameHealthBar
            })
        do
            if ( UIDropDownMenu_GetSelectedID ( whoaBGselect ) == 1 ) then
                v:SetStatusBarTexture("Interface\\AddOns\\whoaUnitFrames\\media\\bg\\status")
                whoaSaves.whoaBackgroundTxt = 1
            elseif ( UIDropDownMenu_GetSelectedID ( whoaBGselect ) == 2 ) then
                v:SetStatusBarTexture("Interface\\AddOns\\whoaUnitFrames\\media\\bg\\blizzard")
                whoaSaves.whoaBackgroundTxt = 2
            elseif ( UIDropDownMenu_GetSelectedID ( whoaBGselect ) == 3 ) then
                v:SetStatusBarTexture("Interface\\AddOns\\whoaUnitFrames\\media\\bg\\Ace")
                whoaSaves.whoaBackgroundTxt = 3
            elseif ( UIDropDownMenu_GetSelectedID ( whoaBGselect ) == 4 ) then
                v:SetStatusBarTexture("Interface\\AddOns\\whoaUnitFrames\\media\\bg\\Aluminium")
                whoaSaves.whoaBackgroundTxt = 4
            elseif ( UIDropDownMenu_GetSelectedID ( whoaBGselect ) == 5 ) then
                v:SetStatusBarTexture("Interface\\AddOns\\whoaUnitFrames\\media\\bg\\banto")
                whoaSaves.whoaBackgroundTxt = 5
            elseif ( UIDropDownMenu_GetSelectedID ( whoaBGselect ) == 6 ) then
                v:SetStatusBarTexture("Interface\\AddOns\\whoaUnitFrames\\media\\bg\\Charcoal")
                whoaSaves.whoaBackgroundTxt = 6
            elseif ( UIDropDownMenu_GetSelectedID ( whoaBGselect ) == 7 ) then
                v:SetStatusBarTexture("Interface\\AddOns\\whoaUnitFrames\\media\\bg\\glaze")
                whoaSaves.whoaBackgroundTxt = 7
            elseif ( UIDropDownMenu_GetSelectedID ( whoaBGselect ) == 8 ) then
                v:SetStatusBarTexture("Interface\\AddOns\\whoaUnitFrames\\media\\bg\\LiteStep")
                whoaSaves.whoaBackgroundTxt = 8
            elseif ( UIDropDownMenu_GetSelectedID ( whoaBGselect ) == 9 ) then
                v:SetStatusBarTexture("Interface\\AddOns\\whoaUnitFrames\\media\\bg\\Minimalist")
                whoaSaves.whoaBackgroundTxt = 9
            elseif ( UIDropDownMenu_GetSelectedID ( whoaBGselect ) == 10 ) then
                v:SetStatusBarTexture("Interface\\AddOns\\whoaUnitFrames\\media\\bg\\otravi")
                whoaSaves.whoaBackgroundTxt = 10
            elseif ( UIDropDownMenu_GetSelectedID ( whoaBGselect ) == 11 ) then
                v:SetStatusBarTexture("Interface\\AddOns\\whoaUnitFrames\\media\\bg\\perl")
                whoaSaves.whoaBackgroundTxt = 11
            elseif ( UIDropDownMenu_GetSelectedID ( whoaBGselect ) == 12 ) then
                v:SetStatusBarTexture("Interface\\AddOns\\whoaUnitFrames\\media\\bg\\smooth")
                whoaSaves.whoaBackgroundTxt = 12
            elseif ( UIDropDownMenu_GetSelectedID ( whoaBGselect ) == 13 ) then
                v:SetStatusBarTexture("Interface\\AddOns\\whoaUnitFrames\\media\\bg\\striped")
                whoaSaves.whoaBackgroundTxt = 13
            elseif ( UIDropDownMenu_GetSelectedID ( whoaBGselect ) == 14 ) then
                v:SetStatusBarTexture("Interface\\AddOns\\whoaUnitFrames\\media\\bg\\Swag")
                whoaSaves.whoaBackgroundTxt = 14
            end
        end
    end

    local function initialize(self, level)
        local info = UIDropDownMenu_CreateInfo()
        for k,v in pairs(items) do
            info = UIDropDownMenu_CreateInfo()
            info.text = v
            info.value = v
            info.func = OnClick
            UIDropDownMenu_AddButton(info, level)
        end
    end

    UIDropDownMenu_GetSelectedID(whoaBGselect)
    UIDropDownMenu_Initialize(whoaBGselect, initialize)
    UIDropDownMenu_SetWidth(whoaBGselect, 100);
    UIDropDownMenu_SetButtonWidth(whoaBGselect, 124)
    UIDropDownMenu_SetSelectedID(whoaBGselect, whoaBackgroundTxt)
    UIDropDownMenu_JustifyText(whoaBGselect, "LEFT")

end

-- createSliderBuff
function whoa:CreateSliderBuff(frame, name, text, slidermin, slidermax, slidervalue, x, y, template)
if (template == nil) then template = "OptionsSliderTemplate"
end
local slider = CreateFrame("Slider", name, frame, template) slider:SetPoint("TOPLEFT", x, y) slider:SetMinMaxValues(slidermin, slidermax) slider:SetValue(slidervalue)
getglobal(slider:GetName() .. 'Low'):SetText('Small');
getglobal(slider:GetName() .. 'High'):SetText('Big');
getglobal(slider:GetName() .. 'Text'):SetText("Buff Size: (" .. format("%.2f",slidervalue) .. ")");
return (slider)
end

-- CreateSlider
function whoa:CreateSlider(frame, name, text, slidermin, slidermax, slidervalue, x, y, template)
if (template == nil) then template = "OptionsSliderTemplate"
end
local slider = CreateFrame("Slider", name, frame, template) slider:SetPoint("TOPLEFT", x, y) slider:SetMinMaxValues(slidermin, slidermax) slider:SetValue(slidervalue)
getglobal(slider:GetName() .. 'Low'):SetText('Min.');
getglobal(slider:GetName() .. 'High'):SetText('Max.');
getglobal(slider:GetName() .. 'Text'):SetText("Current Scale: (" .. format("%.2f",slidervalue) .. ")");
return (slider)
end
-- createSlider2
function whoa:CreateSliderx(frame, name, text, slidermin, slidermax, slidervalue, x, y, template)
if (template == nil) then template = "OptionsSliderTemplate"
end
local slider = CreateFrame("Slider", name, frame, template) slider:SetPoint("TOPLEFT", x, y) slider:SetMinMaxValues(slidermin, slidermax) slider:SetValue(slidervalue)
getglobal(slider:GetName() .. 'Low'):SetText('Dark');
getglobal(slider:GetName() .. 'High'):SetText('Bright');
getglobal(slider:GetName() .. 'Text'):SetText("Darken Value");
return (slider)
end
-- createSlider3
function whoa:CreateSlidery(frame, name, text, slidermin, slidermax, slidervalue, x, y, template)
if (template == nil) then template = "OptionsSliderTemplate"
end
local slider = CreateFrame("Slider", name, frame, template) slider:SetPoint("TOPLEFT", x, y) slider:SetMinMaxValues(slidermin, slidermax) slider:SetValue(slidervalue)
getglobal(slider:GetName() .. 'Low'):SetText(slidermin);
getglobal(slider:GetName() .. 'High'):SetText(slidermax);
getglobal(slider:GetName() .. 'Text'):SetText("Buffsize: (" .. format("%.2f",slidervalue) .. ")");
return (slider)
end

-- CreateButton --
function whoa:CreateButton(frame, name, text, width, height, x, y, template)
if (template == nil) then template = "OptionsButtonTemplate"
end
local button = CreateFrame("Button", name, frame, template) button:SetPoint("TOPLEFT", x, y) button:SetWidth(width)
button:SetHeight(height) button:SetText(text)
return (button)
end

-- CreateEditBox --
function whoa:CreateEditBox(frame, name, width, height, x, y)
local editBox = CreateFrame("EditBox", name, frame, "InputBoxTemplate")
editBox:SetPoint("TOPLEFT", x, y)
editBox:SetWidth(width)
editBox:SetHeight(height)
editBox:SetAutoFocus(false)
editBox:Show()
return(editbox)
end
-- CreateFont --
function whoa:CreateFont(frame, name, text, x, y, size)
    if size == nil then size = 15
end
local fontString = frame:CreateFontString(name) fontString:SetPoint("TOPLEFT", x, y) fontString:SetFont(STANDARD_TEXT_FONT, size, "") fontString:SetText(text)
return (fontString)
end

function whoa:Clear()
editbox1:SetText("")
editbox2:SetText("")
end


--	FACTORY
local uniquealyzer = 1;
function createCheckbutton(parent, x_loc, y_loc, displayname)
    uniquealyzer = uniquealyzer + 1;

    local checkbutton = CreateFrame("CheckButton", "whoaCheckButton" .. uniquealyzer, parent, "ChatConfigCheckButtonTemplate");
    checkbutton:SetPoint("TOPLEFT", x_loc, y_loc);
    getglobal(checkbutton:GetName() .. 'Text'):SetText(displayname);

    return checkbutton;
end

-- function whoa:CreateSliderBuff(frame, name, text, slidermin, slidermax, slidervalue, x, y, template)
-- if (template == nil) then template = "OptionsSliderTemplate"
-- end
-- local slider = CreateFrame("Slider", name, frame, template) slider:SetPoint("TOPLEFT", x, y) slider:SetMinMaxValues(slidermin, slidermax) slider:SetValue(slidervalue)
-- getglobal(slider:GetName() .. 'Low'):SetText('Small');
-- getglobal(slider:GetName() .. 'High'):SetText('Big');
-- getglobal(slider:GetName() .. 'Text'):SetText("Current Size");
-- return (slider)
-- end



PowerBarColor["RUNIC_POWER"] = { r = 0.00, g = 0.82, b = 1.00, fullPowerAnim=true };








