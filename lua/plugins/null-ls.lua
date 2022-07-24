local function bin_exists(name)
  local function file_exists(name)
     local f=io.open(name,"r")
     if f~=nil then io.close(f) return true else return false end
  end

  local paths = vim.split(os.getenv("PATH"), ":")
  for _, path in ipairs(paths) do
    if file_exists(path .. "/" .. name) then return true end
  end
  return false
end

local function include_if_exists(source)
  local command = source._opts.command
  return bin_exists(command) and source or nil
end

local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    include_if_exists(null_ls.builtins.diagnostics.hadolint),
    null_ls.builtins.formatting.autopep8,
    null_ls.builtins.formatting.terraform_fmt,
    null_ls.builtins.formatting.prettier
  },
})
