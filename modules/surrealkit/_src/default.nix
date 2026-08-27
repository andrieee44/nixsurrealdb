{
  lib,
  pkgs,
  stdenv,
}:
let
  version = "v0.7.0";

  assets = {
    x86_64-linux = {
      hash = "sha256-38sOY759HhgWJxfL253QK6dWMS5C1QNGht7Z56zkHuk=";
      tarballSuffix = "x86_64-unknown-linux-musl.tar.gz";
    };

    aarch64-linux = {
      hash = "sha256-c8i48pHQ6Pkxo2iMULNI6EqeqUMXuy5RuqBDugp4Fks=";
      tarballSuffix = "aarch64-unknown-linux-musl.tar.gz";
    };

    aarch64-darwin = {
      hash = "sha256-fU670n35/FUaqjv73oWfhODUXk1Gi9J2hOBXQH5ltUc=";
      tarballSuffix = "aarch64-apple-darwin.tar.gz";
    };
  };

  asset = assets."${stdenv.hostPlatform.system}";
in
pkgs.buildPackages.stdenvNoCC.mkDerivation {
  inherit version;
  pname = "surrealkit";
  sourceRoot = ".";

  installPhase = ''
    mkdir -p "$out/bin"
    install -m755 surrealkit "$out/bin/surrealkit"
  '';

  meta = {
    description = "Migrations, Seeding, TypeGen and Testing for your SurrealDB apps";
    homepage = "https://github.com/surrealdb/surrealkit";
    license = lib.licenses.asl20;
    mainProgram = "surrealkit";
  };

  src = pkgs.fetchurl {
    inherit (asset) hash;
    url = "https://github.com/surrealdb/surrealkit/releases/download/${version}/surrealkit-${version}-${asset.tarballSuffix}";
  };
}
