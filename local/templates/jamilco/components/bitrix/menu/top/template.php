<?if (!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED!==true)die();?>

<?if (!empty($arResult)):?>
<div class="main-menu-wrap">
    <div class="container">
        <div class="main-menu">
            <ul class="clearfix">

				<?
				foreach($arResult as $arItem):
					if($arParams["MAX_LEVEL"] == 1 && $arItem["DEPTH_LEVEL"] > 1) 
						continue;
				?>
					<li><a href="<?=$arItem["LINK"]?>" title="<?=$arItem["TEXT"]?>"><?=$arItem["TEXT"]?></a></li>
					
				<?endforeach?>

			</ul>
        </div>
    </div>
</div>
<?endif?>