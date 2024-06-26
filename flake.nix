{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:nixos/nixpkgs?ref=release-21.11";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs { inherit system; };
      in with pkgs; rec {
        devShell = mkShell rec {
          buildInputs = [
            rustup
            rust-analyzer
            gtk4
            pkgconfig
            gdb

            libxkbcommon
            libGL

            # WINIT_UNIX_BACKEND=wayland
            wayland

            # WINIT_UNIX_BACKEND=x11
            xorg.libXcursor
            xorg.libXrandr
            xorg.libXi
            xorg.libX11
            libxkbcommon
            libGL

            # WINIT_UNIX_BACKEND=wayland
            wayland
            vulkan-headers
            vulkan-loader
            vulkan-tools

            # WINIT_UNIX_BACKEND=x11
            xorg.libXcursor
            xorg.libXrandr
            xorg.libXi
            xorg.libX11

            nushell
          ];
          LD_LIBRARY_PATH = "${lib.makeLibraryPath [ vulkan-loader ]}";
        };
      });
}
