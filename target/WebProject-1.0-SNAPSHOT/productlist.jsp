<%@ page import="com.example.webproject.DAO.daoimpl.ProductListDAOImpl" %>
<%@ page import="com.example.webproject.BEAN.ProductList" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="com.example.webproject.BEAN.Product" %><%--
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
    <title>Danh mục sản phẩm</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">

    <link rel="stylesheet" href="<c:url value='assets/font/fontawesome-free-5.15.3-web/css/all.min.css'/>">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="icon" href="<c:url value= './assets/img/logo3.png'/>">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="<c:url value= './assets/css/base.css'/>">
    <link rel="stylesheet" href="<c:url value= './assets/css/main.css'/>">
    <link rel="stylesheet" href="<c:url value= './assets/css/grid.css'/>">
    <link rel="stylesheet" href="<c:url value= './assets/css/responsive.css'/>">
    <link rel="stylesheet" href="<c:url value= './assets/css/mobile.css'/>">
</head>
<jsp:useBean id="a" class="com.example.webproject.DAO.daoimpl.ProductListDAOImpl" scope="request"></jsp:useBean>
<body>
<%
    ProductListDAOImpl productListDAO = new ProductListDAOImpl();
    NumberFormat nf = NumberFormat.getInstance();
    nf.setMinimumIntegerDigits(0);
%>
<style>
    .col {
        margin: 0 !important;

    }
