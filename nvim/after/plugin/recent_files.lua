vim.keymap.set("n", "<leader>fr",
  function()
      require('telescope').extensions.recent_files.pick()
  end)

