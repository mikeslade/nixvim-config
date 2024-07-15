# My NixVim Config

```bash
nix run .
```

Add to flake.nix:

```nix
{
    inputs = {
        ...
        
        nixvim = {
          url = "github:mikeslade/nixvim-config";
          inputs.nixpkgs.follows = "nixpkgs";
        };
    }

    outputs = inputs @ {
        nixvim,
        ...
    }:{
    ...
    }
}
```

Add to a host configuration.nix like so:

```nix
environment.systemPackages = with pkgs; [
    inputs.nixvim.packages.${system}.default
  ];
};
```
