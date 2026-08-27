{
  lib,
  pkgs,
  stdenv,
}:
let
  version = "v0.6.0";

  assets = {
    x86_64-linux = {
      hash = "sha256-J0YLGyMKLegyQuD+Np9frMyY5t2+2iJ6vM82Qsq+AKg=";
      binarySuffix = "linux-amd64";
    };

    aarch64-linux = {
      hash = "sha256-kFPZxi7uADNiN+LFCAlC8b01uWCAJJ8zHJ5MgtbhiqU=";
      binarySuffix = "linux-arm64";
    };

    aarch64-darwin = {
      hash = "sha256-oxzBiqEGa9xNCctdoqB6JiiRPzBoE10rxOHGP2J9B/I=";
      binarySuffix = "macos-arm64";
    };
  };

  asset = assets."${stdenv.hostPlatform.system}";

  binary = pkgs.fetchurl {
    inherit (asset) hash;
    url = "https://github.com/surrealdb/surrealql-language-server/releases/download/${version}/surrealql-language-server-${asset.binarySuffix}";
  };
in
pkgs.buildPackages.runCommand "surrealql-language-server"
  {
    meta = {
      description = "SurrealQL Language Server";
      homepage = "https://github.com/surrealdb/surrealql-language-server";
      license = lib.licenses.asl20;
      mainProgram = "surrealql-language-server";
    };
  }
  ''
    mkdir -p "$out/bin"
    install -m755 "${binary}" "$out/bin/surrealql-language-server"
  ''
