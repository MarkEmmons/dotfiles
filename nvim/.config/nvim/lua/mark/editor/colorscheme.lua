local colorscheme = "rosebones"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end

-- Set some extra highlights
local hl = vim.api.nvim_set_hl

-- Dap Signs
hl(0, "DapSignBreakpoint", { link = "Todo" })
hl(0, "DapSignBreakpointCondition", { link = "Conditional" })
hl(0, "DapSignLogPoint", { link = "PMenuSbar" })
hl(0, "DapSignStopped", { link = "Visual" })
hl(0, "DapSignBreakpointRejected", { link = "WarningMsg" })

-- Dap UI
hl(0, "DapUIVariable", { link = "Normal" })
hl(0, "DapUIValue", { link = "Normal" })
hl(0, "DapUIFrameName", { link = "Normal" })
hl(0, "DapUIFloatNormal", { link = "NormalFloat" })
hl(0, "DapUIBreakpointsLine", { link = "DapUILineNumber" })
hl(0, "DapUICurrentFrameName", { link = "DapUIBreakpointsCurrentLine" })

-- TODO:
hl(0, "DapUIScope", { link = "Normal" })
hl(0, "DapUIType", { link = "Normal" })
hl(0, "DapUIModifiedValue", { link = "Normal" })
hl(0, "DapUIDecoration", { link = "Normal" })
hl(0, "DapUIThread", { link = "Normal" })
hl(0, "DapUIStoppedThread", { link = "Normal" })
hl(0, "DapUISource", { link = "Normal" })
hl(0, "DapUILineNumber", { link = "Normal" })
hl(0, "DapUIFloatBorder", { link = "Normal" })
hl(0, "DapUIWatchesEmpty", { link = "Normal" })
hl(0, "DapUIWatchesValue", { link = "Normal" })
hl(0, "DapUIWatchesError", { link = "Normal" })
hl(0, "DapUIBreakpointsPath", { link = "Normal" })
hl(0, "DapUIBreakpointsInfo", { link = "Normal" })
hl(0, "DapUIBreakpointsCurrentLine", { link = "Normal" })
hl(0, "DapUIBreakpointsDisabledLine", { link = "Normal" })

-- TODO: These might not be overwritable
hl(0, "DapUIPlayPause", { link = "Normal" })
hl(0, "DapUIRestart", { link = "Normal" })
hl(0, "DapUIStop", { link = "Normal" })
hl(0, "DapUIUnavailable", { link = "Normal" })
hl(0, "DapUIStepOver", { link = "Normal" })
hl(0, "DapUIStepInto", { link = "Normal" })
hl(0, "DapUIStepBack", { link = "Normal" })
hl(0, "DapUIStepOut", { link = "Normal" })

-- Neotest
hl(0, "NeotestPassed", { link = "String" })
hl(0, "NeotestFailed", { link = "DiagnosticError" })
hl(0, "NeotestRunning", { link = "Constant" })
hl(0, "NeotestSkipped", { link = "DiagnosticInfo" })
hl(0, "NeotestTest", { link = "Normal" })
hl(0, "NeotestNamespace", { link = "TSKeyword" })
hl(0, "NeotestFocused", { link = "QuickFixLine" })
hl(0, "NeotestFile", { link = "Keyword" })
hl(0, "NeotestDir", { link = "Keyword" })
hl(0, "NeotestIndent", { link = "Conceal" })
hl(0, "NeotestExpandMarker", { link = "Conceal" })
hl(0, "NeotestAdapterName", { link = "TSConstructor" })
--hl(0, "NeotestBorder", { link = "Normal" })
--hl(0, "NeotestMarked", { link = "Normal" })
--hl(0, "NeotestWinSelect", { link = "Normal" })
--hl(0, "NeotestTarget", { link = "Normal" })
--hl(0, "NeotestUnknown", { link = "Normal" })

-- Navic
hl(0, "NavicIconsFile", { link = "Directory" })
hl(0, "NavicIconsModule", { link = "TSInclude" })
hl(0, "NavicIconsClass", { link = "Type" })
hl(0, "NavicIconsMethod", { link = "Function" })
hl(0, "NavicIconsFunction", { link = "Function" })
hl(0, "NavicIconsConstructor", { link = "TSConstructor" })
hl(0, "NavicIconsBoolean", { link = "TSBoolean" })
hl(0, "NavicIconsField", { link = "TSField" })
hl(0, "NavicIconsNumber", { link = "TSNumber" })
hl(0, "NavicIconsConstant", { link = "TSConstant" })
hl(0, "NavicIconsString", { link = "TSString" })
hl(0, "NavicText", { link = "TSText" })
hl(0, "NavicIconsVariable", { link = "TSVariable" })
hl(0, "NavicIconsEnumMember", { link = "CmpItemKindEnumMember" })
hl(0, "NavicIconsStruct", { link = "Type" })
hl(0, "NavicIconsEvent", { link = "CmpItemKindEventDefault" })
hl(0, "NavicIconsOperator", { link = "TSOperator" })
hl(0, "NavicIconsTypeParameter", { link = "Identifier" })
hl(0, "NavicIconsArray", { link = "TSConstant" })
hl(0, "NavicIconsObject", { link = "TSType" })
hl(0, "NavicIconsNamespace", { link = "TSNamespace" })
hl(0, "NavicIconsPackage", { link = "TSNamespace" })
hl(0, "NavicIconsNull", { link = "TSType" })
hl(0, "NavicIconsProperty", { link = "TSProperty" })
hl(0, "NavicIconsEnum", { link = "CmpItemKindEnum" })
hl(0, "NavicIconsInterface", { link = "CmpItemKindInterface" })
hl(0, "NavicIconsKey", { link = "SpecialKey" })
hl(0, "NavicSeparator", { link = "MsgSeparator" })