</style>
<div class="main">

    <%--  header  --%>
    <%@include file="/header.jsp" %>
    <%--  header  --%>
    <div class="container">
        <div class="grid wide">
            <div class="container">
                <ol class="breadcrumb" itemscope itemtype="http://schema.org/BreadcrumbList">
                    <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
                        <a itemprop="item" href="./index.jsp"><span itemprop="name" content="Trang chủ"><i
                                class="fas fa-home"></i></i> Trang chủ</span></a>
                        <meta itemprop="position" content="1"/>
                    </li>

                    <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
                        <i class="fa fa-angle-right"></i> <a itemprop="item" href="/productlist.jsp"
                                                             title="Điện thoại di động gi&#225; rẻ, ch&#237;nh h&#227;ng - Ho&#224;ng H&#224; Mobile"
                                                             class="actived"><span itemprop="name" content="Điện thoại">Điện thoại</span></a>
                        <meta itemprop="position" content="2"/>
                    </li>
                </ol>
            </div>
            <div class="header__container">
                <h3>Điện thoại</h3>
            </div>
            <ul class="container-filter__list">
                <li class="container-filter__item">
                    Mức giá
                    <i class="container-filter__icon-down fas fa-chevron-down"></i>
                    <ul class="container-filter__price">
                        <li class="container-filter-item">
                            Dưới 1 triệu
                        </li>
                        <li class="container-filter-item">
                            Dưới 2 triệu
                        </li>
                        <li class="container-filter-item">
                            Dưới 3 triệu
                        </li>
                        <li class="container-filter-item">
                            Dưới 4 triệu
                        </li>
                        <li class="container-filter-item">
                            Dưới 5 triệu
                        </li>
                        <li class="container-filter-item">
                            Dưới 7 triệu
                        </li>
                        <li class="container-filter-item">
                            Dưới 10 triệu
                        </li>
                        <li class="container-filter-item">
                            Trên 10 triệu
                        </li>
                    </ul>
                </li>
                <li class="container-filter__item">
                    Hãng sản xuất
                    <i class="container-filter__icon-down fas fa-chevron-down"></i>
                    <ul class="container-filter__manufacturer">
                        <li class="container-filter-item-manufacturer">
                            Apple
                        </li>
                        <li class="container-filter-item-manufacturer">
                            Xiaomi
                        </li>
                        <li class="container-filter-item-manufacturer">
                            Samsung
                        </li>
                        <li class="container-filter-item-manufacturer">
                            Oppo
                        </li>
                        <li class="container-filter-item-manufacturer">
                            OnePlus
                        </li>
                        <li class="container-filter-item-manufacturer">
                            Vivo
                        </li>
                        <li class="container-filter-item-manufacturer">
                            LG
                        </li>
                        <li class="container-filter-item-manufacturer">
                            Google
                        </li>
                    </ul>
                </li>
                <li class="container-filter__item">
                    Hệ điều hành
                    <i class="container-filter__icon-down fas fa-chevron-down"></i>
                    <ul class="container-filter__price">
                        <li class="container-filter-item">
                            Android
                        </li>
                        <li class="container-filter-item">
                            IOS
                        </li>
                        <li class="container-filter-item">
                            Window Phone
                        </li>
                        <li class="container-filter-item">
                            HDH Khác
                        </li>
                    </ul>
                </li>
                <li class="container-filter__item">
                    Màn hình
                    <i class="container-filter__icon-down fas fa-chevron-down"></i>
                    <ul class="container-filter__price">
                        <li class="container-filter-item">
                            Dưới 3"
                        </li>
                        <li class="container-filter-item">
                            Khoảng 3"
                        </li>
                        <li class="container-filter-item">
                            Khoảng 4"
                        </li>
                        <li class="container-filter-item">
                            Khoảng 5"
                        </li>
                        <li class="container-filter-item">
                            Khoảng 6"
                        </li>
                    </ul>

                </li>
                <li class="container-filter__item">
                    Tính năng
                    <i class="container-filter__icon-down fas fa-chevron-down"></i>
                    <ul class="container-filter__price">
                        <li class="container-filter-item">
                            Băng tầng 4G 5G
                        </li>
                        <li class="container-filter-item">
                            2 Sim 2 Sóng
                        </li>
                        <li class="container-filter-item">
                            Smart Phone
                        </li>
                        <li class="container-filter-item">
                            Wifi
                        </li>
                        <li class="container-filter-item">
                            Cảm ứng
                        </li>
                    </ul>
                </li>
                <li class="container-filter__item">
                    Sắp xếp theo giá
                    <i class="container-filter__icon-down fas fa-chevron-down"></i>
                    <ul class="container-filter__price">
                        <li class="container-filter-item">
                            <a href="FilterController?locgia=caodenthap">Giá cao đến thấp</a>
                        </li>
                        <li class="container-filter-item">
                            <a href="FilterController?locgia=thapdencao">Giá thấp đến cao</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <div class="col l-12 m-12 c-12">
                <div class="container-product">
                    <div class="row no-gutters phone-products">
                        <!-- Thêm từng điện thoại vào -->
                        <%for (ProductList productList : ProductListDAOImpl.getInstance().getListProductByCategory(request.getParameter("madanhmuc"))) {%>
                        <%--                        <%for (Product productList : ProductListDAOImpl.getInstance().search(request.getParameter("txt"), Integer.parseInt(request.getParameter("index")))) {%>--%>
                        <%--                        <jsp:useBean id="productList" scope="request" type="java.util.List"/>--%>
                        <%--                        <c:forEach items="${productList}" var="prl">--%>
                        <div class="col l-2-4 l-3-m m-4 c-6">
                            <div class="container-product__item">
                                <div class="container-product__item-heading">
                                    <div class="container-product__item-img"
                                         style="background-image: url('<%=productList.getLink_hinhanh()%>');"></div>
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
                                        <a href="DetailController?id=<%=productList.getId()%>"
                                           class="container-product__item-name">
                                            <%=productList.getTen()%>
                                            <%--                                            <%=productList.getTenSP()%>--%>
                                        </a>
                                        <i class="container-product__item-sale-icon fas fa-gift"></i>
                                    </div>
                                    <div class="container-product__item-buy">
                                <span class="container-product__item-price">
<%--                                    <%=nf.format(productList.getGia())%> đ--%>
                                     <%=ProductListDAOImpl.getInstance().dinhDang(productList.getGia())%>
<%--                                    <%=nf.format(productList.getGiaSP())%> đ--%>
                                </span>
                                        <a href="cart-add?id=<%=productList.getId()%>"
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
                        <%--                        </c:forEach>--%>
                        <%--                        </jsp:useBean>--%>
                        <%}%>
                    </div>
                </div>
            </div>
            <div class="col l-12 m-12 c-12">
                <div class="container-view-more">
                    <a href="#" class="container-btn-extend">Xem thêm điện thoại</a>
                </div>
            </div>
            <nav aria-label="Page navigation example">
                <ul class="pagination">
                    <jsp:useBean id="i" class="com.example.webproject.BEAN.Category"></jsp:useBean>
                    <c:forEach begin="1" end="${a.getNumberPageProduct(i.maDanhMuc)}" var="q">
                        <li class="page-item " aria-current="page"><a class=" page-link"
                                                                      href="PagingController?index=${q}&madanhmuc=${i.maDanhMuc}">${q}</a>
                        </li>
                    </c:forEach>
                </ul>
            </nav>
        </div>
    </div>
    <%--    footer --%>
    <%@include file="/footer.jsp" %>
    <%--    footer --%>
    <!-- Button -->
    <a href="#" class="go-to-top">
        <i class="go-to-top__icon fas fa-chevron-circle-up"></i>
    </a>
</div>

<%--<script src="<c:url value='./js/phone.js'/>"></script>--%>
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
