# SSH configurations
{ pkgs, ... }:
{
	programs.ssh = {
		enable = false;
		package = pkgs.openssh;
		addKeysToAgent = "ask";
	};
}
