<%--
  Created by LeTrongKhiem.
  User: User
  Date: 21-Feb-22
  Time: 2:55 PM
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
    <title>Đã xảy ra lỗi</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">

    <link rel="stylesheet" href="<c:url value='assets/font/fontawesome-free-5.15.3-web/css/all.min.css'/>">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="icon" href="<c:url value= './assets/img/logo3.png'/>">
    <link rel="stylesheet" href="<c:url value= './assets/css/base.css'/>">
    <link rel="stylesheet" href="<c:url value= './assets/css/main.css'/>">
    <link rel="stylesheet" href="<c:url value= './assets/css/grid.css'/>">
    <link rel="stylesheet" href="<c:url value= './assets/css/responsive.css'/>">
</head>
<style>

</style>
<body>
<%--  header  --%>
<%@include file="/header.jsp" %>
<%--  header  --%>
<div style="margin: 200px 100px 300px 100px; text-align: center">
    <span style="color: red; font-size: 30px">ĐÃ XẢY RA LỖI!!!</span>
    <p style="font-size: 20px">TGMobile rất tiếc vì sự cố này <a href="<c:url value="/trang-chu"/>"
                                                                 style="text-decoration: none; font-size: 20px; color: #0b4121">Quay trở
        về trang chủ</a></p>
</div>
<%--    footer --%>
<%@include file="/footer.jsp" %>
<%--    footer --%>
</body>
</html>
