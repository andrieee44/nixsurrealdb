{
  perSystem =
    { pkgs, self', ... }:
    let
      surrealdb = self'.packages.surrealdb;
    in
    {
      checks.surrealdb = surrealdb;
      packages.surrealdb = pkgs.callPackage ./_src { };

      apps.surrealdb = {
        inherit (surrealdb) meta;
        program = surrealdb;
      };
    };
}
