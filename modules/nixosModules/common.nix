{ self, ... }: {
  flake.nixosModules.common = { ... }: {
    imports = [
      self.nixosModules.bootstrap
    ];
  };
}