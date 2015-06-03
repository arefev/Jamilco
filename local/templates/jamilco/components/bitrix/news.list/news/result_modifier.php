<?if(!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED!==true)die();

$maxWith = 300;
$maxHeight = 180;
foreach($arResult['ITEMS'] as $key => $arItem)
{
	$arItem['DETAIL_PICTURE']['RESIZE'] = CFile::ResizeImageGet($arItem['DETAIL_PICTURE']['ID'], array('width' => $maxWith, 'height' => $maxHeight), BX_RESIZE_IMAGE_EXACT, true); 
	
	$arResult["ITEMS"][$key] = $arItem;
}
?>