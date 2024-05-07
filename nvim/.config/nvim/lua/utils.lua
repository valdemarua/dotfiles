local M = {}

M.file_exists = function(filename, bufnr)
  local bufname = vim.api.nvim_buf_get_name(bufnr)
  return vim.fs.find(filename, { upward = true, path = bufname })[1]
end

return M
