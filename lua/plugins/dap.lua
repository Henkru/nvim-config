return {
  {
    'mfussenegger/nvim-dap',
    commit = 'b8abfc6baba5d9a561ca5d1a82aa790bc8175e6a',
    dependencies = {
      {
        'rcarriga/nvim-dap-ui',
        commit = 'f7d75cca202b52a60c520ec7b1ec3414d6e77b0f',
      },
      {
        'theHamsta/nvim-dap-virtual-text',
        commit = 'fbdb48c2ed45f4a8293d0d483f7730d24467ccb6',
      },
      {
        'jay-babu/mason-nvim-dap.nvim',
        commit = 'e51f9b259f066c4347f9a79ffde54c29a0619384',
        dependencies = {
          'williamboman/mason.nvim',
        },
      },
    },
    config = function()
      local dap = require('dap')
      local dapui = require('dapui')

      require('mason-nvim-dap').setup({
        ensure_installed = { 'debugpy', 'codelldb' },
        handlers = {},
      })

      require('nvim-dap-virtual-text').setup()
      dapui.setup()

      dap.adapters.python = {
        type = 'executable',
        command = vim.fn.stdpath('data') .. '/mason/packages/debugpy/venv/bin/python',
        args = { '-m', 'debugpy.adapter' },
      }

      dap.adapters.codelldb = {
        type = 'executable',
        command = 'env',
        args = {
          '-i',
          'HOME=' .. (vim.env.HOME or ''),
          'PATH=/usr/bin:/bin:/usr/sbin:/sbin',
          'LANG=' .. (vim.env.LANG or 'en_US.UTF-8'),
          'LC_ALL=' .. (vim.env.LC_ALL or vim.env.LANG or 'en_US.UTF-8'),
          'TERM=' .. (vim.env.TERM or 'xterm-256color'),
          vim.fn.stdpath('data') .. '/mason/packages/codelldb/extension/adapter/codelldb',
          '--liblldb',
          vim.fn.stdpath('data') .. '/mason/packages/codelldb/extension/lldb/lib/liblldb.dylib',
        },
        detached = false,
      }

      dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open()
      end

      dap.listeners.before.event_terminated['dapui_config'] = function()
        dapui.close()
      end

      dap.listeners.before.event_exited['dapui_config'] = function()
        dapui.close()
      end

      local function is_executable(path)
        return vim.fn.executable(path) == 1 and vim.fn.isdirectory(path) == 0
      end

      local function find_first_executable(patterns)
        local cwd = vim.fn.getcwd()
        for _, pattern in ipairs(patterns) do
          local matches = vim.fn.globpath(cwd, pattern, false, true)
          for _, path in ipairs(matches) do
            if is_executable(path) and not path:match('%.dSYM') then
              return path
            end
          end
        end
        return nil
      end

      local function rust_program()
        local default = find_first_executable({ 'target/debug/*' }) or ''
        return vim.fn.input('Path to Rust executable: ', default, 'file')
      end

      local function c_program()
        local cwd = vim.fn.getcwd()
        local default = nil

        if is_executable(cwd .. '/a.out') then
          default = cwd .. '/a.out'
        else
          default = find_first_executable({ 'build/*', 'bin/*' })
        end

        return vim.fn.input('Path to C executable: ', default or '', 'file')
      end

      require('keymaps').dap()

      dap.configurations.rust = {
        {
          name = 'Launch (codelldb)',
          type = 'codelldb',
          request = 'launch',
          program = rust_program,
          cwd = function()
            return vim.fn.getcwd()
          end,
          args = {},
          stopOnEntry = false,
        },
      }

      dap.configurations.c = {
        {
          name = 'Launch (codelldb)',
          type = 'codelldb',
          request = 'launch',
          program = c_program,
          cwd = function()
            return vim.fn.getcwd()
          end,
          args = {},
          stopOnEntry = false,
        },
      }

      dap.configurations.python = {
        {
          type = 'python',
          request = 'launch',
          name = 'Launch file',
          program = '${file}',
          pythonPath = function()
            local python = vim.fn.exepath('python3')
            if python == '' then
              python = vim.fn.exepath('python')
            end
            if python == '' then
              python = 'python'
            end
            return python
          end,
        },
      }
    end,
  },
}
