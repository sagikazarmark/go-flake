{ lib, buildGo118Module, fetchFromGitHub }:

buildGo118Module rec {
  name = "mga";
  version = "0.7.0";

  src = fetchFromGitHub {
    owner = "sagikazarmark";
    repo = "mga";
    rev = "v${version}";
    sha256 = "sha256-Nz8hWesPWZzwBbugS/9OeQhRK2dqhAzLBUHkU+Eb/u0=";
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
