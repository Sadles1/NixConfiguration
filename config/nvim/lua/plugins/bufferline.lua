vim.pack.add({
	{
		src = "https://github.com/akinsho/bufferline.nvim.git",
	},
	"https://github.com/nvim-tree/nvim-web-devicons"
})

require('bufferline').setup {
	options = {
		mode = 'buffers',
		themable = true,
		numbers = 'none',
		close_command = 'Bdelete! %d',
		path_components = 1,
		tab_size = 21,
		diagnostics = false,
		diagnostics_update_in_insert = false,
		color_icons = true,
		show_buffer_icons = true,
		show_buffer_close_icons = true,
		show_close_icons = true,
		persist_buffer_sort = true,
		separate_style = { '|', '|' },
		enforce_regular_tabs = true,
		always_show_bufferline = true,
		show_tab_indicators = false,
		minimum_padding = 1,
		sort_by = 'insert_at_end'
	},
	highlights = {
		separator = {
			fg = '#434C5E',
		},
		buffer_selected = {
			bold = true,
			italic = true,
		},
	},
}
