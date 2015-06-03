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

<div class="news">
	<? if ($arParams['DISPLAY_TITLE'] == 'Y'): ?>
		<div class="container">
			<p class="h1"><?=GetMessage('NEWS_TITLE')?></p>
	<? endif ?>
		<div class="news-wrap">

			<?foreach($arResult["ITEMS"] as $arItem):?>
				<?
				$this->AddEditAction($arItem['ID'], $arItem['EDIT_LINK'], CIBlock::GetArrayByID($arItem["IBLOCK_ID"], "ELEMENT_EDIT"));
				$this->AddDeleteAction($arItem['ID'], $arItem['DELETE_LINK'], CIBlock::GetArrayByID($arItem["IBLOCK_ID"], "ELEMENT_DELETE"), array("CONFIRM" => GetMessage('CT_BNL_ELEMENT_DELETE_CONFIRM')));
				?>
				<div class="news-item-wrap" id="<?=$this->GetEditAreaId($arItem['ID']);?>">
					<div class="news-item">
						<a href="<?=$arItem['DETAIL_PAGE_URL']?>">
							<div class="news-img"><img src="<?=$arItem['DETAIL_PICTURE']['RESIZE']['src']?>" alt=""/></div>
							<div class="news-text">
								<div class="news-title"><?=$arItem['NAME']?></div>
								<div class="news-preview"><?=$arItem['PREVIEW_TEXT']?></div>
							</div>
						</a>
					</div>
				</div>
				
			<?endforeach;?>

		</div>
		<? if ($arParams['PAGER_SHOW_ALL'] == 'Y'): ?>
			<div class="submit">
				<a href="<?=str_replace('#SITE_DIR#', '', $arResult['LIST_PAGE_URL'])?>" title="<?=GetMessage('NEWS_ALL')?>"><?=GetMessage('NEWS_ALL')?></a>
			</div>
		<? endif ?>
		
	<? if ($arParams['DISPLAY_TITLE'] == 'Y'): ?>
		</div>
	<? endif ?>
</div>
