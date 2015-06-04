<?
if(!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED!==true)die();
?>
<?=$arResult["FORM_NOTE"]?>

<?if ($arResult["isFormNote"] != "Y")
{

?>
<div class="title"><?=$arResult["FORM_DESCRIPTION"]?></div>
<?if ($arResult["isFormErrors"] == "Y"):?><?=$arResult["FORM_ERRORS_TEXT"];?><br/><?endif;?>

<?=str_replace('<form', '<form class="form-horizontal" ', $arResult["FORM_HEADER"])?>

<?
/***********************************************************************************
						form questions
***********************************************************************************/
?>
	<?
	foreach ($arResult["QUESTIONS"] as $FIELD_SID => $arQuestion)
	{
		if ($arQuestion['STRUCTURE'][0]['FIELD_TYPE'] == 'hidden')
		{
			echo $arQuestion["HTML_CODE"];
		}
		else
		{
	?>
		<div class="form-group" style="">
			<label for="form_ext_author_name13" class="control-label"><?=$arQuestion["CAPTION"]?></label>
			<?=str_replace('class="', 'class="form-control ', $arQuestion["HTML_CODE"])?>
		</div>
	<?
		}
	} //endwhile
	?>
<?
if($arResult["isUseCaptcha"] == "Y")
{
?>
		<div class="form-group" style="">
			<label for="form_ext_author_name13" class="control-label"><?=GetMessage("FORM_CAPTCHA_TABLE_TITLE")?></label>
			<input type="hidden" name="captcha_sid" value="<?=htmlspecialcharsbx($arResult["CAPTCHACode"]);?>" /><img src="/bitrix/tools/captcha.php?captcha_sid=<?=htmlspecialcharsbx($arResult["CAPTCHACode"]);?>" width="180" height="40" />
			<?=$arQuestion["HTML_CODE"]?>
			<?=GetMessage("FORM_CAPTCHA_FIELD_TITLE")?><?=$arResult["REQUIRED_SIGN"];?>
			<input type="text" name="captcha_word" size="30" maxlength="50" value="" class="inputtext" />
		</div>
<?
} // isUseCaptcha
?>
		<div class="submit">
			<input <?=(intval($arResult["F_RIGHT"]) < 10 ? "disabled=\"disabled\"" : "");?> type="submit" name="web_form_submit" value="<?=htmlspecialcharsbx(strlen(trim($arResult["arForm"]["BUTTON"])) <= 0 ? GetMessage("FORM_ADD") : $arResult["arForm"]["BUTTON"]);?>" />
		</div>
<?=$arResult["FORM_FOOTER"]?>
<?
} //endif (isFormNote)
?>