local M = {}

function M.get_scheme()
  local scheme = opts.scheme

  if scheme then
    local status_ok, mta = pcall(require, "masita.core.schemes." .. scheme)
    if status_ok then
      return mta
    end
  end
  return require("masita.core.schemes.nord")
end

return M
