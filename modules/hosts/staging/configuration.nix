{ inputs, self, ... }: {
  flake.nixosConfigurations.staging = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = with self.nixosModules; [
      bootstrap
      staging-specific # Yes this is jank, see the bootstrap configuration.nix or readme for more details
      disk-config
      ./_hardware-configuration.nix
      {
        networking.hostName = "staging";
      }
    ];
  };
}