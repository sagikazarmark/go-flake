{ lib, buildGo118Module, fetchFromGitHub }:

buildGo118Module rec {
  name = "mga";
  version = "0.6.0";

  src = fetchFromGitHub {
    owner = "sagikazarmark";
    repo = "mga";
    rev = "v${version}";
    sha256 = "sha256-uU7AuUWBIToSm97bKa4ia4L9Z2tiSX8zne2op1lo+Xo=";
  };

  vendorSha256 = "sha256-XsKUOwKaRRtE5Rz66rKtkuuSpQwvobcv5/zLk7BT4Xs=";

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
