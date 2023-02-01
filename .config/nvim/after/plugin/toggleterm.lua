require("toggleterm").setup{
	direction = 'float',
	open_mapping = [[<c-t>]],
}
local Terminal = require("toggleterm.terminal").Terminal
function _ASYNC_PUBLISH(file_path)
	local file_path = file_path or ''    local publish = Terminal:new({ cmd = "perl $HOME/Documents/git/air8/_VERKTYG/publish.pm " .. file_path .. " 1; read",
		hidden = false, direction = "horizontal", open_mapping = [[<c-y>]] })
	publish:toggle()
end
