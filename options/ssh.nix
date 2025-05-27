# SSH configurations
{ pkgs, ... }:
{
	programs.ssh = {
		enable = true;
		hashKnownHosts = true;
		package = pkgs.openssh;
		addKeysToAgent = "ask";
	};
}
