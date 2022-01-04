<%@ page import="java.text.DecimalFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"
           uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
%>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>iPhone XS Max Cũ (64GB, 256GB) - Fullbox</title>
</head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">

<link rel="stylesheet" href="./assets/font/fontawesome-free-5.15.3-web/css/all.min.css">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
<link rel="icon" href="./assets/img/logo3.png">

<link rel="stylesheet" href="./assets/css/base.css">
<link rel="stylesheet" href="./assets/css/grid.css">
<link rel="stylesheet" href="./assets/css/main.css">
<link rel="stylesheet" href="./assets/css/responsive.css">
<link rel="stylesheet" href="./assets/css/trangitem.css">
<link rel="stylesheet" href="assets/trangitem/libs/normalize.css">
<link rel="stylesheet" href="assets/trangitem/style.css">
<script type="text/javascript" src="assets/trangitem/js/jquery.min.js"></script>

<link rel="stylesheet" href="assets/trangitem/libs/owl.carousel.min.css">
<link rel="stylesheet" href="assets/trangitem/libs/lightgallery.min.css">
<link rel="stylesheet" href="assets/trangitem/libs/lightslider.css">

<link rel="stylesheet" href="assets/trangitem/pages/phone.css">
<link rel="stylesheet" href="assets/trangitem/pages/popup_v2.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/lightgallery@1.8.3/dist/css/lightgallery.min.css">
<!--Đường Dẫn CDN Javascript-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/lightgallery@1.8.3/dist/js/lightgallery-all.min.js"></script>

<body>

<!-- <link rel="stylesheet" href="./public/assets/css/responsive.css">
    <link rel="stylesheet" href="./public/assets/css/responsive-v2.css"> -->


