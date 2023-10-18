local M = {}
M.config = function()
  lvim.builtin.specs = {
    show_jumps       = true,
    min_jump         = 30,
    popup            = {
      delay_ms = 0,   -- delay before popup displays
      inc_ms = 10,    -- time increments used for fade/resize effects
      blend = 10,     -- starting blend, between 0-100 (fully transparent), see :h winblend
      width = 10,
      winhl = "PMenu",
      fader = require('specs').linear_fader,
      resizer = require('specs').shrink_resizer
    },
    ignore_filetypes = {},
    ignore_buftypes  = {
      nofile = true,
    },
  }
end

function M.setup()
  local status_ok, project = pcall(require, "specs")
  if not status_ok then
    return
  end

  project.setup(lvim.builtin.specs)
  if lvim.builtin.specs.on_config_done then
    lvim.builtin.specs.on_config_done(project)
  end
end
return M
