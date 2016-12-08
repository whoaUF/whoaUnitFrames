-- SET DEFAULTS
whoaDefaults = {
	["scale"] = 1,
	["smallAuraSize"] = 20,
	["largeAuraSize"] = 25,
	["customFontSize"] = 10,
	["customStatusText"] = 1,
	["autoManaPercent"] = true,			--	ALWAYS ON
	["thousandSeparators"] = true,		--	ALWAYS ON
	["simpleHealth"] = true,			--	ALWAYS ON
	-- ["showMaxHealth"] = true,		--	TO DEPRECATE?
	["whoaShowMaxHealth"] = 0,			--
	-- ["showToTName"] = false,			--	TO DEPRECATE
	["castbarFix"] = 0,
	["whoaClassColor"] = 1,
	["petFrameOnTop"] = 0,
	["hitIndicators"] = 0,
	["disableStatusGlow"] = 0,
	["disableStatusPred"] = 0,
	["whoaBackgroundTxt"] = 1,
	["whoaBuffSize"] = 17,

	["LARGE_FOCUS_SCALE"] = 1,
	["SMALL_FOCUS_SCALE"] = 0.75,
	["SMALL_FOCUS_UPSCALE"] = 1.333,
	
	-- ["1000 separator"] = ".",
	-- ["Dead"] = "Dead",
	-- ["Ghost"] = "Ghost",
	-- ["Offline"] = "Offline",
	-- ["kilo"] = " K",				-- simpleHealth 1.000
	-- ["mega"] = " M",				-- simpleHealth 1.000.000
	-- ["giga"] = " G",				-- simpleHealth 1.000.000.000

	-- ["castby"] = 55,
	-- ["fcastbx"] = -195,
	-- ["fcastbx"] = -195,
	-- ["palaspecialx"] = 0,
	-- ["targetoffocus"] = 1,
	-- ["classcolorttot"] = 1,
	-- ["classcolorftot"] = 1,
	-- ["castbx"] = -15,
	-- ["classcolorparty"] = 1,
	-- ["playername"] = 1,
	-- ["palaspecialy"] = 0,
	-- ["fcastby"] = 0,
	-- ["classcolortarget"] = 1,
	-- ["framescaletarget"] = 1,
	-- ["specialx"] = 0,
	-- ["framescalefocus"] = 1,
	-- ["classcolorFocus"] = 1,
	-- ["specialy"] = 0,
	-- ["monkspecialx"] = 0,
	-- ["framescaleplayer"] = 1,
	-- ["targetoftarget"] = 1,
	-- ["classcolorarena"] = 1,
	-- ["monkspecialy"] = 0,
	-- ["playerspecialbar"] = 1,
	["classPortraits"] = 0,					-- IN USE
	-- ["playerhitindi"] = 1,
	-- ["bartex"] = 4,
	-- ["classcolorplayer"] = 1,
	["darkentextures"] = 0.9,
	-- ["hformat"] = 5,
	-- ["classcolorcheck"] = 5,
}
whoaSaves = whoaSaves or whoaDefaults
function whoaSetDefaults() 
        whoaSaves.variable = whoaSaves.variable + 1
end