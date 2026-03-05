{ inputs, self, ... }: {
  flake.nixosConfigurations.bootstrap = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = with self.nixosModules; [
      bootstrap
      disk-config
      ./_hardware-configuration.nix
    ];
  };
}