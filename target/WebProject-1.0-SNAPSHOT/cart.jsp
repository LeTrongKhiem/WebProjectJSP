<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="common/taglib.jsp" %>
<%--<%--%>
<%--    request.setCharacterEncoding("UTF-8");--%>
<%--    response.setCharacterEncoding("UTF-8");--%>
<%--%>--%>
<%--<jsp:useBean id="cart" scope="request" type="com.example.webproject.BEAN.Cart"/>--%>
<%--<jsp:useBean id="cart" scope="request" type="com.example.webproject.BEAN.Cart"/>--%>
<%--<jsp:useBean id="a" class="com.example.webproject.DAO.daoimpl.ProductListDAOImpl" scope="request"></jsp:useBean>--%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giỏ Hàng</title>
    <link rel="stylesheet" href="<c:url value= './assets/font/fontawesome-free-5.15.3-web/css/all.css'/>">
    <link rel="stylesheet" href="<c:url value= './assets/lib/css/bootstrap.min.css'/>">
    <link rel="stylesheet" href="<c:url value='./assets/lib/css/owl.carousel.css'/>">
    <link rel="stylesheet" href="<c:url value= './assets/css/base.css'/>">
    <link rel="stylesheet" href="<c:url value= './assets/css/main.css'/>">
    <link rel="stylesheet" href="<c:url value= './assets/css/grid.css'/>">
    <link rel="stylesheet" href="<c:url value= './assets/css/responsive.css'/>">
    <link rel="stylesheet" href="<c:url value= './assets/css/mobile.css'/>">

