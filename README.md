# Nix flake for various Go tools

[![built with nix](https://img.shields.io/badge/builtwith-nix-7d81f7?style=flat-square)](https://builtwithnix.org)


## Usage

```nix
{
  description = "Your go package";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    gopkgs.url = "github:sagikazarmark/go-flakes";
    gopkgs.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, flake-utils, gopkgs, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        devShell = pkgs.mkShell {
          buildInputs = [ pkgs.go gopkgs.mga ];
        };
      });
}
```

Or using overlay:

```nix
{
  description = "Your go package";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    gopkgs.url = "github:sagikazarmark/go-flakes";
    gopkgs.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, flake-utils, gopkgs, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;

          overlays = [ gopkgs.overlay ];
        };
      in {
        devShell = pkgs.mkShell {
          buildInputs = [ pkgs.go pkgs.mga ];
        };
      });
}
```

## License

The project is licensed under the [MIT License](LICENSE).
