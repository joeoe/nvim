local ls = require 'luasnip'

local fmt = require('luasnip.extras.fmt').fmt

local s = ls.snippet
local i = ls.insert_node

return {

  s(
    'vc',
    fmt(
      [[<script lang="ts" setup>
  {}
</script>

<template>
</template>]],
      { i(1) }
    )
  ),

  s(
    'story',
    fmt(
      [[
<script lang="ts" setup>
  {fin}
</script>

<template>
  <Story title="{storyTitle}">
    <template #controls>
    </template>

    <Variant title="{variantTitle}">
    </Variant>
  </Story>
</template>

<style scoped lang="scss">
</style>
]],
      {
        storyTitle = i(1),
        variantTitle = i(2),
        fin = i(0),
      }
    )
  ),
}
