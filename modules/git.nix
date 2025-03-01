# Git configuration
{...}:
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
      extraConfig = {
        commit.gpgsign = true;
        gpg.format = "ssh";
        user.signingkey = "~/.ssh/github.pub";
      };
      userEmail = "anifyuliansyah@gmail.com";
      userName = "Anifyuli";
    };
    git-credential-oauth.enable = true;
  };
}
