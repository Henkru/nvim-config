require('codecompanion').setup({
  strategies = {
    chat = {
      adapter = 'openai',
    },
    inline = {
      adapter = 'openai',
    },
  },
  adapters = {
    openai = function()
      return require('codecompanion.adapters').extend('openai', {
        env = {
          api_key = 'cmd:op read op://personal/ChatGPT-API/password --no-newline',
        },
        schema = {
          model = {
            default = 'gpt-5-mini',
          },
        },
      })
    end,
  },
})
