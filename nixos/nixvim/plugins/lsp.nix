{ ... }:

{
  programs.nixvim.plugins.lsp = {
    enable = true;
    servers = {
      tsserver.enable = true;
      svelte.enable = true;
      tailwindcss.enable = true;
      pyright.enable = true;
      nixd.enable = true;
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
}
