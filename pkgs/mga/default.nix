{ lib, buildGo118Module, fetchFromGitHub }:

buildGo118Module rec {
  name = "mga";
  version = "0.6.1";

  src = fetchFromGitHub {
    owner = "sagikazarmark";
    repo = "mga";
    rev = "v${version}";
    sha256 = "sha256-LAEZwm7yIb1jxns3rH/8T+NMnebUpyB55Q/Pt403TuA=";
  };

  vendorSha256 = "sha256-1NTNWVPp4y8cma1PhmizG6Ao4HCQDE+SYxaWisGkhhk=";

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
