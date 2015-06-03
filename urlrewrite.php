<?
$arUrlRewrite = array(
	array(
		"CONDITION" => "#^/brands/([\-\w]*)/.*#",
		"RULE" => "ELEMENT_ID=$1",
		"ID" => "",
		"PATH" => "/brands/detail.php",
	),
	array(
		"CONDITION" => "#^/news/([\-\w]*)/.*#",
		"RULE" => "ELEMENT_ID=$1",
		"ID" => "",
		"PATH" => "/news/detail.php",
	),
);

?>