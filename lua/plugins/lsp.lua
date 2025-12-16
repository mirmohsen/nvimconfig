return {
    -- LSP core
    {
        "neovim/nvim-lspconfig",
        dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
        config = function()
            -- Mason
            require("mason").setup()

            require("mason-lspconfig").setup({
                ensure_installed = {
                    "ts_ls",             -- Node.js
                    "lua_ls",               -- Lua
                },
            })

            -- Common keymaps when LSP attaches
            local on_attach = function(_, bufnr)
                local opts = { buffer = bufnr }

                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
            end

            -- Node.js (Javascript / Typescript)
            vim.lsp.config.ts_ls = {
                 on_attach = on_attach,
            }

            -- Lua
            vim.lsp.config.lua_ls = {
                on_attach = on_attach,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                            checkThirdParty = false,
                        },
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            }
        end,
    },
}
