# Neovim configuration with NixVim way
{...}:
{
  # NixVim
  programs.nixvim = {
    enable = true;
    colorscheme = "gruvbox";
    colorschemes.gruvbox.enable = true;
  };

}
