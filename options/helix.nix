# Helix configurations
{ inputs, lib, pkgs, ... }:
{
  programs.helix = {
    defaultEditor = true;
    enable = true;
    settings = {
      theme = "gruvbox";
      editor = {
        bufferline = "always";
        indent-guides = {
          render = true;
          character = "┆";
        };
        soft-wrap.enable = true;
        color-modes = true;
        lsp = {
          enable = true;
          display-messages = true;
          display-inlay-hints = true;
          display-progress-messages = true;
        };
        end-of-line-diagnostics = "hint";
        inline-diagnostics = {
          cursor-line = "warning";
        };
        cursorline = true;
        auto-completion = true;
        statusline = {
          left = [
            "spacer"
            "mode"
            "spinner"
          ];
          center = [
            "version-control"
            "spacer"
            "separator"
            "file-name"
            "file-modification-indicator"
          ];
          right = [
            "diagnostics"
            "selections"
            "separator"
            "position"
            "separator"
            "file-encoding"
            "file-line-ending"
            "separator"
            "total-line-numbers"
            "separator"
            "file-type"
          ];
          separator = "»";
          mode.normal = "NORMAL";
          mode.insert = "INSERT";
          mode.select = "SELECT";
        };
        smart-tab = {
          enable = true;
        };
      };
      keys.normal = {
        b.d = ":buffer-close";
        S.b.d = ":buffer-close-all";
      };
    };
    languages = {
      language = [
        {
          name = "nix";
          indent = {
            tab-width = 2;
            unit = "\t";
          };
          formatter.command = lib.getExe pkgs.nixfmt-rfc-style;
          language-servers = [ "nixd" ];
        }
      ];
      language-server = {
        nixd = {
          command = lib.getExe pkgs.nixd;
          args = [ "--semantic-tokens=true" ];
          config.nixd =
            let
              flake = ''(builtins.getFlake "${builtins.toPath inputs.self.outPath}")'';
              homeManagerOpts = "(let cfg = ${flake}.homeConfigurations; users = builtins.attrNames cfg; myUser = builtins.elemAt users 0; in (builtins.getAttr myUser cfg).options)";
            in
            {
              nixpkgs.expr = "import ${flake}.inputs.nixpkgs { }";
              formatting.command = lib.getExe pkgs.nixfmt-rfc-style;
              options = {
                home-manager.expr = "${homeManagerOpts}.home-manager.users.type.getSubOptions []";
              };
            };
        };
      };
    };
  };
}
