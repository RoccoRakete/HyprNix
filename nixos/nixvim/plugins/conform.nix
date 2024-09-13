{ ... }:

{
  programs.nixvim.plugins.conform-nvim = {
    enable = true;

    settings = {
      notify_on_error = true;
      formatters_by_ft = {
        "*" = [ "codespell" ];
        "_" = [ "trim_whitespace" ];
        #go = [ "goimports" "golines" "gofmt" "gofumpt" ];
        javascript = [ "prettierd" ];
        typescript = [ "prettierd" ];
        yaml = [ "prettierd" ];
        json = [ "jq" ];
        lua = [ "stylua" ];
        scss = [ "prettierd" ];
        css = [ "prettierd" ];
        python = [
          "isort"
          "black"
        ];
        rust = [ "rustfmt" ];
        sh = [ "shfmt" ];
        nix = [ "nixfmt" ];
        #terraform = [ "terraform_fmt" ];
      };
    };
  };
}
