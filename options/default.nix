{ lib, ... }:
let
  folder = builtins.path { path = ./.; };
  toImport = name: value: folder + ("/" + name);
  filterConf = key: value: value == "regular" && lib.hasSuffix ".nix" key && key != "default.nix";
  imports = lib.mapAttrsToList toImport (lib.filterAttrs filterConf (builtins.readDir folder));
in {
  inherit imports;
}

