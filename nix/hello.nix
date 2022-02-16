{ pkgs ? (import <nixpkgs> {}) }: with pkgs;

pkgs.stdenv.mkDerivation rec {
  pname = "hello";
  version = "2.12";

  src = pkgs.fetchurl {
    url = "mirror://gnu/hello/${pname}-${version}.tar.gz";
    sha256 = "1ayhp9v4m4rdhjmnl2bq3cibrbqqkgjbl3s7yk2nhlh8vj3ay16g";
  };

  doCheck = true;
}
