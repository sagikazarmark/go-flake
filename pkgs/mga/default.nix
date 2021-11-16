{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  name = "mga";
  version = "0.4.3";

  src = fetchFromGitHub {
    owner = "sagikazarmark";
    repo = "mga";
    rev = "v${version}";
    sha256 = "sha256-VJceI/8U6EMbNUekDDbJls4Lml4PmU7PFiVtxvUXezo=";
  };

  vendorSha256 = "sha256-jp1r1kT9JIKoTHSM5xy+KBfs7eR9RsjgZNSsxxgRTyo=";

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
