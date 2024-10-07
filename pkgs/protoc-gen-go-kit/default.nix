{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  name = "protoc-gen-kit";
  version = "0.5.0";

  src = fetchFromGitHub {
    owner = "sagikazarmark";
    repo = "protoc-gen-go-kit";
    rev = "v${version}";
    sha256 = "sha256-O4de4NW8sCn1LDZpI0HBd33bino/CrK/0X1+wPUMZBE=";
  };

  vendorHash = "sha256-OE3oCtljTxe/mkMaKNpTcShdKCEeTv6PQXFQ82GcB94=";

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
