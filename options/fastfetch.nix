# Fastfetch configs
{...}:
{
  programs.fastfetch = {
    enable = true;
    settings = {
      schema = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";
      display = {
        size = {
          maxPrefix = "MB";
          ndigits = 0;
        };
      };
      modules = [
        "title"
        "separator"
        "os"
        "host"
        { type = "kernel"; format = "{release}"; }
        "uptime"
        "packages"
        "shell"
        { type = "display"; compactType = "original"; key = "Resolution"; }
        "de"
        "wm"
        "wmtheme"
        "theme"
        "icons"
        "terminal"
        { type = "terminalfont"; format = "{/name}{-}{/}{name}{?size} {size}{?}"; }
        "cpu"
        { type = "gpu"; key = "GPU"; }
        { type = "memory"; format = "{} / {}"; }
        "break"
        "colors"
      ];
    };
  };
}

