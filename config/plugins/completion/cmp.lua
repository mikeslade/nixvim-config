luasnip = require("luasnip")
kind_icons = {
	Text = "󰊄",
	Method = "",
	Function = "󰡱",
	Constructor = "",
	Field = "",
	Variable = "󱀍",
	Class = "",
	Interface = "",
	Module = "󰕳",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
}

local cmp = require("cmp")

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
	sources = {
		{ name = "buffer" },
	},
})

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		{ name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
		{ name = "buffer" },
	}),
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
	-- formatting = {
	-- 	format = function(entry, item)
	-- 		local color_item = require("nvim-highlight-colors").format(entry, { kind = item.kind })
	-- 		item = require("lspkind").cmp_format({
	-- 			-- any lspkind format settings here
	-- 		})(entry, item)
	-- 		if color_item.abbr_hl_group then
	-- 			item.kind_hl_group = color_item.abbr_hl_group
	-- 			item.kind = color_item.abbr
	-- 		end
	-- 		return item
	-- 	end,
	-- },
})
