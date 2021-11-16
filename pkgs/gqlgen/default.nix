{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  name = "gqlgen";
  version = "0.14.0";

  src = fetchFromGitHub {
    owner = "99designs";
    repo = "gqlgen";
    rev = "v${version}";
    sha256 = "sha256-pBvPTLNrDZMyoxtsin+MrUCC3www864TPBrOCFNb2U8=";
  };

  vendorSha256 = "sha256-YWoe3lQS+0bMfUiNzC+n7qlQbCS8WO+jLuaQk5X0+v8=";

  # doCheck = false;
  subPackages = [ "." ];

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
