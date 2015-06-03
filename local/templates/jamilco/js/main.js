var sync1 = $(".slider-main .slider");
var sync2 = $(".slider-main .mini-slider-l");
var sync3 = $(".slider-main .mini-slider-r");
var slWhy = $('.slider-why .sl-bottom');
var slNews = $('.news .news-wrap');
var slAbout = $('.about .about-slider');
var slSale = $('.sales .sales-slider');
var slCatalog = $('#catalog .catalog-dialog-slider');
var slCnt,SalesSlCnt,slFlag = true, myMap;
function moveSliderElements(to,speed){
    sync2.trigger(to+'.owl.carousel', [speed]);
    sync3.trigger(to+'.owl.carousel', [speed]);
}
function bindHover(els){
    $('.news-wrap .owl-item').unbind('mouseenter mouseleave');
    els.first().bind('mouseenter mouseleave',function(){
        $(this).parent().parent().parent().toggleClass('hover-l');
    });
    els.last().bind('mouseenter mouseleave',function(){
        $(this).parent().parent().parent().toggleClass('hover-r');
    });
}
$(function(){
    $('#search-form a').click(function(){
        var mw = 179;
        var inpt = $(this).siblings("input");
        var frm = $("#search-form");
        if($.trim(inpt.val()).length === 0){
            inpt.val("");
            if(!frm.hasClass('open')){
                frm.toggleClass("open");
                inpt.animate({"width": mw+"px"},'normal');
                inpt.focus();
            }else{
                inpt.animate({"width": "0px"},'normal',function(){
                    frm.toggleClass("open");
                });
            }
        }else{
            frm.submit();
        }
        return false;
    });

    var dlgtrigger = document.querySelectorAll( '[data-dialog]');
    var dlg = new Object();
    dlg.el = new Object();
    dlg.el.id = false;
    for(var i=0; i<dlgtrigger.length; i++){
        var somedialog = document.getElementById( dlgtrigger[i].getAttribute( 'data-dialog' ) );
        if(dlg.el.id != somedialog.id)
            dlg = new DialogFx( somedialog );
        dlgtrigger[i].addEventListener( 'click', dlg.toggle.bind(dlg) );
    }

    sync1.owlCarousel({
        items:1,
        loop:true,
        nav:true,
        dots: false,
        mouseDrag:false,
        animateOut: 'fadeOut',
        navSpeed: 10000,
        startPosition: 3,
        navContainer: '.sl-nav',
        navText: ['',''],
        autoplay: true
    });
    sync1.on('translate.owl.carousel', function(event) {
        if(slFlag) {
            sync2.trigger('next.owl.carousel', [1000]);
            sync3.trigger('next.owl.carousel', [1000]);
            var num = parseInt($('#sl-cur').html()) + 1;
            if (num > slCnt)
                num = 1;
            $('#sl-cur').html(num);
        }else{
            slFlag = !slFlag;
        }
    });
    sync2.owlCarousel({
        smartSpeed: 1000,
        mouseDrag:false,
        items:3,
        loop:true
    });
    sync3.owlCarousel({
        smartSpeed: 1000,
        mouseDrag:false,
        items:3,
        loop:true,
        startPosition: 4
    });
    slCnt = $('.slider .owl-item:not(".cloned")').size();
    $('.slider-main .slider-bottom .owl-prev').click(function(){
        sync2.trigger('prev.owl.carousel', [1000]);
        sync3.trigger('prev.owl.carousel', [1000]);
        var num = $('#sl-cur').html();
        num = parseInt(num) - 1;
        if(num == 0)
            num = slCnt;
        $('#sl-cur').html(num);
        slFlag = !slFlag;

    });
    $('.slider-main .slider-bottom .owl-next').click(function(){
        sync2.trigger('next.owl.carousel', [1000]);
        sync3.trigger('next.owl.carousel', [1000]);
        var num = $('#sl-cur').html();
        num = parseInt(num) + 1;
        if(num > slCnt)
            num = 1;
        $('#sl-cur').html(num);
        slFlag = !slFlag;
    });
    $('.sl-mini-btn').click(function(){
        var numTo = $(this).data('num');
        var cur = parseInt($('#sl-cur').html())-1;
        var diff,speed;
        if(cur > numTo){
            diff = cur - numTo;
            speed = 1000 / diff;
            for(var i = 0;i < diff;i++){
                setTimeout('moveSliderElements("prev",'+speed+')', speed*i);
            }
        }else{
            diff = numTo - cur;
            speed = 1000 / diff;
            for(var i = 0;i < diff;i++){
                setTimeout('moveSliderElements("next",'+speed+')', speed*i);
            }
        }
        sync1.trigger('to.owl.carousel',[numTo,1000,true]);
        $('#sl-cur').html(parseInt(numTo)+1);
        slFlag = !slFlag;
        return false;
    });

    $('<div class="sl-num"><span id="sl-cur">4</span> / <span class="sl-all">'+slCnt+'</span></div>').appendTo('.sl-nav');

    slWhy.owlCarousel({
        mouseDrag: false,
        items: 1,
        loop: true,
        nav: true,
        animateOut: 'fadeOut',
        navText: ['','']
    });
    $('.slider-why .sl-top a').click(function(){
        var num = $(this).data('slw-num');
        $('.slider-why .sl-top a').removeClass('active');
        $(this).addClass('active');
        slWhy.trigger('to.owl.carousel', [num,1000,true]);
        $('#slw-cur').html(parseInt(num)+1)
        return false;
    });
    $('.slider-why .sl-bottom .owl-next').click(function(){
        var active = $('.slider-why .sl-top a.active');
        if(active.size() != 0)
            var num = active.data('slw-num');
        else
            var num = $('.slider-why .sl-top a').first().data('slw-num');
        $('.slider-why .sl-top a').removeClass('active');
        num+=1;
        var nextActive = $('.slider-why .sl-top a[data-slw-num="'+num+'"]');
        if(nextActive.size() != 0)
            nextActive.addClass('active');
        else {
            $('.slider-why .sl-top a').first().addClass('active');
            num = 0;
        }
        $('#slw-cur').html(parseInt(num)+1);
    });
    $('.slider-why .sl-bottom .owl-prev').click(function(){
        var active = $('.slider-why .sl-top a.active');
        if(active.size() != 0)
            var num = active.data('slw-num');
        else
            var num = $('.slider-why .sl-top a').first().data('slw-num');
        $('.slider-why .sl-top a').removeClass('active');
        num-=1;
        var nextActive = $('.slider-why .sl-top a[data-slw-num="'+num+'"]');
        if(nextActive.size() != 0)
            nextActive.addClass('active');
        else {
            $('.slider-why .sl-top a').last().addClass('active');
            num = 3;
        }
        $('#slw-cur').html(parseInt(num)+1);
    });
    slNews.owlCarousel({
        items: 3,
        loop: true,
        nav: true,
        navText: ['',''],
        margin: 20
    });
    slNews.on('translated.owl.carousel', function(event) {
        var els = $('.news-wrap .owl-item.active');
        bindHover(els);
    });

    $('.news-wrap .owl-item.active:first').bind('mouseenter mouseleave',function(){
        $(this).parent().parent().parent().toggleClass('hover-l');
    });
    $('.news-wrap .owl-item.active:last').bind('mouseenter mouseleave',function(){
        $(this).parent().parent().parent().toggleClass('hover-r');
    });

    $('.brands-mode a').click(function(){
        if(!$(this).is('.active')) {
            //var mode = $(this).data('mode');
            //$('#brand-' + mode).toggleClass('show').siblings('div').toggleClass('show');
            $(this).toggleClass('active').siblings('a').toggleClass('active');
        }
    });
    $('.cooperation-mode a').click(function(){
        if(!$(this).is('.active')) {
            //var mode = $(this).data('mode');
            //$('#cooperation-' + mode).toggle().siblings('div').toggle();
            $(this).toggleClass('active').siblings('a').toggleClass('active');
        }
        //return false;
    });
    $('.contacts .info-title a').click(function(){
        var parent = $(this).parent().parent();
        parent.toggleClass('active');
        if(parent.is('.active')){
            $(this).find('span.word').text('свернуть');
        }else{
            $(this).find('span.word').text('показать');
        }
        return false;
    });
    slAbout.owlCarousel({
        mouseDrag: false,
        items:1,
        loop:true,
        nav:true,
        dots: true,
        animateOut: 'fadeOut',
        smartSpeed: 1000,
        navText: ['',''],
        dotsContainer: $('.about .dots')
    });
    slSale.owlCarousel({
        mouseDrag: false,
        items:1,
        loop:true,
        nav:true,
        animateOut: 'fadeOut',
        smartSpeed: 1000,
        navText: ['',''],
        navContainer: '.s-sl-nav'
    });

    SalesSlCnt = $('.sales-slider .owl-item:not(".cloned")').size();
    $('<div class="sl-num"><span id="sl-cur">1</span> / <span class="sl-all">'+SalesSlCnt+'</span></div>').appendTo('.s-sl-nav');
    slSale.on('changed.owl.carousel', function(event) {
        var num = parseInt(event.page.index)+1;
        $('#sl-cur').html(num);
    });
    $('.buyers-item>a').click(function(){
        $(this).toggleClass('active');
        $(this).siblings('div.buyers-text').slideToggle();
        return false;
    });

    if (typeof Selectik == 'function') {
        $('select').selectik({
            width: 166,
            maxItems: 6,
            customScroll: 1,
            speedAnimation: 100,
            smartPosition: false,
            minScrollHeight: 40
        });
    }

    slCatalog.owlCarousel({
        mouseDrag: false,
        items:1,
        loop:true,
        nav:true,
        animateOut: 'fadeOut',
        smartSpeed: 1000,
        navText: ['','']
    });

    $('textarea.textarea').cuText({
        resizable: true,
        showArrows: true
    });

    /***yandex maps**/
    if($('#yaMap').size() > 0)
        ymaps.ready(init);
    function init() {
        myMap = new ymaps.Map('yaMap', {
            "center": [55.900000, 37.630885],
            "zoom": 10,
            controls: [],
            behaviors: ["drag","dblClickZoom"]
        });
        var objects = [                                      //создаем массив с метками
            new ymaps.Placemark([55.900000, 37.7047], {
                //balloonContentHeader: "<div class='baloon-header dark'><p>ТЦ «Золотой Вавилон»</p><span>Москва, м. Проспект Мира,  пр-т Мира, д.211, к.2 <br/> 10:00-20:00</span></div>",
                //balloonContentBody: "<div class='baloon-content'><div class='bc-item clearfix'><div class='bci-img pull-left'><a href='#'><img src='./img/maps_brand1.jpg'/></a></div><div class='bci-text pull-right'><p>Магазин «ALDO»</p><p> Тел.: +7 495 665-14-37</p> <p> пр-т Мира, д.211, к.2</p></div></div><div class='bc-item clearfix'><div class='bci-img pull-left'><a href='#'><img src='./img/maps_brand2.jpg'/></a></div><div class='bci-text pull-right'><p>Магазин «Снежная королева»</p><p>Тел.: +7 495 740-27-36</p> <p> пр-т Мира, д.211, к.2</p></div></div><div class='bc-item clearfix'><div class='bci-img pull-left'><a href='#'><img src='./img/maps_brand3.jpg'/></a></div><div class='bci-text pull-right'><p>Магазин «Timberland»</p><p> Тел.: +7 495 270-57-23</p> <p> пр-т Мира, д.211, к.2</p></div></div></div>",
                name: 'myPlacemark1',
                iconContent: "<div class='baloon-num'>1</div>"
            }, {
                iconImageHref: './img/baloon-black.png',
                iconImageSize: [32, 47],
                iconImageOffset: [-16, -23],
                hideIconOnBalloonOpen: true
            }),
            new ymaps.Placemark([55.900000, 37.1715], {
                //balloonContentHeader: "<div class='baloon-header'><p>ТЦ «Золотой Вавилон2»</p><span>Москва, м. Проспект Мира,  пр-т Мира, д.211, к.2 <br/> 10:00-20:00</span></div>",
                //balloonContentBody: "<div class='baloon-content'><div class='bc-item clearfix'><div class='bci-img pull-left'><a href='#'><img src='./img/maps_brand1.jpg'/></a></div><div class='bci-text pull-right'><p>Магазин «ALDO»</p><p> Тел.: +7 495 665-14-37</p> <p> пр-т Мира, д.211, к.2</p></div></div><div class='bc-item clearfix'><div class='bci-img pull-left'><a href='#'><img src='./img/maps_brand2.jpg'/></a></div><div class='bci-text pull-right'><p>Магазин «Снежная королева»</p><p>Тел.: +7 495 740-27-36</p> <p> пр-т Мира, д.211, к.2</p></div></div><div class='bc-item clearfix'><div class='bci-img pull-left'><a href='#'><img src='./img/maps_brand3.jpg'/></a></div><div class='bci-text pull-right'><p>Магазин «Timberland»</p><p> Тел.: +7 495 270-57-23</p> <p> пр-т Мира, д.211, к.2</p></div></div></div>",
                name: 'myPlacemark2',
                iconContent: "<div class='baloon-num'>2</div>"
            }, {
                iconImageHref: './img/baloon-red.png',
                iconImageSize: [32, 47],
                iconImageOffset: [-16, -23],
                hideIconOnBalloonOpen: true
            })
        ];
        ymaps.geoQuery(objects).addToMap(myMap);  //добавляем метки на карту
        myMap.geoObjects.events.add('click', function (e) {
            // Получение ссылки на дочерний объект, на котором произошло событие.
            var pm =  e.originalEvent.target.properties._vv._Rj._K;
            var mapPopup = document.getElementById( pm.name );
            if(dlg.el.id != mapPopup.id)
                dlg = new DialogFx( mapPopup );
            dlg.toggle(dlg);
        });

        $('a.show-baloon').bind({
            click: function(){
                $('html, body').animate({
                    scrollTop: $("#yaMap").offset().top - 100
                }, 500);
                var metkaName = $(this).attr('rel');  //сохраняем подпись у ссылки
                var result = ymaps.geoQuery(myMap.geoObjects);   //собираем все объекты на карте
                var metka = result.search('properties.name == "' + metkaName + '"').get(0);  //выполняем поиск по объектам по подписи ссылки
                var coord = metka.geometry.getCoordinates();  //получаем координаты найденной метки
                //coord[0] += 0.2;
                $('.maps .maps-list').removeClass('active');
                $('.links-type a').toggleClass('active');
                myMap.setCenter(coord, 10, {   //смещаем участок с меткой в центр блока, увеличиваем zoom
                    duration: 100,
                    callback: function(){
                        //metka.balloon.open()   //после выполнения перемещения показываем подпись
                        var pm = metka.balloon._bh.properties._vv._Rj._K;
                        var mapPopup = document.getElementById( pm.name );
                        if(dlg.el.id != mapPopup.id)
                            dlg = new DialogFx( mapPopup );
                        dlg.toggle(dlg);
                    }
                });
                return false;
            }
        });
    }
    $('.links-type a').click(function(){
        $(this).parent().find('a').toggleClass('active');
        $('.maps .maps-list').toggleClass('active');
        return false;
    });
    $('.lookbook .l-item>img').fadeIn(2000);
});
