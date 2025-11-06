# default.nix
{ pkgs ? import <nixpkgs> {} }:

pkgs.buildEnv {
  name = "dev-env";
  paths = with pkgs; [
    neovim
    tmux
    fd
    ripgrep
  ];
}
