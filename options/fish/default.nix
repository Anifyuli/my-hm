# fish configurations
{ lib, pkgs, ... }:

let
  fnDir = ./functions;
in
{
  programs.fish = {
    enable = true;
    package = pkgs.fish;
    functions = {
      fish_greeting = lib.fileContents (fnDir + "/fish_greeting.fish");
      fish_prompt = lib.fileContents (fnDir + "/fish_prompt.fish");
      fish_user_key_bindings = lib.fileContents (fnDir + "/fish_user_key_bindings.fish");
    };
    interactiveShellInit = ''
      # Ensure $HOME/.local/bin is in PATH
      if not contains -- $HOME/.local/bin $PATH
          set -gx PATH $HOME/.local/bin $HOME/bin $PATH
      end

      # Set fish_greeting as the default greeting function
      #set -g fish_greeting fish_greeting

      # Android SDK configuration
      set -gx ANDROID_HOME $HOME/.android/sdk
      set -gx ANDROID_AVD_HOME $HOME/.android/avd
      set -gx ANDROID_SDK_ROOT $ANDROID_HOME
      set -gx PATH $PATH \
          $ANDROID_HOME/cmdline-tools/latest/bin \
          $ANDROID_HOME/emulator \
          $ANDROID_HOME/platform-tools

      # pnpm configuration
      set -gx PNPM_HOME $HOME/.local/share/pnpm
      if not contains -- $PNPM_HOME $PATH
          set -gx PATH $PNPM_HOME $PATH
      end

      # tmux autostart
      if type -q tmux
        if not set -q TMUX
          if tmux has-session -t main 2>/dev/null
            set win_count (tmux list-windows -t main | count)
            tmux new-window -t main -n "win-$win_count"
        else
            tmux new-session -ds main -n "win-0"
        end
        tmux attach-session -t main
        end
      end
    '';
    shellAliases = {
      hm = "home-manager";
      logout = "loginctl kill-user $USER";
      warpstat = "curl https://www.cloudflare.com/cdn-cgi/trace/";
    };
  };
}
