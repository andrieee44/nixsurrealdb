{
  lib,
  pkgs,
  stdenv,
}:
let
  version = "v3.2.4";

  assets = {
    x86_64-linux = {
      hash = "sha256-qvnI04gkjbY+EDADhclOyfhe9EMOeflWmIYEXYlt82k=";
      tarballSuffix = "linux-amd64.tgz";
    };

    aarch64-linux = {
      hash = "sha256-ZNn5xhON92i/BMDTY30so2VQIoGa4LF3Kg1i8vs/XwM=";
      tarballSuffix = "linux-arm64.tgz";
    };

    aarch64-darwin = {
      hash = "sha256-jXA+nF7RLlCex+ubFzhdPKxEAHf5OYDVyYtXwtmcu+g=";
      tarballSuffix = "darwin-arm64.tgz";
    };
  };

  asset = assets."${stdenv.hostPlatform.system}";
in
pkgs.buildPackages.stdenvNoCC.mkDerivation {
  inherit version;
  pname = "surreal";
  sourceRoot = ".";

  installPhase = ''
    mkdir -p "$out/bin"
    install -m755 surreal "$out/bin/surreal"
  '';

  meta = {
    description = "A scalable, distributed, collaborative, document-graph database, for the realtime web";
    homepage = "https://github.com/surrealdb/surrealdb";
    license = lib.licenses.bsl11;
    mainProgram = "surreal";
  };

  src = pkgs.fetchurl {
    inherit (asset) hash;
    url = "https://github.com/surrealdb/surrealdb/releases/download/${version}/surreal-${version}.${asset.tarballSuffix}";
  };
}
