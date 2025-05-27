# SSH configurations
{ ... }:
{
	programs.ssh = {
		enable = true;
		addKeysToAgent = "ask";
	};
}