</head>
<style>
    body {
        font-size: 1.6rem;
        scroll-behavior: smooth;
        text-decoration: none !important;
        list-style: none !important;
    }

    #header .col {
        margin: 0 !important;
    }

    #footer .col {
        margin: 0 !important;
    }

    .container {
        margin-top: 80px;
    }

    .f-16 {
        font-size: 1.6rem;
    }

    .h5, h5 {
        font-size: 1.6rem;
    }

    .btn {
        font-size: 1.2rem;
    }

    .f-12 {
        font-size: 1.65rem;
    }

    .shadow-around {
        border-top: 3px solid grey;
    }

    .checkout {
        margin-left: 100px;
    }

    .mgl-c {
        font-size: 1.8rem;
    }

    img {
        max-width: 100%;
        height: auto;
    }

    ul {
        margin: 0;
        padding: 0;
        list-style: none;
    }

    ul ul {
        padding-left: 20px;
    }

    a {
        outline: none !important;
        text-decoration: none !important;
    }

    a.disabled {
        pointer-events: none;
    }

    h1, h2, h3, h4, h5, h6 {
        margin: 10px 0;
        font-weight: 400;
        font-family: 'montserrat', sans-serif;
    }

    .text-right {
        text-align: right !important;
    }

    .text-left {
        text-align: left !important;
    }

    .text-center {
        text-align: center !important;
    }

    .btn-product-slider.style {
        top: 54px;
    }

    .btn-product-slider.btn-pre {
        right: 55px;
    }

    .btn-product-slider.btn-nxt {
        right: 15px;
    }

    .btn-delete {
        padding: 10px 0;
        display: inline-block;
        min-width: 40px;
        text-align: center;
        background-color: #5fb7ea;
    }

    .btn-delete:hover {
        background-color: #ff688f;
    }

    .btn-cart {
        border: 1px solid #d1d1d1;
        border-radius: 5px;
        color: #616161;
        cursor: pointer;
    }

    .btn-cart:hover {
        text-decoration: none;
    }

    .btn-square {
        padding: 10px 0;
        display: inline-block;
        min-width: 40px;
        text-align: center;
    }

    .text-extralight {
        font-weight: 100 !important;
    }

    .text-light {
        font-weight: 300 !important;
    }

    .text-semibold {
        font-weight: 600 !important;
    }

    .text-bold {
        font-weight: 700 !important;
    }

    .text-extrabold {
        font-weight: 800 !important;
    }

    .text-uppercase {
        text-transform: uppercase !important;
    }

    .text-lowercase {
        text-transform: lowercase !important;
    }

    .table-head th {
        text-align: center !important;
        padding: 25px 0 !important;
    }

    .table-head th:nth-child(2) {
        text-align: left !important;
    }

    .table-body {
        background: #fff;
    }

    .table-body td {
        padding: 50px 0;
    }

    .cart-cal .table {
        margin-bottom: 0;
    }

    .cart-cal td {
        padding: 50px 0 !important;
    }

    .cart-cal h6 {
        font-size: 14px;
        color: #1a98e1;
        margin: 0;
        padding-bottom: 9px;
    }

    .cart-cal p {
        font-size: 12px;
        color: #757575;
    }

    .cart-cal span {
        font-weight: 600;
    }

    .quantity-control {
        position: relative !important;
        margin: 0 auto;
        max-width: 125px;
    }

    .quantity-control span.alert-msg {
        position: absolute;
        top: 100%;
        left: 0;
        width: 100%;
        text-align: left;
        color: #ff4575;
        font-size: 10px;
        margin-top: 5px;
        font-weight: normal;
    }

    .quantity-control input {
        height: 41px;
        width: 120px;
        text-align: center;
        z-index: -1;
        background: #fff;
        color: #616161;
        border: 1px solid #e8e8e8;
        border-radius: 5px;
        padding: 0 40px;
        font-size: 18px;
        margin: 0;
    }

    .quantity-control .btn-square {
        background: #e8e8e8;
        color: #9d9d9d;
    }

    .btn-minus {
        position: absolute;
        left: 0;
        top: 0;
        z-index: 20;
        border-radius: 5px 0 0 5px;
    }

    .btn-plus {
        position: absolute;
        right: 0;
        top: 0;
        z-index: 20;
        border-radius: 0 5px 5px 0;
    }

    .cart-price {
        font-size: 24px;
    }

    .cart-action {
    }

    .cart-action li .fa {
        color: #fff;
        font-size: 16px;
    }

    .cart-action .style .fa {
        color: #616161;
    }

    .table > thead > tr > th, .table > tbody > tr > th, .table > tfoot > tr > th {
        border: none !important;
    }

    .table > thead > tr > td, .table > tbody > tr > td, .table > tfoot > tr > td {
        border-top: 0;
        border-bottom: 1px solid #eee;
        vertical-align: middle;
    }

    /*=============================
    break point 1024
    ===========================*/
    /*=============================
    break point 990
    ===========================*/
    @media (max-width: 992px) {
        .cart-cal h6 {
            font-size: 12px;
        }

        .cart-price {
            font-size: 18px;
        }

        .cart-cal p {
            font-size: 10px;
        }

        .quantity-control input {
            height: 31px;
            width: 100px;
        }

        .btn-square {
            min-width: 35px;
            padding: 5px 0;
        }

        .quantity-control {
            max-width: 105px;
        }
    }

    /*=============================
    break point 800
    ===========================*/
    @media (max-width: 800px) {
        .xv-cart-top ul > li {
            display: block;
            margin: 5px;
        }
    }

    /*=============================
    break point 767
    ===========================*/
    @media (max-width: 767px) {
        .table-head th {
            padding: 15px 0 !important;
            font-size: 12px;
        }

        .cart-cal td {
            padding: 30px 0 !important;
        }
    }

    @media (max-width: 360px) {
        .btn {
            width: 100%;
        }

        .counter-wrapper > div {
            background: #323D43;
            height: 80px;
            width: 55px;
            padding: 6px 0;
        }

        .counter-wrapper #days, #hours, #minutes {
            font-size: 30px;
        }

        .cart-buttons > li {
            padding: 0;
        }

        .btn-square {
            min-width: 30px;
            padding: 5px 0;
        }
    }

    @-webkit-keyframes sk-rotate {
        100% {
            -webkit-transform: rotate(360deg)
        }
    }

    @keyframes sk-rotate {
        100% {
            transform: rotate(360deg);
            -webkit-transform: rotate(360deg)
        }
    }

    @-webkit-keyframes sk-bounce {
        0%,
        100% {
            -webkit-transform: scale(0.0)
        }
        50% {
            -webkit-transform: scale(1.0)
        }
    }

    @keyframes sk-bounce {
        0%,
        100% {
            transform: scale(0.0);
            -webkit-transform: scale(0.0);
        }
        50% {
            transform: scale(1.0);
            -webkit-transform: scale(1.0);
        }
    }

    .buttons-cart--inner {
        display: flex;
        justify-content: space-between;
    }

    .buttons-cart--inner {
        margin-bottom: 70px;
    }

    .buttons-cart a:hover {
        color: #c43b68
    }

    .buttons-cart a {
        background: #ebebeb none repeat scroll 0 0;
        color: #3f3f3f;
        font-family: 'Poppins', sans-serif;
        font-size: 12px;
        font-weight: 500;
        height: 62px;
        line-height: 62px;
        padding: 0 45px;
        text-transform: uppercase;
        display: inline-block;
    }

    .ht__coupon__code {
        background: #ebebeb none repeat scroll 0 0;
        padding: 54px 70px;
    }

    .ht__coupon__code span {
        color: #3f3f3f;
        font-family: 'Poppins', sans-serif;
        font-weight: 500;
        text-transform: uppercase;
    }

    .coupon__box {
        margin-top: 19px;
        position: relative;
    }

    .coupon__box input {
        background: #ffffff none repeat scroll 0 0;
        border: 0 none;
        height: 56px;
        padding: 0 30px;
    }

    .ht__cp__btn {
        position: absolute;
        right: 0;
        top: 50%;
        -webkit-transform: translateY(-50%);
        transform: translateY(-50%);
    }

    .ht__cp__btn a {
        background: #015649 none repeat scroll 0 0;
        color: #fff;
        display: inline-block;
        font-family: 'Poppins', sans-serif;
        font-size: 14px;
        font-weight: 500;
        height: 56px;
        line-height: 56px;
        padding: 0 27px;
        text-transform: uppercase;
        transition: all 0.4s ease 0s;
    }

    .ht__cp__btn a:hover {
        background: rgb(235, 235, 235);
        color: rgb(1, 86, 73);
    }

    .htc__cart__total h6 {
        background: #015649 none repeat scroll 0 0;
        font-size: 14px;
        font-weight: 500;
        height: 67px;
        line-height: 65px;
        padding: 0 32px;
        text-transform: uppercase;
        color: #fff;
    }

    .htc__cart__total {
        padding-left: 110px;
    }

    .cart__desk__list {
        display: flex;
        justify-content: space-between;
    }

    .cart__desc li {
        color: #3f3f3f;
        font-family: 'Poppins', sans-serif;
        font-size: 14px;
        font-weight: 500;
        text-transform: uppercase;
    }

    .cart__desk__list {
        margin-bottom: 33px;
        margin-top: 38px;
    }

    .cart__desc li + li {
        padding-top: 18px;
    }

    .cart__price li + li {
        padding-top: 18px;
    }

    .cart__price li {
        color: #3f3f3f;
        font-family: 'Poppins', sans-serif;
        font-size: 14px;
        font-weight: 600;
    }

    .cart__total {
        border-top: 1px solid #ebebeb;
        display: flex;
        justify-content: space-between;
        padding-top: 18px;
    }

    .cart__total span {
        color: #3f3f3f;
        font-family: 'Poppins', sans-serif;
        font-size: 14px;
        font-weight: 500;
        text-transform: uppercase;
    }

    .payment__btn {
        margin-top: 54px;
    }

    .payment__btn li a {
        background: #ebebeb none repeat scroll 0 0;
        color: #3f3f3f;
        display: block;
        font-family: 'Poppins', sans-serif;
        font-weight: 500;
        height: 65px;
        line-height: 65px;
        text-align: center;
        text-transform: uppercase;
        transition: all 0.4s ease 0s;
    }

    .payment__btn li + li {
        margin-top: 15px;
    }

    .payment__btn li a:hover,
    .payment__btn li.active a {
        background: #015649 none repeat scroll 0 0;
        color: #fff;
    }

    .payment__btn li.active a:hover {
        background: #ebebeb;
        color: #015649;
    }

    @media (min-width: 1365px) and (max-width: 1500px) {
        .htc__cart__total {
            padding-left: 70px;
        }
    }

    @media (max-width: 767px) {
        .buttons-cart a + a {
            margin-left: 0;
            margin-top: 20px;
            margin-bottom: 20px
        }

        .buttons-cart a:first-child {
            margin-top: 20px;
        }

        .ht__coupon__code {
            padding: 54px 10px;
        }

        .htc__cart__total {
            padding-left: 0px;
        }

        #footer {
            margin-left: 22px;
        }

        .buttons-cart--inner {
            display: block;
        }

        figure {
            width: 100px;
        }
    }
