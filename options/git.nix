# Git configuration
{ ... }:
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
      userEmail = "anifyuliansyah@gmail.com";
      userName = "Anifyuli";
    };
    git-credential-oauth.enable = true;
  };
}
