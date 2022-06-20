local M = {}

function M.highlight(tbl)
  for group, color in pairs(tbl) do
    local style = color.style and "gui=" .. color.style or "gui=NONE"
    local fg = color.fg and "guifg=" .. color.fg or "guifg=NONE"
    local bg = color.bg and "guibg=" .. color.bg or "guibg=NONE"

    local hl = "hi " .. group .. " " .. fg .. " " .. bg .. " " .. style
    vim.cmd(hl)

    if color.link then
      vim.cmd("hi! link " .. group .. " " .. color.link)
    end
  end
end

function M.terminal(mta)
  vim.g.terminal_color_0 = mta.black
  vim.g.terminal_color_8 = mta.light_black

  vim.g.terminal_color_1 = mta.red
  vim.g.terminal_color_9 = mta.red

  vim.g.terminal_color_2 = mta.green
  vim.g.terminal_color_10 = mta.green

  vim.g.terminal_color_3 = mta.yellow
  vim.g.terminal_color_11 = mta.yellow

  vim.g.terminal_color_4 = mta.blue
  vim.g.terminal_color_12 = mta.blue

  vim.g.terminal_color_5 = mta.magenta
  vim.g.terminal_color_13 = mta.magenta

  vim.g.terminal_color_6 = mta.cyan
  vim.g.terminal_color_14 = mta.cyan

  vim.g.terminal_color_7 = mta.white
  vim.g.terminal_color_15 = mta.white
end

function M.load(theme)
  vim.cmd [[ hi clear ]]
  if vim.fn.exists("syntax_on") then
    vim.cmd [[ syntax reset ]]
  end

  vim.g.colors_name = "masita"

  M.highlight(theme.base)
  M.highlight(theme.integrations)
  M.terminal(theme.terminal)
end

return M
