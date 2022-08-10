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
</body>

</html>
