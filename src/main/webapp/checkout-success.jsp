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
    <title>Trang xác nhận Email</title>

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
<body>
<div class="main">
    <%--  header  --%>
    <%@include file="/header.jsp" %>
    <%--  header  --%>
    <div class="v2-login-area" style="padding-top: 100px">
        <form class="form-signin" action="RegisterController" method="post" name="formdn" id="formdn">
            <div class="form-signin-heading text-center">
                <h1 class="sign-title" style="font-size: 29px; text-align: center">Cảm ơn bạn đã đăng kí tài khoản tại
                    Website</h1>
                <p style="font-size: 13px; text-align: center">Email xác minh đã được gửi vào email: <a
                        href="">${sessionScope.user.email}</a>
                    .Vui lòng kiểm tra trong hòm thư</p>
            </div>
            <div class="v2-login-wrap">
                <a href="#">
                    <button class="btn btn-lg btn-login" type="submit">Xác nhận</button>
                </a>

            </div>
            <div class="v2-login-bottom" style="margin-left: 72px">
                    <span class="v2-left"><span class="v2-hide">Bạn chưa nhận được mã</span><a href=""
                                                                                               class="v2-register-now"> ( Gửi lại mã )</a>
                    </span>
                <span class="v2-right">
                        <a class="v2-remember-password" href="./dangnhap.jsp"> Đăng nhập ngay</a>
                    </span>
            </div>
        </form>
    </div>
    <%--    footer --%>
    <%@include file="/footer.jsp" %>
    <%--    footer --%>
</div>
</body>
</html>
