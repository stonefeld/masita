local M = {}

function M.get(mta)
  return {
    TelescopeSelection = { bg = mta.gray },
    TelescopeSelectionCaret = { fg = mta.orange, bg = mta.gray, style = "bold" },
    TelescopeTitle = { fg = mta.green },
    TelescopeBorder = { fg = mta.light_gray },
    TelescopePromptCounter = { fg = mta.light_gray },
    TelescopeMatching = { fg = mta.yellow, style = "bold" },
  }
end

return M
