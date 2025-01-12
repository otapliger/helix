{
  description = "helix development environment";

  inputs = {
    flake-schemas.url = "https://flakehub.com/f/DeterminateSystems/flake-schemas/*";
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.1.*";
    rust-overlay = {
      url = "https://flakehub.com/f/oxalica/rust-overlay/0.1.*";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      flake-schemas,
      nixpkgs,
      rust-overlay,
    }:
    let
      overlays = [
        rust-overlay.overlays.default
        (final: prev: {
          rustToolchain = (final.rust-bin.fromRustupToolchainFile ./rust-toolchain.toml).override {
            extensions = [ "rust-src" ];
          };
        })
      ];
      supportedSystems = [
        "x86_64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
        "aarch64-linux"
      ];
      forEachSupportedSystem =
        f:
        nixpkgs.lib.genAttrs supportedSystems (
          system:
          f {
            pkgs = import nixpkgs { inherit overlays system; };
          }
        );
    in
    {
      schemas = flake-schemas.schemas;
      devShells = forEachSupportedSystem (
        { pkgs }:
        {
          default = pkgs.mkShell {
            packages = with pkgs; [
              rustToolchain
              rust-analyzer
            ];
            env = {
              RUST_BACKTRACE = "1";
              RUST_SRC_PATH = "${pkgs.rustToolchain}/lib/rustlib/src/rust/library";
            };
          };
        }
      );
    };
}
