local function my_on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	--default mappings
	api.config.mappings.default_on_attach(bufnr)

	--custom mappings
end

--pass to setup along with my other options

require("nvim-tree").setup {
	sort = {
      sorter = "case_sensitive",
    },
    view = {
      width = 30,
    },
    renderer = {
      group_empty = true,
    },
    filters = {
      dotfiles = false,
    },
    git = {
      enable = true,
    },
	on_attach = my_on_attach,
}
