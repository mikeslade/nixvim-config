{pkgs, ...}: {
  extraPlugins = with pkgs.vimUtils; [
    (buildVimPlugin {
      pname = "markview.nvim";
      version = "24.0.0";
      src = pkgs.fetchFromGitHub {
        owner = "OXY2DEV";
        repo = "markview.nvim";
        rev = "72cd34279e94ee96ee33bdf30a87b00e6d45319d";
        hash = "sha256-4D4jB9CmamMAdpEodw4MdDyJVU6EMsh8P4gLs7p4E40=";
      };
    })
  ];

  extraConfigLua = ''
    require("markview").setup();
  '';
}
