<?if(!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED!==true)die();?>
	<? if ($APPLICATION->GetCurPage() == "/"): ?>
		</div> <!-- end .container -->
	<? endif ?>
</div> <!-- end .content-wrap -->

<div class="footer">
    <div class="footer-top">
        <div class="container">
            <div class="clearfix">
				<?$APPLICATION->IncludeComponent("bitrix:menu", "bottom", Array(
						"ROOT_MENU_TYPE" => "bottom",	// Тип меню для первого уровня
						"MAX_LEVEL" => "1",	// Уровень вложенности меню
						"CHILD_MENU_TYPE" => "left",	// Тип меню для остальных уровней
						"USE_EXT" => "N",	// Подключать файлы с именами вида .тип_меню.menu_ext.php
						"DELAY" => "N",	// Откладывать выполнение шаблона меню
						"ALLOW_MULTI_SELECT" => "N",	// Разрешить несколько активных пунктов одновременно
						"MENU_CACHE_TYPE" => "A",	// Тип кеширования
						"MENU_CACHE_TIME" => "3600",	// Время кеширования (сек.)
						"MENU_CACHE_USE_GROUPS" => "Y",	// Учитывать права доступа
						"MENU_CACHE_GET_VARS" => "",	// Значимые переменные запроса
					),
					false
				);?>
               
                <div class="f-phone pull-right">
                    <div class="phone">
						<?$APPLICATION->IncludeFile(
							SITE_TEMPLATE_PATH."/include/phone.php",
							Array(),
							Array("MODE" => "html")
						);?>
					</div>
                    <div class="submit">
                        <a data-dialog="feedback" href="javascript:void(0);">Обратная связь</a>
                    </div>
                </div>
            </div>
            <div class="logo text-center"><a href="/"><img src="<?=SITE_TEMPLATE_PATH?>/img/logo-footer.png" alt=""/></a></div>
        </div>
    </div>
    <div class="footer-bottom">
        <div class="container">
            <div class="fb-l pull-left">
                <div>
                    <span class="copyright">
						<?$APPLICATION->IncludeFile(
							SITE_TEMPLATE_PATH."/include/copyright.php",
							Array(),
							Array("MODE" => "html")
						);?>
					</span>
                </div>
            </div>
            <div class="fb-c pull-left">
                <a class="fb" href="#"></a>
                <a class="ins" href="#"></a>
                <a class="tw" href="#"></a>
            </div>
            <div class="fb-r text-right pull-right">
				<?$APPLICATION->IncludeFile(
					SITE_TEMPLATE_PATH."/include/dev.php",
					Array(),
					Array("MODE" => "html")
				);?>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<div id="authorization" class="dialog">
    <div class="dialog__overlay"></div>
    <div class="dialog__content">
        <div><button class="action" data-dialog-close></button></div>
        <div class="auth-form-wrap">
            <div class="title">личный кабинет</div>
            <form action="" method="get" id="auth-form" class="form-horizontal">
                <div class="form-group" style="">
                    <label for="form_ext_author_name" class="control-label">№ карты</label>
                    <input style="" type="text" placeholder="12345" id="form_ext_author_name" class="form-control" value="" name="author_name">
                </div>
                <div class="form-group" style="">
                    <label for="form_ext_author_name1" class="control-label">PIN</label>
                    <input style="" type="text" placeholder="12345" id="form_ext_author_name1" class="form-control" value="" name="author_name">
                </div>
                <div class="submit">
                    <input type="submit" name="submit" id="" value="Войти">
                </div>
            </form>
        </div>
    </div>
</div>
<div id="feedback" class="dialog">
    <div class="dialog__overlay"></div>
    <div class="dialog__content">
        <div><button class="action" data-dialog-close></button></div>
        <div class="auth-form-wrap">
            <div class="title">Написать нам</div>
            <form action="" method="get" id="auth-form1" class="form-horizontal">
                <div class="form-group" style="">
                    <label for="form_ext_author_name13" class="control-label">Имя</label>
                    <input style="" type="text" placeholder="Константин" id="form_ext_author_name13" class="form-control" value="" name="author_name">
                </div>
                <div class="form-group" style="">
                    <label for="form_ext_author_name12" class="control-label">Эл. почта</label>
                    <input style="" type="text" id="form_ext_author_name12" class="form-control" value="" name="author_name">
                </div>
                <div class="form-group" style="">
                    <label for="form_ext_author_name123" class="control-label">Телефон</label>
                    <input style="" type="text" id="form_ext_author_name123" class="form-control" value="" name="author_name">
                </div>
                <div class="form-group" style="">
                    <label for="form_ext_author_name123" class="control-label">Сообщение</label>
                    <textarea class="form-control" name="text" id="qwerty"></textarea>
                </div>
                <div class="submit">
                    <input type="submit" name="submit" id="" value="Войти">
                </div>
            </form>
        </div>
    </div>
</div>
<!-- JavaScript
================================================== -->
<!--<script src="./js/jquery-1.8.3.min.js"></script>-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<?=SITE_TEMPLATE_PATH?>/js/bootstrap.min.js"></script>
<script src="<?=SITE_TEMPLATE_PATH?>/js/classie.js"></script>
<script src="<?=SITE_TEMPLATE_PATH?>/js/modernizr.custom.js"></script>
<script src="<?=SITE_TEMPLATE_PATH?>/js/dialogFx.js"></script>
<script src="<?=SITE_TEMPLATE_PATH?>/owl/owl.carousel.min.js"></script>
<script src="<?=SITE_TEMPLATE_PATH?>/textarea/autoresize.jquery.js"></script>
<script src="<?=SITE_TEMPLATE_PATH?>/textarea/jquery.mousewheel.min.js"></script>
<script src="<?=SITE_TEMPLATE_PATH?>/textarea/jquery-ui.min.js"></script>
<script src="<?=SITE_TEMPLATE_PATH?>/textarea/cutext.js"></script>
<script src="<?=SITE_TEMPLATE_PATH?>/js/main.js"></script>
<!-- Placed at the end of the document so the pages load faster -->
</body>
</html>