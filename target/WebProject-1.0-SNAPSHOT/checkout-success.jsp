<%@ page import="com.example.webproject.service.SendEmail" %><%--
  Created by LeTrongKhiem.
  User: User
  Date: 25-Dec-21
  Time: 9:02 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="common/taglib.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang xác nhận thanh toán</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    <link rel="stylesheet" href="<c:url value='assets/font/fontawesome-free-5.15.3-web/css/all.min.css'/>">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="icon" href="<c:url value= './assets/img/logo3.png'/>">

    <link rel="stylesheet" href="<c:url value= './assets/css/base.css'/>">
    <link rel="stylesheet" href="<c:url value= './assets/css/main.css'/>">
    <link rel="stylesheet" href="<c:url value= './assets/css/grid.css'/>">
    <link rel="stylesheet" href="<c:url value= './assets/css/responsive.css'/>">
    <link rel="stylesheet" href="<c:url value= './assets/css/dangnhap.css'/>">
</head>
<style>
.icon_success{
    font-size: 60px;

}
</style>
<body>
<div class="main">
    <%--  header  --%>
    <%@include file="/header.jsp" %>
    <%--  header  --%>
    <div class="v2-login-area" style="padding-top: 100px">
        <form class="form-signin" action="index.jsp" method="post">
            <div class="form-signin-heading text-center">
                <h1 class="sign-title" style="font-size: 32px; text-align: center">Thanh toán thành công</h1>
                <i class="far fa-check-circle icon_success"></i>
                <p style="font-size: 13px; text-align: center">Chúng tôi sẽ gửi email xác nhận đơn hàng cho bạn với các chi tiết và thông tin theo dõi.
                </p>
            </div>
            <div class="v2-login-wrap">
                <a href="index.jsp">
                    <button class="btn btn-lg btn-login" type="submit">Về Trang Chủ</button>
                </a>

            </div>

        </form>
    </div>
    <%--    footer --%>
    <%@include file="/footer.jsp" %>
    <%--    footer --%>
</div>
</body>
</html>
