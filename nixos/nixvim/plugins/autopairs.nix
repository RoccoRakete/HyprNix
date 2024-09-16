{
  programs.nixvim.plugins.nvim-autopairs = {
    enable = true;
    settings = {
      checkTs = true;
      disable_filetype = [
        "TelescopePrompt"
        "vim"
      ];
    };
  };
}
