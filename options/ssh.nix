# SSH configurations
{ pkgs, ... }:
{
	programs.ssh = {
		enable = true;
		hasKnownHosts = true;
		package = pkgs.openssh;
		addKeysToAgent = "ask";
	};
}
