local M = {}
M.buffer_paths = function(bufnr)
  local bufname = vim.api.nvim_buf_get_name(bufnr)
  if bufname == '' then
    return { abs = '', root = nil, relative = '' }
  end
  local abs = vim.fs.normalize(vim.fn.fnamemodify(bufname, ':p'))
  local function is_prefix(root, path)
    if not root or root == '' then
      return false
    end
    root = vim.fs.normalize(root)
    if root:sub(-1) ~= '/' then
      root = root .. '/'
    end
    return path:sub(1, #root) == root
  end
  local function deepest_prefix(roots, path)
    local best = nil
    for _, r in ipairs(roots) do
      if is_prefix(r, path) then
        if not best or #r > #best then
          best = r
        end
      end
    end
    return best
  end
  -- 1) LSP root (deepest)
  local lsp_roots = {}
  for _, client in ipairs(vim.lsp.get_clients({ bufnr = bufnr })) do
    local rd = client.config and client.config.root_dir
    if rd and rd ~= '' then
      table.insert(lsp_roots, rd)
    end
  end
  local root = deepest_prefix(lsp_roots, abs)
  -- 2) vim.fs.root with .git
  if not root then
    local fs_root = vim.fs.root(bufnr, { '.git' })
    if is_prefix(fs_root, abs) then
      root = fs_root
    end
  end
  -- 3) cwd
  if not root then
    local cwd = vim.uv.cwd()
    if is_prefix(cwd, abs) then
      root = cwd
    end
  end
  local relative = abs
  if root then
    root = vim.fs.normalize(root)
    if root:sub(-1) ~= '/' then
      root = root .. '/'
    end
    relative = abs:sub(#root + 1)
  end
  return { abs = abs, root = root, relative = relative }
end

M.buffer_path = function(bufnr)
  local paths = M.buffer_paths(bufnr)
  return paths['relative'] ~= nil and paths['relative'] or paths['abs']
end

return M
