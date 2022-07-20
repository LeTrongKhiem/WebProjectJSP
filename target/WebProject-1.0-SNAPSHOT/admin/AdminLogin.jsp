<%@ page import="com.example.webproject.BEAN.Admin" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.example.webproject.admin.dao.impl.AdminDAOImpl" %><%--
  Created by LeTrongKhiem.
  User: User
  Date: 19-Apr-22
  Time: 11:07 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="common/taglib.jsp" %>
<%
    String error = (String) request.getAttribute("error");
    Map<String, Admin> listAdmin = AdminDAOImpl.getInstance().listAdmin();
    session.setAttribute("listAdmin", listAdmin);
%>
<html>
<head>
    <title>Admin Login</title>
    <link href="<c:url value='./assets/css/app.min.css'/>" rel="stylesheet">
</head>
<body>
<%--<%--%>
<%--    String uid = (String) session.getAttribute("user");--%>
<%--    if (uid == null) {--%>
<%--%>--%>
<%--<jsp:forward page="AdminLogin.jsp"/>--%>
<%--<%--%>
<%--} else {--%>

<%--%>--%>
<%--<jsp:forward page="quanlynhanvien.jsp"/>--%>
<%--<%--%>
<%--    }--%>
<%--%>--%>
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
                                <form action="../LoginAdminController" method="post">
                                    <div class="form-group">
                                        <label class="font-weight-semibold" for="email">Username:</label>
                                        <div class="input-affix">
                                            <i class="prefix-icon anticon anticon-user"></i>
                                            <input type="text" class="form-control" id="email"
                                                   placeholder="Email" name="email" value="<%
                    if (request.getAttribute("email")!=null && !request.getAttribute("email").equals("")) {
                        out.print(request.getAttribute("email"));
                    }
                %>">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="font-weight-semibold" for="password">Password:</label>
                                        <a class="float-right font-size-13 text-muted" href="">Forget Password?</a>
                                        <div class="input-affix m-b-10">
                                            <i class="prefix-icon anticon anticon-lock"></i>
                                            <input type="password" class="form-control" id="password"
                                                   placeholder="Password" name="password" value="<%
                     if (request.getAttribute("pass")!=null && !request.getAttribute("pass").equals("")) {
                        out.print("");
                    }
                       %>">
                                        </div>
                                    </div>
                                    <p id="errorLogin" style="color: red; font-size: 16px; text-align: center"><%
                                        if (request.getAttribute("errorAccount") != null && !request.getAttribute("errorAccount").equals("")) {
                                            out.print(request.getAttribute("errorAccount"));
                                        }
                                    %></p>
                                    <div class="form-group">
                                        <div class="d-flex align-items-center justify-content-between">
                                                <span class="font-size-13 text-muted">
                                                    Don't have an account?
                                                    <a class="small" href=""> Signup</a>
                                                </span>
                                            <button class="btn btn-primary" type="submit">Sign In</button>
                                        </div>
                                    </div>
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
