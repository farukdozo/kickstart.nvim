return {
  {
    "bjarneo/ash.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("ash")

      -- Tokyo Night Storm inspired colorscheme
      local c = {
        bg = "#24283b",
        bg_dark = "#1f2335",
        bg_dark1 = "#1b1e2d",
        bg_highlight = "#292e42",

        fg = "#c0caf5",
        fg_dark = "#a9b1d6",
        fg_gutter = "#3b4261",

        blue = "#7aa2f7",
        cyan = "#7dcfff",
        green = "#9ece6a",
        magenta = "#bb9af7",
        orange = "#ff9e64",
        purple = "#9d7cd8",
        red = "#f7768e",
        red1 = "#db4b4b",
        teal = "#1abc9c",
        yellow = "#e0af68",

        comment = "#565f89",

        git = {
          add = "#449dab",
          change = "#6183bb",
          delete = "#914c54",
        },
      }

      local function apply_custom_highlights()
        local set = function(group, opts)
          vim.api.nvim_set_hl(0, group, opts)
        end

        -- -------- Comments
        -- set("@comment", { fg = c.comment, italic = true })
        set("@comment.todo", { fg = c.orange, bold = true })
        set("@comment.warning", { fg = c.yellow })
        set("@comment.error", { fg = c.red, bold = true })

        -- -------- Strings / literals
        set("@string", { fg = c.green })
        set("@string.escape", { fg = c.magenta })
        set("@character", { fg = c.green })
        set("@number", { fg = c.orange })
        set("@boolean", { fg = c.orange })

        -- -------- Variables / constants
        set("@variable", { fg = c.fg })
        set("@variable.builtin", { fg = c.red })
        set("@constant", { fg = c.cyan })
        set("@constant.builtin", { fg = c.cyan, bold = true })

        -- -------- Functions
        set("@function", { fg = c.blue })
        set("@function.builtin", { fg = c.blue, bold = true })
        set("@function.method", { fg = c.blue })
        set("@constructor", { fg = c.blue })

        -- -------- Keywords / operators
        set("@keyword", { fg = c.purple })
        set("@keyword.return", { fg = c.purple })
        set("@conditional", { fg = c.purple })
        set("@repeat", { fg = c.purple })
        set("@operator", { fg = c.purple })

        -- -------- Types
        set("@type", { fg = c.teal })
        set("@type.builtin", { fg = c.teal, bold = true })

        -- -------- Punctuation
        set("@punctuation.delimiter", { fg = c.fg_gutter })
        set("@punctuation.bracket", { fg = c.fg_gutter })
        set("@punctuation.special", { fg = c.orange })

        -- -------- Diagnostics (errors / warnings / hints)
        set("DiagnosticError", { fg = c.red })
        set("DiagnosticWarn", { fg = c.yellow })
        set("DiagnosticInfo", { fg = c.blue })
        set("DiagnosticHint", { fg = c.cyan })

        set("DiagnosticUnderlineError", { undercurl = true, sp = c.red })
        set("DiagnosticUnderlineWarn", { undercurl = true, sp = c.yellow })
        set("DiagnosticUnderlineInfo", { undercurl = true, sp = c.blue })
        set("DiagnosticUnderlineHint", { undercurl = true, sp = c.cyan })

        -- -------- Diagnostics (virtual text / floating)
        set("DiagnosticVirtualTextError", { fg = c.red })
        set("DiagnosticVirtualTextWarn", { fg = c.yellow })
        set("DiagnosticVirtualTextInfo", { fg = c.blue })
        set("DiagnosticVirtualTextHint", { fg = c.cyan })

        set("DiagnosticFloatingError", { fg = c.red })
        set("DiagnosticFloatingWarn", { fg = c.yellow })
        set("DiagnosticFloatingInfo", { fg = c.blue })
        set("DiagnosticFloatingHint", { fg = c.cyan })
      end

      -- Apply immediately
      apply_custom_highlights()

      -- Re-apply on any :colorscheme change
      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = apply_custom_highlights,
      })
    end,
  },
}
