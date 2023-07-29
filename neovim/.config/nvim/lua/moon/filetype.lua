vim.api.nvim_create_autocmd('Filetype', {
  pattern = '*.jet',
  command = 'set filetype=html'
})
