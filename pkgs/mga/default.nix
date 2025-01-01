{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  name = "mga";
  version = "0.11.0";

  src = fetchFromGitHub {
    owner = "sagikazarmark";
    repo = "mga";
    rev = "v${version}";
    sha256 = "sha256-Q33Z1e2f46+qXhY22FfGV1bsW6gKnm6GCaPHLIBS6yA=";
  };

  vendorHash = "sha256-LxRt1+bDheeSerh5kbKZMnEhMDD7NpigifnLFwdIzrg=";

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
