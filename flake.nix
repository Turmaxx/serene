{
  description = "A simple nix-flake for developing my site using zola";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      devShells.${system}.default =
        pkgs.mkShell {
          buildInputs = with pkgs; [ zola ];
          shellHook = '' zola --version '';
        };
    };
}
