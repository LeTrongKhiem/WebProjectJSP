<%--
  Created by LeTrongKhiem.
  User: User
  Date: 02-Jan-23
  Time: 4:15 PM
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
    <title>Xác nhận đơn hàng</title>
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

    .input-key {
        margin-top: 100px !important;
    }

    .text {
        font-size: 24px;
        margin: 0 auto;
    }

    .inputkey {
        width: 540px;
        height: 120px;
        font-size: 35px;
    }
    .form-signin-heading{
        text-align: center;
        width: 404px;
        display: flex;
        align-items: center;
        justify-content: center;
        margin: 0 auto;
    }
    .input-showkey{
        font-size: 18px;
        display: flex;
        align-items: center;
        margin-top: 18px;
    }
    .input-showkey input{

        margin-right: 10px;
    }
    .input-showkey input.key{
        width: 20px;
    }
</style>
<body>

<div class="main">
    <%@include file="/header.jsp" %>
    <%--    <div class="input-key">--%>
    <%--        <span class="text">Nhập Private Key đã cấp khi đăng ký tài khoản</span>--%>
    <%--        <input class="inputkey" type="password" placeholder="" id="privateKey" name="privateKey">--%>
    <%--        <input type="file">--%>
    <%--        <button type="submit">Xác nhận</button>--%>
    <%--    </div>--%>
    <div class="v2-login-area">
        <form class="form-signin" action="LoginController" method="post" name="formdn" id="formdn">
            <div class="form-signin-heading text-center">
                <h1 class="sign-title">Nhập Private Key đã cấp khi đăng ký tài khoản</h1>
            </div>
            <div class="v2-login-wrap">
<%--                <span class="text">Nhập Private Key đã cấp khi đăng ký tài khoản</span>--%>
                <input class="inputkey" type="password" placeholder="" id="privateKey" name="privateKey"/>
                <div class="input-showkey">
                <input type="checkbox" onclick="showKey()" class="key">Show Key
                </div>
                <input type="file" style="font-size: 18px; margin-top: 10px" onchange="openFile(event)"/>
                <button class="btn btn-lg btn-login" type="submit">Xác nhận</button>
            </div>
        </form>
    </div>

    <%@include file="/footer.jsp" %>
</div>
</body>
<script>
    var openFile = function(event) {
        var input = event.target;

        var reader = new FileReader();
        reader.onload = function() {
            var text = reader.result;
            var node = document.getElementById('privateKey');
            node.value = text;

        };
        reader.readAsText(input.files[0]);
    };
    function showKey() {
        var x = document.getElementById("privateKey");
        if (x.type === "password") {
            x.type = "text";
        } else {
            x.type = "password";
        }
    }
</script>
</html>
