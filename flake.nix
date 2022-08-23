{
  description = "Go tools";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }:
    let
      supportedSystems = [
        "aarch64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
        "x86_64-linux"
      ];

      # Helper function to generate an attrset '{ x86_64-linux = f "x86_64-linux"; ... }'.
      forAllSystems = f: nixpkgs.lib.genAttrs supportedSystems (system: f system);

      # Nixpkgs instantiated for supported system types.
      nixpkgsFor = forAllSystems (system: import nixpkgs { inherit system; overlays = [ self.overlay ]; });
    in
    {
      overlay = final: prev: with final; {
        gqlgen = callPackage ./pkgs/gqlgen/default.nix { };
        mga = callPackage ./pkgs/mga/default.nix { };
        protoc-gen-kit = callPackage ./pkgs/protoc-gen-kit/default.nix { };
        protoc-gen-go-kit = callPackage ./pkgs/protoc-gen-go-kit/default.nix { };
        ent = callPackage ./pkgs/ent/default.nix { };
      };

      packages = forAllSystems (system:
        {
          inherit (nixpkgsFor.${system}) gqlgen mga protoc-gen-kit protoc-gen-go-kit ent;
        }
      );
    };
}
