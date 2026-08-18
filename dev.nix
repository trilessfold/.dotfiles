# dev.nix — пользовательское окружение через nix.
#
# Установить/синхронизировать одной командой (заменяет весь профиль
# содержимым этого файла, лишнее из профиля удаляется):
#
#   nix-env -irf ~/dev.nix
#
# Обновить до свежих версий: nix-channel --update && nix-env -irf ~/dev.nix
{ pkgs ? import <nixpkgs> {} }:

pkgs.buildEnv {
  name = "dev-env";
  paths = with pkgs; [
    neovim
    tmux
    fd
    ripgrep
    fzf          # включает fzf-tmux
    tree-sitter
    git-quick-stats
    glibc        # локали для nvim/tmux вне NixOS
  ];
}
