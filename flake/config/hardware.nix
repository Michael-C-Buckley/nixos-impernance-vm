{
  lib,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/profiles/qemu-guest.nix")
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  fileSystems = {
    "/persist".neededForBoot = true;
    "/cache".neededForBoot = true;
  };

  boot.loader = {
    grub.enable = lib.mkForce false;
    efi.canTouchEfiVariables = true;
    systemd-boot.enable = true;
  };

  boot = {
    kernelModules = ["kvm-amd"];
    extraModulePackages = [];
    initrd = {
      availableKernelModules = ["ata_piix" "uhci_hcd" "virtio_pci" "virtio_scsi" "sd_mod"];
      kernelModules = [];
    };
  };

  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
