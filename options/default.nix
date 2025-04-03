{ lib, ... }:
let
  folder = ./.;

  # Function to find default.nix recursively
  toImport = name: type:
    let fullPath = folder + ("/" + name);
    in if type == "directory" then
      # If it's a directory, check if it contains default.nix
      let hasDefaultNix = builtins.pathExists (fullPath + "/default.nix");
      in if hasDefaultNix then import (fullPath + "/default.nix") else null
    else if type == "regular" && lib.hasSuffix ".nix" name && name != "default.nix" then
      # If it's a .nix file but not default.nix, import it
      import fullPath
    else null;

  # Scan directory and filter results
  dirContent = builtins.readDir folder;
  importPaths = lib.mapAttrsToList toImport dirContent;
  imports = builtins.filter (x: x != null) importPaths;
in {
  inherit imports;
}

