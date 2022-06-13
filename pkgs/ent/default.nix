{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  name = "ent";
  version = "0.10.1";

  src = fetchFromGitHub {
    owner = "ent";
    repo = "ent";
    rev = "v${version}";
    sha256 = "sha256-MvfbQKGVYWbZkqc3X3BqsB+z2KMkr0gMOquL02qHwUY=";
  };

  vendorSha256 = "sha256-gSUpy0woJzg0F7XwLzz/rlV6jpqqFLeU8N+DJE18hXQ=";

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
