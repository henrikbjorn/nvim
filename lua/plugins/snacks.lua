return {
  {
    "folke/snacks.nvim",
    lazy = false,
    priority = 1000,
    ---@type snacks.Config
    opts = {
      picker = {
        matcher = {
          frecency = true
        },
        sources = {
          files = { hidden = true },
        },
      },
      rename = {
      },
      indent = {
        animate = {
          enabled = false,
        }
      },
      dashboard = {

        preset = {
          header = [[
      ██████████████████████████████████████      
    ██▒▒██    ░░██  ██    ░░██▒▒██    ░░██▓▓██    
  ██▒▒  ░░██░░██    ░░██░░██▒▒  ░░██░░██▓▓  ▓▓██  
██▒▒  ░░  ░░██    ░░  ░░██▒▒  ░░  ░░██▓▓  ▓▓  ▓▓██
██████████████████████████████████████████████████
██▒▒▒▒▒▒▒▒░░██        ░░██▒▒▒▒▒▒▒▒░░██▓▓▓▓▓▓▓▓▓▓██
  ██▒▒  ░░░░██      ░░░░██▒▒    ░░░░██▓▓  ▓▓▓▓██  
    ██▒▒  ░░░░██    ░░░░██▒▒  ░░░░██▓▓  ▓▓▓▓██    
      ██▒▒  ░░██    ░░░░██▒▒  ░░░░██▓▓  ▓▓██      
        ██▒▒  ░░██  ░░░░██▒▒  ░░██▓▓  ▓▓██        
          ██▒▒░░██  ░░░░██▒▒  ░░██▓▓▓▓██          
            ██▒▒░░██  ░░██▒▒░░██▓▓▓▓██            
              ██▒▒██  ░░██▒▒░░██▓▓██              
                ██▒▒██░░██▒▒██▓▓██                
                  ████░░██▒▒████                  
                    ██░░██▒▒██                    
                      ██████                      ]],
        },
      },

      statuscolumn = {
      },
    },
    keys = {
      { "<leader>,", function() Snacks.picker.files() end, desc = "Find Files" },
      { "<leader>rg", function() Snacks.picker.grep() end, desc = "Grep" },
      { "<leader>b", function() Snacks.picker.buffers() end, desc = "Buffers" },
      { "<space>q", function() Snacks.picker.loclist() end, desc = "Location List" },
      { "<leader>n", function() Snacks.rename.rename_file() end, desc = "Rename File" },
      { "gD", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
      { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
    },
  }
}
