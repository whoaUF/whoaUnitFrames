---------------------------------------------------
-- Whoa UnitFrames Configuration # test dlb
---------------------------------------------------
whoaUnitFrames = {}
whoaUnitFrames.config = {
    -- scale=1.0,						-- scaling for Focus-, Player- and TargetFrame. Default 1.0
    classColor=true,				-- If true shows class colored HP bars.
    largeAuraSize=25,				-- Blizzard default value is 21
    smallAuraSize=20,				-- Blizzard default value is 17
    customFontSize=10;				-- Only on STATUSTEXT FALSE atm: Sets whoaUF text size for player, target and focus. Default: 10
    showToTName=false,				-- If true shows the Name of the ToT beside your TargetFrame.
    petFrameOnTop=false,			-- true or false - Shows the PetFrame above the PlayerFrame.
    hitIndicators=true,				-- If true shows hitIndicators over PlayerFrame portrait.
    disableStatusGlow=false,			-- If true disables glows for capped power bar.
    disableStatusPred=false,		-- If true disables power bar predictions.


--
    customStatusText=true,			-- Activates whoaUF statusText and activates options.
                                    -- Was created before Blizzard had "percent" and "numeric+percent". Blizzard statusText
                                    -- works mostly the same as whoaUF intendde to do back then in WotLK.
-- Only if -> "customStatusText=true"
    autoManaPercent=true,			-- If true percentages shown for mana classes.
    thousandSeparators=true,		-- If true shows 1.000 instead of 1000
    simpleHealth=true,				-- If true shows 100K instad of 100.000.
    showMaxHealth=false,			-- If true shows player / target / focus MaxHealth.



}

whoaUnitFrames.config.phrases = {
    ["1000 separator"] = ".",
    ["Dead"] = "Dead",
    ["Ghost"] = "Ghost",
    ["Offline"] = "Offline",
    ["kilo"] = " K",  -- simpleHealth 1.000
    ["mega"] = " M",  -- simpleHealth 1.000.000
    ["giga"] = " G",  -- simpleHealth 1.000.000.000
}

---------------------------------------------------
-- Class Specific Configuration
---------------------------------------------------
if class == "PRIEST" then
whoaUnitFrames.config.repositionPartyText = false
    -- whoaUnitFrames.config.largeAuraSize = 27
    -- whoaUnitFrames.config.smallAuraSize = 21
    -- whoaUnitFrames.config.autoManaPercent = true
    -- whoaUnitFrames.config.classColor = false
end
if class == "DRUID" then
    whoaUnitFrames.config.repositionPartyText = false
end
if class == "MONK" then
    whoaUnitFrames.config.repositionPartyText = false
end
if class == "MAGE" then
    whoaUnitFrames.config.repositionPartyText = false
end
if class == "PALADIN" then
    whoaUnitFrames.config.repositionPartyText = false
end
if class == "SHAMAN" then
    whoaUnitFrames.config.repositionPartyText = false
end
if class == "WARLOCK" then
    whoaUnitFrames.config.repositionPartyText = false
end
if class == "DEATHKNIGHT" then
    whoaUnitFrames.config.repositionPartyText = false
end
if class == "HUNTER" then
    whoaUnitFrames.config.repositionPartyText = false
end
if class == "ROGUE" then
    whoaUnitFrames.config.repositionPartyText = false
end
if class == "WARRIOR" then
    whoaUnitFrames.config.repositionPartyText = false
end
if class == "DEMONHUNTER" then
    whoaUnitFrames.config.repositionPartyText = false
end
