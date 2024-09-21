{ ... }:

{
  programs.nixvim.plugins.lsp = {
    enable = true;
    servers = {
      ts-ls.enable = true;
      svelte.enable = true;
      tailwindcss.enable = true;
      pyright.enable = true;
      nixd.enable = true;
      bashls.enable = true;
      jsonls.enable = true;
      yamlls.enable = true;
    };
    keymaps = {
      lspBuf = {
        K = "hover";
        gD = "references";
        gd = "definition";
        gi = "implementation";
        gt = "type_definition";
      };
      diagnostic = {
        "<leader>j" = "goto_next";
        "<leader>k" = "goto_prev";
      };
    };
  };
  programs.nixvim.plugins.lspkind = {
    enable = true;
    symbolMap = {
      Copilot = " ";
    };
    extraOptions = {
      maxwidth = 50;
      ellipsis_char = "...";
    };
  };
}
