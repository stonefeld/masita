local M = {}

function M.get(mta)
  local cmp_styles = opts.integrations.cmp.styles

  local hi = {
    CmpItemAbbr = { fg = mta.white },
    CmpItemAbbrDeprecated = { fg = mta.white, style = "strikethrough" },
    CmpItemKind = { fg = mta.blue },
    CmpItemMenu = { fg = mta.light_white },
  }

  if cmp_styles.match then
    hi = vim.tbl_deep_extend(
      "force",
      hi,
      {
        CmpItemAbbr = { fg = mta.light_white },
        CmpItemAbbrMatch = { fg = mta.white, style = "bold" },
        CmpItemAbbrMatchFuzzy = { fg = mta.white, style = "bold" },
      }
    )
  end

  if cmp_styles.kind then
    hi = vim.tbl_deep_extend(
      "force",
      hi,
      {
        CmpItemKindSnippet = { fg = mta.magenta },
        CmpItemKindKeyword = { fg = mta.red },
        CmpItemKindText = { fg = mta.cyan },
        CmpItemKindMethod = { fg = mta.blue },
        CmpItemKindConstructor = { fg = mta.blue },
        CmpItemKindFunction = { fg = mta.blue },
        CmpItemKindFolder = { fg = mta.blue },
        CmpItemKindModule = { fg = mta.blue },
        CmpItemKindConstant = { fg = mta.orange },
        CmpItemKindField = { fg = mta.green },
        CmpItemKindProperty = { fg = mta.green },
        CmpItemKindEnum = { fg = mta.green },
        CmpItemKindUnit = { fg = mta.green },
        CmpItemKindClass = { fg = mta.yellow },
        CmpItemKindVariable = { fg = mta.magenta },
        CmpItemKindFile = { fg = mta.blue },
        CmpItemKindIterface = { fg = mta.yellow },
        CmpItemKindColor = { fg = mta.red },
        CmpItemKindReference = { fg = mta.red },
        CmpItemKindEnumMember = { fg = mta.red },
        CmpItemKindStruct = { fg = mta.blue },
        CmpItemKindValue = { fg = mta.orange },
        CmpItemKindEvent = { fg = mta.blue },
        CmpItemKindOperator = { fg = mta.orange },
        CmpItemKindTypeParameter = { fg = mta.blue },
      }
    )
  end

  return hi
end

return M
