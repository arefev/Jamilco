<?require($_SERVER["DOCUMENT_ROOT"]."/bitrix/modules/main/include/prolog_before.php");?>
<?$APPLICATION->IncludeComponent("bitrix:system.auth.form", ".default", Array(
		"REGISTER_URL" => "",	// Страница регистрации
		"FORGOT_PASSWORD_URL" => "",	// Страница забытого пароля
		"PROFILE_URL" => "",	// Страница профиля
		"SHOW_ERRORS" => "Y",	// Показывать ошибки
	),
	false
);?>