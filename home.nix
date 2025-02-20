{ pkgs, nixgl, ... }:

{
  # Home Manager basic configurations
  home = {
    username = "anifyuli";
    homeDirectory = "/home/anifyuli";
    stateVersion = "25.05";
    packages = with pkgs; [
      nixd
      nixfmt-rfc-style
      nixpkgs-fmt
    ];
    file = {

    };
    sessionVariables = {
      # EDITOR = "emacs";
    };
    shell.enableFishIntegration = true;
  };

  # nixGL Home Manager integration
  nixGL = {
    defaultWrapper = "mesa";
    packages = nixgl.packages;
    vulkan.enable = true;
  };

  programs.home-manager.enable = true;

  # nh configurations
  programs.nh.enable = true;

  # Vim configurations
  programs.vim = {
    enable = true;
    packageConfigurable = pkgs.vim;
    defaultEditor = true;
    settings = {
      expandtab = true;
      mouse = "a";
      number = true;
      shiftwidth = 2;
      tabstop = 2;
    };
    extraConfig = ''
      " Enable softtabstop & smartindent
      set softtabstop=2
      set smartindent

      " Enable colorscheme
      colorscheme gruvbox

      " Airline & theming it
      let g:airline#extensions#tabline#enabled = 1
      let g:airline#extensions#tabline#left_sep = ' '
      let g:airline#extensions#tabline#left_alt_sep = '|'
      let g:airline#extensions#tabline#formatter = 'default'
      let g:airline_theme='gruvbox'
    '';
    plugins = with pkgs.vimPlugins; [
      gruvbox-community
      vim-airline
      vim-airline-themes
      vim-lastplace
      vim-lsp
      vim-lsp-settings
      vim-nix
    ];
  };

}

