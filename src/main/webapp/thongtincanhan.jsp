<%--
  Created by LeTrongKhiem.
  User: User
  Date: 30-Dec-21
  Time: 8:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="common/taglib.jsp" %>
<html>
<head>
    <title>Thông tin cá nhân</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    <link rel="stylesheet" href="<c:url value='assets/font/fontawesome-free-5.15.3-web/css/all.min.css'/>">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="icon" href="<c:url value= './assets/img/logo3.png'/>">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.4/js/bootstrap.min.js"
            integrity="sha512-Cy3gSrKCS8aJ7AIaammc0wLXyKRmTa8ntgHvU01Tuz4EdsqVgk/lKzFm/b/8RxOWBaoHI2uGLLU6rXMbqKcGHA=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.4/css/bootstrap.css"
          integrity="sha512-KsdCRnLXUKDOyOPhhh7EjWSh2Mh/ZI64XwaYQPGyvuQYWBE1FGTCPnUKjLvD+DDQevQdks3US94aYJsIQxTiKg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="<c:url value= './assets/css/base.css'/>">
    <link rel="stylesheet" href="<c:url value= './assets/css/main.css'/>">
    <link rel="stylesheet" href="<c:url value= './assets/css/responsive.css'/>">
    <link rel="stylesheet" href="<c:url value= './assets/css/trangthongtin.css'/>">
    <link rel="stylesheet" href="<c:url value= './assets/css/grid.css'/>">
</head>
<body>
<%--  header  --%>
<%@include file="/header.jsp" %>
<%--  header  --%>
<div class="container">
    <h2 class="container-heading">Tài khoản</h2>
    <div class="grid wide">
        <div class="row">
            <div class="col-lg-3 user-profile-left">
                <div class="text-center user-info">
                    <img src="https://avatar-redirect.appspot.com/google/108477473411482458497?size=400"
                         style="width: 150px;" class="avatar img-circle" alt="avatar">
                    <h3 class="text-center">${sessionScope.user.name}</h3>
                    <input type="file" name="file" id="file" class="inputfile"/>
                    <!-- <input type="file" class="btn btn-light btn--m btn--inline btn-image" value="Chọn ảnh"></input> -->
                </div>
            </div>


            <div class="col-md-9 personal-info">
                <h3>Thông tin cá nhân</h3>

                <form class="form-horizontal" role="form" action="ChangePasswordController" method="post">
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Họ Tên:</label>
                        <div class="col-lg-8">
                            <input class="form-control" type="text" value="${sessionScope.user.name}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Địa chỉ:</label>
                        <div class="col-lg-8">
                            <input class="form-control" type="text" value="${sessionScope.user.address}" name="address">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Email:</label>
                        <div class="col-lg-8">
                            <input class="form-control" type="email" value="${sessionScope.user.email}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">SĐT:</label>
                        <div class="col-lg-8">
                            <input class="form-control" type="text" value="${sessionScope.user.phone}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Tên tài khoản:</label>
                        <div class="col-lg-8">
                            <input class="form-control" type="text" value="${sessionScope.user.email}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Mật khẩu mới:</label>
                        <div class="col-lg-8">
                            <input class="form-control" type="password" value="" name="newPass" id="newPass">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Xác nhận mật khẩu:</label>
                        <div class="col-lg-8">
                            <input class="form-control" type="password" name="confirmPass" id="confirmPass">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label"></label>
                        <div class="col-lg-8">
                            <button type="submit" class="btn-save"
                                    style="width: 150px; height: 40px; font-size: 1.6rem">Cập nhật
                            </button>
                            <span></span>
                            <input type="reset" class="btn btn-default" value="Thoát">
                        </div>
                    </div>
                    <p><font size="2" color="red" id="repassError"></font></p>
                    <div class="form-group">
                        <label class="col-lg-3 control-label"></label>
                        <div class="col-lg-8">
                            <span><%
                                if (request.getAttribute("changePass") != null) {
                                    out.print(request.getAttribute("changePass"));
                                }
                            %></span>
<%--                            <%String action = request.getParameter("action"); %>--%>
<%--                            <%if (action.equals("doimk")) { %>--%>
<%--                            <center><h2 style="color: #BDBDBD">Cập nhật thông tin thành công ! <span--%>
<%--                                    class="glyphicon glyphicon-alert"></span></h2></center>--%>
<%--                            <%} %>--%>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<%--    footer --%>
<%@include file="/footer.jsp" %>
<%--    footer --%>
<script src="<c:url value='./js/tool.js'/>"></script>
<script>
    if ($('#newPass').val().length < 5) {
        $('#passError').html('Mật khẩu phải nhiều hơn 6 kí tự');
        return false;
    }
    if ($('#newPass').val() !== $('#confirmPass').val()) {
        $('#repassError').html('Mật khẩu nhập lại không chính xác!');
        return false;
    }
</script>
</body>
</html>
