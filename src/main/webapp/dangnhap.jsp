<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="common/taglib.jsp" %>
<%
    String error = (String) request.getAttribute("error");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    <%--    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"--%>
    <%--          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">--%>
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
    <div class="v2-login-area">
        <form class="form-signin" action="LoginController" method="post" name="formdn" id="formdn">
            <input type="hidden" name="_token" value="fzKzNPdwVMjvEWLv8wsimORTg4y92ecaAdAMObx9">
            <div class="form-signin-heading text-center">
                <h1 class="sign-title">Đăng nhập</h1>
            </div>
            <div class="v2-login-wrap">
                <input type="text" class="form-control" value="" placeholder="Tên đăng nhập/Email/Số điện thoại"
                       autofocus="" name="email" required="">
                <input type="password" class="form-control" placeholder="Mật khẩu" id="password" name="password"
                       required="">
                <div class="g-recaptcha" style="" data-sitekey="6LeIxAcTAAAAAJcZVRqyHh71UMIEGNQ_MXjiZKhI"></div>
                <button class="btn btn-lg btn-login" type="submit">Đăng nhập</button>
            </div>
            <div class="v2-login-bottom">
                    <span class="v2-left"><span class="v2-hide">Chưa có tài khoản</span><a href="dangki.jsp"
                                                                                           class="v2-register-now"> ( Đăng ký ngay )</a>
                    </span>
                <span class="v2-right">
                    <a class="v2-remember-password" href="https://mobilecity.vn/quen-mat-khau"> Quên mật khẩu ?</a>
                </span>
            </div>
        </form>
    </div>
    <%--    footer --%>
    <%@include file="/footer.jsp" %>
    <%--    footer --%>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src='https://www.google.com/recaptcha/api.js'></script>
<script>
    $(document).ready(function () {
        $('#formdn').on('submit', function() {
            <% List<String> userLogged = (List<String>) application.getAttribute("userLogged");//get user login
            %>
            var arrUserlogged = new Array();
            <%
                for (int i = 0; i<userLogged.size(); i++) {
            %>
            arrUserlogged[<%=i%>] = '<%=userLogged.get(i)%>';
            <%}%>
            for (var k = 0; k < arrUserlogged.length; k++) {
                if ($('#email').val() === arrUserlogged[k]) {
                    $('#error').html('Tài khoản đã được đăng nhập');
                    return false;
                }
            }
            return true;
        });
        $('#formdn').on('keydown', function() {
            $('#error').html();
        });
    });
</script>
</body>
</html>