<%@ page import="com.example.webproject.BEAN.User" %>
<%@ page import="java.util.*" %><%--
  Created by LeTrongKhiem.
  User: User
  Date: 24-Dec-21
  Time: 8:46 PM
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
    <title>Quên mật khẩu</title>

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
<%Map<String, User> listUser = (Map<String, User>) session.getAttribute("listUser");%>
<%Set<String> dsUser = listUser.keySet();%>
<%List<String> dsEmail = new ArrayList<String>();%>
<%
    for (User user : listUser.values()) {
        dsEmail.add(user.getEmail());
    }
%>
<body>
<%--  header  --%>
<%@include file="/header.jsp" %>
<%--  header  --%>
<div class="v2-login-area" style="margin-top: 150px">
    <form class="form-signin" action="ForgotPassword" method="get" onsubmit="return(checkEmail())" name="quenmk">
        <div class="form-signin-heading text-center">
            <h1 class="sign-title">Vui lòng nhập Email đã đăng kí tài khoản</h1>
        </div>
        <div class="v2-login-wrap">
            <input type="email" class="form-control" value="" placeholder="Email của bạn"
                   autofocus="" name="email" required="" oninvalid="setCustomValidity('Địa chỉ email bạn nhập sai!')"
                   onchange="try{setCustomValidity('')}catch(e){}" id="emailInput">
            <p id="emailErr" style="font-size: 16px;text-align: center;color: red;"></p>
            <button class="btn btn-lg btn-login" type="submit">Xác nhận</button>
        </div>
        <div class="v2-login-bottom">
                    <span class="v2-left"><span class="v2-hide">Chưa có tài khoản</span><a href="./dang-ki"
                                                                                           class="v2-register-now"> ( Đăng ký ngay )</a>
                    </span>
            <span class="v2-right">
                        <a class="v2-remember-password" href="./dang-nhap"> Đăng nhập ngay</a>
                    </span>
        </div>
    </form>
</div>
<%--    footer --%>
<%@include file="/footer.jsp" %>
<%--    footer --%>
<script>
    var arr = new Array();
    <%for (int i = 0; i < dsEmail.size(); i++) {%>
    arr[<%=i%>] = "<%=dsEmail.get(i)%>";
    <%}%>

    function checkEmail() {
        for (var i = 0; i < arr.length; i++) {
            var us = arr[i];
            if (document.quenmk.email.value === us) {
                document.getElementById('emailErr').innerHTML = '';
                return true;
            }
        }
        document.getElementById('emailErr').innerHTML = 'Email bạn nhập không chính xác !';
        return false;
    }
</script>
</body>
</html>
