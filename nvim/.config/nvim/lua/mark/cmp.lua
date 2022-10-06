local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
	return
end

-- Add some kind_icons
--   פּ ﯟ   some other good icons
local kind_icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}
-- find more here: https://www.nerdfonts.com/cheat-sheet

-- cmp.setup
-- Hold alt to scroll through completion menu.
cmp.setup {
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = {
		["<A-k>"] = cmp.mapping.select_prev_item(),
		["<A-j>"] = cmp.mapping.select_next_item(),
		["<A-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
		["<A-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
		["<A-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<A-y>"] = cmp.config.disable,
		["<A-e>"] = cmp.mapping {
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		},
		-- Only confirm explicitly selected items.
		["<CR>"] = cmp.mapping.confirm { select = false },
		--["<Tab>"] = cmp.mapping(function(fallback)
		--	if cmp.visible() then
		--		cmp.select_next_item()
		--	else
		--		fallback()
		--	end
		--end, {
		--	"i",
		--	"s",
		--}),
		--["<S-Tab>"] = cmp.mapping(function(fallback)
		--	if cmp.visible() then
		--		cmp.select_prev_item()
		--	else
		--		fallback()
		--	end
		--end, {
		--	"i",
		--	"s",
		--}),
	},
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
			vim_item.menu = ({
				nvim_lsp = "[LSP]",
				nvim_lua = "[LUA]",
				buffer = "[Buffer]",
				path = "[Path]",
			})[entry.source.name]
			return vim_item
		end,
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "buffer" },
		{ name = "path" },
	},
	-- Do not auto-select the first item in the list
	preselect = cmp.PreselectMode.None,
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
	window = {
		documentation = {
    		border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
		},
	},
	experimental = {
		ghost_text = false,
		native_menu = false,
	},
}
