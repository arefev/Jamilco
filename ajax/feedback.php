<?require($_SERVER["DOCUMENT_ROOT"]."/bitrix/modules/main/include/prolog_before.php");?>
<?$APPLICATION->IncludeComponent("bitrix:form.result.new", "feedback", Array(
		"WEB_FORM_ID" => "1",	// ID ���-�����
		"IGNORE_CUSTOM_TEMPLATE" => "Y",	// ������������ ���� ������
		"USE_EXTENDED_ERRORS" => "N",	// ������������ ����������� ����� ��������� �� �������
		"SEF_MODE" => "N",	// �������� ��������� ���
		"CACHE_TYPE" => "A",	// ��� �����������
		"CACHE_TIME" => "3600",	// ����� ����������� (���.)
		"LIST_URL" => "",	// �������� �� ������� �����������
		"EDIT_URL" => "",	// �������� �������������� ����������
		"SUCCESS_URL" => "",	// �������� � ���������� �� �������� ��������
		"CHAIN_ITEM_TEXT" => "",	// �������� ��������������� ������ � ������������� �������
		"CHAIN_ITEM_LINK" => "",	// ������ �� �������������� ������ � ������������� �������
		"SEF_FOLDER" => "/about-company/",	// ������� ��� (������������ ����� �����)
		"VARIABLE_ALIASES" => array(
			"WEB_FORM_ID" => "WEB_FORM_ID",
			"RESULT_ID" => "RESULT_ID",
		)
	),
	false
);?>