<%@ page import="java.util.Map" %>
<%@ page import="com.example.webproject.BEAN.User" %>
<%@ page import="com.example.webproject.DAO.daoimpl.UserDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
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
    <title>Admin Register</title>
    <link href="<c:url value='./assets/css/app.min.css'/>" rel="stylesheet">
</head>
<body>
<div class="app">
    <div class="container-fluid p-h-0 p-v-20 bg full-height d-flex"
         style="">
        <div class="d-flex flex-column justify-content-between w-100">
            <div class="container d-flex h-100">
                <div class="row align-items-center w-100">
                    <div class="col-md-7 col-lg-5 m-h-auto">
                        <div class="card shadow-lg">
                            <div class="card-body">
                                <div class="d-flex align-items-center justify-content-between m-b-30">
                                    <h2 class="m-b-0">Sign In</h2>
                                </div>
                                <form action="../admin/RegisterAdminController" method="post">
                                    <div class="form-group">
                                        <label class="font-weight-semibold" for="email">Email:</label>
                                        <div class="input-affix">
                                            <i class="prefix-icon anticon anticon-user"></i>
                                            <input type="text" class="form-control" id="email"
                                                   placeholder="Email" name="email" value="">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="font-weight-semibold" for="password">Password:</label>
                                        <div class="input-affix m-b-10">
                                            <i class="prefix-icon anticon anticon-lock"></i>
                                            <input type="password" class="form-control" id="password"
                                                   placeholder="Password" name="password" value="">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="font-weight-semibold" for="email">FullName:</label>
                                        <div class="input-affix">
                                            <i class="prefix-icon anticon anticon-user"></i>
                                            <input type="text" class="form-control" id="fname"
                                                   placeholder="FullName" name="fname" value="">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="font-weight-semibold" for="password">SDT:</label>
                                        <div class="input-affix m-b-10">
                                            <i class="prefix-icon anticon anticon-lock"></i>
                                            <input type="text" class="form-control" id="sdt"
                                                   placeholder="Phone" name="phone" value="">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="font-weight-semibold" for="email">Address:</label>
                                        <div class="input-affix">
                                            <i class="prefix-icon anticon anticon-user"></i>
                                            <input type="text" class="form-control" id="address"
                                                   placeholder="Address" name="address" value="">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="font-weight-semibold" for="password">Quyen:</label>
                                        <div class="input-affix m-b-10">
                                            <select name="role" id="">
                                                <option value="1">NV</option>
                                                <option value="2">Admin</option>
                                                <option value="3">QT</option>
                                            </select>
                                        </div>
                                    </div>
                                    <p id="errorLogin" style="color: red; font-size: 16px; text-align: center"></p>
                                    <button class="btn btn-primary" type="submit">Sign Up</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
