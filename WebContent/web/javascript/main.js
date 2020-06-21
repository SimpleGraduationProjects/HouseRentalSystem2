/*下拉菜单  自动展开*/
$(function () {
    $(".dropdown").mouseover(function () {
        $(this).addClass("open");
    });

    $(".dropdown").mouseleave(function () {
        $(this).removeClass("open");
    })

})

//网站的JS主文件
;(function ($) {

    'use strict'
    /*判断是否移动*/
    var isMobile = {
        Android: function () {
            return navigator.userAgent.match(/Android/i);
        },
        BlackBerry: function () {
            return navigator.userAgent.match(/BlackBerry/i);
        },
        iOS: function () {
            return navigator.userAgent.match(/iPhone|iPad|iPod/i);
        },
        Opera: function () {
            return navigator.userAgent.match(/Opera Mini/i);
        },
        Windows: function () {
            return navigator.userAgent.match(/IEMobile/i);
        },
        any: function () {
            return (isMobile.Android() || isMobile.BlackBerry() || isMobile.iOS() || isMobile.Opera() || isMobile.Windows());
        }
    };

    //菜单 在不同设备上的显示
    var responsiveMenu = function () {
        var menuType = 'desktop';//默认PC机模式

        $(window).on('load resize', function () {
            var currMenuType = 'desktop';

            //屏幕小于991为移动模式
            if (matchMedia('only screen and (max-width: 991px)').matches) {
                currMenuType = 'mobile';
            }

            if (currMenuType !== menuType) {
                menuType = currMenuType;

                if (currMenuType === 'mobile') {
                    //移动端显示
                    var $mobileMenu = $('#mainnav').attr('id', 'mainnav-mobi').hide();
                    var hasChildMenu = $('#mainnav-mobi').find('li:has(ul)');

                    $('#header').after($mobileMenu);
                    $('#top-search').hide();//隐藏搜索
                    $('#top-qq').show();//显示QQ联系
                    $('.right_nav_bar').remove();//隐藏右侧悬浮联系框


                    /*手机顶部菜单 */
                    hasChildMenu.children('ul').hide();
                    hasChildMenu.children('a').after('<span class="btn-submenu"></span>');
                    $('.btn-menu').removeClass('active');
                } else {
                    //桌面显示
                    var $desktopMenu = $('#mainnav-mobi').attr('id', 'mainnav').removeAttr('style');
                    $desktopMenu.find('.submenu').removeAttr('style');
                    $('#header').find('.nav-wrap').append($desktopMenu);
                    //$('#top-qq').hide();//隐藏QQ联系
                    $('.btn-submenu').remove();
                }
            }
        });

        /* 移动端的菜单 按钮 点击后显示下拉*/
        $('.btn-menu').on('click', function () {
            $('#mainnav-mobi').slideToggle(300);
            $(this).toggleClass('active');
        });

        $(document).on('click', '#mainnav-mobi li .btn-submenu', function (e) {
            $(this).toggleClass('active').next('ul').slideToggle(300);
            e.stopImmediatePropagation()
        });
    }


    //网站头部菜单  页面滚动时总在最顶
    var headerFixed_s1 = function () {
        var nav = $('.header.bg-color');
        if (nav.size() !== 0) {

            $(window).on('load', function () {
                var header = $('.header.bg-color');
                var offsetTop = $('.header.bg-color').offset().top;
                var headerHeight = $('.header.bg-color').height();
                var buffer = $('<div>', {height: headerHeight}).insertAfter(header);
                buffer.hide();

                $(window).on('load scroll', function () {
                    if ($(window).scrollTop() > offsetTop) {
                        $('.header.bg-color').addClass('fixed-header');
                        buffer.show();
                    } else {
                        $('.header.bg-color').removeClass('fixed-header');
                        buffer.hide();
                    }
                })

            }); // headerFixed style1
        }
    };


    /*只手机上显示   点击后屏幕移到最上面*/
    var goTop = function () {
        $(window).scroll(function () {
            if ($(this).scrollTop() > 300) {
                $('.go-top').addClass('show');
            } else {
                $('.go-top').removeClass('show');
            }
        });

        $('.go-top').on('click', function () {
            $("html, body").animate(
                {
                scrollTop: 0
            },
                1000
            );
            return false;
        });
    };


    //移除页面加载动画
    var removePreloader = function () {
        $(window).load(function () {

            $('.preloader').css('opacity', 0);
            setTimeout(function () {
                    $('.preloader').hide();
                }, 1000
            );
        });

    };


    // Dom Ready
    //加载功能
    $(function () {


        goTop();//返回顶部
        headerFixed_s1();//头跟随页面滚动
        responsiveMenu();//菜单 在不同设备上的显示


        removePreloader();//页面加载完成后移除页面加载动画

    });

})(jQuery);