{ lib, buildGo117Module, fetchFromGitHub }:

buildGo117Module rec {
  name = "protoc-gen-kit";
  version = "0.4.0";

  src = fetchFromGitHub {
    owner = "sagikazarmark";
    repo = "protoc-gen-kit";
    rev = "v${version}";
    sha256 = "sha256-c1PW39GXZ/ONDSi7xb8eLZm0FG2fIinL+1AKXyhpl/k=";
  };

  vendorSha256 = "sha256-uNhFXLlAk9rWgQMVQw30KMMIhPHdVfX3/8izbOB9pXA=";

  proxyVendor = true;

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
