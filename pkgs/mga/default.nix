{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  name = "mga";
  version = "0.9.0";

  src = fetchFromGitHub {
    owner = "sagikazarmark";
    repo = "mga";
    rev = "v${version}";
    sha256 = "sha256-3wY7pqr/M6ACBwQCbJSaSb4h6PUv+Ea+TU9goGE7sqI=";
  };

  vendorSha256 = "sha256-g599K6ullvy+fiRPNMdyRfaYCWPK8yB/Od9d+SrzF1w=";

  proxyModule = true;

  doCheck = false;

  ldflags = [
    "-s"
    "-w"
    "-X main.version=${version}"
  ];

  meta = with lib; {
    description = "Modern Go Application tool";
    homepage = "https://github.com/sagikazarmark/mga";
    license = licenses.mit;
    platforms = platforms.unix;
  };
}
