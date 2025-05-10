{
  modulesPath,
  inputs,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    (modulesPath + "/profiles/qemu-guest.nix")
    ./disko
    ./hardware.nix
    ./impermanence.nix
    #inputs.nixos.nixosModules.hjem.default
    inputs.nixos.inputs.home-manager.nixosModule.default
    inputs.nixos.homeConfiguration.michael
  ];
  networking.hostId = "11111111";

  users.users = {
    root.password = "root1234";
    michael = {
      isNormalUser = true;
      password = "asfdasdf";
      extraGroups = ["wheel"];
    };
  };

  system.stateVersion = "25.05";
}
