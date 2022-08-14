<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.webproject.DAO.daoimpl.CategoryDAOImpl" %>
<%@ page import="com.example.webproject.DAO.daoimpl.ProductDAOImpl" %>
<%@ page import="com.example.webproject.DAO.daoimpl.BannerDAOImpl" %>
<%@ page import="com.example.webproject.BEAN.*" %>
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
    <link rel="stylesheet" href="<c:url value= './assets/css/bootstrap.min.css'/>">
</head>
<style>
    .button-loadmore {
        background-color: darkcyan;
        width: 210px;
        height: 35px;
        font-size: 14px;
        text-align: center;
        border: none;
        border-radius: 7px;
        color: #fff;
        margin-top: 15px;
        margin-left: 42%;
        margin-bottom: 15px;
    }

    .col {
        margin: 0 !important;
    }
</style>
<body>
<%
    if (application.getAttribute("userLogged") == null) {
        List<String> ds = new ArrayList<>();
        application.setAttribute("userLogged", ds);
    }
%>
<%
    BannerDAOImpl bannerDAO = new BannerDAOImpl();
    Banner banner = new Banner();
    ArrayList<Banner> banners = bannerDAO.listBanner();
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
                    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <%for (int i = 0; i < banners.size(); i++) {%>
                            <li data-target="#carouselExampleIndicators" data-slide-to="<%=i%>"
                                class="<%if (i==0) out.print("active");%>"></li>
                            <%}%>
                        </ol>
                        <div class="carousel-inner">
                            <%for (int i = 0; i < banners.size(); i++) {%>
                            <%--                            <div class="carousel-item <%if (banners.indexOf(banner1) == 0) {out.print("active");}%>">--%>
                            <%--                                <img class="d-block w-100" src="<%=banner1.getLink_hinhanh()%>" alt="First slide">--%>
                            <%--                            </div>--%>
                            <div class="carousel-item <%if((i == 0)) {out.print("active");} else {out.print("");}%>">
                                <img class="d-block w-100" src="<%=banners.get(i).getLink_hinhanh()%>"
                                     alt="1">
                            </div>
                            <%}%>
                        </div>
                        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button"
                           data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button"
                           data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>

                <div class="col l-4 m-0 c-0">
                    <iframe src="<%=bannerDAO.listBanner().get(0).getLink_video1()%>"
                            title="YouTube video player"
                            frameborder="0"
                            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                            allowfullscreen class="video1"></iframe>
                    <iframe src="<%=bannerDAO.listBanner().get(0).getLink_video2()%>"
                            title="YouTube video player"
                            frameborder="0"
                            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                            allowfullscreen class="video2"></iframe>
                </div>

                <div class="col l-12 m-12 c-12">
                    <div class="container-nav">
                        <h2 class="container-nav__heading">Hãng:</h2>
                        <ul class="container-nav__list">
                            <%for (Category category : categoryDAO.getListCategoryChild("100001")) {%>
                            <li class="container-nav__item">
                                <a href="ProductListController?madanhmuc=<%=category.getMaDanhMuc()%>"
                                   class="container-nav__item-link"><%=category.getTenDanhMuc()%>
                                </a>
                            </li>
                            <%}%>

                        </ul>
                    </div>
                </div>

                <div class="col l-12 m-12 c-12">
                    <div class="container-filter">
                        <div class="container-filter__item">
                            Giá từ cao đến thấp
                            <i class="container-filter__icon-down fas fa-chevron-down"></i>
                            <ul class="container-filter__list">
                                <li class="container-filter-item">
                                    <a href="FilterController?locgia=caodenthap">Giá cao đến thấp</a>
                                </li>
                                <li class="container-filter-item">
                                    <a href="FilterController?locgia=thapdencao">Giá thấp đến cao</a>
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
                        <div class="row no-gutters phone-products" id="content">
                            <!-- Thêm từng điện thoại vào -->
                            <%for (ProductList p : new ProductDAOImpl().getNextProduct(0, "DT")) {%>
                            <div class="productCount col l-2-4 l-3-m m-4 c-6">
                                <div class="container-product__item">
                                    <div class="container-product__item-heading">
                                        <div class="container-product__item-img"
                                             style="background-image: url('<%=p.getLink_hinhanh()%>');"></div>
                                        <div class="container-product-guarantee">
                                            <a href="trangitem.jsp" class="container-product__item-link">
                                                <div class="container-product-guarantee__heading">
                                                    <img src="https://mobilecity.vn/public/assets/img/icon-mobilecity-care.png"
                                                         alt="Guarantee"
                                                         class="container-product-guarantee__heading-img">
                                                    <h3 class="container-product-guarantee__heading-text">TGMobile
                                                        Care</h3>
                                                </div>

                                                <ul class="container-product-guarantee__list">
                                                    <li class="container-product-guarantee__item">BH 12 tháng nguồn,
                                                        màn hình
                                                    </li>
                                                    <li class="container-product-guarantee__item">Đổi mới 30 ngày
                                                        đầu tiên
                                                    </li>
                                                    <li class="container-product-guarantee__item">Tặng ốp lưng, dán
                                                        cường lực
                                                    </li>
                                                    <li class="container-product-guarantee__item">Hỗ trợ phần mềm
                                                        trọn đời máy
                                                    </li>
                                                </ul>
                                            </a>
                                            <a href="" class="container-product-guarantee__btn">Bảo hành vàng</a>
                                        </div>
                                    </div>
                                    <div class="container-product__item-wrap">
                                        <div class="container-product__item-info">
                                            <a href="DetailController?id=<%=p.getId()%>"
                                               class="container-product__item-name">
                                                <%=p.getTen()%>
                                            </a>
                                            <i class="container-product__item-sale-icon fas fa-gift"></i>
                                        </div>
                                        <div class="container-product__item-buy">
                                                <span class="container-product__item-price">
                                                        <%=p.dinhDang(p.getGia())%>
                                                </span>
                                            <a href="cart-add?id=<%=p.getId()%>"
                                               class="container-product__item-btn">MUA</a>
                                        </div>
                                    </div>
                                    <ul class="container-product__item-gifts-list">
                                        <li class="container-product__item-gift">
                                            1. Tặng:
                                            <span class="container-product__item-gift--highlight">
                                                    Cường lực - Ốp lưng - Tai nghe
                                                </span>
                                            khi mua BHV
                                        </li>
                                        <li class="container-product__item-gift">
                                            2. Giảm:
                                            <span class="container-product__item-gift--highlight">
                                                    100K
                                                </span>
                                            áp dụng HSSV mua BHV tại
                                            <span class="container-product__item-gift--highlight">
                                                    Thủ Đức
                                                </span>
                                        </li>
                                    </ul>
                                    <ul class="container-product-marker__list">
                                        <li class="container-product-marker__item container-product-marker__item--new">
                                            Mới
                                        </li>
                                        <li class="container-product-marker__item container-product-marker__item--hot">
                                            Hot
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <%}%>
                        </div>
                    </div>
                </div>
                <div class="col l-12 m-12 c-12">
                    <button href="" onclick="loadMore()" class="button-loadmore">
                        Xem
                        thêm điện thoại
                    </button>
                </div>
            </div>

            <!-- Laptop Product -->
            <div class="col l-12 m-12 c-12">
                <div class="banner">
                    <div class="row">
                        <div class="col l-6 m-6 c-0">
                            <a href="#" class="banner__link">
                                <img height="150px"
                                     src="<%=bannerDAO.listBanner().get(1).getLink_banner_content()%>"
                                     alt="Banner 1" class="banner__img">
                            </a>
                        </div>
                        <div class="col l-6 m-6 c-0">
                            <a href="#" class="banner__link">
                                <img height="150px"
                                     src="<%=bannerDAO.listBanner().get(2).getLink_banner_content()%>"
                                     alt="Banner 2" class="banner__img">
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col l-12 m-12 c-12">
                <div class="container-nav">
                    <h2 class="container-nav__heading">Hãng:</h2>
                    <ul class="container-nav__list">
                        <%for (Category category : categoryDAO.getListCategoryChild("200001")) {%>
                        <li class="container-nav__item">
                            <a href="ProductListController?madanhmuc=<%=category.getMaDanhMuc()%>"
                               class="container-nav__item-link"><%=category.getTenDanhMuc()%>
                            </a>
                        </li>
                        <%}%>
                    </ul>
                </div>
            </div>

            <div class="col l-12 m-12 c-12">
                <div class="container-filter">
                    <div class="container-filter__item">
                        Giá từ cao đến thấp
                        <i class="container-filter__icon-down fas fa-chevron-down"></i>
                        <ul class="container-filter__list">
                            <li class="container-filter-item">
                                <a href="FilterController?locgia=caodenthap">Giá cao đến thấp</a>
                            </li>
                            <li class="container-filter-item">
                                <a href="FilterController?locgia=thapdencao">Giá thấp đến cao</a>
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
                    <div class="row no-gutters phone-products" id="content1">
                        <!-- Thêm từng điện thoại vào -->
                        <%for (ProductList p : new ProductDAOImpl().getNextProduct(0, "LT")) {%>
                        <div class="productCount1 col l-2-4 l-3-m m-4 c-6">
                            <div class="container-product__item">
                                <div class="container-product__item-heading">
                                    <div class="container-product__item-img"
                                         style="background-image: url('<%=p.getLink_hinhanh()%>');"></div>
                                    <div class="container-product-guarantee">
                                        <a href="trangitem.jsp" class="container-product__item-link">
                                            <div class="container-product-guarantee__heading">
                                                <img src="https://mobilecity.vn/public/assets/img/icon-mobilecity-care.png"
                                                     alt="Guarantee"
                                                     class="container-product-guarantee__heading-img">
                                                <h3 class="container-product-guarantee__heading-text">TGMobile
                                                    Care</h3>
                                            </div>

                                            <ul class="container-product-guarantee__list">
                                                <li class="container-product-guarantee__item">BH 12 tháng nguồn,
                                                    màn hình
                                                </li>
                                                <li class="container-product-guarantee__item">Đổi mới 30 ngày
                                                    đầu tiên
                                                </li>
                                                <li class="container-product-guarantee__item">Tặng ốp lưng, dán
                                                    cường lực
                                                </li>
                                                <li class="container-product-guarantee__item">Hỗ trợ phần mềm
                                                    trọn đời máy
                                                </li>
                                            </ul>
                                        </a>
                                        <a href="" class="container-product-guarantee__btn">Bảo hành vàng</a>
                                    </div>
                                </div>
                                <div class="container-product__item-wrap">
                                    <div class="container-product__item-info">
                                        <a href="DetailController?id=<%=p.getId()%>"
                                           class="container-product__item-name">
                                            <%=p.getTen()%>
                                        </a>
                                        <i class="container-product__item-sale-icon fas fa-gift"></i>
                                    </div>
                                    <div class="container-product__item-buy">
                                                <span class="container-product__item-price">
                                                        <%=p.dinhDang(p.getGia())%>
                                                </span>
                                        <a href="cart-add?id=<%=p.getId()%>"
                                           class="container-product__item-btn">MUA</a>
                                    </div>
                                </div>
                                <ul class="container-product__item-gifts-list">
                                    <li class="container-product__item-gift">
                                        1. Tặng:
                                        <span class="container-product__item-gift--highlight">
                                                    Cường lực - Ốp lưng - Tai nghe
                                                </span>
                                        khi mua BHV
                                    </li>
                                    <li class="container-product__item-gift">
                                        2. Giảm:
                                        <span class="container-product__item-gift--highlight">
                                                    100K
                                                </span>
                                        áp dụng HSSV mua BHV tại
                                        <span class="container-product__item-gift--highlight">
                                                    Thủ Đức
                                                </span>
                                    </li>
                                </ul>
                                <ul class="container-product-marker__list">
                                    <li class="container-product-marker__item container-product-marker__item--new">
                                        Mới
                                    </li>
                                    <li class="container-product-marker__item container-product-marker__item--hot">
                                        Hot
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <%}%>
                    </div>
                </div>
            </div>
            <div class="col l-12 m-12 c-12">
                <button href="" onclick="loadMore1()" class="button-loadmore">
                    Xem
                    thêm Laptop
                </button>
            </div>
            <!-- PhoneProduct Tool -->
            <div class="row container__item">
                <div class="col l-12 m-12 c-12">
                    <div class="banner">
                        <div class="row">
                            <div class="col l-6 m-6 c-0">
                                <a href="#" class="banner__link">
                                    <img height="150px"
                                         src="<%=bannerDAO.listBanner().get(0).getLink_banner_content()%>"
                                         alt="Banner 1" class="banner__img">
                                </a>
                            </div>
                            <div class="col l-6 m-6 c-0">
                                <a href="#" class="banner__link">
                                    <img height="150px"
                                         src="<%=bannerDAO.listBanner().get(1).getLink_banner_content()%>"
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
                            <%for (Category category : categoryDAO.getListCategoryChild("300001")) {%>
                            <li class="container-nav__item">
                                <a href="ProductListController?madanhmuc=<%=category.getMaDanhMuc()%>"
                                   class="container-nav__item-link"><%=category.getTenDanhMuc()%>
                                </a>
                            </li>
                            <%}%>
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
                        <div class="row no-gutters tool-products" id="content2">
                            <!-- Thêm phụ kiện -->
                            <%for (ProductList p : new ProductDAOImpl().getNextProduct(0, "phukien")) {%>
                            <div class="productCount2 col l-2-4 l-3-m m-4 c-6">
                                <div class="container-product__item">
                                    <div class="container-product__item-heading">
                                        <div class="container-product__item-img"
                                             style="background-image: url('<%=p.getLink_hinhanh()%>');"></div>
                                        <div class="container-product-guarantee">
                                            <a href="trangitem.jsp" class="container-product__item-link">
                                                <div class="container-product-guarantee__heading">
                                                    <img src="https://mobilecity.vn/public/assets/img/icon-mobilecity-care.png"
                                                         alt="Guarantee"
                                                         class="container-product-guarantee__heading-img">
                                                    <h3 class="container-product-guarantee__heading-text">TGMobile
                                                        Care</h3>
                                                </div>

                                                <ul class="container-product-guarantee__list">
                                                    <li class="container-product-guarantee__item">BH 12 tháng nguồn,
                                                        màn hình
                                                    </li>
                                                    <li class="container-product-guarantee__item">Đổi mới 30 ngày
                                                        đầu tiên
                                                    </li>
                                                    <li class="container-product-guarantee__item">Tặng ốp lưng, dán
                                                        cường lực
                                                    </li>
                                                    <li class="container-product-guarantee__item">Hỗ trợ phần mềm
                                                        trọn đời máy
                                                    </li>
                                                </ul>
                                            </a>
                                            <a href="" class="container-product-guarantee__btn">Bảo hành vàng</a>
                                        </div>
                                    </div>
                                    <div class="container-product__item-wrap">
                                        <div class="container-product__item-info">
                                            <a href="DetailController?id=<%=p.getId()%>"
                                               class="container-product__item-name">
                                                <%=p.getTen()%>
                                            </a>
                                            <i class="container-product__item-sale-icon fas fa-gift"></i>
                                        </div>
                                        <div class="container-product__item-buy">
                                                <span class="container-product__item-price">
                                                        <%=p.dinhDang(p.getGia())%>
                                                </span>
                                            <a href="cart-add?id=<%=p.getId()%>"
                                               class="container-product__item-btn">MUA</a>
                                        </div>
                                    </div>
                                    <ul class="container-product__item-gifts-list">
                                        <li class="container-product__item-gift">
                                            1. Tặng:
                                            <span class="container-product__item-gift--highlight">
                                                    Cường lực - Ốp lưng - Tai nghe
                                                </span>
                                            khi mua BHV
                                        </li>
                                        <li class="container-product__item-gift">
                                            2. Giảm:
                                            <span class="container-product__item-gift--highlight">
                                                    100K
                                                </span>
                                            áp dụng HSSV mua BHV tại
                                            <span class="container-product__item-gift--highlight">
                                                    Thủ Đức
                                                </span>
                                        </li>
                                    </ul>
                                    <ul class="container-product-marker__list">
                                        <li class="container-product-marker__item container-product-marker__item--new">
                                            Mới
                                        </li>
                                        <li class="container-product-marker__item container-product-marker__item--hot">
                                            Hot
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <%}%>
                        </div>
                    </div>
                </div>
                <div class="col l-12 m-12 c-12">
                    <button onclick="loadMore2()" class="button-loadmore">Xem thêm phụ kiện</button>
                </div>
            </div>

            <!-- PhoneProduct Fix -->
            <div class="row container__item">
                <div class="col l-12 m-12 c-12">
                    <div class="banner">
                        <div class="row">
                            <div class="col l-6 m-6 c-0">
                                <a href="#" class="banner__link">
                                    <img src="<%=bannerDAO.listBanner().get(2).getLink_banner_content()%>"
                                         alt="Banner 1" class="banner__img">
                                </a>
                            </div>
                            <div class="col l-6 m-6 c-0">
                                <a href="#" class="banner__link">
                                    <img src="<%=bannerDAO.listBanner().get(2).getLink_banner_content()%>"
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
                            <%for (Category category : categoryDAO.getListCategoryChild("400001")) {%>
                            <li class="container-nav__item">
                                <a href="ProductListController?madanhmuc=<%=category.getMaDanhMuc()%>"
                                   class="container-nav__item-link"><%=category.getTenDanhMuc()%>
                                </a>
                            </li>
                            <%}%>

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
                    <button onclick="loadMore2()" class="button-loadmore">Xem thêm</button>
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
    <script src="<c:url value='./js/bootstrap.min.js'/>"></script>
    <script src="<c:url value='./js/fix.js'/>"></script>
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="<c:url value='./assets/lib/js/bootstrap.min.js'/>"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

    <script src="https://code.jquery.com/jquery-3.3.1.min.js"
            integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
    <script>
        //dung de loadmore
        function loadMore() {
            var amount = document.getElementsByClassName('productCount').length;
            jQuery.ajax({
                <%--url: "<%=request.getContextPath()%>/LoadmoreController?madanhmuc=100001",--%>
                url: "/LoadmoreController?madanhmuc=100001",
                type: "get", //send it through get method
                data: {
                    exits: amount
                },
                success: function (data) {
                    var row = document.getElementById('content');
                    row.innerHTML += data;
                },
                error: function (xhr) {

                }
            });
        }

        function loadMore1() {
            var amount = document.getElementsByClassName('productCount1').length;
            jQuery.ajax({
                <%--url: "<%=request.getContextPath()%>/LoadmoreController?madanhmuc=200001",--%>
                url: "/LoadmoreController?madanhmuc=200001",
                type: "get", //send it through get method
                data: {
                    exits: amount
                },
                success: function (data) {
                    var row = document.getElementById('content1');
                    row.innerHTML += data;
                },
                error: function (xhr) {

                }
            });
        }

        function loadMore2() {
            var amount = document.getElementsByClassName('productCount2').length;
            jQuery.ajax({
                <%--url: "<%=request.getContextPath()%>/LoadmoreController?madanhmuc=300001",--%>
                url: "/LoadmoreController?madanhmuc=300001",
                type: "get", //send it through get method
                data: {
                    exits: amount
                },
                success: function (data) {
                    var row = document.getElementById('content2');
                    row.innerHTML += data;
                },
                error: function (xhr) {

                }
            });
        }
    </script>
</body>

</html>