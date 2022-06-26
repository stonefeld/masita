local M = {}

function M.get(mta)
  return {
    DapUIVariable = { fg = mta.white },
    DapUIScope = { fg = mta.light_cyan },
    DapUIType = { fg = mta.magenta },
    DapUIValue = { fg = mta.white },
    DapUIModifiedValue = { fg = mta.yellow, style = "bold" },
    DapUIDecoration = { fg = mta.light_cyan },
    DapUIThread = { fg = mta.green },
    DapUIStoppedThread = { fg = mta.light_cyan },
    DapUIFrameName = { fg = mta.white },
    DapUISource = { fg = mta.magenta },
    DapUILineNumber = { fg = mta.light_cyan },
    DapUIFloatBorder = { links = "FloatBorder" },
    DapUIWatchesEmpty = { fg = mta.red },
    DapUIWatchesValue = { fg = mta.green },
    DapUIWatchesError = { links = "Error" },
    DapUIBreakpointsPath = { fg = mta.light_cyan },
    DapUIBreakpointsInfo = { fg = mta.green },
    DapUIBreakpointsCurrentLine = { fg = mta.green, style = "bold" },
    DapUIBreakpointsLine = { fg = mta.light_cyan },
    DapUIBreakpointsDisabledLine = { fg = mta.gray },
  }
end

return M
