{
  perSystem =
    { pkgs, self', ... }:
    let
      surrealql-language-server = self'.packages.surrealql-language-server;
    in
    {
      checks.surrealql-language-server = surrealql-language-server;
      packages.surrealql-language-server = pkgs.callPackage ./_src { };

      apps.surrealql-language-server = {
        inherit (surrealql-language-server) meta;
        program = surrealql-language-server;
      };
    };
}
