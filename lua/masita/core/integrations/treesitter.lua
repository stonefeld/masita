local M = {}

function M.get(mta)
  return {
    TSAnnotation = { link = "Identifier" },
    TSAttribute = { link = "Identifier" },
    TSBoolean = { link = "Boolean" },
    TSCharacter = { link = "Character" },
    TSComment = { link = "Comment" },
    TSConditional = { link = "Conditional" },
    TSConstBuiltin = { link = "Keyword" },
    TSConstMacro = { link = "PreProc" },
    TSConstant = { link = "Constant" },
    TSConstructor = { link = "Type" },
    TSError = { link = "Normal" },
    TSException = { link = "Exception" },
    TSField = { link = "Identifier" },
    TSParameter = { fg = mta.cyan, style = opts.styles.parameters },
  }
end

return M
