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
    interactiveShellInit = builtins.readFile ./config.fish;
    shellAliases = {
      logout = "loginctl kill-user $USER";
      warpstat = "curl https://www.cloudflare.com/cdn-cgi/trace/";
    };
  };
}
