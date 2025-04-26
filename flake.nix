{
  inputs = {
    nixos.url = "github:Michael-C-Buckley/nixos";
    nixpkgs.follows = "nixos/nixpkgs";
    systems.url = "github:nix-systems/x86_64-linux";
    flake-parts.url = "github:hercules-ci/flake-parts";
    impermanence.url = "github:nix-community/impermanence";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {flake-parts, ...} @ inputs: flake-parts.lib.mkFlake {inherit inputs;} {imports = [./flake];};
}
