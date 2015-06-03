<?if(!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED!==true)die();?>
<?

?>
<!DOCTYPE html>
<html lang="ru">
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="author" content="">
    <link rel="icon" href="<?=SITE_TEMPLATE_PATH?>/favicon.ico">

    <title><?$APPLICATION->ShowTitle()?></title>

    <!-- Bootstrap core CSS -->
	<? $APPLICATION->SetAdditionalCSS(SITE_TEMPLATE_PATH.'/css/bootstrap.min.css'); ?>
	<? $APPLICATION->SetAdditionalCSS(SITE_TEMPLATE_PATH.'/css/dialog.css'); ?>
	<? $APPLICATION->SetAdditionalCSS(SITE_TEMPLATE_PATH.'/css/dialog-sandra.css'); ?>
	<? $APPLICATION->SetAdditionalCSS(SITE_TEMPLATE_PATH.'/owl/owl.carousel.css'); ?>
	<? $APPLICATION->SetAdditionalCSS(SITE_TEMPLATE_PATH.'/owl/animate.css'); ?>
	<? $APPLICATION->SetAdditionalCSS(SITE_TEMPLATE_PATH.'/css/style.css'); ?>
	
	<? $APPLICATION->AddHeadScript(SITE_TEMPLATE_PATH.'/js/ie-emulation-modes-warning.js'); ?>
	<? $APPLICATION->AddHeadScript(SITE_TEMPLATE_PATH.'/js/ie10-viewport-bug-workaround.js'); ?>
    <link href='http://fonts.googleapis.com/css?family=PT+Serif:400,700,400italic,700italic&subset=latin,cyrillic-ext' rel='stylesheet' type='text/css'>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
	
	<?$APPLICATION->ShowHead();?>
</head>
<body>
<div id="panel"><?$APPLICATION->ShowPanel();?></div>
	
<!-- Begin page content -->
<div class="header-line">
	<div class="container">
		<div class="shops pull-left"><a href="/shops/">Магазины</a></div>
		<div class="phone pull-left">+7 (495) 705 93 38</div>
		<div class="find pull-right">
			<form action="search.html" method="get" id="search-form">
				<a href="javascript:void(0);"></a>
				<input type="text" placeholder="Найти..." name="q" value=""/>
			</form>
			<div class="clearfix"></div>
		</div>
		<div class="auth-link pull-right"><a data-dialog="authorization"  href="javascript:void(0);"></a></div>
		<div class="links l2 pull-right"><a href="/wholesale/">оптовые продажи</a></div>
		<div class="links l1 pull-right"><a href="/franchising/">франчайзинг</a></div>
		<div class="clearfix"></div>
	</div>
</div>
	
<div class="logo">
    <div class="container text-center"><a href="/"><img src="<?=SITE_TEMPLATE_PATH?>/img/logo.png" alt=""/></a>
    </div>
</div>

