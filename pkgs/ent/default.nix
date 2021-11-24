{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  name = "ent";
  version = "0.9.1";

  src = fetchFromGitHub {
    owner = "ent";
    repo = "ent";
    rev = "v${version}";
    sha256 = "sha256-33u15MzfbTZZaKEgXaMA9RdtMcHboVUYmgTzAkuCCko=";
  };

  vendorSha256 = "sha256-4ARd/kT9/f/75Va44tukMYcLPsGHKLCkLWMKYyPMaZQ=";

  subPackages = [ "cmd/ent" ];

  ldflags = [
    "-s"
    "-w"
  ];

  meta = with lib; {
    description = "An entity framework for Go";
    homepage = "https://entgo.io";
    license = licenses.asl20;
    platforms = platforms.unix;
  };
}
