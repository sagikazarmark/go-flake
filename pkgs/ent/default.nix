{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  name = "ent";
  version = "0.14.0";

  src = fetchFromGitHub {
    owner = "ent";
    repo = "ent";
    rev = "v${version}";
    sha256 = "sha256-Jq5txpjv2JxypOXYA8JKT0CNMIaJksMUIdnbwflVMZA=";
  };

  vendorHash = "sha256-9KdSGIyi95EVQq9jGoVqK8aq3JXlQXB+Qwlh/Kfz4Oc=";

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
