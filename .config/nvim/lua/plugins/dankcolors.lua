return {
	{
		"RRethy/base16-nvim",
		priority = 1000,
		config = function()
			require('base16-colorscheme').setup({
				base00 = '#0f150b',
				base01 = '#0f150b',
				base02 = '#86927c',
				base03 = '#86927c',
				base04 = '#dcedd0',
				base05 = '#f7fff2',
				base06 = '#f7fff2',
				base07 = '#f7fff2',
				base08 = '#ff633f',
				base09 = '#ff633f',
				base0A = '#7ff825',
				base0B = '#57ff4c',
				base0C = '#bcff8c',
				base0D = '#7ff825',
				base0E = '#98ff4c',
				base0F = '#98ff4c',
			})

			vim.api.nvim_set_hl(0, 'Visual', {
				bg = '#86927c',
				fg = '#f7fff2',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Statusline', {
				bg = '#7ff825',
				fg = '#0f150b',
			})
			vim.api.nvim_set_hl(0, 'LineNr', { fg = '#86927c' })
			vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#bcff8c', bold = true })

			vim.api.nvim_set_hl(0, 'Statement', {
				fg = '#98ff4c',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Keyword', { link = 'Statement' })
			vim.api.nvim_set_hl(0, 'Repeat', { link = 'Statement' })
			vim.api.nvim_set_hl(0, 'Conditional', { link = 'Statement' })

			vim.api.nvim_set_hl(0, 'Function', {
				fg = '#7ff825',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Macro', {
				fg = '#7ff825',
				italic = true
			})
			vim.api.nvim_set_hl(0, '@function.macro', { link = 'Macro' })

			vim.api.nvim_set_hl(0, 'Type', {
				fg = '#bcff8c',
				bold = true,
				italic = true
			})
			vim.api.nvim_set_hl(0, 'Structure', { link = 'Type' })

			vim.api.nvim_set_hl(0, 'String', {
				fg = '#57ff4c',
				italic = true
			})

			vim.api.nvim_set_hl(0, 'Operator', { fg = '#dcedd0' })
			vim.api.nvim_set_hl(0, 'Delimiter', { fg = '#dcedd0' })
			vim.api.nvim_set_hl(0, '@punctuation.bracket', { link = 'Delimiter' })
			vim.api.nvim_set_hl(0, '@punctuation.delimiter', { link = 'Delimiter' })

			vim.api.nvim_set_hl(0, 'Comment', {
				fg = '#86927c',
				italic = true
			})

			local current_file_path = vim.fn.stdpath("config") .. "/lua/plugins/dankcolors.lua"
			if not _G._matugen_theme_watcher then
				local uv = vim.uv or vim.loop
				_G._matugen_theme_watcher = uv.new_fs_event()
				_G._matugen_theme_watcher:start(current_file_path, {}, vim.schedule_wrap(function()
					local new_spec = dofile(current_file_path)
					if new_spec and new_spec[1] and new_spec[1].config then
						new_spec[1].config()
						print("Theme reload")
					end
				end))
			end
		end
	}
}
