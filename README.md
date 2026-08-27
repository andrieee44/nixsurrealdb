# nixsurrealdb

## NAME

nixsurrealdb - Nix SurrealDB Precompiled Binaries

## SYNOPSIS

In your `flake.nix`:

```nix
inputs.nixsurrealdb.url = "github:andrieee44/nixsurrealdb";
```

### nixsurrealdb.packages."${system}".surrealdb

[A scalable, distributed, collaborative, document-graph database, for the
realtime web](https://github.com/surrealdb/surrealdb)

### nixsurrealdb.packages."${system}".surrealkit

[Migrations, Seeding, TypeGen and Testing for your SurrealDB apps](https://github.com/surrealdb/surrealkit)

### nixsurrealdb.packages."${system}".surrealql-language-server

[SurrealQL Language Server](https://github.com/surrealdb/surrealql-language-server)

## DESCRIPTION

nixsurrealdb downloads the precompiled binaries from the
[SurrealDB](https://github.com/surrealdb/surrealdb),
[surrealkit](https://github.com/surrealdb/surrealkit), and
[surrealql-language-server](https://github.com/surrealdb/surrealql-language-server)
GitHub releases and provides them as ready-to-use Nix packages. Each package
also exposes an
[app output](https://nix.dev/manual/nix/stable/command-ref/new-cli/nix3-run),
so it can be run directly with `nix run`.

Building the Rust projects from source did not work reliably on the
maintainer's machine, and at the time of writing, `surrealkit` and
`surrealql-language-server` did not have an available Nix derivation. As a
result, this flake packages the precompiled binaries instead.

## REPORTING BUGS

Open a GitHub issue at
[github.com/andrieee44/nixsurrealdb](https://github.com/andrieee44/nixsurrealdb/issues).

## COPYRIGHT

See [`LICENSE`](./LICENSE). Licensed under
[AGPLv3 or later](https://www.gnu.org/licenses/agpl-3.0.html).

As of this writing, the SurrealDB project's licenses are
[Apache 2.0](https://www.apache.org/licenses/LICENSE-2.0), with the exception
of SurrealDB itself, which is licensed under
[BSL 1.1](https://github.com/surrealdb/surrealdb/blob/main/LICENSE).

## SEE ALSO

- [GitHub repository](https://github.com/andrieee44/nixsurrealdb)
- [Nix flakes](https://wiki.nixos.org/wiki/Flakes)
- [Nix](https://nixos.org/)
- [Nixpkgs](https://github.com/NixOS/nixpkgs)
- [SurrealDB](https://surrealdb.com/)
