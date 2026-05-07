vim.opt.number = true
vim.opt.relativenumber = true
-- ability to undo changes after exiting and reopening the file
vim.opt.undofile = true
-- window splitting
vim.opt.splitbelow = true
vim.opt.splitright = true
-- leader key mapping
vim.g.mapleader = " "
-- adding 4 spaces as tabs
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4 -- set to 0 to default to tabstop value
-- making vim use system clipboard
vim.opt.clipboard = "unnamedplus"
-- plugin Manager
-- Lazyvim
-- https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

-- color theme (gruvbox)
{
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("gruvbox")
        end,
    },

-- File Finder
-- fzf
-- Example usage: type :Files, then twice "space" to open the file finder, close with q
{
        "https://github.com/junegunn/fzf.vim",
        dependencies = {
            "https://github.com/junegunn/fzf",
        },
        keys = {
            { "<Leader><Leader>", "<Cmd>Files<CR>", desc = "Find files" },
            { "<Leader>,", "<Cmd>Buffers<CR>", desc = "Find buffers" },
            { "<Leader>/", "<Cmd>Rg<CR>", desc = "Search project" },
        },
    },
-- commenting using gc
{
        "https://github.com/numToStr/Comment.nvim",
        event = "VeryLazy", -- Special lazy.nvim event for things that can load later and are not important for the initial UI
        config = function()
            require("Comment").setup()
        end,
    },
-- indent settings 
{
        "https://github.com/tpope/vim-sleuth",
        event = { "BufReadPost", "BufNewFile" }, -- Load after your file content
    },

-- reopens file at the last location
{
        "https://github.com/farmergreg/vim-lastplace",
        event = "BufReadPost",
    },

-- showing indent lines
{
        "https://github.com/lukas-reineke/indent-blankline.nvim",
        event = { "VeryLazy" },
        config = function()
            require("ibl").setup()
        end,
    },

-- status line
{
        "https://github.com/nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        config = function()
            require("lualine").setup()
        end,
    },
-- jump to a line or a character, similar to avy. See documentation to know usage
{
        "https://github.com/folke/flash.nvim",
        event = "VeryLazy",
        config = function()
            require("flash").setup({
                modes = {
                    search = {
                        enabled = true,
                    },
                    char = {
                        enabled = false,
                    },
                },
            })
        end,
    },
})

