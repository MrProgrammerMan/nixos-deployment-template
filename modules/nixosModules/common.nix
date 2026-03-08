{ self, ... }: {
  flake.nixosModules.common = { ... }: {
    imports = with self.nixosModules; [
      bootstrap
      secrets
    ];
  };
}