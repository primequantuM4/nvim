require("flutter-tools").setup{};

-- Commands for easy flutter key access
vim.keymap.set("n","<leader>flr", vim.cmd.FlutterRun); 
vim.keymap.set("n","<leader>fe", vim.cmd.FlutterEmulators);
vim.keymap.set("n","<leader>fq", vim.cmd.FlutterQuit); 
vim.keymap.set("n", "<leader>drs", vim.cmd.FlutterLspRestart);
vim.keymap.set("n", "<leader>fr", vim.cmd.FlutterRestart);
vim.keymap.set("n", "<leader>frr", vim.cmd.FlutterReload);
