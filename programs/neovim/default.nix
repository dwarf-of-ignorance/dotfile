{ pkgs, inputs, ... }:
{
    programs = {
        neovim = {
            enable = true;
            defaultEditor = true;
            vimAlias = true;
            vimdiffAlias = true;
            withNodeJs = true;
            extraPackages = with pkgs; [
                lua-language-server
                gopls
                luajitPackages.lua-lsp
                nil
                rust-analyzer
                yaml-language-server
                bash-language-server
                pyright
                marksman
                jdt-language-server
                javascript-typescript-langserver
                vscode-langservers-extracted
                kotlin-language-server
                llvmPackages_18.clang-tools         
                xclip
                wl-clipboard
            ];
            plugins = with pkgs.vimPlugins; [
                auto-session
                dressing-nvim
                nvim-treesitter.withAllGrammars
                nvim-autopairs
                nvim-web-devicons
                nvim-cmp
                nvim-surround
                nvim-lspconfig
                cmp-nvim-lsp
                cmp-buffer
                luasnip
                cmp_luasnip
                friendly-snippets
                lspkind-nvim
                comment-nvim
                plenary-nvim
                neodev-nvim
                luasnip
                undotree
                telescope-nvim
                todo-comments-nvim
                telescope-fzf-native-nvim
                telescope-ui-select-nvim
                telescope-fzy-native-nvim
                telescope-file-browser-nvim
                rose-pine
                yazi-nvim
            ];
            extraLuaConfig = ''
                ${builtins.readFile ./nvim/options.lua}
                ${builtins.readFile ./nvim/keymaps.lua}
                ${builtins.readFile ./nvim/plugins/autopairs.lua}
                ${builtins.readFile ./nvim/plugins/auto-session.lua}
                ${builtins.readFile ./nvim/plugins/cmp.lua}
                ${builtins.readFile ./nvim/plugins/lsp.lua}
                ${builtins.readFile ./nvim/plugins/telescope.lua}
                ${builtins.readFile ./nvim/plugins/todo-comments.lua}
                ${builtins.readFile ./nvim/plugins/undotree.lua}
                ${builtins.readFile ./nvim/plugins/treesitter.lua}
                ${builtins.readFile ./nvim/plugins/file-browser.lua}
                ${builtins.readFile ./nvim/plugins/hijack-netrw.lua}
            '';
        };
    };
}
