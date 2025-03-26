return {
  {
    "zbirenbaum/copilot.lua",
    config = function()
      require("copilot").setup({
        cmd = "Copilot",
        event = "InsertEnter",
        build = ":Copilot auth",
        suggestion = {
          enabled = true,
          auto_trigger = true,
        },
        panel = { enabled = false },

        vim.keymap.set("i", "<C-l>", function()
          require("copilot.suggestion").accept()
        end, { silent = true, desc = "Accept Copilot Suggestion" }),
        vim.keymap.set("i", "<C-j>", function()
          require("copilot.suggestion").next()
        end, { silent = true, desc = "Next Copilot Suggestion" }),
        vim.keymap.set("i", "<C-k>", function()
          require("copilot.suggestion").prev()
        end, { silent = true, desc = "Previous Copilot Suggestion" }),
      })
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
      model = "claude-3.7-sonnet",
    },
    cmd = {
      "CopilotChat",
      "CopilotChatToggle",
      "CopilotChatAgents",
      "CopilotChatModels",
      "CopilotChatExplain",
      "CopilotChatReview",
      "CopilotChatFix",
      "CopilotChatOptimize",
      "CopilotChatDocs",
      "CopilotChatTests",
      "CopilotChatCommit",
    },
    keys = {
      { "<leader>cct", "<cmd>CopilotChatToggle<CR>", desc = "Toggle AI Chat" },
      { "<leader>cce", "<cmd>CopilotChatExplain<CR>", mode = { "v", "n" }, desc = "AI Explain" },
      { "<leader>ccr", "<cmd>CopilotChatReview<CR>", mode = { "v", "n" }, desc = "AI Review" },
      { "<leader>ccf", "<cmd>CopilotChatFix<CR>", mode = { "v", "n" }, desc = "AI Fix" },
      { "<leader>cco", "<cmd>CopilotChatOptimize<CR>", mode = { "v", "n" }, desc = "AI Optimize" },
      { "<leader>cctt", "<cmd>CopilotChatTests<CR>", mode = { "v", "n" }, desc = "AI Tests" },
      { "<leader>ccm", "<cmd>CopilotChatModels<CR>", mode = { "v", "n" }, desc = "AI Models" },
      { "<leader>ccrr", "<cmd>CopilotChatReset<CR>", desc = "AI Chat Reset" },
    },
  },
}
