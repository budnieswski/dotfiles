return {
  "lewis6991/gitsigns.nvim",
  event = "LazyFile",
  opts = {
    current_line_blame = true,
    on_attach = function(buffer)
      vim.keymap.set({ "n", "v" }, "<leader>gl", ":Gitsigns toggle_current_line_blame<CR>", {
        buffer = buffer,
        desc = "Git Toggle Line Blame",
      })
    end,
  },
}
