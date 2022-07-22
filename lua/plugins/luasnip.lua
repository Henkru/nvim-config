require('luasnip').config.set_config {
  history = true,
  update_events = "TextChanged,TextChangedI",
}

require("luasnip.loaders.from_vscode").lazy_load()
