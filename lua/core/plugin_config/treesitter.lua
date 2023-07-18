require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "svelte", "rust", "yaml", "python", "ruby", "go", "toml", "javascript", "html"},

  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
}
