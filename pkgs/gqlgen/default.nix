{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  name = "gqlgen";
  version = "0.17.55";

  src = fetchFromGitHub {
    owner = "99designs";
    repo = "gqlgen";
    rev = "v${version}";
    sha256 = "sha256-xT/Uy+tPTf1oqJ2OX9KCnBPGxgZfz2Q04ky4qz1ucZA=";
  };

  vendorHash = "sha256-jxKwhSuNAGU/gpHq6ChSnaI2H1lmqw/WTf4hL496uT0=";

  # doCheck = false;
  subPackages = [ "." ];

  allowGoReference = true;

  ldflags = [
    "-s"
    "-w"
    "-X github.com/99designs/gqlgen/graphql.Version=v${version}"
  ];

  meta = with lib; {
    description = "go generate based graphql server library";
    homepage = "https://github.com/99designs/gqlgen";
    license = licenses.mit;
    platforms = platforms.unix;
  };
}
