{
  perSystem =
    { pkgs, self', ... }:
    let
      surrealkit = self'.packages.surrealkit;
    in
    {
      checks.surrealkit = surrealkit;
      packages.surrealkit = pkgs.callPackage ./_src { };

      apps.surrealkit = {
        inherit (surrealkit) meta;
        program = surrealkit;
      };
    };
}
