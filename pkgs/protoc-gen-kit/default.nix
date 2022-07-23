{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  name = "protoc-gen-kit";
  version = "0.4.0";

  src = fetchFromGitHub {
    owner = "sagikazarmark";
    repo = "protoc-gen-kit";
    rev = "v${version}";
    sha256 = "sha256-c1PW39GXZ/ONDSi7xb8eLZm0FG2fIinL+1AKXyhpl/k=";
  };

  vendorSha256 = "sha256-IDqtffEswqXrnp7UqM7DHe6EUA9cKeYwnr5myVkOKXw=";

  # proxyVendor = true;

  doCheck = false;
  subPackages = [ "." ];

  ldflags = [
    "-s"
    "-w"
    "-X main.version=${version}"
  ];

  meta = with lib; {
    description = "Protoc compiler for Go kit code";
    homepage = "https://github.com/sagikazarmark/protoc-gen-kit";
    license = licenses.mit;
    platforms = platforms.unix;
  };
}
