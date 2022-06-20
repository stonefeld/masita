local M = {}

M.opts = {
  transparent_bg = false,
  transparent_float = false,
  accent_bg = true,
  scheme = "nord",
  styles = {
    comments = "italic",
    functions = "NONE",
    parameters = "NONE",
  },
  integrations = {
    treesitter = true,
    lsp = {
      enabled = true,
      virtual_text = {
        errors = "italic",
        warnings = "italic",
        hints = "italic",
        info = "italic",
      },
      underlines = {
        errors = "underline",
        warnings = "underline",
        hints = "underline",
        info = "underline",
      },
    },
    cmp = {
      enabled = true,
      styles = {
        match = true,
        kind = true,
      },
    },
    telescope = true,
  },
}

function M.set_opts(opts)
  opts = opts or {}
  M.opts = vim.tbl_deep_extend("force", M.opts, opts)
end

return M
