local awful = require('awful')
local bling = require('bling')

awful.layout.layouts = {
  bling.layout.centered,
  awful.layout.suit.tile,
  awful.layout.suit.floating,
}
