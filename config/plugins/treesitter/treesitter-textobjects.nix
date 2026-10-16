# nvim-treesitter-textobjects (main branch) no longer reads keymaps from the
# treesitter config, so they are set through the keymap API.
let
  mkMap = mode: module: fn: key: query: {
    inherit mode key;
    action.__raw = ''
      function()
        require("nvim-treesitter-textobjects.${module}").${fn}("${query}", "textobjects")
      end
    '';
  };
  select = mkMap ["x" "o"] "select" "select_textobject";
  move = mkMap ["n" "x" "o"] "move";
  swap = mkMap "n" "swap";
in {
  plugins.treesitter-textobjects.enable = true;

  extraConfigLua = ''
    require("nvim-treesitter-textobjects").setup({
      select = { lookahead = true },
      move = { set_jumps = true },
    })
  '';

  keymaps = [
    (select "aa" "@parameter.outer")
    (select "ia" "@parameter.inner")
    (select "af" "@function.outer")
    (select "if" "@function.inner")
    (select "ac" "@class.outer")
    (select "ic" "@class.inner")
    (select "ii" "@conditional.inner")
    (select "ai" "@conditional.outer")
    (select "il" "@loop.inner")
    (select "al" "@loop.outer")
    (select "at" "@comment.outer")
    (move "goto_next_start" "]m" "@function.outer")
    (move "goto_next_start" "]]" "@class.outer")
    (move "goto_next_end" "]M" "@function.outer")
    (move "goto_next_end" "][" "@class.outer")
    (move "goto_previous_start" "[m" "@function.outer")
    (move "goto_previous_start" "[[" "@class.outer")
    (move "goto_previous_end" "[M" "@function.outer")
    (move "goto_previous_end" "[]" "@class.outer")
    (swap "swap_next" "<leader>a" "@parameters.inner")
    (swap "swap_previous" "<leader>A" "@parameter.outer")
  ];
}