<div class="main">
    <div class="header">
        <div class="header-nav">
            <div class="grid wide no-margin">
                <div class="row">
                    <div class="col l-4 m-12 c-12">
                        <div class="header-nav__item">
                            <span>Bạn đang xem giá, tồn kho tại: </span>
                            <span class="header-nav__location">
                                    Hồ Chí Minh
                                    <i class="header-nav__icon-down fas fa-chevron-down"></i>
                                    <ul class="header-nav__areas-list">
                                        <li class="header-nav__area-name">Hồ Chí Minh</li>
                                        <li class="header-nav__area-name">Hà Nội</li>
                                        <li class="header-nav__area-name">Bình Dương</li>
                                    </ul>
                                </span>
                        </div>
                    </div>
                    <div class="col l-4 m-0 c-0">
                        <div class="header-nav__item">
                            <p class="header-nav__info">
                                Hotline:
                                <span class="header-nav__info-address">
                                        HN: 0372253243 - SG: 0372253243 - ĐN: 0372253243 - CSKH Online 0372253243
                                    </span>
                            </p>
                        </div>
                    </div>
                    <div class="col l-4 m-0 c-0">
                        <div class="header-nav__item">
                            <ul class="header-nav__logs-list">
                                <li class="header-nav__log-item">
                                    <a href="./trangbaohanh.html" class="header-nav__log-link">Tra cứu bảo hành</a>
                                </li>
                                <li class="header-nav__log-item">
                                    <a href="#" class="header-nav__log-link">Đăng nhập</a>
                                </li>
                                <li class="header-nav__log-item">
                                    <a href="#" class="header-nav__log-link">Đăng ký</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="header-with-search">
            <div class="grid wide">
                <div class="header-with-search__wrap">
                    <!-- Mobile menu button -->
                    <div class="header-mobile-menu display-on-mobile-and-tablet">
                        <i class="header-mobile-menu__icon fas fa-bars"></i>
                    </div>

                    <a href="#" class="header-logo__link">
                        <!-- <div class="header-logo__img">TG Mobile</div> -->
                        <div class="header-mobile-nav__logo1"
                             style="background-image: url('./assets/img/logo3.png');">
                        </div>
                    </a>

                    <div class="header-search hide-on-mobile-and-tablet">
                        <input type="text" placeholder="Nhập tên sản phẩm..." class="header-search__input">
                        <i class="header-search__icon fas fa-search"></i>
                    </div>

                    <ul class="header-menu hide-on-mobile-and-tablet">

                        <!-- Menu Mobile -->
                        <li class="header-menu__item">
                            <a href="mobile.html" class="header-menu__item-link">
                                <i class="header-menu__item-icon fas fa-mobile-alt"></i>
                                <p class="header-menu__item-name">Điện thoại</p>
                            </a>

                            <div class="header-sub-menu">
                                <div class="grid">
                                    <div class="row">
                                        <div class="col l-9 m-9">
                                            <h3 class="header-sub-menu__title">Hãng sản xuất</h3>
                                            <div class="row">
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="./mobile.html" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Apple
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Samsung
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            OnePlus
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Xiaomi
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Oppo
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Vivo
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            ZTE (Nubia)
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Asus
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Nokia
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            LG
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Google
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Vsmart
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Meizu
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Sony
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            BlackBerry
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Lenovo
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Bkav
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Huawei
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Smartisan
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Meiigoo
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col l-3 m-4">
                                            <h3 class="header-sub-menu__title">Mức giá</h3>
                                            <div class="row">
                                                <div class="col l-12">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Dưới 1 triệu
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-12">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Dưới 2 triệu
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-12">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Dưới 3 triệu
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-12">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Dưới 5 triệu
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-12">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Dưới 8 triệu
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-12">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Dưới 10 triệu
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-12">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Trên 10 triệu
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col l-12 m-12">
                                            <div class="header-sub-menu__ranking">
                                                <i class="header-sub-menu__ranking-icon fas fa-trophy"></i>
                                                <a href="#" class="header-sub-menu__ranking-title">Xếp hạng điện
                                                    thoại</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>

                        <!-- Menu Tablet -->
                        <li class="header-menu__item">
                            <a href="" class="header-menu__item-link">
                                <i class="header-menu__item-icon fas fa-laptop"></i>
                                <p class="header-menu__item-name">Laptop</p>
                            </a>

                            <div class="header-sub-menu">
                                <div class="grid">
                                    <div class="row">
                                        <div class="col l-9 m-9">
                                            <h3 class="header-sub-menu__title">Hãng sản xuất</h3>
                                            <div class="row">
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Apple
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Samsung
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col l-3 m-3">
                                            <h3 class="header-sub-menu__title">Mức giá</h3>
                                            <div class="row">
                                                <div class="col l-12 m-12">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Dưới 1 triệu
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-12 m-12">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Dưới 2 triệu
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-12 m-12">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Dưới 3 triệu
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-12 m-12">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Dưới 5 triệu
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-12 m-12">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Dưới 8 triệu
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-12 m-12">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Dưới 10 triệu
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-12 m-12">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Trên 10 triệu
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col l-12 m-12">
                                            <div class="header-sub-menu__ranking">
                                                <i class="header-sub-menu__ranking-icon fas fa-trophy"></i>
                                                <a href="#" class="header-sub-menu__ranking-title">Xếp hạng điện
                                                    thoại</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>

                        <!-- Menu Tool -->
                        <li class="header-menu__item">
                            <a href="" class="header-menu__item-link">
                                <i class="header-menu__item-icon fas fa-headphones-alt"></i>
                                <p class="header-menu__item-name">Phụ kiện</p>
                            </a>

                            <div class="header-sub-menu header-sub-menu--m-size">
                                <div class="grid">
                                    <div class="row">
                                        <div class="col l-12 m-12">
                                            <h3 class="header-sub-menu__title">Loại phụ kiện</h3>
                                            <div class="row">
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Loa - Tai nghe
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Đồng hồ thông minh
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Pin - Sạc dự phòng
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Phụ kiện iPhone
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Đồ chơi công nghệ
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Phụ kiện Xiaomi
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Máy lọc không khí
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Phụ kiện Sony
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Phụ kiện Samsung
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Phụ kiện LG
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Phụ kiện Lenovo
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Phụ kiện iPad
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Phụ kiện Meizu
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Phụ kiện BlackBerry
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Phụ kiện Oppo
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Phụ kiện Pisen
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Phụ kiện Mark
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Phụ kiện khác
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>

                        <!-- Menu Fix -->
                        <li class="header-menu__item">
                            <a href="" class="header-menu__item-link">
                                <i class="header-menu__item-icon fas fa-tools"></i>
                                <p class="header-menu__item-name">Sửa chữa</p>
                            </a>

                            <div class="header-sub-menu header-sub-menu--m-size">
                                <div class="grid">
                                    <div class="row">
                                        <div class="col l-12 m-12">
                                            <h3 class="header-sub-menu__title">Loại sản phẩm</h3>
                                            <div class="row">
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            iPhone
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Samsung
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Xiaomi
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Oppo
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Realme
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Honor
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            iPad
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Sony
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            HTC
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            LG
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Asus
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            BlackBerry
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Vivo
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Mobiistar
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Huawei
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Sim ghép iPhone
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Hãng khác
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Linh kiện điện thoại
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>

                        <!-- Menu Unlock -->
                        <li class="header-menu__item">
                            <a href="" class="header-menu__item-link">
                                <i class="header-menu__item-icon fas fa-unlock"></i>
                                <p class="header-menu__item-name">Mở khóa</p>
                            </a>

                            <div class="header-sub-menu header-sub-menu--m-size">
                                <div class="grid">
                                    <div class="row">
                                        <div class="col l-12 m-12">
                                            <h3 class="header-sub-menu__title">Hãng sản xuất</h3>
                                            <div class="row">
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Unlock iPhone
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Unlock Samsung
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Unlock LG
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Unlock Sony
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Unlock HTC
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Unlock Huawei
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Unlock iPad
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col l-4 m-4">
                                                    <div class="header-sub-menu__item">
                                                        <a href="#" class="header-sub-menu__link">
                                                            <i
                                                                    class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                            Unlock Xiaomi
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>

                        <!-- Menu news -->
                        <li class="header-menu__item">
                            <a href="" class="header-menu__item-link">
                                <i class="header-menu__item-icon fas fa-newspaper"></i>
                                <p class="header-menu__item-name">Tin tức</p>
                            </a>
                        </li>

                        <li class="header-menu__item">
                            <a href="" class="header-menu__item-link">
                                <i class="header-menu__item-icon fas fa-shopping-cart"></i>
                                <p class="header-menu__item-name">Giỏ hàng</p>
                            </a>
                        </li>
                    </ul>

                    <!-- Button search in mobile -->
                    <div class="header-mobile-search display-on-mobile-and-tablet">
                        <i class="header-mobile-search__icon fas fa-search"></i>
                    </div>

                    <!-- Mobile search input -->
                    <div class="header-mobile-search-box__wrap">
                        <input type="text" placeholder="Nhập tên sản phẩm..."
                               class="header-mobile-search-box__input">
                        <button class="header-mobile-search-box__btn">
                            <i class="header-mobile-search-box__icon fas fa-search"></i>
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Mobile and Tablet sub menu -->
        <label class="header-mobile-nav__overlay"></label>

        <nav class="header-mobile-nav">
            <div class="header-mobile-nav__heading">
                <a href="#" class="header-mobile-nav__heading-link">
                    <div class="header-mobile-nav__logo"></div>
                </a>
                <i class="header-mobile-nav__close fas fa-times"></i>
            </div>

            <ul class="header-mobile-nav__list">
                <!-- Mobile -->
                <li class="header-mobile-nav__item">
                    <label class="header-mobile-nav__item-select">
                        <i class="header-mobile-nav__icon-open fas fa-chevron-right"></i>
                        Điện thoại
                    </label>

                    <ul class="header-mobile-sub-nav__list" style="--num-row: 8;">
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">Apple</a>
                        </li>
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">Samsung</a>
                        </li>
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">OnePlus</a>
                        </li>
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">Xiaomi</a>
                        </li>
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">Oppo</a>
                        </li>
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">Vivo</a>
                        </li>
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">ZTE (Nubia)</a>
                        </li>
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">Asus</a>
                        </li>
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">Nokia</a>
                        </li>
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">LG</a>
                        </li>
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">Google</a>
                        </li>
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">Vsmart</a>
                        </li>
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">Meizu</a>
                        </li>
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">Sony</a>
                        </li>
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">BlackBerry</a>
                        </li>
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">Lenovo</a>
                        </li>
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">Bkav</a>
                        </li>
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">Huawei</a>
                        </li>
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">Smartisan</a>
                        </li>
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">Meiigo</a>
                        </li>
                    </ul>
                </li>

                <!-- Tablet -->
                <li class="header-mobile-nav__item">
                    <label class="header-mobile-nav__item-select">
                        <i class="header-mobile-nav__icon-open fas fa-chevron-right"></i>
                        Tablet
                    </label>

                    <ul class="header-mobile-sub-nav__list" style="--num-row: 2;">
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">Apple</a>
                        </li>
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">Samsung</a>
                        </li>
                    </ul>
                </li>

                <!-- Tool -->
                <li class="header-mobile-nav__item">
                    <label class="header-mobile-nav__item-select">
                        <i class="header-mobile-nav__icon-open fas fa-chevron-right"></i>
                        Phụ kiện
                    </label>

                    <ul class="header-mobile-sub-nav__list" style="--num-row: 8;">
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">Loa - Tai nghe</a>
                        </li>
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">Đồng hồ thông minh</a>
                        </li>
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">Pin - Sạc dự phòng</a>
                        </li>
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">Phụ kiện iPhone</a>
                        </li>
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">Đồ chơi công nghệ</a>
                        </li>
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">Phụ kiện Xiaomi</a>
                        </li>
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">Máy lọc không khí</a>
                        </li>
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">Phụ kiện Sony</a>
                        </li>
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">Phụ kiện Samsung</a>
                        </li>
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">Phụ kiện LG</a>
                        </li>
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">Phụ kiện Lenovo</a>
                        </li>
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">Phụ kiện Ipad</a>
                        </li>
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">Phụ kiện Meizu</a>
                        </li>
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">Phụ kiện BlackBerry</a>
                        </li>
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">Phụ kiện Oppo</a>
                        </li>
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">Phụ kiện Pisen</a>
                        </li>
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">Phụ kiện Mark</a>
                        </li>
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">Phụ kiện khác</a>
                        </li>
                    </ul>
                </li>

                <!-- Fix -->
                <li class="header-mobile-nav__item">
                    <label class="header-mobile-nav__item-select">
                        <i class="header-mobile-nav__icon-open fas fa-chevron-right"></i>
                        Sửa chữa
                    </label>

                    <ul class="header-mobile-sub-nav__list" style="--num-row: 8;">
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">iPhone</a>
                        </li>
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">Samsung</a>
                        </li>
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">Xiaomi</a>
                        </li>
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">Oppo</a>
                        </li>
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">Realme</a>
                        </li>
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">Honor</a>
                        </li>
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">iPad</a>
                        </li>
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">Sony</a>
                        </li>
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">HTC</a>
                        </li>
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">LG</a>
                        </li>
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">Asus</a>
                        </li>
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">BlackBerry</a>
                        </li>
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">Meizu</a>
                        </li>
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">Vivo</a>
                        </li>
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">Mobiistar</a>
                        </li>
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">Huawei</a>
                        </li>
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">Sim ghép iPhone</a>
                        </li>
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">Hãng khác</a>
                        </li>
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">Linh kiện điện thoại</a>
                        </li>
                    </ul>
                </li>

                <!-- Unlock -->
                <li class="header-mobile-nav__item">
                    <label class="header-mobile-nav__item-select">
                        <i class="header-mobile-nav__icon-open fas fa-chevron-right"></i>
                        Mở khóa
                    </label>

                    <ul class="header-mobile-sub-nav__list" style="--num-row: 4;">
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">Unlock iPhone</a>
                        </li>
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">Unlock Samsung</a>
                        </li>
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">Unlock LG</a>
                        </li>
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">Unlock Sony</a>
                        </li>
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">Unlock HTC</a>
                        </li>
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">Unlock Huawei</a>
                        </li>
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">Unlock iPad</a>
                        </li>
                        <li class="header-mobile-sub-nav__item">
                            <a href="#" class="header-mobile-sub-nav__item-link">Unlock Xiaomi</a>
                        </li>
                    </ul>
                </li>

                <!-- News -->
                <li class="header-mobile-nav__item">
                    <a href="#" class="header-mobile-nav__item-select">
                        <i class="header-mobile-nav__icon-open fas fa-chevron-right"></i>
                        Tin tức
                    </a>
                </li>

                <li class="header-mobile-nav__item pd-none" style="--num-row: 2;">
                    <a href="#" class="header-mobile-nav__item-link">Liên hệ</a>
                </li>
                <li class="header-mobile-nav__item pd-none">
                    <a href="#" class="header-mobile-nav__item-link">Diễn đàn</a>
                </li>
                <li class="header-mobile-nav__item pd-none">
                    <a href="#" class="header-mobile-nav__item-link">Tra cứu bảo hành</a>
                </li>
                <li class="header-mobile-nav__item pd-none">
                    <a href="#" class="header-mobile-nav__item-link">Đăng nhập</a>
                </li>
                <li class="header-mobile-nav__item pd-none">
                    <a href="#" class="header-mobile-nav__item-link">Đăng xuất</a>
                </li>
            </ul>
        </nav>
    </div>

    <div class="container">
        <div class="grid wide">
            <div class="container_item">
                <div class="breadcrumb">
                    <ul itemscope itemtype="http://schema.org/BreadcrumbList">
                        <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
                            <a itemprop="item" href="./mobile.html"><span itemprop="name">Điện thoại di
                                        động</span>
                                <i class="fa fa-angle-right" aria-hidden="true" style="margin: 0 5px"></i>
                            </a>
                            <meta itemprop="position" content="2"/>
                        </li>
                        <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
                            <a itemprop="item" href="list apple"><span itemprop="name">Apple
                                        (iPhone) - Quốc tế</span>
                            </a>
                            <meta itemprop="position" content="3"/>
                        </li>
                    </ul>
                </div>
                <div class="product-title is-desktop">
                    <h1 class="title">${detail.tenSP}</h1>
                    <div class="rating-show-start">
                        <i class="fa fa-star" aria-hidden="true"></i>
                        <i class="fa fa-star" aria-hidden="true"></i>
                        <i class="fa fa-star" aria-hidden="true"></i>
                        <i class="fa fa-star" aria-hidden="true"></i>
                        <i class="fa fa-star" aria-hidden="true"></i>
                        <a href="#" class="rating-show-count">(<span>1092</span> đánh giá)</a>
                    </div>
                </div>
                <div class="product-content-box">
                    <div class="grid wide">
                        <div class="row">
                            <div class="product-image-store-list col l-4 m-4 c-12">
                                <div class="product-slide-image">
                                    <div class="product_image v2-product-image">
                                        <li class="active"><img
                                                src="${detail.link_hinhanh}"
                                                alt="iphone-xs-max-den" data-color="1"/></li>
                                        <li><img
                                                src="https://cdn.mobilecity.vn/mobilecity-vn/images/2021/07/w300/iphone-xs-max-trang.jpg"
                                                alt="iphone-xs-max-trang" data-color="9"/></li>
                                        <li><img
                                                src="https://cdn.mobilecity.vn/mobilecity-vn/images/2021/07/w300/iphone-xs-max-vang.jpg"
                                                alt="iphone-xs-max-vang" data-color="511"/></li>
                                    </div>
                                    <div class="product_slide v2-product-slide">
                                        <ul id="image-gallery" class="gallery list-unstyled">
                                            <li data-src="https://cdn.mobilecity.vn/mobilecity-vn/images/2021/07/iphone-xs-max-truoc-sau.jpg"
                                                data-sub-html="<h4>iPhone XS Max Cũ (64GB, 256GB) - Fullbox</h4>">
                                                <a href="#">
                                                    <img src="https://cdn.mobilecity.vn/mobilecity-vn/images/2021/07/w80/iphone-xs-max-truoc-sau.jpg"
                                                         alt="iphone-xs-max-truoc-sau"/>
                                                </a>
                                            </li>
                                            <li data-src="https://cdn.mobilecity.vn/mobilecity-vn/images/2020/05/iphone-xsmax-mobile-city.jpg"
                                                data-sub-html="<h4>iPhone XS Max Cũ (64GB, 256GB) - Fullbox</h4>">
                                                <a href="#">
                                                    <img src="https://cdn.mobilecity.vn/mobilecity-vn/images/2020/05/w80/iphone-xsmax-mobile-city.jpg"
                                                         alt="iphone-xsmax-mobile-city"/>
                                                </a>
                                            </li>
                                            <li data-src="https://cdn.mobilecity.vn/mobilecity-vn/images/2021/07/iphone-xs-max-man-hinh.jpg"
                                                data-sub-html="<h4>iPhone XS Max Cũ (64GB, 256GB) - Fullbox</h4>">
                                                <a href="#">
                                                    <img src="https://cdn.mobilecity.vn/mobilecity-vn/images/2021/07/w80/iphone-xs-max-man-hinh.jpg"
                                                         alt="iphone-xs-max-man-hinh"/>
                                                </a>
                                            </li>
                                            <li data-src="https://cdn.mobilecity.vn/mobilecity-vn/images/2021/07/iphone-xs-max-tren-duoi.jpg"
                                                data-sub-html="<h4>iPhone XS Max Cũ (64GB, 256GB) - Fullbox</h4>">
                                                <a href="#">
                                                    <img src="https://cdn.mobilecity.vn/mobilecity-vn/images/2021/07/w80/iphone-xs-max-tren-duoi.jpg"
                                                         alt="iphone-xs-max-tren-duoi"/>
                                                </a>
                                            </li>
                                            <li data-src="https://cdn.mobilecity.vn/mobilecity-vn/images/2021/07/iphone-xs-max-canh-ben.jpg"
                                                data-sub-html="<h4>iPhone XS Max Cũ (64GB, 256GB) - Fullbox</h4>">
                                                <a href="#">
                                                    <img src="https://cdn.mobilecity.vn/mobilecity-vn/images/2021/07/w80/iphone-xs-max-canh-ben.jpg"
                                                         alt="iphone-xs-max-canh-ben"/>
                                                </a>
                                            </li>
                                            <li data-src="https://cdn.mobilecity.vn/mobilecity-vn/images/2021/07/iphone-xs-max-nut-nguon.jpg"
                                                data-sub-html="<h4>iPhone XS Max Cũ (64GB, 256GB) - Fullbox</h4>">
                                                <a href="#">
                                                    <img src="https://cdn.mobilecity.vn/mobilecity-vn/images/2021/07/w80/iphone-xs-max-nut-nguon.jpg"
                                                         alt="iphone-xs-max-nut-nguon"/>
                                                </a>
                                            </li>
                                            <li data-src="https://cdn.mobilecity.vn/mobilecity-vn/images/2021/07/iphone-xs-max-nut-bam.jpg"
                                                data-sub-html="<h4>iPhone XS Max Cũ (64GB, 256GB) - Fullbox</h4>">
                                                <a href="#">
                                                    <img src="https://cdn.mobilecity.vn/mobilecity-vn/images/2021/07/w80/iphone-xs-max-nut-bam.jpg"
                                                         alt="iphone-xs-max-nut-bam"/>
                                                </a>
                                            </li>
                                            <li data-src="https://cdn.mobilecity.vn/mobilecity-vn/images/2021/07/iphone-xs-max-canh-duoi.jpg"
                                                data-sub-html="<h4>iPhone XS Max Cũ (64GB, 256GB) - Fullbox</h4>">
                                                <a href="#">
                                                    <img src="https://cdn.mobilecity.vn/mobilecity-vn/images/2021/07/w80/iphone-xs-max-canh-duoi.jpg"
                                                         alt="iphone-xs-max-canh-duoi"/>
                                                </a>
                                            </li>
                                            <li data-src="https://cdn.mobilecity.vn/mobilecity-vn/images/2021/07/iphone-xs-max-khay-sim.jpg"
                                                data-sub-html="<h4>iPhone XS Max Cũ (64GB, 256GB) - Fullbox</h4>">
                                                <a href="#">
                                                    <img src="https://cdn.mobilecity.vn/mobilecity-vn/images/2021/07/w80/iphone-xs-max-khay-sim.jpg"
                                                         alt="iphone-xs-max-khay-sim"/>
                                                </a>
                                            </li>
                                            <li data-src="https://cdn.mobilecity.vn/mobilecity-vn/images/2021/07/iphone-xs-max-camera.jpg"
                                                data-sub-html="<h4>iPhone XS Max Cũ (64GB, 256GB) - Fullbox</h4>">
                                                <a href="#">
                                                    <img src="https://cdn.mobilecity.vn/mobilecity-vn/images/2021/07/w80/iphone-xs-max-camera.jpg"
                                                         alt="iphone-xs-max-camera"/>
                                                </a>
                                            </li>
                                            <li data-src="https://cdn.mobilecity.vn/mobilecity-vn/images/2021/07/iphone-xs-max-mat-sau.jpg"
                                                data-sub-html="<h4>iPhone XS Max Cũ (64GB, 256GB) - Fullbox</h4>">
                                                <a href="#">
                                                    <img src="https://cdn.mobilecity.vn/mobilecity-vn/images/2021/07/w80/iphone-xs-max-mat-sau.jpg"
                                                         alt="iphone-xs-max-mat-sau"/>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="product-store-list">
                                    <p class="title-store-list">Danh sách cửa hàng:</p>
                                    <select class="location" id="location-message">
                                        <option value="1" selected>
                                            TP.HCM
                                        </option>
                                        <option value="2">
                                            Hà Nội
                                        </option>
                                        <option value="3">
                                            Đà Nẵng
                                        </option>
                                    </select>
                                    <style type="text/css">
                                        .outstock {
                                            color: red;
                                        }

                                        .instock {
                                            color: blue;
                                        }
                                    </style>
                                    <div class="store-list">
                                        <ul>
                                            <li class="store" data-location="0" data-id="0">
                                                Cửa hàng online <span class="status-stock instock">(Còn hàng)</span>
                                            </li>
                                            <li class="store" data-location="1" data-id="1" style="">
                                                Phường Linh Trung, Thủ Đức, Thành phố Hồ Chí Minh <span
                                                    class="status-stock instock">(Còn hàng)</span>
                                            </li>
                                            <li class="store" data-location="1" data-id="2" style="">
                                                Phường Linh Trung, Thủ Đức, Thành phố Hồ Chí Minh <span
                                                    class="status-stock instock">(Còn hàng)</span>
                                            </li>
                                            <li class="store" data-location="2" data-id="3" style="display: none">
                                                Phường Linh Trung, Thủ Đức, Thành phố Hồ Chí Minh <span
                                                    class="status-stock instock">(Còn hàng)</span>
                                            </li>
                                            <li class="store" data-location="2" data-id="4" style="display: none">
                                                Phường Linh Trung, Thủ Đức, Thành phố Hồ Chí Minh <span
                                                    class="status-stock instock">(Còn hàng)</span>
                                            </li>
                                            <li class="store" data-location="3" data-id="5" style="display: none">
                                                Phường Linh Trung, Thủ Đức, Thành phố Hồ Chí Minh <span
                                                    class="status-stock instock">(Còn hàng)</span>
                                            </li>
                                            <li class="store" data-location="1" data-id="6" style="">
                                                Phường Linh Trung, Thủ Đức, Thành phố Hồ Chí Minh <span
                                                    class="status-stock instock">(Còn hàng)</span>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col l-5 m-8 c-12">
                                <div class="product-price-content">
                                    <div class="price-and-color">
                                        <div class="price_location">
                                            <p>Giá tại: </p>
                                            <select class="location" id="location">
                                                <option value="1" selected>
                                                    Hà Nội
                                                </option>
                                                <option value="2">
                                                    TP.HCM
                                                </option>
                                                <option value="3">
                                                    Đà Nẵng
                                                </option>
                                            </select>
                                        </div>
                                        <div class="price-product" style="">
                                            <p class="price">${detail.giaSP}</p>
                                            <p class="price-old"></p>
                                        </div>
                                        <div class="status-box">
                                            <i class="fas fa-check-square" aria-hidden="true"></i>
                                            <span class="status-instock">Còn hàng</span>
                                        </div>
                                    </div>
                                    <div class="attribute-group" style="">
                                        <p class="product-note-buy">Chọn phiên bản để xem giá và chi nhánh còn hàng:
                                        </p>
                                        <div class="color-list attribute-list">
                                            <p class="attribute-title"><span class="title">Màu sắc</span> <span
                                                    class="color-name-selected"></span></p>
                                            <div class="attribute-value">
                                                <div data-color_id="1" style="background-color: #000000"
                                                     data-title="Đen" class="color-item attribute-item">
                                                    <div class="product-variation__tick ">
                                                        <svg enable-background="new 0 0 12 12" viewBox="0 0 12 12"
                                                             x="0" y="0" class="svg-icon icon-tick-bold ">
                                                            <g>
                                                                <path
                                                                        d="m5.2 10.9c-.2 0-.5-.1-.7-.2l-4.2-3.7c-.4-.4-.5-1-.1-1.4s1-.5 1.4-.1l3.4 3 5.1-7c .3-.4 1-.5 1.4-.2s.5 1 .2 1.4l-5.7 7.9c-.2.2-.4.4-.7.4 0-.1 0-.1-.1-.1z">
                                                                </path>
                                                            </g>
                                                        </svg>
                                                    </div>
                                                </div>
                                                <div data-color_id="9" style="background-color: #ffffff"
                                                     data-title="Trắng" class="color-item attribute-item">
                                                    <div class="product-variation__tick ">
                                                        <svg enable-background="new 0 0 12 12" viewBox="0 0 12 12"
                                                             x="0" y="0" class="svg-icon icon-tick-bold ">
                                                            <g>
                                                                <path
                                                                        d="m5.2 10.9c-.2 0-.5-.1-.7-.2l-4.2-3.7c-.4-.4-.5-1-.1-1.4s1-.5 1.4-.1l3.4 3 5.1-7c .3-.4 1-.5 1.4-.2s.5 1 .2 1.4l-5.7 7.9c-.2.2-.4.4-.7.4 0-.1 0-.1-.1-.1z">
                                                                </path>
                                                            </g>
                                                        </svg>
                                                    </div>
                                                </div>
                                                <div data-color_id="511" style="background-color: #ffd479"
                                                     data-title="Vàng" class="color-item attribute-item">
                                                    <div class="product-variation__tick ">
                                                        <svg enable-background="new 0 0 12 12" viewBox="0 0 12 12"
                                                             x="0" y="0" class="svg-icon icon-tick-bold ">
                                                            <g>
                                                                <path
                                                                        d="m5.2 10.9c-.2 0-.5-.1-.7-.2l-4.2-3.7c-.4-.4-.5-1-.1-1.4s1-.5 1.4-.1l3.4 3 5.1-7c .3-.4 1-.5 1.4-.2s.5 1 .2 1.4l-5.7 7.9c-.2.2-.4.4-.7.4 0-.1 0-.1-.1-.1z">
                                                                </path>
                                                            </g>
                                                        </svg>
                                                    </div>
                                                </div>
                                                <span style="display: none" class="color-name-selected"></span>
                                            </div>
                                        </div>
                                        <div class="storage-list attribute-list">
                                            <p class="attribute-title">Bộ nhớ </p>
                                            <div class="attribute-value">
                                                <div data-storage_id="14" class="storage-item attribute-item">64GB
                                                    <div class="product-variation__tick ">
                                                        <svg enable-background="new 0 0 12 12" viewBox="0 0 12 12"
                                                             x="0" y="0" class="svg-icon icon-tick-bold ">
                                                            <g>
                                                                <path
                                                                        d="m5.2 10.9c-.2 0-.5-.1-.7-.2l-4.2-3.7c-.4-.4-.5-1-.1-1.4s1-.5 1.4-.1l3.4 3 5.1-7c .3-.4 1-.5 1.4-.2s.5 1 .2 1.4l-5.7 7.9c-.2.2-.4.4-.7.4 0-.1 0-.1-.1-.1z">
                                                                </path>
                                                            </g>
                                                        </svg>
                                                    </div>
                                                </div>
                                                <div data-storage_id="253" class="storage-item attribute-item">256GB
                                                    <div class="product-variation__tick ">
                                                        <svg enable-background="new 0 0 12 12" viewBox="0 0 12 12"
                                                             x="0" y="0" class="svg-icon icon-tick-bold ">
                                                            <g>
                                                                <path
                                                                        d="m5.2 10.9c-.2 0-.5-.1-.7-.2l-4.2-3.7c-.4-.4-.5-1-.1-1.4s1-.5 1.4-.1l3.4 3 5.1-7c .3-.4 1-.5 1.4-.2s.5 1 .2 1.4l-5.7 7.9c-.2.2-.4.4-.7.4 0-.1 0-.1-.1-.1z">
                                                                </path>
                                                            </g>
                                                        </svg>
                                                    </div>
                                                </div>
                                                <div data-storage_id="254" class="storage-item attribute-item">512GB
                                                    <div class="product-variation__tick ">
                                                        <svg enable-background="new 0 0 12 12" viewBox="0 0 12 12"
                                                             x="0" y="0" class="svg-icon icon-tick-bold ">
                                                            <g>
                                                                <path
                                                                        d="m5.2 10.9c-.2 0-.5-.1-.7-.2l-4.2-3.7c-.4-.4-.5-1-.1-1.4s1-.5 1.4-.1l3.4 3 5.1-7c .3-.4 1-.5 1.4-.2s.5 1 .2 1.4l-5.7 7.9c-.2.2-.4.4-.7.4 0-.1 0-.1-.1-.1z">
                                                                </path>
                                                            </g>
                                                        </svg>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="origin-list attribute-list">
                                            <p class="attribute-title">Nguồn gốc </p>
                                            <div class="attribute-value">
                                                <div data-origin_id="11" class="origin-item attribute-item">Hàn Quốc
                                                    <div class="product-variation__tick ">
                                                        <svg enable-background="new 0 0 12 12" viewBox="0 0 12 12"
                                                             x="0" y="0" class="svg-icon icon-tick-bold ">
                                                            <g>
                                                                <path
                                                                        d="m5.2 10.9c-.2 0-.5-.1-.7-.2l-4.2-3.7c-.4-.4-.5-1-.1-1.4s1-.5 1.4-.1l3.4 3 5.1-7c .3-.4 1-.5 1.4-.2s.5 1 .2 1.4l-5.7 7.9c-.2.2-.4.4-.7.4 0-.1 0-.1-.1-.1z">
                                                                </path>
                                                            </g>
                                                        </svg>
                                                    </div>
                                                </div>
                                                <div data-origin_id="305" class="origin-item attribute-item">Âu, Mỹ
                                                    <div class="product-variation__tick ">
                                                        <svg enable-background="new 0 0 12 12" viewBox="0 0 12 12"
                                                             x="0" y="0" class="svg-icon icon-tick-bold ">
                                                            <g>
                                                                <path
                                                                        d="m5.2 10.9c-.2 0-.5-.1-.7-.2l-4.2-3.7c-.4-.4-.5-1-.1-1.4s1-.5 1.4-.1l3.4 3 5.1-7c .3-.4 1-.5 1.4-.2s.5 1 .2 1.4l-5.7 7.9c-.2.2-.4.4-.7.4 0-.1 0-.1-.1-.1z">
                                                                </path>
                                                            </g>
                                                        </svg>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="aspect-list attribute-list">
                                            <p class="attribute-title">Tình trạng </p>
                                            <div class="attribute-value">
                                                <div data-aspect_id="32" class="aspect-item attribute-item">95%
                                                    <div class="product-variation__tick ">
                                                        <svg enable-background="new 0 0 12 12" viewBox="0 0 12 12"
                                                             x="0" y="0" class="svg-icon icon-tick-bold ">
                                                            <g>
                                                                <path
                                                                        d="m5.2 10.9c-.2 0-.5-.1-.7-.2l-4.2-3.7c-.4-.4-.5-1-.1-1.4s1-.5 1.4-.1l3.4 3 5.1-7c .3-.4 1-.5 1.4-.2s.5 1 .2 1.4l-5.7 7.9c-.2.2-.4.4-.7.4 0-.1 0-.1-.1-.1z">
                                                                </path>
                                                            </g>
                                                        </svg>
                                                    </div>
                                                </div>
                                                <div data-aspect_id="18" class="aspect-item attribute-item">99%
                                                    <div class="product-variation__tick ">
                                                        <svg enable-background="new 0 0 12 12" viewBox="0 0 12 12"
                                                             x="0" y="0" class="svg-icon icon-tick-bold ">
                                                            <g>
                                                                <path
                                                                        d="m5.2 10.9c-.2 0-.5-.1-.7-.2l-4.2-3.7c-.4-.4-.5-1-.1-1.4s1-.5 1.4-.1l3.4 3 5.1-7c .3-.4 1-.5 1.4-.2s.5 1 .2 1.4l-5.7 7.9c-.2.2-.4.4-.7.4 0-.1 0-.1-.1-.1z">
                                                                </path>
                                                            </g>
                                                        </svg>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="warranty-list attribute-list" style="">
                                        <p class="attribute-title">
                                                <span class="title">Gói bảo hành <a href="./trangbaohanh.html"
                                                                                    target="_blank">Tìm
                                                        hiểu
                                                        thêm</a></span>
                                            <span class="price-warranty"></span>
                                        </p>
                                        <div class="attribute-value">
                                            <div data-warranty_id="1" data-web_id="1429"
                                                 data-warranty_price="550000" class="attribute-item warranty-item">
                                                BHV 6 Tháng
                                            </div>
                                            <div data-warranty_id="3" data-web_id="1430"
                                                 data-warranty_price="850000" class="attribute-item warranty-item">
                                                BHV 12 Tháng
                                            </div>
                                            <span class="price-warranty" style=""></span>
                                            <div class="about-warranty">
                                                <a href="" class="about_warranty_link" target="_blank">
                                                    <i class="fa fa-question-circle-o" aria-hidden="true"></i>
                                                </a>
                                                <div id="text-tooltips">
                                                    <div class="tips-content">
                                                        <p class="tips-content-heading">Các chính sách của gói Bảo
                                                            hành
                                                            vàng
                                                            mà Bảo hành
                                                            thường không có:</p>
                                                        <p>1. Bảo hành cả Pin, Nguồn, Màn hình, Camera, Vân tay.
                                                        </p>
                                                        <p>2. Thời gian được đổi máy nếu có lỗi nhà sản xuất lên đến
                                                            30
                                                            ngày
                                                            (+ thêm 15-30
                                                            ngày đối với máy ship xa).</p>
                                                        <p>3. Tặng củ sạc nhanh, Cáp, Dán cường lực, Ốp lưng, Tai
                                                            nghe
                                                            hoặc
                                                            mặt hàng khác
                                                            tương đương khi mua Bảo hành vàng.</p>
                                                        <p>4. Bảo hành lần 3 đổi máy luôn.</p>
                                                        <p>... Còn nhiều chính sách khác trong gói BHV, quý khách
                                                            xem
                                                            chi
                                                            tiết <a
                                                                    href="https://mobilecity.vn/page/chinh-sach-bao-hanh.html"
                                                                    target="_blank">Tại đây</a></p>
                                                    </div>
                                                    <div class="outline-tips">
                                                        <div class="tips"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-more-info">
                                    <div class="warranty-default-box">
                                        <p class="warranty-text" style="">
                                            Thời gian bảo hành: <span class="warranty-content">
                                                    <span class="warranty-content-default">BH Thường 6 Tháng</span>
                                                    <span class="warranty-content-selected"></span></span>
                                            <span class="warranty-help-link">(<a href="" target="_blank">Xem chi
                                                        tiết</a>)</span>
                                        </p>
                                        <p>Giao hàng tận nơi miễn phí trong 30 phút (<a
                                                href="/page/chinh-sach-van-chuyen.html">Tìm hiểu
                                            thêm</a>)</p>
                                    </div>
                                    <div class="sale-box v2-promotion">
                                        <p class="sale-box-title">Khuyến mãi</p>
                                        <ul>
                                            <li>
                                                <p>Tặng: <span style="color: #ff0000;">Cường lực -</span> <span
                                                        style="color: #ff0000;">Ốp
                                                            lưng - Tai nghe</span> khi mua BHV</p>
                                            </li>
                                            <li>
                                                <p>Giảm: <span style="color: #ff0000;">100K</span> áp dụng HSSV mua
                                                    BHV
                                                    tại
                                                    <span style="color: #ff0000;">Linh Trung - Thủ Đức</span>
                                                </p>
                                            </li>
                                            <li>
                                                <p>Mua: Dán cường lực 5D chỉ <span
                                                        style="color: #ff0000;">30K</span>
                                                </p>
                                            </li>
                                            <li>
                                                <p>Giảm 100K khi mua BHV và đặt hàng tại: <a title=""
                                                                                             href="https://bit.ly/mc42-voucher">Đây</a>
                                                </p>
                                            </li>
                                            <li>
                                                <p>Mua SHOPEE giá Rẻ: <a title="MobileCity Shopee" href=""
                                                                         rel="nofollow" target="_blank">CLICK</a></p>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="product-address">
                                        <ul>
                                            <li>Fullbox: máy, sạc, cáp, sách hướng dẫn, que chọc sim</li>
                                        </ul>
                                    </div>
                                    <div class="product-messsage hidden-promotion" style=""></div>

                                    <div class="product-address">Hotline: 0372.253.243 (HN) | 0372.253.243 (HCM) |
                                        0372.253.243 (ĐN)
                                    </div>

                                    <a href="cart-add?id=${detail.maSP}">
                                        <button class="button-add-cart btn-payment">
                                            <i class="fas fa-shopping-cart"></i>
                                            THÊM VÀO GIỎ HÀNG
                                        </button>
                                    </a>
                                    <a href="#">
                                        <button class="button-buy btn-payment">
                                            MUA HÀNG NGAY
                                        </button>
                                    </a>
                                    <div class="installment">
                                        <a href="" target="_blank" class="installment-btn"><span class="title">MUA
                                                    TRẢ
                                                    GÓP
                                                    0%</span><span class="line">(Duyệt HS 5
                                                    phút, Trả góp qua thẻ)</span></a>
                                    </div>
                                </div>
                            </div>
                            <div class="product-related-box phone-related-box col l-3 m-0 c-0" style="">
                                <div class="product-related-title">Sản phẩm tương tự</div>
                                <div class="product-related-list phone-related-box-mobile product-box-mobile">
                                </div>
                                <div class="product-related-title">Phụ kiện liên quan</div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="grid wide">
            <div class="product-content-box">
                <div class="product-info-box">
                    <div class="product-info-title">Thông số kỹ thuật</div>
                    <div class="product-info-content">
                        <table>
                            <tbody>
                            <tr>
                                <td>Màn hình:</td>
                                <td>Super Retina OLED, HDR10, 625 nits (HBM)<br/>
                                    6.5 inches, 1242 x 2688 pixels, tỷ lệ 19.5:9<br/>
                                    Kính chống xước, 3D Touch
                                </td>
                            </tr>
                            <tr>
                                <td>Hệ điều hành:</td>
                                <td>IOS 12</td>
                            </tr>
                            <tr>
                                <td>Camera sau:</td>
                                <td>12 MP, f/1.8, 26mm (góc rộng), dual pixel PDAF, OIS<br/>
                                    12 MP, f/2.4, 52mm (chân dung), PDAF, OIS, 2x optical zoom<br/>
                                    Quay phim <a href="/cdn-cgi/l/email-protection" class="__cf_email__"
                                                 data-cfemail="dce8979ceee8">[email&#160;protected]</a>/30/60fps, <a
                                            href="/cdn-cgi/l/email-protection" class="__cf_email__"
                                            data-cfemail="a392939b93d3e39093">[email&#160;protected]</a>/60/120/240fps
                                </td>
                            </tr>
                            <tr>
                                <td>Camera trước:</td>
                                <td>7 MP, f/2.2, 32mm (tiêu chuẩn)<br/>
                                    Quay phim <a href="/cdn-cgi/l/email-protection" class="__cf_email__"
                                                 data-cfemail="0435343c3474443734">[email&#160;protected]</a>/60fps,
                                    gyro-EIS
                                </td>
                            </tr>
                            <tr>
                                <td>CPU:</td>
                                <td>Apple A12 Bionic (7 nm), 6 nhân<br/>
                                    (2x2.5 GHz Vortex + 4x1.6 GHz Tempest)<br/>
                                    GPU: Apple GPU, 4 nhân
                                </td>
                            </tr>
                            <tr>
                                <td>RAM:</td>
                                <td>4 GB</td>
                            </tr>
                            <tr>
                                <td>Bộ nhớ trong:</td>
                                <td>64-256-512 GB, NVMe<br/>
                                    Thẻ nhớ: không
                                </td>
                            </tr>
                            <tr>
                                <td>Thẻ SIM:</td>
                                <td>1 SIM - 2 SIM (tùy phiên bản thị trường), Dual SIM (Nano-SIM, dual stand-by)
                                    thị
                                    trường
                                    Trung Quốc
                                </td>
                            </tr>
                            <tr>
                                <td>Dung lượng pin:</td>
                                <td>Li-Ion 3174 mAh<br/>
                                    Sạc nhanh 15W, 50% trong 30 phút (quảng cáo)<br/>
                                    USB Power Delivery 2.0
                                </td>
                            </tr>
                            <tr>
                                <td>Thiết kế:</td>
                                <td>Thanh + Cảm ứng</td>
                            </tr>
                            </tbody>
                        </table>
                        <span id="product-show-lightbox" class="show-lightbox-btn">Xem thêm cấu hình chi tiết</span>
                    </div>
                    <div class="product-info-lightbox lightbox">
                            <span id="product-close-lightbox" class="close-lightbox-btn"><i class="fa fa-times"
                                                                                            aria-hidden="true"></i></span>
                        <marquee class="product-lightbox-title">
                            <p>iPhone XS Max Cũ (64GB, 256GB) - Fullbox</p>
                        </marquee>
                        <div class="product-lightbox-content">
                            <table>
                                <tbody>
                                <tr>
                                    <td colspan="2">Thông tin chung</td>
                                </tr>
                                <tr>
                                    <td>Hệ điều hành:</td>
                                    <td>IOS 12</td>
                                </tr>
                                <tr>
                                    <td>Ngôn ngữ:</td>
                                    <td>Đa ngôn ngữ, có hỗ trợ Tiếng Việt</td>
                                </tr>
                                <tr>
                                    <td colspan="2">Màn hình</td>
                                </tr>
                                <tr>
                                    <td>Loại màn hình:</td>
                                    <td>OLED</td>
                                </tr>
                                <tr>
                                    <td>Màu màn hình:</td>
                                    <td>16 triệu màu</td>
                                </tr>
                                <tr>
                                    <td>Chuẩn màn hình:</td>
                                    <td>Super Retina OLED, HDR10, 625 nits (HBM)<br/>
                                        6.5 inches, 1242 x 2688 pixels, tỷ lệ 19.5:9<br/>
                                        Kính chống xước, 3D Touch
                                    </td>
                                </tr>
                                <tr>
                                    <td>Độ phân giải:</td>
                                    <td>1242 x 2688 pixels</td>
                                </tr>
                                <tr>
                                    <td>Màn hình rộng:</td>
                                    <td>6.5</td>
                                </tr>
                                <tr>
                                    <td>Công nghệ cảm ứng:</td>
                                    <td>Cảm ứng điện dung đa điểm</td>
                                </tr>
                                <tr>
                                    <td colspan="2">Chụp hình &amp; Quay phim</td>
                                </tr>
                                <tr>
                                    <td>Camera sau:</td>
                                    <td>12 MP, f/1.8, 26mm (góc rộng), dual pixel PDAF, OIS<br/>
                                        12 MP, f/2.4, 52mm (chân dung), PDAF, OIS, 2x optical zoom<br/>
                                        Quay phim <a href="/cdn-cgi/l/email-protection" class="__cf_email__"
                                                     data-cfemail="66522d265452">[email&#160;protected]</a>/30/60fps, <a
                                                href="/cdn-cgi/l/email-protection" class="__cf_email__"
                                                data-cfemail="497879717939097a79">[email&#160;protected]</a>/60/120/240fps
                                    </td>
                                </tr>
                                <tr>
                                    <td>Camera trước:</td>
                                    <td>7 MP, f/2.2, 32mm (tiêu chuẩn)<br/>
                                        Quay phim <a href="/cdn-cgi/l/email-protection" class="__cf_email__"
                                                     data-cfemail="aa9b9a929adaea999a">[email&#160;protected]</a>/60fps,
                                        gyro-EIS
                                    </td>
                                </tr>
                                <tr>
                                    <td>Đèn Flash:</td>
                                    <td>Có</td>
                                </tr>
                                <tr>
                                    <td>Tính năng camera:</td>
                                    <td>OIS, PDAF, 2x optical zoom, Quad-LED dual-tone flash, HDR
                                        (photo/panorama)
                                    </td>
                                </tr>
                                <tr>
                                    <td>Quay phim:</td>
                                    <td><a href="/cdn-cgi/l/email-protection" class="__cf_email__"
                                           data-cfemail="162427202666562422">[email&#160;protected]</a>/30/60fps,
                                        <a href="/cdn-cgi/l/email-protection" class="__cf_email__"
                                           data-cfemail="7d4c4d454d0d3d4e4d">[email&#160;protected]</a>/60/120/240fps,
                                        HDR,
                                        stereo sound rec.
                                    </td>
                                </tr>
                                <tr>
                                    <td>Videocall:</td>
                                    <td>Có</td>
                                </tr>
                                <tr>
                                    <td colspan="2">CPU &amp; RAM</td>
                                </tr>
                                <tr>
                                    <td>Tốc độ CPU:</td>
                                    <td>Hexa-core (2x Vortex + 4x Tempest)</td>
                                </tr>
                                <tr>
                                    <td>Số nhân:</td>
                                    <td>6 nhân</td>
                                </tr>
                                <tr>
                                    <td>Chipset:</td>
                                    <td>Apple A12 Bionic (7 nm), 6 nhân<br/>
                                        (2x2.5 GHz Vortex + 4x1.6 GHz Tempest)<br/>
                                        GPU: Apple GPU, 4 nhân
                                    </td>
                                </tr>
                                <tr>
                                    <td>RAM:</td>
                                    <td>4 GB</td>
                                </tr>
                                <tr>
                                    <td>Chip đồ họa (GPU):</td>
                                    <td>Apple GPU (4-core graphics)</td>
                                </tr>
                                <tr>
                                    <td colspan="2">Bộ nhớ &amp; Lưu trữ</td>
                                </tr>
                                <tr>
                                    <td>Danh bạ:</td>
                                    <td>Không giới hạn</td>
                                </tr>
                                <tr>
                                    <td>Bộ nhớ trong (ROM):</td>
                                    <td>64-256-512 GB, NVMe<br/>
                                        Thẻ nhớ: không
                                    </td>
                                </tr>
                                <tr>
                                    <td>Thẻ nhớ ngoài:</td>
                                    <td>Không hỗ trợ</td>
                                </tr>
                                <tr>
                                    <td>Hỗ trợ thẻ tối đa:</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td colspan="2">Thiết kế &amp; Trọng lượng</td>
                                </tr>
                                <tr>
                                    <td>Kiểu dáng:</td>
                                    <td>Thanh + Cảm ứng</td>
                                </tr>
                                <tr>
                                    <td>Kích thước:</td>
                                    <td>157.5 x 77.4 x 7.7 mm</td>
                                </tr>
                                <tr>
                                    <td>Trọng lượng (g):</td>
                                    <td>208</td>
                                </tr>
                                <tr>
                                    <td colspan="2">Thông tin pin</td>
                                </tr>
                                <tr>
                                    <td>Loại pin:</td>
                                    <td>Li-Ion</td>
                                </tr>
                                <tr>
                                    <td>Dung lượng pin:</td>
                                    <td>Li-Ion 3174 mAh<br/>
                                        Sạc nhanh 15W, 50% trong 30 phút (quảng cáo)<br/>
                                        USB Power Delivery 2.0
                                    </td>
                                </tr>
                                <tr>
                                    <td>Pin có thể tháo rời:</td>
                                    <td>Không</td>
                                </tr>
                                <tr>
                                    <td colspan="2">Kết nối &amp; Cổng giao tiếp</td>
                                </tr>
                                <tr>
                                    <td>3G:</td>
                                    <td>có</td>
                                </tr>
                                <tr>
                                    <td>4G:</td>
                                    <td>Có</td>
                                </tr>
                                <tr>
                                    <td>Loại Sim:</td>
                                    <td>1 SIM - 2 SIM (tùy phiên bản thị trường), Dual SIM (Nano-SIM, dual
                                        stand-by)
                                        thị
                                        trường Trung Quốc
                                    </td>
                                </tr>
                                <tr>
                                    <td>Khe gắn Sim:</td>
                                    <td>1 SIM - 2 SIM (tùy phiên bản thị trường), Dual SIM (Nano-SIM, dual
                                        stand-by)
                                        thị
                                        trường Trung Quốc
                                    </td>
                                </tr>
                                <tr>
                                    <td>Wifi:</td>
                                    <td>Wi-Fi 802.11 a/b/g/n/ac, dual-band, hotspot</td>
                                </tr>
                                <tr>
                                    <td>GPS:</td>
                                    <td>Yes, with A-GPS, GLONASS, GALILEO, QZSS</td>
                                </tr>
                                <tr>
                                    <td>Bluetooth:</td>
                                    <td>5.0, A2DP, LE</td>
                                </tr>
                                <tr>
                                    <td>GPRS/EDGE:</td>
                                    <td>Có</td>
                                </tr>
                                <tr>
                                    <td>Jack tai nghe:</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>NFC:</td>
                                    <td>Có</td>
                                </tr>
                                <tr>
                                    <td>Kết nối USB:</td>
                                    <td>2.0, proprietary reversible connector</td>
                                </tr>
                                <tr>
                                    <td>Kết nối khác:</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>Cổng sạc:</td>
                                    <td>2.0, proprietary reversible connector</td>
                                </tr>
                                <tr>
                                    <td colspan="2">Giải trí &amp; Ứng dụng</td>
                                </tr>
                                <tr>
                                    <td>Xem phim:</td>
                                    <td>MP4/H.265 player</td>
                                </tr>
                                <tr>
                                    <td>Nghe nhạc:</td>
                                    <td>MP3/WAV/AAX+/AIFF/Apple Lossless player</td>
                                </tr>
                                <tr>
                                    <td>Cổng sạc:</td>
                                    <td>2.0, proprietary reversible connector</td>
                                </tr>
                                <tr>
                                    <td>Ghi âm:</td>
                                    <td>Có</td>
                                </tr>
                                <tr>
                                    <td>FM radio:</td>
                                    <td>Không</td>
                                </tr>
                                <tr>
                                    <td>Chức năng khác:</td>
                                    <td>- Face ID, accelerometer, gyro, proximity, compass, barometer<br/>
                                        - Fast battery charging: 50% in 30 min<br/>
                                        - Qi wireless charging<br/>
                                        - Siri natural language commands and dictation<br/>
                                        - iCloud cloud service<br/>
                                        - Audio/video/photo editor<br/>
                                        - Document editor
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="product-video-box">
                    <div class="product-video-title">Video đánh giá &amp; review iPhone XS Max Cũ (64GB, 256GB) -
                        Fullbox
                    </div>
                    <div class="product-video-content" id="slider_video_home">
                        <div class="iframe" data-iframe="https://www.youtube.com/watch?v=DI7E08OOzVk&amp;t=94s">
                        </div>
                        <div class="slide_video owl-carousel" id="slide_video">
                            <div class="item" data-iframe="https://www.youtube.com/watch?v=DI7E08OOzVk&amp;t=94s">
                                <span class="item_serial">1</span>
                            </div>
                            <div class="item" data-iframe=" https://www.youtube.com/watch?v=MmHMW_USg5E">
                                <span class="item_serial">2</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="grid wide">
            <div class="product-content-box fix-content-right">
                <div class="product-content-left">
                    <div class="product-detail product-subdetail">
                        <h2 class="product-content-title">
                            <img src="assets/img/logo3.png" alt="">
                            Đánh giá nhanh iphone XS Max
                        </h2>
                        <div class="product-detail-content css-content">
                            <p style="text-align: justify;"><strong>iPhone XS Max cũ</strong> chính hãng, giá rẻ
                                nhất Hà
                                Nội, Đà
                                Nẵng, TP HCM. Mua iPhone XS Max cũ xách tay trả góp lãi suất thấp. Bán iPhone XS Max
                                cũ
                                xách tay
                                BH 12 tháng chính hãng.</p>
                            <h2 id="mcetoc_1d6apkjha0" style="text-align: justify;">iPhone XS Max cũ - Sự hoàn hảo
                                trên
                                một
                                chiếc smartphone</h2>
                            <p style="text-align: justify;">Bộ ba siêu phẩm iPhone chính thức ra mắt người dùng vào
                                ngày
                                13/9
                                vừa qua. Với hàng loạt công nghệ tiên tiến cùng những nâng cấp về phần cứng, <a
                                        href="../../../apple/iphone-xs-max-cu.html" target="_blank"
                                        rel="noopener noreferrer"><strong>iPhone XS Max cũ</strong></a> xứng đáng là
                                chiếc
                                smartphone cao cấp nhất trên thị trường hiện nay. Hãy cùng MobileCity đánh giá chi
                                tiết
                                chiếc
                                smartphone này nhé!</p>
                            <p style="text-align: justify;">
                                <iframe src="https://www.youtube.com/embed/axvnuPnzLHw"
                                        width="100%" height="350" frameborder="0"
                                        allowfullscreen="allowfullscreen"></iframe>
                            </p>
                            <h3 id="mcetoc_1d6apkjha1" style="text-align: justify;">iPhone XS Max cũ sở hữu thiết kế
                                thời thượng
                                cùng màn hình cực lớn</h3>
                            <p style="text-align: justify;">iPhone XS Max cũ là chiếc smartphone được trang bị màn
                                hình
                                lớn nhất
                                từ trước tới giờ của Apple. Dù sở hữu màn hình tràn viền 6.5 inch nhưng kích thước
                                tổng
                                của
                                chiếc iPhone XS Max cũ chỉ tương đương iPhone 8 nhờ tỷ lệ màn hình 19.5:9. Bên cạnh
                                đó,
                                iPhone
                                XS Max cũ sở hữu tấm nền Super Retina OLED cùng những công nghệ hiển thị hình ảnh
                                HDR10,
                                Dolby
                                Vision giúp hình ảnh hiển thị một cách sống động, chân thực hơn bao giờ hết.</p>
                            <table class="sudo-content-img">
                                <tbody>
                                <tr class="sudo-content-img-item">
                                    <td><img class="lazy" title="iPhone XS Max cũ"
                                             src="https://mobilecity.vn/public/assets/img/load_video.svg"
                                             data-original="https://cdn.mobilecity.vn/mobilecity-vn/images/2018/10/iPhone-XS-Max-cu-1.jpg"
                                             alt="iPhone XS Max cũ" data-id="19681"/></td>
                                </tr>
                                </tbody>
                            </table>
                            <p style="text-align: justify;">Về thiết kế, iPhone XS Max cũ vẫn giữ nguyên thiết kế so
                                với
                                iPhone
                                X với màn hình tai thỏ, mặt kính và khung thép không gỉ. Ngoài ra, Apple đã chăm
                                chút
                                từng đường
                                nét, góc cạnh của chiếc smartphone này để biến nó trở thành biểu tượng của sự hoàn
                                hảo
                                trong
                                thiết kế.</p>
                            <h3 id="mcetoc_1d6apkjha2" style="text-align: justify;">iPhone XS Max cũ có hiệu năng
                                cực
                                "khủng"
                            </h3>
                            <p style="text-align: justify;">Cả ba chiếc smartphone của Apple đều được trang bị
                                chipset
                                A12
                                Bionic mới nhất từ Apple. Đây là bộ vi xử lý đầu tiên được xây dựng trên tiến trình
                                7nm
                                và được
                                đánh giá là con chip mạnh mẽ nhất từ trước tới giờ. Cụ thể, chúng tôi đã sử dụng
                                công cụ
                                Geekbench 4 để kiểm tra hiệu năng của máy. Theo đó, iPhone XS Max cũ đạt 11.515
                                điểm, bỏ
                                xa tất
                                cả các đối thủ khác.</p>
                            <table class="sudo-content-img">
                                <tbody>
                                <tr class="sudo-content-img-item">
                                    <td><img class="lazy" title="iPhone XS Max cũ"
                                             src="https://mobilecity.vn/public/assets/img/load_video.svg"
                                             data-original="https://cdn.mobilecity.vn/mobilecity-vn/images/2018/10/iphone-xs-max-cu-2.jpg"
                                             alt="iPhone XS Max cũ" data-id="19682"/></td>
                                </tr>
                                </tbody>
                            </table>
                            <p style="text-align: justify;">Trên thực tế, khi trải nghiệm các tựa game khủng, game
                                3D,
                                máy đều
                                xử lý cực kỳ mượt mà. Điều này giúp mang lại những trải nghiệm vô cùng tuyệt vời cho
                                người dùng.
                            </p>
                            <h3 id="mcetoc_1d6apkjha3" style="text-align: justify;">Đánh giá Camera iPhone XS Max
                                cũ:
                                Điểm nâng
                                cấp đáng giá nhất</h3>
                            <p style="text-align: justify;">iPhone XS Max cũ được trang bị camera kép ở mặt sau. Cảm
                                biến chính
                                độ phân giải 12MP, khẩu độ f/1.8 cùng cảm biến tele 12MP khẩu độ f/2.4 có hỗ trợ OIS
                                cho
                                khả
                                năng chụp góc rộng cực tốt.</p>
                            <table class="sudo-content-img">
                                <tbody>
                                <tr class="sudo-content-img-item">
                                    <td><img class="lazy" title="iPhone XS Max cũ"
                                             src="https://mobilecity.vn/public/assets/img/load_video.svg"
                                             data-original="https://cdn.mobilecity.vn/mobilecity-vn/images/2018/10/iphone-xs-max-cu-3.jpg"
                                             alt="iPhone XS Max cũ" data-id="19683"/></td>
                                </tr>
                                </tbody>
                            </table>
                            <p style="text-align: justify;">Con chip thần kinh thế hệ mới được trang bị trên chiếc
                                smartphone
                                này có khả năng thực hiện 1 ngàn tỷ phép toán mỗi giây. Nhờ đó, camera của máy nhận
                                biết
                                chủ thể
                                một cách rõ ràng, xóa phông tốt hơn và có thể chụp trong mọi điều kiện ánh sáng.</p>
                            <h3 id="mcetoc_1d6apkjha4" style="text-align: justify;">Thời lượng pin iPhone XS Max cũ
                                được
                                gia
                                tăng đáng kể</h3>
                            <p style="text-align: justify;">Với việc trang bị cho chiếc smartphone của mình viên pin
                                3.174 mAh,
                                Apple đã giải quyết được điểm yếu về pin trên một chiếc iPhone. Đây cũng là viên pin
                                có
                                dung
                                lượng lớn nhất được Apple trang bị cho một chiếc <a
                                        href="../../../dien-thoai-apple/" target="_blank"
                                        rel="noopener noreferrer"><strong>iPhone cũ</strong></a>. Nhờ đó,
                                người dùng
                                có thể thỏa sức lướt web, xem phim, sử dụng các tác vụ cơ bản trong suốt 1.5 ngày
                                liên
                                tục.</p>
                            <table class="sudo-content-img">
                                <tbody>
                                <tr class="sudo-content-img-item">
                                    <td><img class="lazy" title="iPhone XS Max cũ"
                                             src="https://mobilecity.vn/public/assets/img/load_video.svg"
                                             data-original="https://cdn.mobilecity.vn/mobilecity-vn/images/2018/10/iphone-xs-max-cu-4.jpg"
                                             alt="iPhone XS Max cũ" data-id="19684"/></td>
                                </tr>
                                </tbody>
                            </table>
                            <h2 id="mcetoc_1d6apkjha5" style="text-align: justify;">Cảm nhận thực tế trên tay iPhone
                                XS
                                Max cũ
                            </h2>
                            <p style="text-align: justify;">Sau gần 1 tháng trải nghiệm chiếc điện thoại này, có thể
                                nói
                                đây
                                chính là chiếc smartphone hoàn hảo về mọi mặt từ thiết kế cho tới các phần cứng bên
                                trong. Máy
                                đem lại một trải nghiệm tuyệt vời, đặc biệt là khi chơi game và chụp ảnh. Nếu bạn
                                vẫn
                                băn khoăn
                                có nên mua iPhone XS Max cũ hay không, hãy đến cửa hàng gần nhất của Mobile City để
                                trải
                                nghiệm
                                sản phẩm nhé!</p>
                            <table class="sudo-content-img">
                                <tbody>
                                <tr class="sudo-content-img-item">
                                    <td><img class="lazy" title="iPhone XS Max cũ"
                                             src="https://mobilecity.vn/public/assets/img/load_video.svg"
                                             data-original="https://cdn.mobilecity.vn/mobilecity-vn/images/2018/10/iphone-xs-max-cu-5.jpg"
                                             alt="iPhone XS Max cũ" data-id="19685"/></td>
                                </tr>
                                </tbody>
                            </table>
                            <h3 id="mcetoc_1d6apkjha6" style="text-align: justify;">Giá iPhone XS Max cũ bao nhiêu
                                hiện
                                nay?
                            </h3>
                            <p style="text-align: justify;">iPhone XS Max cũ có giá như thế nào đang là vấn đề mà
                                rất
                                nhiều
                                người dùng quan tâm. Hiện nay, Mobile City là chuỗi cửa hàng có mức giá iPhone XS
                                Max cũ
                                tốt
                                nhất trên thị trường. Không những thế, bạn còn nhận được rất nhiều ưu đãi cùng các
                                chương trình
                                bảo hành hấp dẫn của cửa hàng.</p>
                            <p style="text-align: center;"></p>
                            <p></p>
                            <p></p>

                        </div>
                        <div class="product-detail-show">
                            <button class="product-detail-view product-detail-viewall">
                                <i class="fa fa-long-arrow-down"></i> Xem thêm chi tiết bài viết
                            </button>
                            <button class="product-detail-view product-detail-viewdefault">
                                <i class="fa fa-long-arrow-up"></i> Ẩn bớt chi tiết bài viết
                            </button>
                        </div>
                    </div>
                    <div class="product-detail product-subdetail">
                        <h2 class="product-content-title">
                            <img src="assets/img/logo3.png" alt="">
                            So sánh iPhone XS Max và Samsung Note 10 Plus, Kẻ 5 lạng người nửa cân !!!
                        </h2>
                        <div class="product-detail-content css-content">
                            <p>Với mức giá ngang ngửa nhau ở thời điểm hiện tại thì anh em sẽ lựa chọn sản phẩm <a
                                    href="https://mobilecity.vn/samsung/samsung-galaxy-note-10-plus-cu.html">Samsung
                                Note 10
                                Plus</a> hay <a href="https://mobilecity.vn/apple/iphone-xs-max-cu.html">iPhone
                                XS
                                Max</a>
                                đến từ nhà táo? Chắc hẳn không ít anh em khó có thể đưa ra lựa chọn cho bản thân!
                                Vậy
                                mời anh em
                                cùng tham khảo trong video sau để có thể đưa ra lựa chọn cho riêng mình!</p>
                            <p style="text-align: center;">
                                <iframe src="//www.youtube.com/embed/8HfhbUC3UFs"
                                        width="560" height="314" allowfullscreen="allowfullscreen"></iframe>
                            </p>
                            <p></p>
                            <p></p>
                            <div id="WidgetFloaterPanels" class="LTRStyle"
                                 style="display: none; text-align: left; direction: ltr; visibility: hidden;"
                                 translate="no">
                                <div id="WidgetFloater" style="display: none;">
                                    <div id="WidgetLogoPanel"><span id="WidgetTranslateWithSpan">TRANSLATE with <img
                                            class="lazy" id="FloaterLogo"/></span> <span id="WidgetCloseButton"
                                                                                         title="Exit Translation">x</span>
                                    </div>
                                    <div id="LanguageMenuPanel">
                                        <div class="DDStyle_outer"><input id="LanguageMenu_svid"
                                                                          style="display: none;" autocomplete="on"
                                                                          name="LanguageMenu_svid"
                                                                          type="text" value="en"/>
                                            <input id="LanguageMenu_textid" style="display: none;" autocomplete="on"
                                                   name="LanguageMenu_textid" type="text"/> <span
                                                    id="__LanguageMenu_header" class="DDStyle"
                                                    tabindex="0">English</span>
                                            <div style="position: relative; text-align: left; left: 0;">
                                                <div style="position: absolute; ;left: 0px;">
                                                    <div id="__LanguageMenu_popup" class="DDStyle"
                                                         style="display: none;">
                                                        <table id="LanguageMenu" border="0">
                                                            <tbody>
                                                            <tr>
                                                                <td><a tabindex="-1" href="#ar">Arabic</a></td>
                                                                <td><a tabindex="-1" href="#he">Hebrew</a></td>
                                                                <td><a tabindex="-1" href="#pl">Polish</a></td>
                                                            </tr>
                                                            <tr>
                                                                <td><a tabindex="-1" href="#bg">Bulgarian</a>
                                                                </td>
                                                                <td><a tabindex="-1" href="#hi">Hindi</a></td>
                                                                <td><a tabindex="-1" href="#pt">Portuguese</a>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td><a tabindex="-1" href="#ca">Catalan</a></td>
                                                                <td><a tabindex="-1" href="#mww">Hmong Daw</a>
                                                                </td>
                                                                <td><a tabindex="-1" href="#ro">Romanian</a>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td><a tabindex="-1" href="#zh-CHS">Chinese
                                                                    Simplified</a>
                                                                </td>
                                                                <td><a tabindex="-1" href="#hu">Hungarian</a>
                                                                </td>
                                                                <td><a tabindex="-1" href="#ru">Russian</a></td>
                                                            </tr>
                                                            <tr>
                                                                <td><a tabindex="-1" href="#zh-CHT">Chinese
                                                                    Traditional</a>
                                                                </td>
                                                                <td><a tabindex="-1" href="#id">Indonesian</a>
                                                                </td>
                                                                <td><a tabindex="-1" href="#sk">Slovak</a></td>
                                                            </tr>
                                                            <tr>
                                                                <td><a tabindex="-1" href="#cs">Czech</a></td>
                                                                <td><a tabindex="-1" href="#it">Italian</a></td>
                                                                <td><a tabindex="-1" href="#sl">Slovenian</a>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td><a tabindex="-1" href="#da">Danish</a></td>
                                                                <td><a tabindex="-1" href="#ja">Japanese</a>
                                                                </td>
                                                                <td><a tabindex="-1" href="#es">Spanish</a></td>
                                                            </tr>
                                                            <tr>
                                                                <td><a tabindex="-1" href="#nl">Dutch</a></td>
                                                                <td><a tabindex="-1" href="#tlh">Klingon</a>
                                                                </td>
                                                                <td><a tabindex="-1" href="#sv">Swedish</a></td>
                                                            </tr>
                                                            <tr>
                                                                <td><a tabindex="-1" href="#en">English</a></td>
                                                                <td><a tabindex="-1" href="#ko">Korean</a></td>
                                                                <td><a tabindex="-1" href="#th">Thai</a></td>
                                                            </tr>
                                                            <tr>
                                                                <td><a tabindex="-1" href="#et">Estonian</a>
                                                                </td>
                                                                <td><a tabindex="-1" href="#lv">Latvian</a></td>
                                                                <td><a tabindex="-1" href="#tr">Turkish</a></td>
                                                            </tr>
                                                            <tr>
                                                                <td><a tabindex="-1" href="#fi">Finnish</a></td>
                                                                <td><a tabindex="-1" href="#lt">Lithuanian</a>
                                                                </td>
                                                                <td><a tabindex="-1" href="#uk">Ukrainian</a>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td><a tabindex="-1" href="#fr">French</a></td>
                                                                <td><a tabindex="-1" href="#ms">Malay</a></td>
                                                                <td><a tabindex="-1" href="#ur">Urdu</a></td>
                                                            </tr>
                                                            <tr>
                                                                <td><a tabindex="-1" href="#de">German</a></td>
                                                                <td><a tabindex="-1" href="#mt">Maltese</a></td>
                                                                <td><a tabindex="-1" href="#vi">Vietnamese</a>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td><a tabindex="-1" href="#el">Greek</a></td>
                                                                <td><a tabindex="-1" href="#no">Norwegian</a>
                                                                </td>
                                                                <td><a tabindex="-1" href="#cy">Welsh</a></td>
                                                            </tr>
                                                            <tr>
                                                                <td><a tabindex="-1" href="#ht">Haitian
                                                                    Creole</a>
                                                                </td>
                                                                <td><a tabindex="-1" href="#fa">Persian</a></td>
                                                                <td></td>
                                                            </tr>
                                                            </tbody>
                                                        </table>
                                                        <img class="lazy"
                                                             style="height: 7px; width: 17px; border-width: 0px; left: 20px;"
                                                             alt=""/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="CTFLinksPanel"><span id="ExternalLinksPanel"><a id="HelpLink"
                                                                                             title="Help"
                                                                                             href="https://go.microsoft.com/?linkid=9722454"
                                                                                             target="_blank"
                                                                                             rel="noopener noreferrer"> <img
                                            class="lazy"
                                            id="HelpImg"/></a> <a id="EmbedLink"
                                                                  title="Get this widget for your own site"></a> <img
                                            class="lazy"
                                            id="EmbedImg"/> <a id="ShareLink"
                                                               title="Share translated page with friends"></a> <img
                                            class="lazy"
                                            id="ShareImg"/> </span></div>
                                    <div id="FloaterProgressBar"></div>
                                </div>
                                <div id="WidgetFloaterCollapsed" style="display: none;">TRANSLATE with <img
                                        class="lazy" id="CollapsedLogoImg"/></div>
                                <div id="FloaterSharePanel" style="display: none;">
                                    <div id="ShareTextDiv"><span id="ShareTextSpan"> COPY THE URL BELOW </span>
                                    </div>
                                    <div id="ShareTextboxDiv"><input id="ShareTextbox" name="ShareTextbox"
                                                                     readonly="readonly" type="text"/> <a id="EmailLink"
                                                                                                          title="Email this translation"></a>
                                        <img class="lazy" id="EmailImg"/>
                                    </div>
                                    <div id="ShareFooter"><span id="ShareHelpSpan"><a id="ShareHelpLink"></a> <img
                                            class="lazy" id="ShareHelpImg"/></span> <span id="ShareBackSpan"><a
                                            id="ShareBack" title="Back To Translation"></a> Back</span></div>
                                    <input id="EmailSubject" name="EmailSubject" type="hidden"
                                           value="Check out this page in {0} translated from {1}"/> <input
                                        id="EmailBody" name="EmailBody" type="hidden"
                                        value="Translated: {0}%0d%0aOriginal: {1}%0d%0a%0d%0aAutomatic translation powered by Microsoft® Translator%0d%0ahttp://www.bing.com/translator?ref=MSTWidget"/>
                                    <input id="ShareHelpText" type="hidden"
                                           value="This link allows visitors to launch this page and automatically translate it to {0}."/>
                                </div>
                                <div id="FloaterEmbed" style="display: none;">
                                    <div id="EmbedTextDiv"><span id="EmbedTextSpan">EMBED THE SNIPPET BELOW IN YOUR
                                                SITE</span>
                                        <a id="EmbedHelpLink"
                                           title="Copy this code and place it into your HTML."></a>
                                        <img class="lazy" id="EmbedHelpImg"/>
                                    </div>
                                    <div id="EmbedTextboxDiv"><input id="EmbedSnippetTextBox"
                                                                     name="EmbedSnippetTextBox" readonly="readonly"
                                                                     type="text"
                                                                     value="&lt;div id='MicrosoftTranslatorWidget' class='Dark' style='color:white;background-color:#555555'&gt;&lt;/div&gt;&lt;script type='text/javascript'&gt;setTimeout(function(){var s=document.createElement('script');s.type='text/javascript';s.charset='UTF-8';s.src=((location &amp;&amp; location.href &amp;&amp; location.href.indexOf('https') == 0)?'https://ssl.microsofttranslator.com':'http://www.microsofttranslator.com')+'/ajax/v3/WidgetV3.ashx?siteData=ueOIGRSKkd965FeEGM5JtQ**&amp;ctf=true&amp;ui=true&amp;settings=manual&amp;from=en';var p=document.getElementsByTagName('head')[0]||document.documentElement;p.insertBefore(s,p.firstChild); },0);&lt;/script&gt;"/>
                                    </div>
                                    <div id="EmbedNoticeDiv"><span id="EmbedNoticeSpan">Enable collaborative
                                                features
                                                and
                                                customize widget: <a href="https://www.bing.com/widget/translator"
                                                                     target="_blank" rel="noopener noreferrer">Bing Webmaster
                                                    Portal</a></span></div>
                                    <div id="EmbedFooterDiv"><span id="EmbedBackSpan"><a
                                            title="Back To Translation">Back</a></span></div>
                                </div>
                            </div>
                        </div>
                        <div class="product-detail-show">
                            <button class="product-detail-view product-detail-viewall">
                                <i class="fa fa-long-arrow-down"></i> Xem thêm chi tiết bài viết
                            </button>
                            <button class="product-detail-view product-detail-viewdefault">
                                <i class="fa fa-long-arrow-up"></i> Ẩn bớt chi tiết bài viết
                            </button>
                        </div>
                    </div>


                </div>
                <div class="product-content-right">
                    <div class="product-summary">
                        <p class="product-summary-title">iPhone XS Max Cũ (64GB, 256GB) - Fullbox</p>
                        <p class="product-summary-price">10.150.000 ₫</p>
                        <div class="sale-box v2-promotion">
                            <p class="sale-box-title">Khuyến mãi</p>
                            <ol>
                                <li>
                                    <p>Tặng: <span style="color: #ff0000;">Cường lực -</span> <span
                                            style="color: #ff0000;">Ốp
                                                lưng - Tai nghe</span> khi mua BHV</p>
                                </li>
                                <li>
                                    <p>Giảm: <span style="color: #ff0000;">100K</span> áp dụng HSSV mua BHV tại
                                        <span style="color: #ff0000;">42 phố Vọng</span>
                                    </p>
                                </li>
                                <li>
                                    <p>Mua: Dán cường lực 5D chỉ <span style="color: #ff0000;">30K</span></p>
                                </li>
                                <li>
                                    <p>Giảm 100K khi mua BHV và đặt hàng tại: <a title="#" href="#">Đây</a></p>
                                </li>
                                <li>
                                    <p>Mua SHOPEE giá Rẻ: <a title="MobileTG Shopee" href="#" rel="nofollow"
                                                             target="_blank">CLICK</a></p>
                                </li>
                            </ol>
                        </div>
                        <a href="cart-add?id=${detail.maSP}">
                            <button class="button-add-cart btn-checkout" style="width: 100%">
                                <i class="fas fa-shopping-cart"></i>
                                THÊM VÀO GIỎ HÀNG
                            </button>
                        </a>
                        <a href="#">
                            <button class="button-buy btn-checkout" style="width: 100%">
                                MUA HÀNG NGAY
                            </button>
                        </a>
                        <div class="product-summary-address">
                            <span><strong>037.225.3243</strong> (HN)</span>
                            <span><strong>037.225.3243</strong> (HCM)</span>
                            <span><strong>037.225.3243</strong> (ĐN)</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="footer">
        <div class="grid wide">
            <div class="row">
                <!-- Footer Areas -->
                <div class="col l-3 l-4-m m-5 c-10 l-o-0 l-o-0-m c-o-1 m-o-1">
                    <div class="footer__heading">
                        <i class="footer__heading-icon fas fa-map-marker-alt"></i>
                        Hệ thống cửa hàng
                    </div>
                    <ul class="footer-areas">
                        <li class="footer-area__item">
                            <h3 class="footer-area__heading">Hồ Chí Minh</h3>
                            <ul class="footer-places">
                                <li class="footer-place__item">
                                    <div class="footer-place__item-location">
                                        Phường Linh Trung, Thủ Đức, Thành phố Hồ Chí Minh
                                        <a href="#"
                                           class="footer-place__item-link footer-place__item-link--highlight">|
                                            Xem
                                            bản đồ</a>
                                    </div>
                                    <div class="footer-place__item-contact">
                                        Điện thoại:
                                        <a href="#" class="footer-place__item-link">037.225.3243</a>
                                        -
                                        <a href="#" class="footer-place__item-link">097.123.9797</a>
                                    </div>
                                </li>
                                <li class="footer-place__item">
                                    <div class="footer-place__item-location">
                                        Phường Linh Trung, Thủ Đức, Thành phố Hồ Chí Minh
                                        <a href="#"
                                           class="footer-place__item-link footer-place__item-link--highlight">|
                                            Xem
                                            bản đồ</a>
                                    </div>
                                    <div class="footer-place__item-contact">
                                        Điện thoại:
                                        <a href="#" class="footer-place__item-link">037.225.3243</a>
                                        -
                                        <a href="#" class="footer-place__item-link">097.123.9797</a>
                                    </div>
                                </li>
                                <li class="footer-place__item">
                                    <div class="footer-place__item-location">
                                        Phường Linh Trung, Thủ Đức, Thành phố Hồ Chí Minh
                                        <a href="#"
                                           class="footer-place__item-link footer-place__item-link--highlight">|
                                            Xem
                                            bản đồ</a>
                                    </div>
                                    <div class="footer-place__item-contact">
                                        Điện thoại:
                                        <a href="#" class="footer-place__item-link">037.225.3243</a>
                                        -
                                        <a href="#" class="footer-place__item-link">097.123.9797</a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        <li class="footer-area__item">
                            <h3 class="footer-area__heading">Hà Nội</h3>
                            <ul class="footer-places">
                                <li class="footer-place__item">
                                    <div class="footer-place__item-location">
                                        Phường Linh Trung, Thủ Đức, Thành phố Hồ Chí Minh
                                        <a href="#"
                                           class="footer-place__item-link footer-place__item-link--highlight">|
                                            Xem
                                            bản đồ</a>
                                    </div>
                                    <div class="footer-place__item-contact">
                                        Điện thoại:
                                        <a href="#" class="footer-place__item-link">037.225.3243</a>
                                        -
                                        <a href="#" class="footer-place__item-link">097.123.9797</a>
                                    </div>
                                </li>
                                <li class="footer-place__item">
                                    <div class="footer-place__item-location">
                                        Phường Linh Trung, Thủ Đức, Thành phố Hồ Chí Minh
                                        <a href="#"
                                           class="footer-place__item-link footer-place__item-link--highlight">|
                                            Xem
                                            bản đồ</a>
                                    </div>
                                    <div class="footer-place__item-contact">
                                        Điện thoại:
                                        <a href="#" class="footer-place__item-link">037.225.3243</a>
                                        -
                                        <a href="#" class="footer-place__item-link">097.123.9797</a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        <li class="footer-area__item">
                            <h3 class="footer-area__heading">Đà Nẵng</h3>
                            <ul class="footer-places">
                                <li class="footer-place__item">
                                    <div class="footer-place__item-location">
                                        Phường Linh Trung, Thủ Đức, Thành phố Hồ Chí Minh
                                        <a href="#"
                                           class="footer-place__item-link footer-place__item-link--highlight">|
                                            Xem
                                            bản đồ</a>
                                    </div>
                                    <div class="footer-place__item-contact">
                                        Điện thoại:
                                        <a href="#" class="footer-place__item-link">037.225.3243</a>
                                        -
                                        <a href="#" class="footer-place__item-link">097.123.9797</a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>

                <!-- Footer Policy -->
                <div class="col l-3 l-4-m m-5 c-10 l-o-0 l-o-0-m c-o-1 m-o-1">
                    <div class="footer__heading">
                        <i class="footer__heading-icon far fa-question-circle"></i>
                        Quy định - chính sách
                    </div>

                    <ul class="footer-policy__list">
                        <li class="footer-policy__item">
                            <a href="./trangbaohanh.html" class="footer-policy__link">Chính sách bảo hành</a>
                        </li>
                        <li class="footer-policy__item">
                            <a href="#" class="footer-policy__link">Chính sách vận chuyển</a>
                        </li>
                        <li class="footer-policy__item">
                            <a href="#" class="footer-policy__link">Chính sách đổi trả hàng</a>
                        </li>
                        <li class="footer-policy__item">
                            <a href="#" class="footer-policy__link">Chính sách bảo mật thông tin</a>
                        </li>
                        <li class="footer-policy__item">
                            <a href="#" class="footer-policy__link">Hướng dẫn thanh toán</a>
                        </li>
                        <li class="footer-policy__item">
                            <a href="#" class="footer-policy__link">Hướng dẫn mua hàng Online</a>
                        </li>
                        <li class="footer-policy__item">
                            <a href="#" class="footer-policy__link">Dịch vụ Ship COD Toàn quốc</a>
                        </li>
                        <li class="footer-policy__item">
                            <a href="#" class="footer-policy__link">Chính sách đại lý linh, phụ kiện</a>
                        </li>
                        <li class="footer-policy__item">
                            <a href="#" class="footer-policy__link">Sitemap</a>
                        </li>
                    </ul>
                </div>

                <!-- Footer Subscribe -->
                <div class="col l-3 l-4-m m-5 c-10 l-o-0 l-o-0-m c-o-1 m-o-1">
                    <div class="footer__heading">
                        <i class="footer__heading-icon far fa-envelope"></i>
                        Đăng ký nhận bảng tin
                    </div>

                    <div class="footer-mail">
                        <form action="">
                            <input type="text" required placeholder="Nhập email của bạn..." name="" id=""
                                   class="footer-mail__input">
                            <button class="footer-mail__btn">Gửi</button>
                        </form>
                    </div>

                    <div class="footer-linked">
                        <h3 class="footer-linked__heading">
                            <i class="footer-linked__icon fas fa-link"></i>
                            Liên kết
                        </h3>

                        <ul class="footer-associates">
                            <li class="footer-associate__item">
                                <i
                                        class="footer-associate__icon footer-associate__icon--facebook fab fa-facebook"></i>
                                <a href="https://www.facebook.com/khiem.1604/" target="_blank"
                                   class="footer-associate__link">
                                    Facebook
                                </a>
                            </li>
                            <li class="footer-associate__item">
                                <i
                                        class="footer-associate__icon footer-associate__icon--youtube fab fa-youtube"></i>
                                <a href="" target="_blank" class="footer-associate__link">
                                    Youtube
                                </a>
                            </li>
                        </ul>
                    </div>


                </div>
                <div class="col l-3 l-4-m m-5 c-10 l-o-0 l-o-0-m c-o-1 m-o-1" style="padding: 65px 45px;">
                    <div class="footer-certification"></div>
                    <div class="footer-power"></div>
                </div>
            </div>
        </div>

        <div class="footer-text">Lê Trọng Khiêm - Lê Hoàng Ân - Tằng Minh Thuận</div>

        <ul class="footer-nav-mobile__list">
            <li class="footer-nav-mobile__item">
                <a href="#" class="footer-nav-mobile__link">
                    <i class="footer-nav-mobile__icon fas fa-home"></i>
                    <span class="footer-nav-mobile__title">Trang chủ</span>
                </a>
            </li>
            <li class="footer-nav-mobile__item">
                <a href="#" class="footer-nav-mobile__link">
                    <i class="footer-nav-mobile__icon fas fa-shopping-cart"></i>
                    <span class="footer-nav-mobile__title">Giỏ hàng</span>
                    <span class="footer-nav-mobile__number">0</span>
                </a>
            </li>
            <li class="footer-nav-mobile__item">
                <a href="#" class="footer-nav-mobile__link">
                    <i class="footer-nav-mobile__icon fas fa-bell"></i>
                    <span class="footer-nav-mobile__title">Thông báo</span>
                    <span class="footer-nav-mobile__number">0</span>
                </a>
            </li>
            <li class="footer-nav-mobile__item">
                <a href="#" class="footer-nav-mobile__link">
                    <i class="footer-nav-mobile__icon fas fa-user"></i>
                    <span class="footer-nav-mobile__title">Tài khoản</span>
                </a>
            </li>
        </ul>
    </div>
</div>

<script type="text/javascript" src="assets/trangitem/js/function.js"></script>
<script type="text/javascript" src="assets/trangitem/js/owl.carousel.js"></script>
<script type="text/javascript" src="assets/trangitem/js/lightslider.js"></script>
<script type="text/javascript" src="assets/trangitem/js/lightgallery-all.min.js"></script>
<script type="text/javascript" src="assets/trangitem/js/function.js"></script>
<script type="text/javascript" src="assets/trangitem/js/phone.js"></script>
<script type="text/javascript">


</script>
</body>

</html>