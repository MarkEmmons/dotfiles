local colorscheme = "zenbones"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end

-- Set some extra highlights
local hl = vim.api.nvim_set_hl

-- Dap Signs
hl(0, "DapSignBreakpoint", { link = "Error" })

-- Neotest
hl(0, "NeotestAdapterName", { link = "Normal" })
hl(0, "NeotestBorder", { link = "Normal" })
hl(0, "NeotestDir", { link = "Normal" })
hl(0, "NeotestExpandMarker", { link = "Normal" })
hl(0, "NeotestFailed", { link = "Normal" })
hl(0, "NeotestFile", { link = "Normal" })
hl(0, "NeotestFocused", { link = "Normal" })
hl(0, "NeotestIndent", { link = "Normal" })
hl(0, "NeotestMarked", { link = "Normal" })
hl(0, "NeotestNamespace", { link = "Normal" })
hl(0, "NeotestPassed", { link = "Normal" })
hl(0, "NeotestRunning", { link = "Normal" })
hl(0, "NeotestWinSelect", { link = "Normal" })
hl(0, "NeotestSkipped", { link = "Normal" })
hl(0, "NeotestTarget", { link = "Normal" })
hl(0, "NeotestTest", { link = "Normal" })
hl(0, "NeotestUnknown", { link = "Normal" })


--hl(0, "NavicIconsFile", { fg = c.fg, bg = c.bg })
--hl(0, "NavicIconsModule", { fg = c.fg, bg = c.bg })
--hl(0, "NavicIconsNamespace", { fg = c.fg, bg = c.bg })
--hl(0, "NavicIconsPackage", { fg = c.fg, bg = c.bg })
--hl(0, "NavicIconsClass", { fg = c.fg, bg = c.bg })
--hl(0, "NavicIconsMethod", { fg = c.fg, bg = c.bg })
--hl(0, "NavicIconsProperty", { fg = c.fg, bg = c.bg })
--hl(0, "NavicIconsField", { fg = c.fg, bg = c.bg })
--hl(0, "NavicIconsConstructor", { fg = c.fg, bg = c.bg })
--hl(0, "NavicIconsEnum", { fg = c.fg, bg = c.bg })
--hl(0, "NavicIconsInterface", { fg = c.fg, bg = c.bg })
--hl(0, "NavicIconsFunction", { fg = c.fg, bg = c.bg })
--hl(0, "NavicIconsVariable", { fg = c.fg, bg = c.bg })
--hl(0, "NavicIconsConstant", { fg = c.fg, bg = c.bg })
--hl(0, "NavicIconsString", { fg = c.fg, bg = c.bg })
--hl(0, "NavicIconsNumber", { fg = c.fg, bg = c.bg })
--hl(0, "NavicIconsBoolean", { fg = c.fg, bg = c.bg })
--hl(0, "NavicIconsArray", { fg = c.fg, bg = c.bg })
--hl(0, "NavicIconsObject", { fg = c.fg, bg = c.bg })
--hl(0, "NavicIconsKey", { fg = c.fg, bg = c.bg })
--hl(0, "NavicIconsNull", { fg = c.fg, bg = c.bg })
--hl(0, "NavicIconsEnumMember", { fg = c.fg, bg = c.bg })
--hl(0, "NavicIconsStruct", { fg = c.fg, bg = c.bg })
--hl(0, "NavicIconsEvent", { fg = c.fg, bg = c.bg })
--hl(0, "NavicIconsOperator", { fg = c.fg, bg = c.bg })
--hl(0, "NavicIconsTypeParameter", { fg = c.fg, bg = c.bg })
--hl(0, "NavicText", { fg = c.sign_add, bg = c.sign_add })
--hl(0, "NavicSeparator", { fg = c.fg, bg = c.bg })
