<%--
  Created by LeTrongKhiem.
  User: User
  Date: 03-Dec-21
  Time: 7:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang bảo hành</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">

    <link rel="stylesheet" href="<c:url value='assets/font/fontawesome-free-5.15.3-web/css/all.min.css'/>">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="icon" href="<c:url value= './assets/img/logo3.png'/>">

    <link rel="stylesheet" href="<c:url value= './assets/css/base.css'/>">
    <link rel="stylesheet" href="<c:url value= './assets/css/main.css'/>">
    <link rel="stylesheet" href="<c:url value= './assets/css/grid.css'/>">
    <link rel="stylesheet" href="<c:url value= './assets/css/responsive.css'/>">
    <link rel="stylesheet" href="<c:url value= './assets/css/mobile.css'/>">
</head>

<body>
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
                                <a href="#" class="header-nav__log-link">Tra cứu bảo hành</a>
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

                <a href="./index.html" class="header-logo__link">
                    <!-- <div class="header-logo__img">TG Mobile</div> -->
                    <div class="header-mobile-nav__logo1" style="background-image: url('./assets/img/logo3.png');">
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
                    <input type="text" placeholder="Nhập tên sản phẩm..." class="header-mobile-search-box__input">
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
                <div class="header-mobile-nav__logo">
                    TG Mobile
                </div>
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
        <div class="container">
            <ol class="breadcrumb" itemscope itemtype="http://schema.org/BreadcrumbList">
                <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
                    <a itemprop="item" href="./index.html"><span itemprop="name" content="Trang chủ"><i
                            class="fas fa-home"></i></i> Trang chủ</span></a>
                    <meta itemprop="position" content="1"/>
                </li>

                <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
                    <i class="fa fa-angle-right"></i> <a itemprop="item" href="/mobile.html"
                                                         title="Điện thoại di động gi&#225; rẻ, ch&#237;nh h&#227;ng - Ho&#224;ng H&#224; Mobile"
                                                         class="actived"><span itemprop="name"
                                                                               content="Tra cứu bảo hành">Tra cứu bảo hành</span></a>
                    <meta itemprop="position" content="2"/>
                </li>
            </ol>
        </div>
        <div class="header__container">
            <h3>Tra cứu bảo hành</h3>
        </div>
        <div class="footer-mail">
            <form action="">
                <input type="text" required placeholder="Nhập số điện thoại của bạn..." name="" id=""
                       class="footer-mail__input" style="margin-right: 20px; height: 34px;">
                <input type="text" required placeholder="Nhập imei..." name="" id=""
                       class="footer-mail__input" style="margin-right: 20px; height: 34px;">
                <button class="footer-mail__btn" style="height: 34px; width: 90px">Tra cứu</button>
            </form>
        </div>
        <div class="v2-banner-search">
            <img src="./assets/img/tra-cuu-bao-hanh.jpg" alt="">
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
                                    <a href="#" class="footer-place__item-link footer-place__item-link--highlight">|
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
                                    <a href="#" class="footer-place__item-link footer-place__item-link--highlight">|
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
                                    <a href="#" class="footer-place__item-link footer-place__item-link--highlight">|
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
                                    <a href="#" class="footer-place__item-link footer-place__item-link--highlight">|
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
                                    <a href="#" class="footer-place__item-link footer-place__item-link--highlight">|
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
                                    <a href="#" class="footer-place__item-link footer-place__item-link--highlight">|
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
                        <a href="#" class="footer-policy__link">Chính sách bảo hành</a>
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
                            <i class="footer-associate__icon footer-associate__icon--facebook fab fa-facebook"></i>
                            <a href="https://www.facebook.com/khiem.1604/" target="_blank"
                               class="footer-associate__link">
                                Facebook
                            </a>
                        </li>
                        <li class="footer-associate__item">
                            <i class="footer-associate__icon footer-associate__icon--youtube fab fa-youtube"></i>
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

<!-- Button -->
<a href="#" class="go-to-top">
    <i class="go-to-top__icon fas fa-chevron-circle-up"></i>
</a>

<a href="#" class="go-to-chat">
    <i class="go-to-chat__icon fab fa-facebook-messenger"></i>
</a>
</body>

</html>