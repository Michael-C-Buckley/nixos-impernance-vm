{self, inputs, ...}: {
  systems = import inputs.systems;

  perSystem = {
    inputs',
    pkgs,
    ...
  }: {
    devShells.default = import ./shell.nix {inherit inputs' pkgs;};
  };

  flake = {
    packages."x86_64-linux".default = self.outputs.nixosConfigurations.vm.config.system.build.diskoImagesScript;

    nixosConfigurations = {
      "vm" = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          inputs.disko.nixosModules.disko
          ./configuration.nix
          ./hardware-configuration.nix
        ];
      };
    };
  };
}
