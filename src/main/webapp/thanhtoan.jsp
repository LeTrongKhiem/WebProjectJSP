<%@ page import="java.text.DecimalFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"
           uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
%>
<%@include file="common/taglib.jsp" %>
<%--<jsp:useBean id="cart" scope="request" type="vn.edu.hcmuaf.fit.lab5.beans.Cart"/>--%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>Material Design for Bootstrap</title>
    <!-- MDB icon -->
    <link rel="icon" href="img/mdb-favicon.ico" type="image/x-icon" />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css" />
    <!-- Google Fonts Roboto -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" />
    <!-- MDB ESSENTIAL -->
    <link rel="stylesheet" href="ventor/css/mdb.min.css" />
    <!-- MDB PLUGINS -->
    <link rel="stylesheet" href="ventor/plugins/css/all.min.css" />
    <!-- Custom styles -->
    <link rel="stylesheet" href="assets/css/main.css">
    <link rel="stylesheet" href="assets/css/base.css">
    <link rel="stylesheet" href="assets/css/grid.css">
    <link rel="stylesheet" href="assets/css/thanhtoan.css">
    <link rel="stylesheet" href="assets/css/responsive.css">
    
   
   
    <style>

    </style>
</head>

<body>

    <!-- Container for demo purpose -->
    <!--Main Navigation-->
    <div class="header" id="header">
        <div class="header-nav">
            <div class="grid wide no-margin" >
                <div class="row" >
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
                              
                                <!-- <li class="header-nav__log-item">
                                    <a href="#" class="header-nav__log-link">Đăng nhập</a>
                                </li>
                                <li class="header-nav__log-item">
                                    <a href="#" class="header-nav__log-link">Đăng ký</a>
                                </li> -->
                               
                                <li class="header__navbar-items">
                                    <a href="#" class="header__navbar-items-link ">
                                        <i class="header__navbar--icon fas fa-bell"></i>
                                        Thông báo

                                        
                                    </a>
                                </li>
                                <li class="header__navbar-items header__navbar-user header__navbar-items--separate">
                                    <img src="https://avatar-redirect.appspot.com/google/108477473411482458497?size=400"
                                        alt="" class="header__navbar-user-img">
                                    <span class="header__navbar-user-name"> Hoàng Ân</span>
                                    <ul class="header__navbar-user-menu">
                                        <li class="header__navber-user-item">
                                            <a href="" class="header-nav__log-link">Tài khoản của tôi</a>
                                        </li>
                                        <li class="header__navber-user-item">
                                            <a href="" class="header-nav__log-link">Tra cứu bảo hành</a>
                                        </li>
                                        <li class="header__navber-user-item">
                                            <a href="" class="header-nav__log-link">Đơn đặt hàng</a>
                                        </li>
                                        <li class="header__navber-user-item">
                                            <a href="" class="header-nav__log-link">Lịch sử mua hàng</a>
                                        </li>
                                        <li class="header__navber-user-item">
                                            <a href="" class="header-nav__log-link">Lịch sử sữa chữa</a>
                                        </li>
                                        <li class="header__navber-user-item">
                                            <a href="" class="header-nav__log-link">Sổ địa chỉ</a>
                                        </li>
                                        <li class="header__navber-user-item header__navber-user-item--separate">
                                            <a href="" class="header-nav__log-link">Đăng xuất</a>
                                        </li>
                                        
                                    </ul>
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
                        <div class="header-mobile-nav__logo1" style="background-image: url('./assets/img/logo3.png');">
                        </div>
                    </a>

                    <div class="header-search hide-on-mobile-and-tablet">
                        <input type="text" placeholder="Nhập tên sản phẩm..." class="header-search__input">
                        <i class="header-search__icon fas fa-search"></i>
                    </div>

                    <ul class="header-menu hide-on-mobile-and-tablet">

                        <!-- Menu Mobile -->
                        <li class="header-menu__item" >
                            <a href="mobile.html" class="header-menu__item-link">
                                <i class="header-menu__item-icon fas fa-mobile-alt"></i>
                                <p class="header-menu__item-name">Điện thoại</p>
                            </a>

                            <div class="header-sub-menu" id="mobile">
                                <div class="grid">
                                    <div class="row">
                                        <div class="col l-9 m-9">
                                            <h3 class="header-sub-menu__title">Hãng sản xuất</h3>
                                            <div class="row" id="apple">
                                                <div class="col l-4 m-4" >
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

                                        <div class="col l-3 m-4" id="price">
                                            <h3 class="header-sub-menu__title">Mức giá</h3>
                                            <div class="row" >
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
                            <a href="tranglaptop.html" class="header-menu__item-link">
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
                            <a href="trangunlock.html" class="header-menu__item-link">
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
                <a href="#" class="header-logo__link">
                    <div class="header-mobile-nav__logo1" style="background-image: url('./assets/img/logo3.png');">
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
    <!--Main Navigation-->

    <!--Main layout-->
    <main class="mb-6 mt-5 ">
        <div class="container">
            <div class="py-5 text-center header_checkout">
                <i class="fa fa-credit-card" aria-hidden="true"></i>
                <h2 class="header-checkout__heading">Thanh toán</h2>
                <p class="header-checkout__p">Vui lòng kiểm tra thông tin Khách hàng, thông tin Giỏ hàng trước khi Đặt hàng.</p>
            </div>
            <!-- Section: Checkout form -->
           <div class="grid wide">
            <section class="checkout">
               
                <div class="row gx-lg-5">
                    <div class="col-lg-8 mb-4 mb-md-0">
                        <!-- Section: Biling details -->
                        <section class="">
                            <form action="<%=request.getContextPath()+"/order"%>" method="post">
                                <h5 class="mb-4">Thông tin khách hàng</h5>

                                <!-- 2 column grid layout with text inputs for the first and last names -->

                                <div class="form-outline mb-4 d-flex align-items-center">
                                    <input type="text" id="form6Example1" class="form-control" name="name" />
                                    <label class="form-label" for="form6Example1">Họ và tên</label>
                                </div>
                                <!-- Text input -->


                                <!-- Text input -->
                                <div class="form-outline mb-4">
                                    <input type="text" id="form6Example4" class="form-control" name="address" />
                                    <label class="form-label" for="form6Example4">Địa chỉ</label>
                                </div>

                                <!-- Email input -->
                                <div class="form-outline mb-4">
                                    <input type="email" id="form6Example5" class="form-control" name="email"/>
                                    <label class="form-label" for="form6Example5">Email</label>
                                </div>

                                <!-- Number input -->
                                <div class="form-outline mb-4">
                                    <input type="text" id="form6Example6" class="form-control" name="phoneNumber"/>
                                    <label class="form-label" for="form6Example6" >Số điện thoại</label>
                                </div>

                                <!-- Message input -->
