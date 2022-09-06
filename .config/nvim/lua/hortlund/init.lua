require("hortlund.set")
require("hortlund.packer")

vim.api.nvim_command('autocmd BufRead,BufNewFile /Users/andreas.hortlund/Documents/git/air8/* setlocal fileencodings=iso-8859-1')
vim.api.nvim_command('au BufNewFile,BufRead *.tt set filetype=tt2html')


-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

--Get store
store = os.getenv("ASKAS_BUTIK")

-- lualine
require('lualine').setup{
  sections = {
    lualine_c = {{'filename', file_status = true, path = 2}},
	lualine_x = {"store",'encoding', 'fileformat', 'filetype'}
  }
}
vim.cmd[[let g:tokyonight_style = "night"]]
vim.cmd[[let g:tokyonight_italic_functions = 1]]

vim.cmd[[colorscheme tokyonight]]

--nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>
--nnoremap <backspace> <C-]>
--nnoremap <tab>       <C-T>
map("n", "<backspace>", "<C-]>")
map("n", "<tab>", "<C-T>")
--map("n", "<C-p>", "<cmd>Telescope find_files<CR>")
map("n", "<C-f>", "<cmd>Telescope live_grep<CR>")
map("n", "<Leader>f", "<cmd>Telescope grep_string<CR>")
map("n", "<Leader>s", ":<C-u>call gitblame#echo()<CR>")
map("n", "<Leader>b", ":! perl /Users/andreas.hortlund/Documents/git/air8/_VERKTYG/publish.pm %:p 1<CR>")
