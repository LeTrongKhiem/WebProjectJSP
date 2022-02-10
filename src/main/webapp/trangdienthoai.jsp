<%@ page import="java.text.DecimalFormat" %>
<%@ page import="com.example.webproject.BEAN.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.webproject.DAO.daoimpl.ProductListDAOImpl" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="fn"
           uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
%>
<%@include file="common/taglib.jsp" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang tìm kiếm</title>
    <link rel="stylesheet" href="<c:url value='assets/font/fontawesome-free-5.15.3-web/css/all.min.css'/>">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="icon" href="<c:url value= './assets/img/logo3.png'/>">

    <link rel="stylesheet" href="<c:url value= './assets/css/base.css'/>">
    <link rel="stylesheet" href="<c:url value= './assets/css/main.css'/>">
    <link rel="stylesheet" href="<c:url value= './assets/css/grid.css'/>">
    <link rel="stylesheet" href="<c:url value= './assets/css/responsive.css'/>">
    <link rel="stylesheet" href="<c:url value= './assets/css/tranglaptop.css'/>">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

<style>
    .col {
        margin: 0 !important;
    }
    .paginationCenter {
        margin: 10px 0 0 50%;
        font-size: 18px;
    }
</style>
<%--<%--%>
<%--    CategoryDAOImpl categoryDAO = new CategoryDAOImpl();--%>
<%--%>--%>
<jsp:useBean id="a" class="com.example.webproject.DAO.daoimpl.ProductListDAOImpl" scope="request"></jsp:useBean>
<body>
<div class="main">
    <%--  header  --%>
    <%@include file="/header.jsp" %>
    <%--  header  --%>

    <div class="container">
        <div class="grid wide">
            <div class="container-breadcrumb">
                <ol class="breadcrumb" itemscope itemtype="http://schema.org/BreadcrumbList">
                    <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
                        <a itemprop="item" href="./index.jsp"><span itemprop="name" content="Trang chủ"><i
                                class="fas fa-home"></i></i> Trang chủ</span></a>
                        <meta itemprop="position" content="1"/>
                    </li>

                    <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
                        <i class="itemListElement-icon fa fa-angle-right"></i> <a itemprop="item"
                                                                                  href="./trangdienthoai.jsp"
                                                                                  title="Điện thoại di động gi&#225; rẻ, ch&#237;nh h&#227;ng - Ho&#224;ng H&#224; Mobile"
                                                                                  class="actived"><span itemprop="name"
                                                                                                        content="Laptop">Điện thoại</span></a>
                        <meta itemprop="position" content="2"/>
                    </li>
                </ol>
            </div>
            <div class="container-nav">
                <h2 class="container-nav__heading">Hãng sản xuất:</h2>
                <ul class="container-nav__list">
                    <%--                    <%for (Category categoryChild : categoryDAO.getListCategoryPhone()) {%>--%>
                    <jsp:useBean id="listCategory" scope="request" type="java.util.List"/>
                    <c:forEach items="${listCategory}" var="l">
                        <li class="container-nav__item">
                            <a href="ProductListController?madanhmuc=${l.maDanhMuc}"
                               class="container-nav__item-link">${l.tenDanhMuc}
                            </a>
                        </li>
                        <%--                    <%}%>--%>
                    </c:forEach>


                </ul>
            </div>
            <div class="col l-12 m-12 c-12">
                <div class="container-product">
                    <div id="content" class="row no-gutters">
                        <jsp:useBean id="product" scope="request" type="java.util.List"/>
                        <c:forEach var="i" items="${product}">
                            <%--                            <%for (Product productList : ProductListDAOImpl.getInstance().search(request.getParameter("txt"), Integer.parseInt(request.getParameter("index")))) {%>--%>
                            <div class="productCount col l-2-4 l-3-m m-4 c-6">
                                <div class="container-product__item">
                                    <div class="container-product__item-heading">
                                        <div class="container-product__item-img"
                                             style="background-image: url(${i.link_hinhanh})"></div>

                                        <div class="container-product-guarantee">
                                            <a href="" class="container-product__item-link">
                                                <div class="container-product-guarantee__heading">
                                                    <img src="https://mobilecity.vn/public/assets/img/icon-mobilecity-care.png"
                                                         alt="Guarantee"
                                                         class="container-product-guarantee__heading-img">
                                                    <h3 class="container-product-guarantee__heading-text">TG Mobile</h3>
                                                </div>

                                                <ul class="container-product-guarantee__list">
                                                    <li class="container-product-guarantee__item">BH 12 tháng nguồn, màn
                                                        hình
                                                    </li>
                                                    <li class="container-product-guarantee__item">Đổi mới 30 ngày đầu
                                                        tiên
                                                    </li>
                                                    <li class="container-product-guarantee__item">Tặng ốp lưng, dán
                                                        cường lực
                                                    </li>
                                                    <li class="container-product-guarantee__item">Hỗ trợ phần mềm trọn
                                                        đời máy
                                                    </li>
                                                </ul>
                                            </a>
                                            <a href="" class="container-product-guarantee__btn">Bảo hành vàng</a>
                                        </div>
                                    </div>
                                    <div class="container-product__item-wrap">
                                        <div class="container-product__item-info">
                                            <a href="DetailController?id=${i.maSP}" class="container-product__item-name">
                                                    ${i.tenSP}
                                            </a>
                                            <i class="container-product__item-sale-icon fas fa-gift"></i>
                                        </div>
                                        <div class="container-product__item-buy">
                                <span class="container-product__item-price">
                                        ${i.dinhDang(i.giaSP)}
<%--                                    <%=ProductListDAOImpl.getInstance().dinhDang(productList.getGiaSP())%>--%>
                                </span>
                                            <a href="cart-add?id=${i.maSP}" class="container-product__item-btn">MUA</a>
                                        </div>
                                    </div>
                                    <ul class="container-product__item-gifts-list">
                                        <li class="container-product__item-gift">
                                            <span class="container-product__item-span">KM</span>
                                            Tặng Phiếu mua hàng 1.500.000đ
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
                            <%--                            <%}%>--%>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <nav aria-label="Page navigation example">
                <ul class="pagination paginationCenter">
                    <c:forEach begin="1" end="${endP}" var="i">
                        <li class="page-item ${index==i?"active":""}"><a class=" page-link"
                                                                         href="search?index=${i}&txt=${txts}">${i}</a>
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

    <a href="#" class="go-to-chat">
        <i class="go-to-chat__icon fab fa-facebook-messenger"></i>
    </a>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
        integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>


<script>
    function loadMore() {
        var amount = document.getElementsByClassName('productCount').length;
        jQuery.ajax({
            url: "/WebProject/SearchController",
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
</script>
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
                };

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
                        ;
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