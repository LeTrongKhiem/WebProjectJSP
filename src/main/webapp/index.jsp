<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang chủ</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">

    <link rel="stylesheet" href="<c:url value='assets/font/fontawesome-free-5.15.3-web/css/all.min.css'/>">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="icon" href="<c:url value= './assets/img/logo3.png'/>">

    <link rel="stylesheet" href="<c:url value= './assets/css/base.css'/>">
    <link rel="stylesheet" href="<c:url value= './assets/css/grid.css'/>">
    <link rel="stylesheet" href="<c:url value= './assets/css/main.css'/>">
    <link rel="stylesheet" href="<c:url value= './assets/css/responsive.css'/>">
</head>

<body>
<%
    if (application.getAttribute("userLogged") == null) {
        List<String> ds = new ArrayList<>();
        application.setAttribute("userLogged", ds);
    }
%>
<div class="main">

    <%--  header  --%>
    <%@include file="/header.jsp" %>
    <%--  header  --%>
    <div class="container">
        <div class="grid wide">
            <!-- PhoneProduct Phone -->
            <div class="row container__item">
                <div class="col l-8 m-12 c-12">
                    <div class="banner">
                        <div class="row">
                            <div class="phone-banner__wrap">
                                <i class="fas fa-arrow-left phone-banner__btn-prev"></i>
                                <i class="fas fa-arrow-right phone-banner__btn-next"></i>
                                <div class="phone-banner__list">
                                    <!-- Thêm danh sách Banner -->
                                </div>
                                <div class="phone-banner-pagination">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col l-4 m-0 c-0">
                    <iframe src="https://www.youtube.com/embed/m8jp_VQQsJM" title="YouTube video player"
                            frameborder="0"
                            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                            allowfullscreen class="video1"></iframe>
                    <iframe src="https://www.youtube.com/embed/BqO4oBIRsNg" title="YouTube video player"
                            frameborder="0"
                            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                            allowfullscreen class="video2"></iframe>
                </div>

                <div class="col l-12 m-12 c-12">
                    <div class="container-nav">
                        <h2 class="container-nav__heading">Hãng:</h2>
                        <ul class="container-nav__list">
                            <li class="container-nav__item">
                                <a href="#" class="container-nav__item-link">Apple</a>
                            </li>
                            <li class="container-nav__item">
                                <a href="#" class="container-nav__item-link">Samsung</a>
                            </li>
                            <li class="container-nav__item">
                                <a href="#" class="container-nav__item-link">OnePlus</a>
                            </li>
                            <li class="container-nav__item">
                                <a href="#" class="container-nav__item-link">Xiaomi</a>
                            </li>
                            <li class="container-nav__item">
                                <a href="#" class="container-nav__item-link">Oppo</a>
                            </li>
                            <li class="container-nav__item">
                                <a href="#" class="container-nav__item-link">Vivo</a>
                            </li>
                            <li class="container-nav__item">
                                <a href="#" class="container-nav__item-link">ZTE</a>
                            </li>
                            <li class="container-nav__item">
                                <a href="#" class="container-nav__item-link">Asus</a>
                            </li>
                            <li class="container-nav__item">
                                <a href="#" class="container-nav__item-link">Nokia</a>
                            </li>
                            <li class="container-nav__item">
                                <a href="#" class="container-nav__item-link">LG</a>
                            </li>
                            <li class="container-nav__item">
                                <a href="#" class="container-nav__item-link">Google</a>
                            </li>
                            <li class="container-nav__item">
                                <a href="#" class="container-nav__item-link">Vsmart</a>
                            </li>
                            <li class="container-nav__item">
                                <a href="#" class="container-nav__item-link">Meizu</a>
                            </li>
                            <li class="container-nav__item">
                                <a href="#" class="container-nav__item-link">Sony</a>
                            </li>
                            <li class="container-nav__item">
                                <a href="#" class="container-nav__item-link">BlackBerry</a>
                            </li>
                            <li class="container-nav__item">
                                <a href="#" class="container-nav__item-link">Lenovo</a>
                            </li>
                            <li class="container-nav__item">
                                <a href="#" class="container-nav__item-link">Bkav</a>
                            </li>
                            <li class="container-nav__item">
                                <a href="#" class="container-nav__item-link">Huawei</a>
                            </li>
                            <li class="container-nav__item">
                                <a href="#" class="container-nav__item-link">Smartisan</a>
                            </li>
                            <li class="container-nav__item">
                                <a href="#" class="container-nav__item-link">Meiigo</a>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="col l-12 m-12 c-12">
                    <div class="container-filter">
                        <div class="container-filter__item">
                            Giá từ cao đến thấp
                            <i class="container-filter__icon-down fas fa-chevron-down"></i>
                            <ul class="container-filter__list">
                                <li class="container-filter__list-item">
                                    Giá từ cao đến thấp
                                </li>
                                <li class="container-filter__list-item">
                                    Giá từ thấp đến cao
                                </li>
                            </ul>
                        </div>

                        <div class="container-filter__item">
                            Bán chạy
                            <i class="container-filter__icon-down fas fa-chevron-down"></i>
                            <ul class="container-filter__list">
                                <li class="container-filter__list-item">
                                    Bán chạy
                                </li>
                                <li class="container-filter__list-item">
                                    Phổ biến
                                </li>
                                <li class="container-filter__list-item">
                                    Khuyến mãi
                                </li>
                                <li class="container-filter__list-item">
                                    Hàng mới về
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="col l-12 m-12 c-12">
                    <div class="container-product">
                        <div class="row no-gutters phone-products">
                            <!-- Thêm từng điện thoại vào -->
                        </div>
                    </div>
                </div>

                <div class="col l-12 m-12 c-12">
                    <div class="container-view-more">
                        <a href="#" class="container-btn-extend">Xem thêm điện thoại</a>
                    </div>
                </div>
            </div>

            <!-- PhoneProduct Tool -->
            <div class="row container__item">
                <div class="col l-12 m-12 c-12">
                    <div class="banner">
                        <div class="row">
                            <div class="col l-6 m-6 c-0">
                                <a href="#" class="banner__link">
                                    <img src="https://cdn.mobilecity.vn/mobilecity-vn/images/2020/08/airpod-2-2.jpg"
                                         alt="Banner 1" class="banner__img">
                                </a>
                            </div>
                            <div class="col l-6 m-6 c-0">
                                <a href="#" class="banner__link">
                                    <img src="https://cdn.mobilecity.vn/mobilecity-vn/images/2019/11/untitled-1.jpg"
                                         alt="Banner 2" class="banner__img">
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col l-12 m-12 c-12">
                    <div class="container-nav">
                        <h2 class="container-nav__heading">Phụ kiện:</h2>
                        <ul class="container-nav__list">
                            <li class="container-nav__item">
                                <a href="#" class="container-nav__item-link">Loa - Tai nghe</a>
                            </li>
                            <li class="container-nav__item">
                                <a href="#" class="container-nav__item-link">Đồng hồ thông minh</a>
                            </li>
                            <li class="container-nav__item">
                                <a href="#" class="container-nav__item-link">Pin, Sạc dự phòng</a>
                            </li>
                            <li class="container-nav__item">
                                <a href="#" class="container-nav__item-link">Đồ chơi công nghệ</a>
                            </li>
                            <li class="container-nav__item">
                                <a href="#" class="container-nav__item-link">Phụ kiện điện thoại</a>
                            </li>
                            <li class="container-nav__item">
                                <a href="#" class="container-nav__item-link">Máy lọc không khí</a>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="col l-12 m-12 c-12">
                    <div class="container-filter">
                        <div class="container-filter__item">
                            Giá từ cao đến thấp
                            <i class="container-filter__icon-down fas fa-chevron-down"></i>
                            <ul class="container-filter__list">
                                <li class="container-filter__list-item">
                                    Giá từ cao đến thấp
                                </li>
                                <li class="container-filter__list-item">
                                    Giá từ thấp đến cao
                                </li>
                            </ul>
                        </div>

                        <div class="container-filter__item">
                            Bán chạy
                            <i class="container-filter__icon-down fas fa-chevron-down"></i>
                            <ul class="container-filter__list">
                                <li class="container-filter__list-item">
                                    Bán chạy
                                </li>
                                <li class="container-filter__list-item">
                                    Phổ biến
                                </li>
                                <li class="container-filter__list-item">
                                    Khuyến mãi
                                </li>
                                <li class="container-filter__list-item">
                                    Hàng mới về
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="col l-12 m-12 c-12">
                    <div class="container-product">
                        <div class="row no-gutters tool-products">
                            <!-- Thêm phụ kiện -->
                        </div>
                    </div>
                </div>

                <div class="col l-12 m-12 c-12">
                    <div class="container-view-more">
                        <a href="#" class="container-btn-extend">Xem thêm phụ kiện</a>
                    </div>
                </div>
            </div>

            <!-- PhoneProduct Fix -->
            <div class="row container__item">
                <div class="col l-12 m-12 c-12">
                    <div class="banner">
                        <div class="row">
                            <div class="col l-6 m-6 c-0">
                                <a href="#" class="banner__link">
                                    <img src="https://cdn.mobilecity.vn/mobilecity-vn/images/2020/08/airpods-pro-rep.jpg"
                                         alt="Banner 1" class="banner__img">
                                </a>
                            </div>
                            <div class="col l-6 m-6 c-0">
                                <a href="#" class="banner__link">
                                    <img src="https://cdn.mobilecity.vn/mobilecity-vn/images/2020/08/airpod-2-3.jpg"
                                         alt="Banner 2" class="banner__img">
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col l-12 m-12 c-12">
                    <div class="container-nav">
                        <h2 class="container-nav__heading">Dịch vụ sửa chữa:</h2>
                        <ul class="container-nav__list">
                            <li class="container-nav__item">
                                <a href="#" class="container-nav__item-link">iPhone</a>
                            </li>
                            <li class="container-nav__item">
                                <a href="#" class="container-nav__item-link">Samsung</a>
                            </li>
                            <li class="container-nav__item">
                                <a href="#" class="container-nav__item-link">Oppo</a>
                            </li>
                            <li class="container-nav__item">
                                <a href="#" class="container-nav__item-link">Xiaomi</a>
                            </li>
                            <li class="container-nav__item">
                                <a href="#" class="container-nav__item-link">Realme</a>
                            </li>
                            <li class="container-nav__item">
                                <a href="#" class="container-nav__item-link">Honor</a>
                            </li>
                            <li class="container-nav__item">
                                <a href="#" class="container-nav__item-link">iPad</a>
                            </li>
                            <li class="container-nav__item">
                                <a href="#" class="container-nav__item-link">Sony</a>
                            </li>
                            <li class="container-nav__item">
                                <a href="#" class="container-nav__item-link">HTC</a>
                            </li>
                            <li class="container-nav__item">
                                <a href="#" class="container-nav__item-link">LG</a>
                            </li>
                            <li class="container-nav__item">
                                <a href="#" class="container-nav__item-link">Asus</a>
                            </li>
                            <li class="container-nav__item">
                                <a href="#" class="container-nav__item-link">BlackBerry</a>
                            </li>
                            <li class="container-nav__item">
                                <a href="#" class="container-nav__item-link">Vivo</a>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="col l-12 m-12 c-12">
                    <div class="container-filter">
                        <div class="container-filter__item">
                            Giá từ cao đến thấp
                            <i class="container-filter__icon-down fas fa-chevron-down"></i>
                            <ul class="container-filter__list">
                                <li class="container-filter__list-item">
                                    Giá từ cao đến thấp
                                </li>
                                <li class="container-filter__list-item">
                                    Giá từ thấp đến cao
                                </li>
                            </ul>
                        </div>

                        <div class="container-filter__item">
                            Bán chạy
                            <i class="container-filter__icon-down fas fa-chevron-down"></i>
                            <ul class="container-filter__list">
                                <li class="container-filter__list-item">
                                    Bán chạy
                                </li>
                                <li class="container-filter__list-item">
                                    Phổ biến
                                </li>
                                <li class="container-filter__list-item">
                                    Khuyến mãi
                                </li>
                                <li class="container-filter__list-item">
                                    Hàng mới về
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="col l-12 m-12 c-12">
                    <div class="container-product">
                        <div class="row no-gutters fix-products">
                            <!-- Thêm sản phẩm -->
                        </div>
                    </div>
                </div>

                <div class="col l-12 m-12 c-12">
                    <div class="container-view-more">
                        <a href="#" class="container-btn-extend">Xem thêm dịch vụ sửa chữa</a>
                    </div>
                </div>
            </div>

            <!-- PhoneProduct Unlock -->
            <div class="row container__item">
                <div class="col l-12 m-12 c-12">
                    <div class="banner">
                        <div class="row">
                            <div class="col l-6 m-6 c-0">
                                <a href="#" class="banner__link">
                                    <img src="https://cdn.mobilecity.vn/mobilecity-vn/images/2020/08/airpod-2-2-1.jpg"
                                         alt="Banner 1" class="banner__img">
                                </a>
                            </div>
                            <div class="col l-6 m-6 c-0">
                                <a href="#" class="banner__link">
                                    <img src="https://cdn.mobilecity.vn/mobilecity-vn/images/2020/02/untitled-1.jpg"
                                         alt="Banner 1" class="banner__img">
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col l-12 m-12 c-12">
                    <div class="container-nav">
                        <h2 class="container-nav__heading">Hãng:</h2>
                        <ul class="container-nav__list">
                            <li class="container-nav__item">
                                <a href="#" class="container-nav__item-link">Apple</a>
                            </li>
                            <li class="container-nav__item">
                                <a href="#" class="container-nav__item-link">Samsung</a>
                            </li>
                            <li class="container-nav__item">
                                <a href="#" class="container-nav__item-link">OnePlus</a>
                            </li>
                            <li class="container-nav__item">
                                <a href="#" class="container-nav__item-link">Xiaomi</a>
                            </li>
                            <li class="container-nav__item">
                                <a href="#" class="container-nav__item-link">Oppo</a>
                            </li>
                            <li class="container-nav__item">
                                <a href="#" class="container-nav__item-link">Vivo</a>
                            </li>
                            <li class="container-nav__item">
                                <a href="#" class="container-nav__item-link">ZTE</a>
                            </li>
                            <li class="container-nav__item">
                                <a href="#" class="container-nav__item-link">Asus</a>
                            </li>
                            <li class="container-nav__item">
                                <a href="#" class="container-nav__item-link">Nokia</a>
                            </li>
                            <li class="container-nav__item">
                                <a href="#" class="container-nav__item-link">LG</a>
                            </li>
                            <li class="container-nav__item">
                                <a href="#" class="container-nav__item-link">Google</a>
                            </li>
                            <li class="container-nav__item">
                                <a href="#" class="container-nav__item-link">Vsmart</a>
                            </li>
                            <li class="container-nav__item">
                                <a href="#" class="container-nav__item-link">Meizu</a>
                            </li>
                            <li class="container-nav__item">
                                <a href="#" class="container-nav__item-link">Sony</a>
                            </li>
                            <li class="container-nav__item">
                                <a href="#" class="container-nav__item-link">BlackBerry</a>
                            </li>
                            <li class="container-nav__item">
                                <a href="#" class="container-nav__item-link">Lenovo</a>
                            </li>
                            <li class="container-nav__item">
                                <a href="#" class="container-nav__item-link">Bkav</a>
                            </li>
                            <li class="container-nav__item">
                                <a href="#" class="container-nav__item-link">Huawei</a>
                            </li>
                            <li class="container-nav__item">
                                <a href="#" class="container-nav__item-link">Smartisan</a>
                            </li>
                            <li class="container-nav__item">
                                <a href="#" class="container-nav__item-link">Meiigo</a>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="col l-12 m-12 c-12">
                    <div class="container-filter">
                        <div class="container-filter__item">
                            Giá từ cao đến thấp
                            <i class="container-filter__icon-down fas fa-chevron-down"></i>
                            <ul class="container-filter__list">
                                <li class="container-filter__list-item">
                                    Giá từ cao đến thấp
                                </li>
                                <li class="container-filter__list-item">
                                    Giá từ thấp đến cao
                                </li>
                            </ul>
                        </div>

                        <div class="container-filter__item">
                            Bán chạy
                            <i class="container-filter__icon-down fas fa-chevron-down"></i>
                            <ul class="container-filter__list">
                                <li class="container-filter__list-item">
                                    Bán chạy
                                </li>
                                <li class="container-filter__list-item">
                                    Phổ biến
                                </li>
                                <li class="container-filter__list-item">
                                    Khuyến mãi
                                </li>
                                <li class="container-filter__list-item">
                                    Hàng mới về
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="col l-12 m-12 c-12">
                    <div class="container-product">
                        <div class="row no-gutters unlock-products">
                            <!-- Thêm sản phẩm -->
                        </div>
                    </div>
                </div>

                <div class="col l-12 m-12 c-12">
                    <div class="container-view-more">
                        <a href="#" class="container-btn-extend">Xem thêm Unlock, mở mạng</a>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <%--    footer --%>
    <%@include file="/footer.jsp" %>
    <%--    footer --%>


    <!-- Button -->
    <a href="#" class="go-to-top">
        <i class="go-to-top__icon fas fa-chevron-circle-up"></i>
    </a>

    <a href="#" class="go-to-chat">
        <i class="go-to-chat__icon fab fa-facebook-messenger"></i>
    </a>
