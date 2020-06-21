/*�����˵�  �Զ�չ��*/
$(function () {
    $(".dropdown").mouseover(function () {
        $(this).addClass("open");
    });

    $(".dropdown").mouseleave(function () {
        $(this).removeClass("open");
    })

})

//��վ��JS���ļ�
;(function ($) {

    'use strict'
    /*�ж��Ƿ��ƶ�*/
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

    //�˵� �ڲ�ͬ�豸�ϵ���ʾ
    var responsiveMenu = function () {
        var menuType = 'desktop';//Ĭ��PC��ģʽ

        $(window).on('load resize', function () {
            var currMenuType = 'desktop';

            //��ĻС��991Ϊ�ƶ�ģʽ
            if (matchMedia('only screen and (max-width: 991px)').matches) {
                currMenuType = 'mobile';
            }

            if (currMenuType !== menuType) {
                menuType = currMenuType;

                if (currMenuType === 'mobile') {
                    //�ƶ�����ʾ
                    var $mobileMenu = $('#mainnav').attr('id', 'mainnav-mobi').hide();
                    var hasChildMenu = $('#mainnav-mobi').find('li:has(ul)');

                    $('#header').after($mobileMenu);
                    $('#top-search').hide();//��������
                    $('#top-qq').show();//��ʾQQ��ϵ
                    $('.right_nav_bar').remove();//�����Ҳ�������ϵ��


                    /*�ֻ������˵� */
                    hasChildMenu.children('ul').hide();
                    hasChildMenu.children('a').after('<span class="btn-submenu"></span>');
                    $('.btn-menu').removeClass('active');
                } else {
                    //������ʾ
                    var $desktopMenu = $('#mainnav-mobi').attr('id', 'mainnav').removeAttr('style');
                    $desktopMenu.find('.submenu').removeAttr('style');
                    $('#header').find('.nav-wrap').append($desktopMenu);
                    //$('#top-qq').hide();//����QQ��ϵ
                    $('.btn-submenu').remove();
                }
            }
        });

        /* �ƶ��˵Ĳ˵� ��ť �������ʾ����*/
        $('.btn-menu').on('click', function () {
            $('#mainnav-mobi').slideToggle(300);
            $(this).toggleClass('active');
        });

        $(document).on('click', '#mainnav-mobi li .btn-submenu', function (e) {
            $(this).toggleClass('active').next('ul').slideToggle(300);
            e.stopImmediatePropagation()
        });
    }


    //��վͷ���˵�  ҳ�����ʱ�����
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


    /*ֻ�ֻ�����ʾ   �������Ļ�Ƶ�������*/
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


    //�Ƴ�ҳ����ض���
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
    //���ع���
    $(function () {


        goTop();//���ض���
        headerFixed_s1();//ͷ����ҳ�����
        responsiveMenu();//�˵� �ڲ�ͬ�豸�ϵ���ʾ


        removePreloader();//ҳ�������ɺ��Ƴ�ҳ����ض���

    });

})(jQuery);