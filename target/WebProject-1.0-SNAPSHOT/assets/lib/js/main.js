/*
1-General
2-sliders
3-Quantity control and cart
4-tabs
5-Accordian
6-Add to cart
7-Countdown Timer
8-Masonry Blog
*/

jQuery(function($) {
    "use strict";

    var qtimer;

    function qtyMsg(alertMsg, p, defaultVal) {
        p.find(".alert-msg").remove();
        p.append('<span class="alert-msg">' + alertMsg + '</span>');
        if (typeof defaultVal != "undefined") {
            p.find("input").val(defaultVal);
        }
        qtimer = setInterval(function(e) {
            if (qtimer !== null) {
                clearTimeout(qtimer);
                qtimer = null;
            }
            p.find(".alert-msg").remove();
        }, 4000);
    }
    function planetApp() {
        /*=============
        General
        =================*/


        $(".mega-child").each(function(e) {
            var $this = $(this);
            $this.parent().addClass("megamenu");
        });

        $("body").on("click", ".closePromotions", function(e) {
            e.preventDefault();
            var $this = $(this);
            $this.parent().slideUp();
        });

        $("body").on("click", ".megamenu > a", function(e) {
            e.preventDefault();
            var $this = $(this),
                p = $this.parent();
            $(".megamenu").not(p).removeClass("opened").find(".mega-child").slideUp();
            $this.parent().toggleClass("opened").find(".mega-child").slideToggle();
        });

        $('body').on("click", function(e) {
            if (!$(e.target).closest('.megamenu').length) {
                $(".megamenu").removeClass("opened").find(".mega-child").slideUp().find(".setting-switcher").removeClass("active");
            }
        });

        $("body").on("click", ".nav-triger", function(e) {
            e.preventDefault();
            $(this).toggleClass("active");
            $("ul.main_menu").stop(true, true).fadeToggle();
        });

        $("body").on("click", ".main_menu a", function(e) {
            var $this = $(this),
                sibling = $this.siblings("ul");
            if (sibling.length) {
                e.preventDefault();
                sibling.slideToggle();
            }
        });

        $('.btn-list').click(function() {
            $('.xv-product-slides').removeClass('grid-view');
            $('.xv-product-slides').addClass('list-view');
        });

        $('.btn-grid').click(function() {
            $('.xv-product-slides').removeClass('list-view');
            $('.xv-product-slides').addClass('grid-view');
        });

        $("body").on("click", ".triggerSwitch", function(e) {
            var $this = $(this);
            $this.parent().toggleClass("active");
        });

        $("body").on("click", ".widget-category li.parent > a", function(e) {
            e.preventDefault();
            e.stopImmediatePropagation();
            $(this).siblings("ul").slideToggle();
        });

        /*=======================================
	sliders
	=======================================*/

        var owl = $(".owl-carousel");
        owl.each(function() {
            var $this = $(this),
                viewDots = $this.data("dots"),
                isLoop = $this.data("loop"),
                isNav = $this.data("nav"),
                viewSlides = +$this.data("slides"),
                viewSlides_md = +$this.data("slides-md"),
                viewSlides_sm = +$this.data("slides-sm"),
                slideMargin = +$this.data("margin"),
                slidesCenter = $this.data("center"),
                slidesHash = $this.data("hash"),
                nextIcon = $this.data("next"),
                prevIcon = $this.data("prev"),
                slideDrag = $this.data("drag");

            $this.owlCarousel({
                autoHeight: false,
                loop: isLoop,
                margin: slideMargin,
                nav: isNav,
                dots: viewDots,
                center: slidesCenter,
                URLhashListener: slidesHash,
                mouseDrag: slideDrag,
                navText: ["<i class='" + prevIcon + "'></i>", "<i class='" + nextIcon + "'></i>"],
                responsive: {
                    0: {
                        items: viewSlides_sm
                    },
                    600: {
                        items: viewSlides_md
                    },
                    1000: {
                        items: viewSlides
                    }
                }
            }); /*owl end*/
        }); /*each*/

        /*=======================================
	Quantity control and cart
	=======================================*/

        $('body').on("click", ".quantity-control .btn-plus", function(e) {
            var p = $(this).parent(),
                tInput = p.find("input"),
                tValue = +tInput.val(),
                maxAllowed = +tInput.attr("data-max"),
                alertMsg = tInput.attr("data-maxalert");
            if (tValue < maxAllowed) {
                tInput.val(tValue + 1);
            } else if (!p.find(".alert-msg").length) {
                qtyMsg(alertMsg, p);
            }
        });

        $('body').on("click", ".quantity-control .btn-minus", function(e) {
            var p = $(this).parent(),
                tInput = p.find("input"),
                tValue = +tInput.val(),
                minAllowed = +tInput.attr("data-min"),
                alertMsg = tInput.attr("data-minalert");
            if (tValue > minAllowed) {
                tInput.val(tValue - 1);
            } else if (!p.find(".alert-msg").length) {
                qtyMsg(alertMsg, p);
            }
        });

        $(".quantity-control input").keyup(function() {
            var $this = $(this),
                p = $this.parent(),
                val = $this.val(),
                minAllowed = +$this.attr("data-min"),
                maxAllowed = +$this.attr("data-max"),
                msgMax = $this.attr("data-maxalert"),
                msgMin = $this.attr("data-minalert"),
                msginvalid = $this.attr("data-invalid");
            if ($.isNumeric(val)) {
                if (val > maxAllowed) {
                    qtyMsg(msgMax, p, maxAllowed);
                } else if (val < minAllowed) {
                    qtyMsg(msgMin, p, minAllowed);
                }
            } else {

                $this.val(minAllowed);
                qtyMsg(msginvalid, p);
            }
        });

        $('body').on("click", ".openCart", function(e) {
            e.preventDefault();
            e.stopImmediatePropagation();
            $(this).toggleClass("active").parent().find('.table-responsive').fadeToggle();
        });

        $('body').on("click", function(e) {
            if (!$(e.target).closest('.doc-header').length) {
                $(".cart-calculations").slideUp();
                $(".openCart").removeClass("active");
            }
        });

        $('.custome-select select').on('change', function() {
            var p = $(this).parent(".custome-select");
            p.find('span').html($(this).find('option:selected').text());
        });

        /*=======================================
	tabs
	=======================================*/

        $(".quickActions a").click(function(e) {
            e.preventDefault();
            var $this = $(this),
                $container = $(this).parents(".quickViewWrap");
            $container.addClass("active");
            $('.qv-panel').removeClass("active");
            if ($this.data("wide") === true) {
                $container.addClass("wideQView");
            } else if ($container.hasClass("wideQView")) {
                $container.removeClass("wideQView");
            }
            $('.quickActions li').removeClass('active');
            $this.parent().addClass('active');
            $($this.attr("href") + '.qv-panel').addClass("active");
        });


        $(".tabSlider a").click(function(e) {
            e.preventDefault();
            $('.tabsPanel').hide();
            $('.tabSlider a').removeClass('active');
            $(this).parent('a').addClass('active');
            $($(this).attr("href") + '.tabsPanel').show();
        });


        $(".tab-sections a").click(function(e) {
            e.preventDefault();
            $('.tab-content').hide();
            $('.tab-sections li').removeClass('active');
            $(this).parent('li').addClass('active');
            $($(this).attr("href") + '.tab-content').show();
        });


        /*=======================================
	Accordian
	=======================================*/

        $("body").on("click", ".accordian-trigger", function(e) {
            e.preventDefault();
            $(this).parents(".accordian-wrapper").toggleClass("active");
            $(this).parents(".accordian-wrapper").find(".accordian-pane").slideToggle();
        });

        /*======================================
        Countdown Timer
        =======================================*/

        $('.counter-wrapper').startTimer();

        /*=============================
        Masonry Blog
        ============================*/
        if ($('.masonry-container').length) {
            $('.masonry-container').waitForImages(function() {
                $('.masonry-container').masonry({
                    itemSelector: '.masonry-item'
                });
            });
        }

    }
    
    
    /*===========================
    Ajax
    =============================*/
    $('#pageContentArea').ajaxify({forms: false,requestDelay:200,aniParams:{opacity: 1}});
     
	$(window).on('pronto.render', function(event, eventInfo){
        $('html, body').animate({scrollTop: 0});
		planetApp();
		$('.pageLoader').fadeOut();
	});
	
    $(window).on('pronto.request', function(event, eventInfo){
        $(".quickViewWrap").removeClass("active");
        $('.table-responsive').fadeOut();
		$('.pageLoader').fadeIn();
	});
    
    planetApp();
    
/*=======================================
Add to cart
=========================================*/
    var alertTimer, isLockedAll = false;
    $(window).scroll(function() {
        if ($(window).scrollTop() > 100) {
            $(".quickViewWrap").removeClass("xv-hide").addClass("xv-show");
        } else {
            $(".quickViewWrap").removeClass("xv-show").addClass("xv-hide");
        }
    });

    $("body").on("click", ".closeQPanel", function(e) {
        e.preventDefault();
        var $this = $(this);
        $this.parents(".qv-panel").removeClass("active");
        $(".quickActions li").removeClass("active");
    });

    $('body').on("click", ".qv-remove-prod", function(e) {
        e.preventDefault();
        var p = $(this).parents("ul"),
            $this = $(this),
            $cont = p.parent(),
            cartVal = parseInt($(".cartItems-count").text());
        $this.parent().remove();
        if ($cont.attr("id") === "qvt-cart" && cartVal > 0) {
            $(".cartItems-count").text(cartVal - 1);
        }
        if (!p.children("li").length) {
            p.addClass("empty");
        }
    });

    $('body').on("click", function(e) {
        if (!$(e.target).closest('.quickViewWrap,.flytoQuickView,.qv-remove-prod').length) {
            $(".quickViewWrap").removeClass('active');
        }
    });

    $("body").on("click", ".qv-remove-prod", function(e) {
        e.preventDefault();
        $(this).parent().remove();
    });

    $('body').on('click', '.flytoQuickView', function(e) {
        e.preventDefault();

        var $this = $(this),
            $item, $container, $imgToDrag, $cart, $imgClone, $product,
            targetTab = $this.data("qv-tab"),
            currentTab = $(targetTab).find(".quickShoping-list"),
            tabAct = $(".quickActions").find("a[href=" + targetTab + "]");

        if (isLockedAll) {
            return false;
        } else {
            isLockedAll = true;
            $(".flytoQuickView").addClass("locked");
        }
        tabAct.trigger("click");

        $container = $this.closest('.products');
        $item = $this.closest($container.data('product'));

        /*not secure way to get data from data attributes, this data should be accesed from server,
        we have used js object to demo the functionality. Good way would be to only get product id from
        data attribute (or hidden field if you prefer ) and then get data from the server using ID*/

        $product = {
            id: $item.data("pid"),
            name: $item.data("name"),
            category: $item.data("category"),
            price: $item.data("price"),
            qty: 1,
            stock: true
        };

        $imgToDrag = $item.find($container.data('thumbnail'));
        $cart = $('.quickViewWrap');
        $imgClone = $imgToDrag.clone();
        $imgClone.offset({
                top: $imgToDrag.offset().top,
                left: $imgToDrag.offset().left
            })
            .css({
                'opacity': '0.5',
                'position': 'absolute',
                'width': '150px',
                'z-index': '100000'
            })
            .appendTo($('body'))
            .animate({
                'top': $cart.offset().top + 10,
                'left': $cart.offset().left + 10,
                'width': 60,
            }, 1000, 'easeInQuad', function() {
                if (targetTab === "#qvt-cart") {
                    $(".cartItems-count").text(parseInt($(".cartItems-count").text()) + 1);
                }
                if (currentTab.hasClass("empty")) {
                    currentTab.removeClass("empty");
                }
                var isAlready = currentTab.find("li a[data-pid=" + $product.id + "]");
                if (isAlready.length) {
                    var new_qty = +isAlready.data("qty") + 1;
                    isAlready.parent().remove();
                    currentTab.prepend('<li><a href="#" class="qv-remove-prod fa fa-remove" data-pid="' + $product.id + '" data-qty="' + new_qty + '"></a><a href="#"><img alt="" src="' + $imgClone.attr("src") + '"></a><span>x' + new_qty + '</span></li>');
                } else {
                    currentTab.prepend('<li><a href="#" class="qv-remove-prod fa fa-remove" data-pid="' + $product.id + '" data-qty="' + $product.qty + '"></a><a href="#"><img alt="" src="' + $imgClone.attr("src") + '"></a></li>');
                }
                $(this).detach();
                $(".qv-alert").addClass("active");
                alertTimer = setInterval(function(e) {
                    if (alertTimer !== null) {
                        clearTimeout(alertTimer);
                        alertTimer = null;
                    }
                    $(".qv-alert").removeClass("active");
                    isLockedAll = false;
                    $(".flytoQuickView").removeClass("locked");
                }, 2000);

            });

    });

    

}); /*end ready*/ /*end*/