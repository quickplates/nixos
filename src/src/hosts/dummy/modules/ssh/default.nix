# SSH server configuration
{
  config,
  lib,
  pkgs,
  ...
}: {
  services = {
    openssh = {
      # Enable SSH server
      enable = true;

      settings = {
        # Root can't login with SSH
        PermitRootLogin = "no";

        # No one can login with password
        # This means only public key authentication is allowed
        PasswordAuthentication = false;

        # Remove existing socket before creating a new one
        # Needed for GPG agent forwarding
        StreamLocalBindUnlink = "yes";

        # Accept environment variables from the client
        # COLORTERM is used to demonstrate color support of client terminal
        AcceptEnv = "COLORTERM";
      };

      # Save resources by only starting the service when needed
      startWhenNeeded = true;
    };

    sshguard = {
      # Prevents brute force attacks
      enable = true;
    };
  };
}
