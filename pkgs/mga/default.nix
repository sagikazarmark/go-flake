{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  name = "mga";
  version = "0.10.0";

  src = fetchFromGitHub {
    owner = "sagikazarmark";
    repo = "mga";
    rev = "v${version}";
    sha256 = "sha256-YuQvAFZ0lnDCMNZXaYt/1bumDJ/R/BFciWgRdbF7r78=";
  };

  vendorHash = "sha256-p/h0nIYVuWrAaWo5A96DrFbHVRrtuiHYff5rHBbW3z4=";

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
