{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  name = "protoc-gen-kit";
  version = "0.3.0";

  src = fetchFromGitHub {
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

  meta = with lib; {
    description = "Protoc compiler for Go kit code";
    homepage = "https://github.com/sagikazarmark/protoc-gen-kit";
    license = licenses.mit;
    platforms = platforms.unix;
  };
}
