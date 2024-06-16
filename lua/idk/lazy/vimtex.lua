return {
    "lervag/vimtex",
    lazy = false,
    init = function()
		vim.g.vimtex_view_method = "zathura"
		vim.g.vimtex_quickfix_open_on_warning = 0
		vim.g.vimtex_compiler_latexmk_engines = {
			_ = "-xelatex",
		}
    end
}