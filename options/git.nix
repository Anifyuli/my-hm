# Git configuration
{ pkgs, ... }:
{
  programs = {
    git = {
      diff-highlight = {
        enable = true;
        pagerOpts = [
          "--tabs=2"
          "-RFX"
        ];
      };
      enable = true;
      package = pkgs.gitFull;
      userEmail = "anifyuliansyah@gmail.com";
      userName = "Anifyuli";
    };
    git-credential-oauth.enable = true;
  };
}
