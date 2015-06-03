<?if(!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED!==true)die();

$maxSize = 240;
foreach($arResult['ITEMS'] as $key => $arItem)
{
	$arItem['DISPLAY_PROPERTIES']['LOGO']['RESIZE'] = CFile::ResizeImageGet($arItem['DISPLAY_PROPERTIES']['LOGO']['FILE_VALUE']['ID'], array('width' => $maxSize, 'height' => $maxSize), BX_RESIZE_IMAGE_PROPORTIONAL, true); 
	
	$arItem['DISPLAY_PROPERTIES']['LOGO_HOVER']['RESIZE'] = CFile::ResizeImageGet($arItem['DISPLAY_PROPERTIES']['LOGO_HOVER']['FILE_VALUE']['ID'], array('width' => $maxSize, 'height' => $maxSize), BX_RESIZE_IMAGE_PROPORTIONAL, true); 
	
	$arItem['DISPLAY_PROPERTIES']['LOGO_PICTURE']['RESIZE'] = CFile::ResizeImageGet($arItem['DISPLAY_PROPERTIES']['LOGO_PICTURE']['FILE_VALUE']['ID'], array('width' => $maxSize, 'height' => $maxSize), BX_RESIZE_IMAGE_EXACT, true); 
	
	$arResult["ITEMS"][$key] = $arItem;
}
?>