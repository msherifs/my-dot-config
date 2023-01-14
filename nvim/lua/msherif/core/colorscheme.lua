local status, _ = pcall(vim.cmd, "colorscheme embark")

local bk_status, _ = pcall(vim.cmd, "set background=light")
if not status then
	print("Colorscheme not installed")
end
