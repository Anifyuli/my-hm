# Development tools configurations
{
  config,
  pkgs,
  ...
}:
{
  # Gradle configurations
  programs.gradle = {
    enable = true;
    package = pkgs.gradle_8;
    settings = {
      "org.gradle.home" = pkgs.jdk17;
    };
  };

  # Java configurations
  programs.java = {
    enable = true;
    package = pkgs.jdk17;
  };

  # Zed editor
  programs.zed-editor = {
    enable = true;
    package = config.lib.nixGL.wrap pkgs.zed-editor_git;
    extensions = [
      "html"
      "gruvbox-material"
      "icons-modern-material"
      "php"
      "react-snippets"
      "react-typescript-snippets"
      "wakatime"
    ];
    userSettings = {
      agent = {
        enabled = true;
        default_model = {
          provider = "zed.dev";
          model = "claude-sonnet-4";
        };
      };
      autosave = "on_window_change";
      restore_on_startup = "none";
      soft_wrap = "editor_width";
      show_wrap_guides = true;
      vim_mode = true;
      vim = {
        use_system_clipboard = "on_yank";
      };
      ui_font_size = 16;
      ui_font_family = ".SystemUIFont";
      ui_font_weight = 800;
      buffer_font_size = 14;
      buffer_font_family = "BlexMono Nerd Font";
      buffer_font_features = {
        calt = true;
      };
      buffer_font_weight = 500;
      buffer_line_height = "comfortable";
      theme = {
        mode = "system";
        light = "Gruvbox Light";
        dark = "Gruvbox Dark";
      };
      icon_theme = {
        mode = "system";
        light = "Icons modern material (Light)";
        dark = "Icons modern material (Dark)";
      };
      collaboration_panel = {
        dock = "right";
      };
      tab_bar = {
        show = true;
      };
      tabs = {
        show_diagnostics = "errors";
        file_icons = true;
        show_close_button = "always";
      };
      indent_guides = {
        enabled = true;
        coloring = "indent_aware";
      };
      file_finder = {
        file_icons = true;
      };
      inlay_hints = {
        enabled = true;
      };
      languages = {
        HTML = {
          formatter = "auto";
        };
        PHP = {
          language_servers = [
            "eslint"
            "phpactor"
            "vscode-html-language-server"
          ];
        };
      };
      lsp = {
        eslint = {
          settings = {
            codeActionOnSave = {
              rules = [ "import/order" ];
            };
          };
        };
        vscode-html-language-server = {
          settings = {
            format = {
              contentUnformatted = [
                "svg"
                "script"
              ];
            };
          };
        };
        tailwindcss-language-server = {
          settings = {
            classAttributes = [
              "class"
              "className"
              "ngClass"
              "styles"
            ];
          };
        };
      };
    };
  };
}