<%--                                <h5 class="mb-4">Hình thức thanh toán</h5>--%>

<%--                                <div class="d-block my-3">--%>
<%--                                    <div class="custom-control custom-radio">--%>
<%--                                        <input id="httt-1" name="httt_ma" type="radio" class="custom-control-input"--%>
<%--                                            required="" value="1">--%>
<%--                                        <label class="custom-control-label" for="httt-1">Tiền mặt</label>--%>
<%--                                    </div>--%>
<%--                                    <div class="custom-control custom-radio">--%>
<%--                                        <input id="httt-2" name="httt_ma" type="radio" class="custom-control-input"--%>
<%--                                            required="" value="2">--%>
<%--                                        <label class="custom-control-label" for="httt-2">Chuyển khoản</label>--%>
<%--                                    </div>--%>
<%--                                    <div class="custom-control custom-radio">--%>
<%--                                        <input id="httt-3" name="httt_ma" type="radio" class="custom-control-input"--%>
<%--                                            required="" value="3">--%>
<%--                                        <label class="custom-control-label" for="httt-3">Ship COD</label>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <hr class="mb-4">--%>
                                <button class="btn btn-primary btn-lg btn-block  btn-rounded w-100 ripple-surface btn-checkout"
                                    type="submit" name="btnDatHang">Đặt
                                    hàng</button>

                            </form>
                        </section>
                        <!-- Section: Biling details -->
                    </div>

                    <div class="col-lg-4 mb-4 mb-md-0 m-0">
                        <!-- Section: Summary -->
                        <section class="shadow-4 p-4 rounded-5 mb-4">
                            <h5 class="mb-4">Thanh toán</h5>

                            <div class="d-flex justify-content-between mb-3">
                                <span>Tạm tính</span>
                                <span>${cart.total}</span>
                            </div>
                            <div class="d-flex justify-content-between">
                                <span>Phí vận chuyển</span>
                                <span>Miễn phí</span>
                            </div>
                            <hr class="my-4" />
                            <div class="d-flex justify-content-between fw-bold mb-4">
                                <span>Tổng thành tiền</span>
                                <span>${cart.total}</span>
                            </div>



                            <!-- Section: Summary -->

                            <!-- Section: Summary -->



                            <div class="d-flex align-items-center">
                                <input type="text" class="form-control rounded me-1" placeholder="Mã giảm giá" />
                                <button type="button" class="btn btn-link btn-rounded overflow-visible w-50 btn-sale ">
                                    Xác nhận
                                </button>
                            </div>
                        </section>
                        <!-- Section: Summary -->
                    </div>
                </div>
            </section>
           </div>
            <!-- Section: Checkout form -->
        </div>
    </main>
    <!--Main layout-->
    <div class="footer" id="footer">
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
                                            class="footer-place__item-link footer-place__item-link--highlight">| Xem
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
                                            class="footer-place__item-link footer-place__item-link--highlight">| Xem
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
                                            class="footer-place__item-link footer-place__item-link--highlight">| Xem
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
                                            class="footer-place__item-link footer-place__item-link--highlight">| Xem
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
                                            class="footer-place__item-link footer-place__item-link--highlight">| Xem
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
                                            class="footer-place__item-link footer-place__item-link--highlight">| Xem
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
    <!-- Container for demo purpose -->
</body>
<!-- MDB ESSENTIAL -->
<script type="text/javascript" src="js/mdb.min.js"></script>
<script type="text/javascript" src="ventor/js/mdb.min.js"></script>
<!-- MDB PLUGINS -->
<script type="text/javascript" src="ventor/plugins/js/all.min.js"></script>
<!-- Custom scripts -->
<!-- Sidenav -->


</html>