</div>

<script src="<c:url value='./js/phone.js'/>"></script>
<script src="<c:url value='./js/tool.js'/>"></script>
<script src="<c:url value='./js/fix.js'/>"></script>
<script src="<c:url value='./js/unlock.js'/>"></script>
<script>
    const $ = document.querySelector.bind(document);
    const $$ = document.querySelectorAll.bind(document);

    const event = (() => {

        return {
            handleEvent() {
                // Search in mobile
                const mobileSearchBtn = $('.header-mobile-search');

                mobileSearchBtn.onclick = () => {
                    $('.header-mobile-search-box__wrap').classList.toggle('active');
                };

                // Menu nav in mobile
                const mobileMenuBtn = $('.header-mobile-menu');
                const overlayMobileScreen = $('.header-mobile-nav__overlay');
                const mobileNav = $('.header-mobile-nav');
                const mobileCloseNavBtn = $('.header-mobile-nav__close');

                function handleMobileNav() {
                    overlayMobileScreen.classList.toggle('active');
                    mobileNav.classList.toggle('active');
                }

                mobileMenuBtn.onclick = () => {
                    handleMobileNav();
                };

                overlayMobileScreen.onclick = () => {
                    handleMobileNav();
                };

                mobileCloseNavBtn.onclick = () => {
                    handleMobileNav()
                };

                // Menu subnav in mobile
                const mobileSubNavs = $$('.header-mobile-nav__item-select');

                Array.from(mobileSubNavs).forEach((mobileSubNav) => {
                    mobileSubNav.onclick = () => {
                        mobileSubNav.classList.toggle('active');
                        mobileSubNav.firstElementChild.classList.toggle('active');
                        if (mobileSubNav.nextElementSibling) {
                            mobileSubNav.nextElementSibling.classList.toggle('active');
                        }
                    };
                });

                // Scroll Screen
                const goToTopBtn = $('.go-to-top');
                document.onscroll = () => {
                    const scrollTop = window.scrollY || document.documentElement.scrollTop;
                    if (scrollTop > 120) {
                        goToTopBtn.classList.add('active');
                    } else {
                        goToTopBtn.classList.remove('active');
                    }
                };
            },
            init() {
                this.handleEvent();
            }
        }

    })();

    event.init();
</script>
</body>

</html>