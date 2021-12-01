{
  description = "Haskell flake";

  outputs = { self, nixpkgs }:
    let pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in {
      packages.x86_64-linux.aoc2021 = pkgs.haskellPackages.callCabal2nix "aoc2021" ./. {};
      defaultPackage.x86_64-linux = self.packages.x86_64-linux.aoc2021;

      devShell.x86_64-linux = pkgs.mkShell {
        buildInputs = with pkgs; [
          (haskellPackages.ghcWithPackages (p: [ p.cabal-install p.haskell-language-server ]))
        ];
      };
    };
}
