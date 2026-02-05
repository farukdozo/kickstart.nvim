return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false,                    -- neo-tree will lazily load itself
    keys = {
      -- { '\\',         ':Neotree reveal<CR>',     desc = 'NeoTree reveal',      silent = true },
      { '<leader>e',  '',                        desc = 'NeoTree' },
      { '<leader>ec', ':Neotree close<CR>',      desc = 'Neotree [C]lose' },
      { '<leader>et', ':Neotree toggle<CR>',     desc = 'NeoTree [T]oggle' },
      { '<leader>ef', ':Neotree filesystem<CR>', desc = 'NeoTree [F]ilesystem' },
      { '<leader>eb', ':Neotree buffers<CR>',    desc = 'NeoTree [B]uffers' },
      { '<leader>eg', ':Neotree git_status<CR>', desc = 'NeoTree [G]it status' },
    },
  }
}
