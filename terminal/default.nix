# Can import other nix modules here
# Other modules can just import this folder and it will use the default.nix if another file isn't specified
# Since shells also has a default.nix, everything in that import will be brought over when this default.nix is included somewhere

{pkgs, ... }:
{
  imports = [
    ./shells
    ./terminator.nix
  ];
}