</style>
<body>
<%@include file="/header.jsp" %>
<div class="container">
    <div class="grid wide">
        <div class="xv-cart pt-60">
            <div class="xv-cart-top pb-45">
                <div class="table-responsive cart-cal  text-center">
                    <table class="table">
                        <thead>
                        <tr class="table-head">
                            <th>Hình ảnh</th>
                            <th class="th_description">Thông tin sản phẩm</th>
                            <th>&nbsp;</th>
                            <th>&nbsp;</th>
                            <th>Số lượng</th>
                            <th>Giá</th>
                            <th>Xóa</th>
                        </tr>
                        <jsp:useBean id="cart" scope="request" type="com.example.webproject.BEAN.Cart"/>
                        <c:if test="${cart.productList.size() == 0}">
                            <div class="alert alert-warning" role="alert">
                                Không còn sản phẩm nào trong giỏ hàng
                            </div>
                        </c:if>
                        </thead>
                        <tbody class="shadow-around" id="cart-body">

<%--                        <c:set var="products" value="${cart.productList}"/>--%>
<%--                        <c:forEach items="${products}" var="product">--%>

<%--                            <tr class="table-body">--%>
<%--                                <td>--%>
<%--                                    <figure><img src="${product.link_hinhanh}" style="width:160px"/></figure>--%>
<%--                                </td>--%>
<%--                                <td>--%>
<%--                                    <div class="cart-wrappper text-left th_description">--%>
<%--                                        <h6>${product.tenSP}</h6>--%>
<%--                                        <p><span>Availability</span>: Available in Stock</p>--%>
<%--                                        <p><span>Product Code</span>: CwT4a</p>--%>
<%--                                    </div>--%>
<%--                                </td>--%>
<%--                                <td>&nbsp;</td>--%>
<%--                                <td>&nbsp;</td>--%>
<%--                                <td>--%>
<%--                                    <form class="quantity-control"--%>
<%--                                          action="<%=request.getContextPath()+"/updateQuantity"%>" method="post">--%>
<%--                                          <span data-id="asc_${product.maSP}" class="btn-cart btn-square btn-plus btn-qty"><i--%>
<%--                                            class="fa fa-plus"></i></span>--%>
<%--                                        <input type="text" disabled value="${product.quantitySold}" data-min="0"--%>
<%--                                               data-minalert="Số lượng không được nhỏ hơn 0"--%>
<%--                                               data-invalid="Nhập số lượng hợp lệ"--%>
<%--                                               name="quantity">--%>
<%--                                        <input value="${product.maSP}" type="hidden" name="id" data-min="0">--%>
<%--                                        <span data-id="desc_${product.maSP}" class="btn-cart btn-square btn-minus btn-qty"><i--%>
<%--                                                class="fa fa-minus"></i></span>--%>

