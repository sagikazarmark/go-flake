{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  name = "protoc-gen-kit";
  version = "0.1.1";

  src = fetchFromGitHub {
    owner = "sagikazarmark";
    repo = "protoc-gen-go-kit";
    rev = "v${version}";
    sha256 = "sha256-2pf4m6/oO063bhJ/QL5kY5HPkXS5bQDqqqcYe1gFrXg=";
  };

  vendorSha256 = "sha256-y+/hjYUTFZuq55YAZ5M4T1cwIR+XFQBmWVE+Cg1Y7PI=";

  # proxyVendor = true;

  doCheck = false;
  subPackages = [ "." ];

  ldflags = [
    "-s"
    "-w"
    "-X main.version=${version}"
  ];

  meta = with lib; {
    description = "Protoc compiler for Go kit code";
    homepage = "https://github.com/sagikazarmark/protoc-gen-go-kit";
    license = licenses.mit;
    platforms = platforms.unix;
  };
}
