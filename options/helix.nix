# Helix configurations
{ lib, pkgs, ... }:
{
  programs.helix = {
    enable = true;
    defaultEditor = true;
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
        auto-format = true;
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
        whitespace = {
          render = "all";
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
            "file-modification-indicator"
            "spacer"
            "separator"
            "file-name"
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
