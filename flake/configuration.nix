{
  modulesPath,
  lib,
  pkgs,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    (modulesPath + "/profiles/qemu-guest.nix")
    ./disko
  ];
  networking.hostId = "11111111";

  environment.systemPackages = with pkgs; map lib.lowPrio [
    neovim
  ];

  users.users = {
    root.password = "root1234";
    michael = {
      isNormalUser = true;
      password = "asfdasdf";
    };
  };

  system.stateVersion = "25.05";
}
