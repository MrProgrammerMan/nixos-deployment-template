{ self, ... }: {
  flake.nixosModules.bootstrap = { modulesPath, lib, pkgs, ... }: {
    imports = [
      (modulesPath + "/installer/scan/not-detected.nix")
      self.nixosModules.ssh-root
    ];
    boot.loader.grub = {
      efiSupport = true;
      efiInstallAsRemovable = true;
    };

    environment.systemPackages = map lib.lowPrio [
      pkgs.curl
      pkgs.gitMinimal
    ];

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    system.stateVersion = "24.05";
  };
}