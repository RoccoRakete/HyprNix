{ pkgs, ... }:

{
  programs.nixvim.plugins.lazygit = {
    enable = true;
    #extraPlugins = with pkgs.vimPlugins; [
    #  lazygit-nvim
    #];

  };
  programs.nixvim = {
    keymaps = [
      {
        mode = "n";
        key = "<leader>gg";
        action = "<cmd>LazyGit<CR>";
        options = {
          desc = "LazyGit (root dir)";
        };
      }
    ];
    extraConfigLua = ''
      require("telescope").load_extension("lazygit")
    '';
  };
}
