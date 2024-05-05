local ls = require 'luasnip'

local s = ls.snippet
local t = ls.text_node
-- local c = ls.choice_node

return {
  s({ trig = 'hi', dscr = 'Example snippet' }, { t 'Hello, world!' }),
  -- s(
  --   'cc',
  --   c(1, {
  --     t 'who am i',
  --     t 'no really',
  --   })
  -- ),
}