<?$APPLICATION->IncludeComponent("bitrix:menu", "top", Array(
		"ROOT_MENU_TYPE" => "top",	// Тип меню для первого уровня
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

<? if ($APPLICATION->GetCurPage() == "/"): ?>
	<div class="slider-main">
		<div class="slider">
			<div class="sl-item">
				<div class="img-wrap">
					<img src="<?=SITE_TEMPLATE_PATH?>/img/sl1.jpg" alt=""/>
				</div>
				<div class="text">
					<div class="title">title1</div>
					<div class="preview">preview1</div>
					<div class="more"><a href="#">Подробнее</a></div>
				</div>
			</div>
			<div class="sl-item">
				<div class="img-wrap">
					<img src="<?=SITE_TEMPLATE_PATH?>/img/sl2.jpg" alt=""/>
				</div>
				<div class="text">
					<div class="title">title2</div>
					<div class="preview">preview2</div>
					<div class="more"><a href="#">Подробнее</a></div>
				</div>
			</div>
			<div class="sl-item">
				<div class="img-wrap">
					<img src="<?=SITE_TEMPLATE_PATH?>/img/sl1.jpg" alt=""/>
				</div>
				<div class="text">
					<div class="title">Совершай покупки в NAF NAF и получай подарки!</div>
					<div class="preview">При покупке 2-х изделий мы рады подарить вам изящную бижутерию, при покупке трех – яркий лак для ногтей, а при покупке 4-х и более – чехол для смартфона!</div>
					<div class="more"><a href="#">Подробнее</a></div>
				</div>
			</div>
			<div class="sl-item">
				<div class="img-wrap">
					<img src="<?=SITE_TEMPLATE_PATH?>/img/sl2.jpg" alt=""/>
				</div>
					<div class="text">
						<div class="title">title4</div>
						<div class="preview">preview4</div>
						<div class="more"><a href="#">Подробнее</a></div>
					</div>
			</div>
			<div class="sl-item">
				<div class="img-wrap">
					<img src="<?=SITE_TEMPLATE_PATH?>/img/sl1.jpg" alt=""/>
				</div>
					<div class="text">
						<div class="title">title5</div>
						<div class="preview">preview5</div>
						<div class="more"><a href="#">Подробнее</a></div>
					</div>
			</div>
			<div class="sl-item">
				<div class="img-wrap">
					<img src="<?=SITE_TEMPLATE_PATH?>/img/sl2.jpg" alt=""/>
				</div>
					<div class="text">
						<div class="title">title6</div>
						<div class="preview">preview6</div>
						<div class="more"><a href="#">Подробнее</a></div>
					</div>
			</div>
			<div class="sl-item">
				<div class="img-wrap">
					<img src="<?=SITE_TEMPLATE_PATH?>/img/sl1.jpg" alt=""/>
				</div>
					<div class="text">
						<div class="title">title7</div>
						<div class="preview">preview7</div>
						<div class="more"><a href="#">Подробнее</a></div>
					</div>
			</div>
		</div>
		<div class="slider-bottom">
			<div class="mini-slider-l">
				<div><a data-num="0" class="sl-mini-btn" href="#1">Распродажа в Timberland1</a></div>
				<div><a data-num="1" class="sl-mini-btn" href="#2">Черный всегда в моде!2</a></div>
				<div><a data-num="2" class="sl-mini-btn" href="#3">Коллекция SPORT от Juicy Couture3</a></div>
				<div><a data-num="3" class="sl-mini-btn" href="#4">Скидки от NAF NAF4</a></div>
				<div><a data-num="4" class="sl-mini-btn" href="#5">Спецпредоложение в Lee Cooper5</a></div>
				<div><a data-num="5" class="sl-mini-btn" href="#6">Скидка 20% в New Balance6</a></div>
				<div><a data-num="6" class="sl-mini-btn" href="#7">Открылись два магазина ALDO!7</a></div>
			</div>
			<div class="sl-nav"></div>
			<div class="mini-slider-r">
				<div><a data-num="0" class="sl-mini-btn" href="#1">Распродажа в Timberland1</a></div>
				<div><a data-num="1" class="sl-mini-btn" href="#2">Черный всегда в моде!2</a></div>
				<div><a data-num="2" class="sl-mini-btn" href="#3">Коллекция SPORT от Juicy Couture3</a></div>
				<div><a data-num="3" class="sl-mini-btn" href="#4">Скидки от NAF NAF4</a></div>
				<div><a data-num="4" class="sl-mini-btn" href="#5">Спецпредоложение в Lee Cooper5</a></div>
				<div><a data-num="5" class="sl-mini-btn" href="#6">Скидка 20% в New Balance6</a></div>
				<div><a data-num="6" class="sl-mini-btn" href="#7">Открылись два магазина ALDO!7</a></div>
			</div>
		</div>
	</div>
<? endif ?>

<div class="content-wrap">
	<? if ($APPLICATION->GetCurPage() == "/"): ?>
		<div class="container">
			<h1>О компании</h1>
			<div class="content">
				<p>Группа компаний «ДжамильКо» начала свою активную деятельность в сфере розничной торговли с 1993 года.
				На сегодняшний день «ДжамильКо» — один из российских лидеров в области дистрибуции и маркетинга
				высококачественной модной одежды и аксессуаров от ведущих мировых производителей.
				</p>
			</div>
			<p class="title">Почему именно мы?</p>
		</div>
		<div class="slider-why">
			<div class="container">
				<div class="sl-top clearfix">
					<div class="sw-item">
						<a class="active" data-slw-num="0" href="#">
							<div class="sw-img-wrap">
								<img class="cur" src="<?=SITE_TEMPLATE_PATH?>/img/sw1.png" alt=""/>
								<img class="hover" src="<?=SITE_TEMPLATE_PATH?>/img/swh1.png" alt=""/>
							</div>
							<div class="sw-text">20 лет <br/> опыта</div>
						</a>
					</div>
					<div class="sw-item">
						<a data-slw-num="1" href="#">
							<div class="sw-img-wrap">
								<img class="cur" src="<?=SITE_TEMPLATE_PATH?>/img/sw2.png" alt=""/>
								<img class="hover" src="<?=SITE_TEMPLATE_PATH?>/img/swh2.png" alt=""/>
							</div>
							<div class="sw-text">экслюзивные бренды</div>
						</a>
					</div>
					<div class="sw-item">
						<a data-slw-num="2" href="#">
							<div class="sw-img-wrap">
								<img class="cur" src="<?=SITE_TEMPLATE_PATH?>/img/sw3.png" alt=""/>
								<img class="hover" src="<?=SITE_TEMPLATE_PATH?>/img/swh3.png" alt=""/>
							</div>
							<div class="sw-text">140 магазинов</div>
						</a>
					</div>
					<div class="sw-item">
						<a data-slw-num="3" href="#">
							<div class="sw-img-wrap">
								<img class="cur" src="<?=SITE_TEMPLATE_PATH?>/img/sw4.png" alt=""/>
								<img class="hover" src="<?=SITE_TEMPLATE_PATH?>/img/swh4.png" alt=""/>
							</div>
							<div class="sw-text">награды и премии</div>
						</a>
					</div>
				</div>
				<div class="sl-num"><span id="slw-cur">1</span> / <span class="sl-all">4</span></div>
				<div class="sl-bottom">
					<div class="swb-item">Группа компаний «ДжамильКо» <br/> основана и вышла на российский рынок товаров класса «люкс» в 1993 году</div>
					<div class="swb-item">Компания работает с такими брендами, как BURBERRY, CHAUMET, De Beers, JAEGER, John Lobb, PAULE KA, Salvatore Ferragamo, SONIA RYKIEL, SONIA by SONIA RYKIEL, Vilebrequin, Wolford и многие другие.</div>
					<div class="swb-item">3</div>
					<div class="swb-item">В конце 2012 года компания «ЛВБ» была признана «Дистрибьютором года» в рамках ежегодной профессиональной премии в области модной индустрии PROFashion Awards 2012.</div>
				</div>
				<div class="why-more"><a href="#">Узнать больше о нас</a></div>
			</div>
		</div>
		<div class="brands">
			<div class="container">
				<p class="h1">Бренды</p>
				<div class="brands-wrap">
					<div class="row brand-images">
						<div class="col-xs-3 p0">
							<div class="brand-item">
								<a href="#">
									<img class="brand-logo" src="<?=SITE_TEMPLATE_PATH?>/img/gray_brands_logos/1.png" alt=""/>
									<img class="brand-logo-white" src="<?=SITE_TEMPLATE_PATH?>/img/white_brands_logos/1.png" alt=""/>
									<img class="brand-hover" src="<?=SITE_TEMPLATE_PATH?>/img/brands_hovers/1.png" alt=""/>
								</a>
							</div>
						</div>
						<div class="col-xs-3 p0">
							<div class="brand-item">
								<a href="#">
									<img class="brand-logo" src="<?=SITE_TEMPLATE_PATH?>/img/gray_brands_logos/2.png" alt=""/>
									<img class="brand-logo-white" src="<?=SITE_TEMPLATE_PATH?>/img/white_brands_logos/2.png" alt=""/>
									<img class="brand-hover" src="<?=SITE_TEMPLATE_PATH?>/img/brands_hovers/2.png" alt=""/>
								</a>
							</div>
						</div>
						<div class="col-xs-3 p0">
							<div class="brand-item">
								<a href="#">
									<img class="brand-logo" src="<?=SITE_TEMPLATE_PATH?>/img/gray_brands_logos/3.png" alt=""/>
									<img class="brand-logo-white" src="<?=SITE_TEMPLATE_PATH?>/img/white_brands_logos/3.png" alt=""/>
									<img class="brand-hover" src="<?=SITE_TEMPLATE_PATH?>/img/brands_hovers/3.png" alt=""/>
								</a>
							</div>
						</div>
						<div class="col-xs-3 p0">
							<div class="brand-item">
								<a href="#">
									<img class="brand-logo" src="<?=SITE_TEMPLATE_PATH?>/img/gray_brands_logos/4.png" alt=""/>
									<img class="brand-logo-white" src="<?=SITE_TEMPLATE_PATH?>/img/white_brands_logos/4.png" alt=""/>
									<img class="brand-hover" src="<?=SITE_TEMPLATE_PATH?>/img/brands_hovers/4.png" alt=""/>
								</a>
							</div>
						</div>
						<div class="col-xs-3 p0">
							<div class="brand-item">
								<a href="#">
									<img class="brand-logo" src="<?=SITE_TEMPLATE_PATH?>/img/gray_brands_logos/5.png" alt=""/>
									<img class="brand-logo-white" src="<?=SITE_TEMPLATE_PATH?>/img/white_brands_logos/5.png" alt=""/>
									<img class="brand-hover" src="<?=SITE_TEMPLATE_PATH?>/img/brands_hovers/5.png" alt=""/>
								</a>
							</div>
						</div>
						<div class="col-xs-3 p0">
							<div class="brand-item">
								<a href="#">
									<img class="brand-logo" src="<?=SITE_TEMPLATE_PATH?>/img/gray_brands_logos/6.png" alt=""/>
									<img class="brand-logo-white" src="<?=SITE_TEMPLATE_PATH?>/img/white_brands_logos/6.png" alt=""/>
									<img class="brand-hover" src="<?=SITE_TEMPLATE_PATH?>/img/brands_hovers/6.png" alt=""/>
								</a>
							</div>
						</div>
						<div class="col-xs-3 p0">
							<div class="brand-item">
								<a href="#">
									<img class="brand-logo" src="<?=SITE_TEMPLATE_PATH?>/img/gray_brands_logos/7.png" alt=""/>
									<img class="brand-logo-white" src="<?=SITE_TEMPLATE_PATH?>/img/white_brands_logos/7.png" alt=""/>
									<img class="brand-hover" src="<?=SITE_TEMPLATE_PATH?>/img/brands_hovers/7.png" alt=""/>
								</a>
							</div>
						</div>
						<div class="col-xs-3 p0">
							<div class="brand-item">
								<a href="#">
									<img class="brand-logo" src="<?=SITE_TEMPLATE_PATH?>/img/gray_brands_logos/8.png" alt=""/>
									<img class="brand-logo-white" src="<?=SITE_TEMPLATE_PATH?>/img/white_brands_logos/8.png" alt=""/>
									<img class="brand-hover" src="<?=SITE_TEMPLATE_PATH?>/img/brands_hovers/8.png" alt=""/>
								</a>
							</div>
						</div>
						<div class="col-xs-3 p0">
							<div class="brand-item">
								<a href="#">
									<img class="brand-logo" src="<?=SITE_TEMPLATE_PATH?>/img/gray_brands_logos/9.png" alt=""/>
									<img class="brand-logo-white" src="<?=SITE_TEMPLATE_PATH?>/img/white_brands_logos/9.png" alt=""/>
									<img class="brand-hover" src="<?=SITE_TEMPLATE_PATH?>/img/brands_hovers/9.png" alt=""/>
								</a>
							</div>
						</div>
						<div class="col-xs-3 p0">
							<div class="brand-item">
								<a href="#">
									<img class="brand-logo" src="<?=SITE_TEMPLATE_PATH?>/img/gray_brands_logos/10.png" alt=""/>
									<img class="brand-logo-white" src="<?=SITE_TEMPLATE_PATH?>/img/white_brands_logos/10.png" alt=""/>
									<img class="brand-hover" src="<?=SITE_TEMPLATE_PATH?>/img/brands_hovers/10.png" alt=""/>
								</a>
							</div>
						</div>
						<div class="col-xs-3 p0">
							<div class="brand-item">
								<a href="#">
									<img class="brand-logo" src="<?=SITE_TEMPLATE_PATH?>/img/gray_brands_logos/11.png" alt=""/>
									<img class="brand-logo-white" src="<?=SITE_TEMPLATE_PATH?>/img/white_brands_logos/11.png" alt=""/>
									<img class="brand-hover" src="<?=SITE_TEMPLATE_PATH?>/img/brands_hovers/11.png" alt=""/>
								</a>
							</div>
						</div>
						<div class="col-xs-3 p0">
							<div class="brand-item">
								<a href="#">
									<img class="brand-logo" src="<?=SITE_TEMPLATE_PATH?>/img/gray_brands_logos/12.png" alt=""/>
									<img class="brand-logo-white" src="<?=SITE_TEMPLATE_PATH?>/img/white_brands_logos/12.png" alt=""/>
									<img class="brand-hover" src="<?=SITE_TEMPLATE_PATH?>/img/brands_hovers/12.png" alt=""/>
								</a>
							</div>
						</div>
					</div>
				</div>
				<div class="submit">
					<a href="#">Все бренды</a>
				</div>
			</div>
		</div>
		<div class="career">
			<div class="container">
				<div class="career-inner">
					<div class="career-title">Карьера</div>
					<div class="career-text">ИЩЕМ ЯРКИХ ПРОДАВЦОВ-КОНСУЛЬТАНТОВ</div>
				   <div class="career-mail">Присылайте свои резюме по адресу: hr@jamilco.ru</div>
				   <div class="career-phone">Телефон отдела по работе с персоналом: +7 495 745 88 95</div>
					<div class="more"><a href="#">Подробнее</a></div>
				</div>
			</div>
		</div>
		<div class="news">
			<div class="container">
				<p class="h1">Новости</p>
				<div class="news-wrap">
					<div class="news-item-wrap">
						<div class="news-item">
							<a href="#">
								<div class="news-img"><img src="<?=SITE_TEMPLATE_PATH?>/img/n1.jpg" alt=""/></div>
								<div class="news-text">
									<div class="news-title">разве СЕЗОН ЮБОК КОНЧИЛСЯ?</div>
									<div class="news-preview">Пора узнать, какие юбки будут в моде этой осенью!</div>
								</div>
							</a>
						</div>
					</div>
					<div class="news-item-wrap">
						<div class="news-item">
							<a href="#">
								<div class="news-img"><img src="<?=SITE_TEMPLATE_PATH?>/img/n2.jpg" alt=""/></div>
								<div class="news-text">
									<div class="news-title">ЦВЕТА ОСЕННЕГО СЕЗОНА!</div>
									<div class="news-preview">Еще не знаете осенние тенденции? Мы подскажем!</div>
								</div>
							</a>
						</div>
					</div>
					<div class="news-item-wrap">
						<div class="news-item">
							<a href="#">
								<div class="news-img"><img src="<?=SITE_TEMPLATE_PATH?>/img/n3.jpg" alt=""/></div>
								<div class="news-text">
									<div class="news-title">ВСТРЕЧАЕМ ОСЕНЬ 2014 МОДНО!</div>
									<div class="news-preview">Какие тенденции наблюдаются этой осенью?</div>
								</div>
							</a>
						</div>
					</div>
				</div>
				<div class="submit">
					<a href="#">Все новости</a>
				</div>
			</div>
		</div>
	<? else: ?>
		<div class="container">
			<h1><?$APPLICATION->ShowTitle(false)?></h1>
	<? endif ?>