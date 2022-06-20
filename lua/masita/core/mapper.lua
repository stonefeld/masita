local M = {}

local mta
local function get_base()
  mta.none = "NONE"

  return {
    Normal = { fg = mta.white, bg = opts.transparent_bg and mta.none or mta.black },
    NonText = { fg = mta.light_black },
    EndOfBuffer = { fg = mta.light_black },
    Whitespace = { fg = mta.light_black },
    SpecialKey = { fg = mta.light_cyan },

    Folded = { fg = mta.light_gray },
    SignColumn = { fg = mta.white, bg = opts.transparent_bg and mta.none or mta.light_black },
    FoldColumn = { link = "SignColumn" },
    VertSplit = { fg = mta.gray, bg = mta.none },

    IncSearch = { fg = mta.light_black, bg = mta.yellow },
    Search = { link = "IncSearch" },
    Substitute = { link = "IncSearch" },

    ColorColumn = { bg = mta.light_black },
    Conceal = { fg = mta.light_gray },
    Cursor = { fg = mta.black, bg = mta.white },
    lCursor = { link = "Cursor" },

    LineNr = { fg = mta.gray },
    CursorLineNr = { fg = mta.yellow, bg = opts.transparent_bg and mta.none or mta.light_black },
    CursorLine = { bg = mta.light_black },
    CursorColumn = { link = "CursorLine" },

    Visual = { bg = mta.gray },
    VisualNOS = { bg = mta.gray, style = "underline" },
    QuickFixLine = { link = "CursorLine" },

    ErrorMsg = { bg = mta.red },
    WarningMsg = { fg = mta.black, bg = mta.yellow },
    ModeMsg = { fg = mta.yellow, style = "bold" },
    MoreMsg = { fg = mta.cyan, style = "bold" },

    Directory = { fg = mta.blue },
    MatchParen = { fg = mta.yellow, style = "bold" },
    Pmenu = { fg = mta.white, bg = mta.dark_gray },
    PmenuSel = { fg = mta.black, bg = mta.white },
    PmenuSbar = { link = "Pmenu" },
    PmenuThumb = { bg = mta.light_gray },
    NormalFloat = { bg = opts.transparent_float and mta.none or mta.dark_gray },
    WildMenu = { link = "PmenuSel" },

    Question = { fg = mta.yellow },
    SpellBad = { fg = mta.red, style = "undercurl" },
    SpellCap = { fg = mta.yellow, style = "undercurl" },
    SpellLocal = { fg = mta.cyan, style = "undercurl" },
    SpellRare = { fg = mta.magenta, style = "undercurl" },

    StatusLine = { fg = mta.white, bg = mta.light_black },
    StatusLineNC = { fg = mta.light_gray, bg = mta.light_black },
    StatusLineAccent = { fg = opts.accent_bg and mta.black or mta.yellow, bg = opts.accent_bg and mta.yellow or mta.none },
    StatusLineAccentInsert = { fg = opts.accent_bg and mta.black or mta.orange, bg = opts.accent_bg and mta.orange or mta.none },
    StatusLineAccentVisual = { fg = opts.accent_bg and mta.black or mta.magenta, bg = opts.accent_bg and mta.magenta or mta.none },
    StatusLineAccentReplace = { fg = opts.accent_bg and mta.black or mta.red, bg = opts.accent_bg and mta.red or mta.none },
    StatusLineAccentCmd = { fg = opts.accent_bg and mta.black or mta.green, bg = opts.accent_bg and mta.green or mta.none },

    TabLine = { fg = mta.light_gray, bg = mta.light_black },
    TabLineFill = { fg = mta.white, bg = mta.light_black },
    TabLineSel = { fg = mta.yellow, bg = mta.gray, style = "bold" },

    DiffAdd = { fg = mta.black, bg = mta.green },
    DiffChange = { fg = mta.black, bg = mta.blue },
    DiffDelete = { fg = mta.black, bg = mta.red },
    DiffText = { fg = mta.black, bg = mta.yellow },

    DebugPC = { fg = mta.black, bg = mta.green },
    DebugBreakpoint = { fg = mta.black, bg = mta.red },

    Title = { fg = mta.yellow, style = "bold" },
    Todo = { fg = mta.white, style = "bold" },
    Error = { fg = mta.red },

    HealthError = { fg = mta.black, bg = mta.red },
    HealthSuccess = { fg = mta.black, bg = mta.green },
    HealthWarning = { fg = mta.black, bg = mta.yellow },

    Bold = { style = "bold" },
    Underlined = { style = "underline" },
    Italic = { style = "italic" },

    Boolean = { link = "Constant" },
    Character = { link = "String" },
    Comment = { fg = mta.light_gray, style = opts.styles.comments },
    -- Conditional = { fg = mta.magenta },
    Constant = { fg = mta.orange },
    -- Define = { fg = mta.red },
    -- Delimiter = { fg = mta.red },
    -- Exception = { fg = mta.red },
    -- Field = { fg = mta.light_blue },
    Float = { link = "Constant" },
    Function = { fg = mta.blue, style = opts.styles.functions },
    Identifier = { fg = mta.cyan },
    -- Ignore = { fg = mta.light_gray },
    -- Include = { fg = mta.blue },
    Keyword = { fg = mta.magenta },
    Label = { link = "Keyword" },
    -- Macro = { fg = mta.orange },
    Number = { link = "Constant" },
    Operator = { fg = mta.red },
    PreProc = { fg = mta.blue },
    -- PreCondit = { fg = mta.red },
    -- Repeat = { fg = mta.magenta },
    Special = { fg = mta.red },
    SpecialChar = { fg = mta.yellow },
    SpecialComment = { fg = mta.yellow, style = opts.styles.comments },
    Structure = { fg = mta.magenta },
    StorageClass =  { fg = mta.magenta },
    Statement = { fg = mta.magenta },
    String = { fg = mta.green },
    Tag = { fg = mta.blue },
    Type = { fg = mta.yellow },
    -- Typedef = { fg = mta.red },

    MarkdownCode = { link = "String" },
  }
end

local function get_integrations()
  local integrations = opts["integrations"]
  local final_integrations = {}

  for int in pairs(integrations) do
    local enabled = false
    if type(integrations[int]) == "table" then
      enabled = integrations[int]["enabled"]
    else
      enabled = integrations[int]
    end

    local status_ok, integration = pcall(require, "masita.core.integrations." .. int)
    if enabled and status_ok then
      final_integrations = vim.tbl_deep_extend("force", final_integrations, integration.get(mta))
    end
  end

  return final_integrations
end

local function get_terminal()
  return mta
end

function M.apply()
  _G.opts = require("masita.config").opts
  mta = require("masita.core.schemes").get_scheme()

  local theme = {}
  theme.base = get_base()
  theme.integrations = get_integrations()
  theme.terminal = get_terminal()

  _G.opts = nil

  return theme
end

return M
