return {
  s('im', fmta("import { <> } from '<>'", { i(2), i(1) })),
  s('imp', fmta("import '<>'", { i(1) })),

  s('cl', fmta('console.log(<>)', { i(1) })),
  s('ce', fmta('console.error(<>)', { i(1) })),

  s('uin', t 'const { t } = useI18n()'),
  s('tr', fmta('{{ t("<>") }}', { i(1) })),

  -- TODO: Separate test type
  s('des', fmta("describe('<>', () =>> {\n\t<>\n})", { i(1), i(2) })),
  s('it', fmta("test('<>', () =>> {\n\t<>\n})", { i(1), i(2) })),
}
