{ lib, pkgs, ... }:
{
  programs.helix = {
    enable = true;
    settings = {
      theme = "gruvbox";
      editor = {
        bufferline = "always";
        indent-guides.render = true;
        soft-wrap.enable = true;
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
        statusline = {
          left = [
            "mode"
            "spinner"
          ];
          center = [
            "file-modification-indicator"
            "file-name"
            "version-control"
          ];
          right = [
            "diagnostics"
            "selections"
            "position"
            "file-encoding"
            "total-line-numbers"
            "file-line-ending"
            "file-type"
          ];
          separator = "/";
          mode.normal = "NORMAL";
          mode.insert = "INSERT";
          mode.select = "SELECT";
        };
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
          auto-format = true;
          formatter.command = lib.getExe pkgs.nixfmt-rfc-style;
          language-servers = [ "nixd" ];
        }
      ];
      language-server.nixd = {
        command = lib.getExe pkgs.nixd;
      };
    };
  };
}
