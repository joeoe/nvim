return {
	s("im", fmta("import { <> } from '<>'", { i(2), i(1) })),
	s("imp", fmta("import '<>'", { i(1) })),

	s("cl", fmta("console.log(<>)", { i(1) })),
	s("ce", fmta("console.error(<>)", { i(1) })),

	s("uin", t("const { t } = useI18n()")),
	s("tr", fmta('{{ t("<>") }}', { i(1) })),
}
