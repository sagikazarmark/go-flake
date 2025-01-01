{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  name = "protoc-gen-kit";
  version = "0.6.0";

  src = fetchFromGitHub {
    owner = "sagikazarmark";
    repo = "protoc-gen-go-kit";
    rev = "v${version}";
    sha256 = "sha256-Xw0Hx9AC4R6QgGeduTY5nfRh5t2UOO6dlve78si6nf4=";
  };

  vendorHash = "sha256-U16VXGurRGWTFLASw1MMnn/Qv5TeWkO2b8NpnSFBp9Y=";

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