<%--                                    </form>--%>
<%--                                </td>--%>
<%--                                <td><span class="cart-price">${product.dinhDang(product.giaSP)}</span></td>--%>
<%--                                <td>--%>
<%--                                    <ul class="cart-action">--%>
<%--                                        <li><a href="remove?id=${product.maSP}" class="btn-cart btn-delete btn-blue"><i--%>
<%--                                                class="fa fa-trash"></i></a></li>--%>
<%--                                    </ul>--%>
<%--                                </td>--%>
<%--                            </tr>--%>
<%--                            &lt;%&ndash;                            <jsp:useBean id="error" scope="request" type="com.example.webproject.controller.cart.UpdateQuantityController"/>&ndash;%&gt;--%>
<%--                            &lt;%&ndash;                            <tr>${error}</tr>&ndash;%&gt;--%>
<%--                        </c:forEach>--%>

                        </tbody>
                    </table>
                </div>
            </div>
            <!--xv-cart-top-->
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="buttons-cart--inner">
                        <div class="buttons-cart">
                            <a href="<%=request.getContextPath() + "/trang-chu"%>">Tiếp tục mua hàng</a>
                        </div>
                        <div class="buttons-cart checkout--btn">
                            <a href="<%=request.getContextPath() + "/updateQuantity"%>">Cập nhật</a>
                            <a href="<%=request.getContextPath() + "/checkout"%>">Thanh Toán</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 col-sm-12 col-xs-12">
                    <div class="ht__coupon__code">
                        <span>NHẬP MÃ GIẢM GIÁ CỦA BẠN</span>
                        <div class="coupon__box">
                            <input type="text" placeholder="">
                            <div class="ht__cp__btn">
                                <a href="#">enter</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-sm-12 col-xs-12 smt-40 xmt-40">
                    <div class="htc__cart__total">
                        <h6>Tổng giỏ hàng</h6>
                        <div class="cart__desk__list">
                            <ul class="cart__desc">
                                <li>Tổng giỏ hàng</li>

                                <li>Phí ship</li>
                            </ul>
                            <ul class="cart__price">
<%--                                <li>${cart.dinhDang(cart.total)}</li>--%>
                                <li class="total-cart"></li>
                                <li>Miễn phí</li>
                            </ul>
                        </div>
                        <div class="cart__total">
                            <span>Tổng đơn hàng</span>
                            <span>${cart.dinhDang(cart.total)}</span>
                        </div>
                        <ul class="payment__btn">
                            <li class="active"><a href="<%=request.getContextPath()+"/checkout"%>"> Tiến hành thanh
                                toán</a></li>
                            <li><a href="#">Tiếp tục mua sắm</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%--    footer --%>
<%@include file="/footer.jsp" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
        integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
<script src="./js/cart.js"></script>
<script>
    var cartJS = new CartJS();
    cartJS.initialize();
    function loadCart() {
        $.ajax({
            type: "GET",
            url: '/WebProject/cart',
            success: function (response) {
                console.log(response);
                var html = '';
                var total = 0;
                var count = 0;
                var row = document.getElementById('cart-body');
                row.innerHTML += response;
            },
        });
    }
</script>
</body>

</html>
