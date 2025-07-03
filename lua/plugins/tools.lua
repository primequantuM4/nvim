return {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function ()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<C-p>', builtin.find_files, {})
            vim.keymap.set('n', '<leader>pf', builtin.git_files, {})
            vim.keymap.set('n', '<leader>ps', function()
                builtin.grep_string({ search = vim.fn.input("Grep > ")});
            end)
        end
    },

    {
        'nvim-flutter/flutter-tools.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'stevearc/dressing.nvim',
        },
       config = function ()
            require("flutter-tools").setup{
                lsp = {
                        color = {
                            enabled = true,
                            background = true,
                            background_color = nil,
                            foreground = false,
                            virtual_text = true,
                            virtual_text_str = "■",
                        }
                }
            };

            -- Commands for easy flutter key access
            vim.keymap.set("n","<leader>flr", vim.cmd.FlutterRun);
            vim.keymap.set("n","<leader>fe", vim.cmd.FlutterEmulators);
            vim.keymap.set("n","<leader>fq", vim.cmd.FlutterQuit);
            vim.keymap.set("n", "<leader>drs", vim.cmd.FlutterLspRestart);
            vim.keymap.set("n", "<leader>fr", vim.cmd.FlutterRestart);
            vim.keymap.set("n", "<leader>frr", vim.cmd.FlutterReload);
        end,
    },

    {
        "mbbill/undotree",
        config = function ()
            vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<CR>")       
        end
        },

    {
        "tpope/vim-fugitive",
        config = function ()
            vim.keymap.set("n", "<leader>gs", vim.cmd.Git);
            vim.keymap.set("n", "<leader>gp", "<cmd>Git push<CR>");

            vim.keymap.set("n", "<leader>ga", "<cmd>diffget //2<CR>");
            vim.keymap.set("n", "<leader>gl", "<cmd>diffget //3<CR>");
        end
    },

    {
            'akinsho/toggleterm.nvim', version = "*",
            config = function()
      -- Setup toggleterm as per your provided config
          local status_ok, toggleterm = pcall(require, "toggleterm")
          if not status_ok then
              return
          end

          toggleterm.setup({
              size = 20,
              open_mapping = [[<c-\>]],
              hide_numbers = true,
              shade_filetypes = {},
              shade_terminals = true,
              shading_factor = 2,
              start_in_insert = true,
              insert_mappings = true,
              persist_size = true,
              direction = "horizontal",
              close_on_exit = true,
              shell = vim.o.shell,
              float_opts = {
                  border = "curved",
                  winblend = 0,
                  highlights = {
                      border = "Normal",
                      background = "Normal",
                  },
              },
          })

          -- Function to set terminal keymaps
          function _G.set_terminal_keymaps()
              local opts = { noremap = true }
              vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
              vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
              vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
              vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
              vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
              vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
          end

          vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

          -- Terminal commands setup
          local Terminal = require("toggleterm.terminal").Terminal
          local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

          function _LAZYGIT_TOGGLE()
              lazygit:toggle()
          end

          local node = Terminal:new({ cmd = "node", hidden = true })

          function _NODE_TOGGLE()
              node:toggle()
          end

          local python = Terminal:new({ cmd = "python3", hidden = true })

          function _PYTHON_TOGGLE()
              python:toggle()
          end
      end
    },

    {
        "numToStr/Comment.nvim",
        opts = {}

    },

    {
        "windwp/nvim-autopairs", opts = {}
    }
}
