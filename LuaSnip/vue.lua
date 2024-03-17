return {
  s('cmp', fmt([[const {} = computed(() => {} )]], { i(1), i(2) })),

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
}
