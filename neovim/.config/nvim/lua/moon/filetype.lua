local map_pattern_ft = function(pattern, ft)
	vim.api.nvim_create_autocmd("Filetype", {
		pattern = pattern,
		command = "set filetype=" .. ft,
	})
end

map_pattern_ft("*.jet", "html")
