{
  description = "Go tools";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages.mga = pkgs.buildGoModule rec {
          name = "mga";
          version = "0.4.3";

          src = pkgs.fetchFromGitHub {
            owner = "sagikazarmark";
            repo = "mga";
            rev = "v${version}";
            sha256 = "sha256-VJceI/8U6EMbNUekDDbJls4Lml4PmU7PFiVtxvUXezo=";
          };

          vendorSha256 = "sha256-jp1r1kT9JIKoTHSM5xy+KBfs7eR9RsjgZNSsxxgRTyo=";

          doCheck = false;

          ldflags = [
            "-s"
            "-w"
            "-X main.version=${version}"
          ];

          meta = with pkgs.lib; {
            description = "Modern Go Application tool";
            homepage = "https://github.com/sagikazarmark/mga";
            license = licenses.mit;
            platforms = platforms.unix;
          };
        };

        packages.protoc-gen-kit = pkgs.buildGoModule rec {
          name = "protoc-gen-kit";
          version = "0.3.0";

          src = pkgs.fetchFromGitHub {
            owner = "sagikazarmark";
            repo = "protoc-gen-kit";
            rev = "v${version}";
            sha256 = "sha256-2n/YPUSxGpBYW46/BjJjZpHcrAvD2ck16vNjwGZF2To=";
          };

          vendorSha256 = "sha256-ORsoafJ3g1z22lGaqHHMtXcgNzyzewRR+LxDGKQuM7E=";

          doCheck = false;
          subPackages = [ "." ];

          ldflags = [
            "-s"
            "-w"
            "-X main.version=${version}"
          ];

          meta = with pkgs.lib; {
            description = "Protoc compiler for Go kit code";
            homepage = "https://github.com/sagikazarmark/protoc-gen-kit";
            license = licenses.mit;
            platforms = platforms.unix;
          };
        };
      });
}
