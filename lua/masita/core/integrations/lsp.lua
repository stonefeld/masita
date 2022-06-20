local M = {}

function M.get(mta)
  local virtual_text = opts.integrations.lsp.virtual_text
  local underlines = opts.integrations.lsp.underlines

  local error = mta.red
  local warning = mta.yellow
  local info = mta.cyan
  local hint = mta.green

  return {
    DiagnosticError = { fg = error, style = virtual_text.errors },
    DiagnosticWarn = { fg = warning, style = virtual_text.warnings },
    DiagnosticInfo = { fg = info, style = virtual_text.info },
    DiagnosticHint = { fg = hint, style = virtual_text.hints },

    DiagnosticUnderlineError = { style = underlines.errors },
    DiagnosticUnderlineWarn = { style = underlines.warnings },
    DiagnosticUnderlineInfo = { style = underlines.info },
    DiagnosticUnderlineHint = { style = underlines.hints },
  }
end

return M
