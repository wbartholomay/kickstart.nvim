-- Autocompletion
return {
	{
		'saghen/blink.cmp',
		event = 'VimEnter',
		version = '1.*',
		dependencies = {
			{
				'L3MON4D3/LuaSnip',
				version = '2.*',
				build = (function()
					if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
						return
					end
					return 'make install_jsregexp'
				end)(),
				opts = {
					history = true,
					region_check_events = "InsertEnter",
					delete_check_events = "TextChanged,InsertLeave",
				},
			},
			'folke/lazydev.nvim',
		},
		opts = {
			keymap = { preset = 'default' },
			appearance = { nerd_font_variant = 'mono' },
			completion = { documentation = { auto_show = false, auto_show_delay_ms = 500 } },
			sources = {
				default = { 'lsp', 'path', 'snippets', 'lazydev' },
				providers = {
					lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
					cmdline = {
						enabled = function()
							return vim.fn.getcmdline():sub(1, 1) ~= '!'
						end,
					},
				},
			},
			snippets = { preset = 'luasnip' },
			fuzzy = { implementation = 'lua' },
			signature = { enabled = true },
		},
	},
}
