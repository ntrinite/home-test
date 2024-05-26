# Can import other nix modules here
# Other modules can just import this folder and it will use the default.nix if another file isn't specified
{pkgs, ... }:
{
  imports = [
    ./vscode.nix
    # ./python.nix
  ];
}
