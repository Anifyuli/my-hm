# Home manager services options
{ ... }:
{
  services = {
    # Enable auto expire generations
    home-manager.autoExpire.enable = true;
    # Enable ssh-agent
    ssh-agent.enable = true;
  };
}
