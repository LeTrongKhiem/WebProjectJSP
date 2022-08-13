<%@ page import="java.util.List" %>
<%@ page import="com.example.webproject.BEAN.User" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.example.webproject.DAO.daoimpl.UserDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="common/taglib.jsp" %>
<%
    String error = (String) request.getAttribute("error");
    Map<String, User> listUser = UserDAO.getInstance().listUser();
    session.setAttribute("listUser", listUser);
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập</title>

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
    .gg-button {
        width: 250px;
        height: 32px;
        background-color: #4385f5;
        border: 2px;
        border-radius: 10px;
        font-size: 20px;
    }
</style>
<body>
<div class="main">
    <%--  header  --%>
    <%@include file="/header.jsp" %>
    <%--  header  --%>
    <div class="v2-login-area">
        <form class="form-signin" action="/admin/LoginController" method="post" name="formdn" id="formdn">
            <div class="form-signin-heading text-center">
                <h1 class="sign-title">Đăng nhập</h1>
            </div>
            <div class="v2-login-wrap">
                <input type="text" id="email" class="form-control" value="<%
                    if (request.getAttribute("email")!=null && !request.getAttribute("email").equals("")) {
                        out.print(request.getAttribute("email"));
                    }
                %>" placeholder="Tên đăng nhập/Email/Số điện thoại"
                       autofocus="" name="email" required="">
                <input type="password" class="form-control" placeholder="Mật khẩu" id="password" name="password"
                       required="" value="<%
                     if (request.getAttribute("pass")!=null && !request.getAttribute("pass").equals("")) {
                        out.print("");
                    }
                       %>">
                <div class="g-recaptcha" data-sitekey="6LeIxAcTAAAAAJcZVRqyHh71UMIEGNQ_MXjiZKhI"></div>
                <p id="errorLogin" style="color: red; font-size: 16px; text-align: center"><%
                    if (request.getAttribute("errorAccount") != null && !request.getAttribute("errorAccount").equals("")) {
                        out.print(request.getAttribute("errorAccount"));
                    } else if (request.getAttribute("errorCC") != null && !request.getAttribute("errorCC").equals("")) {
                        out.print(request.getAttribute("errorCC"));
                    }
                %></p>

                <button class="btn btn-lg btn-login" type="submit">Đăng nhập</button>
            </div>
            <div class="v2-login-bottom">
                    <span class="v2-left"><span class="v2-hide">Chưa có tài khoản</span><a href="./dang-ky"
                                                                                           class="v2-register-now"> ( Đăng ký ngay )</a>
                    </span>
                <span class="v2-right">
                    <a class="v2-remember-password" href="./quen-mat-khau"> Quên mật khẩu ?</a>
                </span> <br>

            </div>
            <%--            <a href="" type="submit" class="gg-button"><i class="fab fa-google-plus-g"></i>Đăng nhập với--%>
            <%--                Google--%>
            <%--            </a>--%>
        </form>
    </div>
    <%--    footer --%>
    <%@include file="/footer.jsp" %>
    <%--    footer --%>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
<%--<script type="text/javascript">--%>
<%--    $(document).ready(function () {--%>
<%--        $('#formdn').on('submit', function () {--%>
<%--            <% List<String> userLogged = (List<String>) application.getAttribute("userLogged");//get user login--%>
<%--            %>--%>
<%--            var arrUserlogged = new Array();--%>
<%--            <%--%>
<%--                for (int i = 0; i<userLogged.size(); i++) {--%>
<%--            %>--%>
<%--            arrUserlogged[<%=i%>] = '<%=userLogged.get(i)%>';--%>
<%--            <%}%>--%>
<%--            for (var k = 0; k < arrUserlogged.length; k++) {--%>
<%--                if ($('#email').val() === arrUserlogged[k]) {--%>
<%--                    $('#errorLogin').html('Tài khoản đã được đăng nhập');--%>
<%--                    return false;--%>
<%--                }--%>
<%--            }--%>
<%--            return true;--%>
<%--        });--%>
<%--        $('#formdn').on('keydown', function () {--%>
<%--            $('#errorLogin').html();--%>
<%--        });--%>
<%--    });--%>
<%--</script>--%>

</body>
</html>