{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  name = "protoc-gen-kit";
  version = "0.4.0";

  src = fetchFromGitHub {
    owner = "sagikazarmark";
    repo = "protoc-gen-go-kit";
    rev = "v${version}";
    sha256 = "sha256-m0TkcWgnUOkA9Ke5P9fyM+nediBdj/WgmNF9mElbkkg=";
  };

  vendorHash = "sha256-sZJy/d7fzGmCWi1R0zDrAoV8OdqbmcXN54M87vDjyuE=";

  # proxyVendor = true;

  doCheck = false;
  subPackages = [ "." ];

  ldflags = [
    "-s"
    "-w"
    "-X main.version=v${version}"
  ];

  meta = with lib; {
    description = "Protoc compiler for Go kit code";
    homepage = "https://github.com/sagikazarmark/protoc-gen-go-kit";
    license = licenses.mit;
    platforms = platforms.unix;
  };
}
