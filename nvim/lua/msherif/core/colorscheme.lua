local status, _ = pcall(vim.cmd, "colorscheme moonfly")
if not status then
	print("Colorscheme not installed")
end
