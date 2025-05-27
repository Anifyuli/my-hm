# SSH configurations
{ pkgs, ... }:
{
	programs.ssh = {
		enable = true;
		package = pkgs.openssh;
		addKeysToAgent = "ask";
	};
}
