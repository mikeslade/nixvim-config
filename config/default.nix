{
  config,
  lib,
  ...
}: {
  # Import all your configuration modules here
  imports = [
    ./plugins

    ./autocommands.nix
    ./highlight.nix
    ./keys.nix
    ./options.nix

    # ./options.nix
    # ./keymappings.nix
  ];

  options = {
    theme = lib.mkOption {
      default = lib.mkDefault "tomorrow-night";
      type = lib.types.enum [
        "aquarium"
        "darcula"
        "decay"
        "edge-dark"
        "everblush"
        "everforest"
        "google-dark"
        "gruvbox"
        "jellybeans"
        "material-darker" # I like it
        "mountain"
        "nord"
        "onedark"
        "paradise"
        "phd"
        "shadesmear-dark" # I like it
        "tokyo-night-terminal-dark" # I like it
        "tokyo-night-terminal-storm"
        "tokyodark-terminal" # I like it
        "tokyonight"
        "tomorrow-night" # I like it
      ];
    };
    assistant = lib.mkOption {
      default = "none";
      type = lib.types.enum ["copilot" "none"];
    };
  };
  config = {
    # The base16 theme to use, if you want to use another theme, change it in colorscheme.nix
    theme = "tomorrow-night";
    extraConfigLua = ''
      _G.theme = "${config.theme}"
    '';
  };
}
