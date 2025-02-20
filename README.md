# My Home Manager
This is my standalone Nix Home Manager installation

System info (based on 1st commit) :
```console
$ nix-shell -p nix-info --run "nix-info -m"
fetching github input 'github:NixOS/nixpkgs/nixpkgs-unstable'
 - system: `"x86_64-linux"`
 - host os: `Linux 6.13.3-cachyos1.fc41.x86_64, Fedora Linux, 41 (KDE Plasma), nobuild`
 - multi-user?: `yes`
 - sandbox: `yes`
 - version: `nix-env (Lix, like Nix) 2.92.0
System type: x86_64-linux
Additional system types: i686-linux, x86_64-v1-linux, x86_64-v2-linux, x86_64-v3-linux
Features: gc, signed-caches
System configuration file: /etc/nix/nix.conf
User configuration files: /home/anifyuli/.config/nix/nix.conf:/home/anifyuli/.config/kdedefaults/nix/nix.conf:/etc/xdg/nix/nix.conf:/usr/share/kde-settings/kde-profile/default/xdg/nix/nix.conf
Store directory: /nix/store
State directory: /nix/var/nix
Data directory: /nix/store/m9x3y8acqnm2jvn2papmq6bl5z1qpfck-lix-2.92.0/share`
 - nixpkgs: `/nix/store/0zchvfmj0wpf8nnqzgivq9b3yl8lyrm1-source`
 ```
