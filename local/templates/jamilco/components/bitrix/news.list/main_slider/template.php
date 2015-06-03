<?if(!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED!==true)die();
/** @var array $arParams */
/** @var array $arResult */
/** @global CMain $APPLICATION */
/** @global CUser $USER */
/** @global CDatabase $DB */
/** @var CBitrixComponentTemplate $this */
/** @var string $templateName */
/** @var string $templateFile */
/** @var string $templateFolder */
/** @var string $componentPath */
/** @var CBitrixComponent $component */
$this->setFrameMode(true);

?>
<div class="slider-main">
	<div class="slider">
		<? foreach($arResult["ITEMS"] as $arItem): ?>
			<?
			$this->AddEditAction($arItem['ID'], $arItem['EDIT_LINK'], CIBlock::GetArrayByID($arItem["IBLOCK_ID"], "ELEMENT_EDIT"));
			$this->AddDeleteAction($arItem['ID'], $arItem['DELETE_LINK'], CIBlock::GetArrayByID($arItem["IBLOCK_ID"], "ELEMENT_DELETE"), array("CONFIRM" => GetMessage('CT_BNL_ELEMENT_DELETE_CONFIRM')));
			?>
			<div class="sl-item" id="<?=$this->GetEditAreaId($arItem['ID']);?>">
				<div class="img-wrap">
					<img src="<?=$arItem['PREVIEW_PICTURE']['SRC']?>" alt=""/>
				</div>
				<div class="text">
					<? if ($arItem['DISPLAY_PROPERTIES']['TITLE']): ?>
						<div class="title"><?=$arItem['DISPLAY_PROPERTIES']['TITLE']['DISPLAY_VALUE']?></div>
					<? endif ?>
					<? if ($arItem['PREVIEW_TEXT']): ?>
						<div class="preview"><?=$arItem['PREVIEW_TEXT']?></div>
					<? endif ?>
					<div class="more"><a href="#"><?=GetMessage('MORE_INFO_LINK')?></a></div>
				</div>
			</div>
			
		<? endforeach ?>
	</div>
	<div class="slider-bottom">
		<div class="mini-slider-l">
			<? 
			$i = 1;
			foreach($arResult["ITEMS"] as $key => $arItem): ?>
				<div><a data-num="<?=$i-1?>" class="sl-mini-btn" href="#<?=$i?>"><?=$arItem['NAME']?></a></div>
			<? 
			$i++;
			endforeach; ?>
		</div>
		<div class="sl-nav"></div>
		<div class="mini-slider-r">
			<? 
			$i = 1;
			foreach($arResult["ITEMS"] as $key => $arItem): ?>
				<div><a data-num="<?=$i-1?>" class="sl-mini-btn" href="#<?=$i?>"><?=$arItem['NAME']?></a></div>
			<? 
			$i++;
			endforeach; ?>
		</div>
	</div>
</div>
