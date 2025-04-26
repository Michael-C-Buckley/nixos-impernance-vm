{
  inputs',
  pkgs,
  ...
}:
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    # Misc
    jsonfmt
    lefthook
    mdformat
    treefmt
    taplo

    # Nix
    alejandra
    nil

    # Yaml
    yamlfmt
  ];
}
