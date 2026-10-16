{
  plugins = {
    lsp-format = {enable = true;};
    lsp = {
      enable = true;
      servers = {
        bashls.enable = true;
        clangd.enable = true;
        cssls.enable = true;
        dockerls.enable = true;
        eslint.enable = true;
        gopls.enable = true;
        html.enable = true;
        lua_ls = {
          enable = true;
          settings.telemetry.enable = false;
        };
        nil_ls.enable = true;
        marksman.enable = true;
        pyright.enable = true;
        rust_analyzer = {
          enable = true;
          installRustc = false;
          installCargo = false;
        };
        taplo.enable = true;
        /*
        terraformls = {enable = true;};
        */
        ts_ls.enable = false;
        yamlls.enable = true;
      };
      keymaps = {
        silent = true;
        lspBuf = {
          gd = {
            action = "definition";
            desc = "Goto Definition";
          };
          gr = {
            action = "references";
            desc = "Goto References";
          };
          gD = {
            action = "declaration";
            desc = "Goto Declaration";
          };
          gI = {
            action = "implementation";
            desc = "Goto Implementation";
          };
          gT = {
            action = "type_definition";
            desc = "Type Definition";
          };
          K = {
            action = "hover";
            desc = "Hover";
          };
          "<leader>cw" = {
            action = "workspace_symbol";
            desc = "Workspace Symbol";
          };
          "<leader>cr" = {
            action = "rename";
            desc = "Rename";
          };
        };
        diagnostic = {
          "<leader>cd" = {
            action = "open_float";
            desc = "Line Diagnostics";
          };
          "[d" = {
            action = "goto_next";
            desc = "Next Diagnostic";
          };
          "]d" = {
            action = "goto_prev";
            desc = "Previous Diagnostic";
          };
        };
      };
    };
    web-devicons = {
      enable = true;
    };
  };
  extraConfigLua = ''
    local _border = "rounded"

    -- Default border for floating windows, including LSP hover and signature help
    vim.o.winborder = _border

    vim.diagnostic.config{
      float={border=_border}
    };

    require('lspconfig.ui.windows').default_options = {
      border = _border
    }
  '';
}
