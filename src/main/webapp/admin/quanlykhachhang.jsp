<%@ page import="com.example.webproject.BEAN.User" %>
<%@ page import="com.example.webproject.admin.dao.impl.AdminDAOImpl" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by LeTrongKhiem.
  User: User
  Date: 19-Apr-22
  Time: 11:44 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý khách hàng</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    <link rel="stylesheet" href="<c:url value='../assets/font/fontawesome-free-5.15.3-web/css/all.min.css'/>">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="icon" href="<c:url value= '../assets/img/logo3.png'/>">
    <link rel="stylesheet" href="<c:url value='./assets/css/app.min.css'/>">
</head>
<body>
<div class="app">
    <div class="layout">
        <%--  header  --%>
        <%@include file="./header.jsp" %>
        <%--  header  --%>

        <%@include file="./slidernavbar.jsp" %>

        <div class="page-container">
            <!-- Content Wrapper START -->
            <div class="main-content">
                <div class="page-header">
                    <h2 class="header-title">Danh sách khách hàng</h2>
                    <div class="header-sub-title">
                        <nav class="breadcrumb breadcrumb-dash">
                            <a href="#" class="breadcrumb-item"><i class="anticon anticon-home m-r-5"></i>Home</a>
                            <a class="breadcrumb-item" href="#">Apps</a>
                            <a class="breadcrumb-item" href="#">E-commerce</a>
                            <span class="breadcrumb-item active">Danh sách khách hàng</span>
                        </nav>
                    </div>
                </div>
                <div class="card">
                    <div class="card-body">
                        <div class="row m-b-30">
                            <div class="col-lg-8">
                                <div class="d-md-flex">
                                    <div class="m-b-10">
                                        <select class="custom-select" style="min-width: 180px;">
                                            <option selected>Status</option>
                                            <option value="all">All</option>
                                            <option value="approved">Approved</option>
                                            <option value="pending">Pending</option>
                                            <option value="rejected">Rejected</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="table-responsive">
                            <table class="table table-hover e-commerce-table">
                                <thead>
                                <tr>
                                    <th>UserId</th>
                                    <th>HoTen</th>
                                    <th>Email</th>
                                    <th>Sdt</th>
                                    <th>Role</th>
                                    <th>Gioi Tinh</th>
                                    <th>Active</th>
                                    <th>DiaChi</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <%--                                <jsp:useBean id="getListAdmin" scope="request" type="java.util.List"/>--%>
                                <%--                                <c:forEach items="${getListAdmin}" var="ad">--%>
                                <%ArrayList<User> userArrayList = new AdminDAOImpl().getListCustomer();%>
                                <%for (User user : userArrayList) {%>
                                <tr>
                                    <td>
                                        <%=user.getId()%>
                                    </td>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <div class="avatar avatar-image avatar-sm m-r-10">
                                                <img src="assets/images/avatars/thumb-1.jpg" alt="">
                                            </div>
                                            <%--                                            <h6 class="m-b-0">${ad.hoTen}</h6>--%>
                                            <h6 class="m-b-0"><%=user.getName()%></h6>
                                        </div>
                                    </td>
                                    <%--                                    <td>${ad.email}</td>--%>
                                    <%--                                    <td>${ad.ngayBD}</td>--%>
                                    <%--                                    <td>${ad.role}</td>--%>
                                    <%--                                    <td>${ad.address}</td>--%>

                                    <td><%=user.getEmail()%>
                                    </td>
                                    <td><%=user.getPhone()%>
                                    </td>
                                    <td><%=user.getRole()%>
                                    </td>
                                    <td><%=user.getGender()%>
                                    </td>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <div class="badge badge-success badge-dot m-r-10"></div>
                                            <%--                                            <div>${ad.active}</div>--%>
                                            <div><%
                                                if (user.isActive() == 1) {
                                                    out.print("Đã xác nhận");
                                            %>
                                                <%} else out.print("Chưa xác nhận");%>
                                            </div>
                                        </div>
                                    </td>
                                    <td><%=user.getAddress()%>
                                    </td>
                                    <td class="text-right">
                                        <button class="btn btn-icon btn-hover btn-sm btn-rounded pull-right">
                                            <i class="anticon anticon-edit"></i>
                                        </button>
                                        <button class="btn btn-icon btn-hover btn-sm btn-rounded">
                                            <i class="anticon anticon-delete"></i>
                                        </button>
                                    </td>
                                </tr>
                                <%--                                </c:forEach>--%>
                                <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Content Wrapper END -->

</div>
<!-- Core Vendors JS -->
<script src="<c:url value='assets/js/vendors.min.js'/>"></script>

<!-- page js -->
<script src="<c:url value='assets/vendors/datatables/jquery.dataTables.min.js'/>"></script>
<script src="<c:url value='assets/vendors/datatables/dataTables.bootstrap.min.js'/>"></script>
<script src="<c:url value='assets/js/pages/e-commerce-order-list.js'/>"></script>

<!-- Core JS -->
<script src="<c:url value='assets/js/app.min.js'/>"></script>
</body>
</html>
