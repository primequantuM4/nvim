require('code_runner').setup({
    filetype = {
        java = {
            "cd $dir &&",
            "javac $fileName &&",
            "java $fileNameWithoutExt"
        },
        elixir = "elixir",
        python = "python -u",
        go = "go run"
    }
});

vim.keymap.set("n", "<leader>rr", vim.cmd.RunCode);

