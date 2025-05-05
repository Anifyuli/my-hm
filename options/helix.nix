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
          center = [ "file-name" ];
          right = [
            "diagnostics"
            "position"
            "primary-selection-length"
            "file-encoding"
            "file-type"
            "version-control"
            "spacer"
            "position-percentage"
          ];
          separator = "|";
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
