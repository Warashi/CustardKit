{ inputs, ... }:
{
  imports = [
    # keep-sorted start
    inputs.devshell.flakeModule
    inputs.git-hooks.flakeModule
    inputs.treefmt-nix.flakeModule
    # keep-sorted end
  ];
  perSystem =
    {
      self',
      config,
      pkgs,
      system,
      ...
    }:
    {
      pre-commit = {
        check.enable = true;
        settings = {
          src = ../../.;
          hooks = {
            # keep-sorted start block=yes
            actionlint.enable = true;
            treefmt.enable = true;
            # keep-sorted end
          };
        };
      };

      treefmt = {
        projectRootFile = "flake.nix";
        programs = {
          nixfmt.enable = true;
        };
      };

      devshells.default = {
        devshell = {
          packages = with pkgs; [
            cue
            jsonschema
            nixfmt
          ];
          startup = {
            pre-commit = {
              text = config.pre-commit.shellHook;
            };
          };
        };
      };
    };
}
