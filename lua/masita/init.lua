local M = {}

local utils = require("masita.core.utils")

function M.load()
  local theme = require("masita.core.mapper").apply()
  utils.load(theme)
end

function M.setup(opts)
  require("masita.config").set_opts(opts)
end

return M
