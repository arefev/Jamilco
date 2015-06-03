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

<div class="brands">
	<? if ($arParams['DISPLAY_TITLE'] == 'Y'): ?>
		<div class="container">
			<p class="h1"><?=GetMessage('BRANDS_TITLE')?></p>
	<? endif ?>
	
		<div class="brands-wrap">
			<div class="row brand-images">

				<?foreach($arResult["ITEMS"] as $arItem):?>
					<?
					$this->AddEditAction($arItem['ID'], $arItem['EDIT_LINK'], CIBlock::GetArrayByID($arItem["IBLOCK_ID"], "ELEMENT_EDIT"));
					$this->AddDeleteAction($arItem['ID'], $arItem['DELETE_LINK'], CIBlock::GetArrayByID($arItem["IBLOCK_ID"], "ELEMENT_DELETE"), array("CONFIRM" => GetMessage('CT_BNL_ELEMENT_DELETE_CONFIRM')));
					?>
					<div class="col-xs-3 p0" id="<?=$this->GetEditAreaId($arItem['ID']);?>">
						<div class="brand-item">
							<a href="<?=$arItem['DETAIL_PAGE_URL']?>">
								<img class="brand-logo" src="<?=$arItem['DISPLAY_PROPERTIES']['LOGO']['RESIZE']['src']?>" alt=""/>
								<img class="brand-logo-white" src="<?=$arItem['DISPLAY_PROPERTIES']['LOGO_HOVER']['RESIZE']['src']?>" alt=""/>
								<img class="brand-hover" src="<?=$arItem['DISPLAY_PROPERTIES']['LOGO_PICTURE']['RESIZE']['src']?>" alt=""/>
							</a>
						</div>
					</div>
					
				<?endforeach;?>

			</div>
		</div>
		<? if ($arParams['PAGER_SHOW_ALL'] == 'Y'): ?>
			<div class="submit">
				<a href="<?=str_replace('#SITE_DIR#', '', $arResult['LIST_PAGE_URL'])?>" title="<?=GetMessage('BRANDS_ALL')?>"><?=GetMessage('BRANDS_ALL')?></a>
			</div>
		<? endif ?>
		
	<? if ($arParams['DISPLAY_TITLE'] == 'Y'): ?>
		</div>
	<? endif ?>
</div>
