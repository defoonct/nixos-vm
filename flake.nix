{
  description = "Simple NixOS VM";

  outputs = { self, nixpkgs }: {

    nixosModules.base = { pkgs, ... }: {
      system.stateVersion = "23.05";

      # Configure networking
      networking.useDHCP = false;
      networking.interfaces.eth0.useDHCP = true;

      # User definition
      services.getty.autologinUser = "foobar";
      users.users.foobar.isNormalUser = true;

      # Enable passwordless 'sudo'
      users.users.foobar.extraGroups = ["wheel"];
      security.sudo.wheelNeedsPassword = false;
    };

    nixosConfigurations.linuxBase = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [self.nixosModules.base];
    };
  };
}
