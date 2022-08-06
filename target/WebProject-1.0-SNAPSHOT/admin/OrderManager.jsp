<%@ page import="java.text.DecimalFormat" %><%--
  Created by LeTrongKhiem.
  User: User
  Date: 28-Jun-22
  Time: 8:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<html>
<head>
    <title>Quản lý đơn hàng</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    <link rel="stylesheet" href="<c:url value='../assets/font/fontawesome-free-5.15.3-web/css/all.min.css'/>">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="icon" href="<c:url value= '../assets/img/logo3.png'/>">
    <link rel="stylesheet" href="<c:url value='./assets/css/app.min.css'/>">
</head>
<link rel="stylesheet" href="<c:url value='./assets/css/app.min.css'/>">
<script>
    function showMessage(id) {
        var options = confirm('Bạn có muốn xóa sản phẩm này');
        if (options === true) {
            window.location.href = 'deleteOrder?id=' + id;
        }
    }
    function showMessageAccept(id) {
        var options = confirm('Bạn có duyệt đơn hàng này');
        if (options === true) {
            window.location.href = 'accept?id=' + id;
        }
    }
</script>
<style>
    .btn:hover {
        border: none !important;
    }
</style>
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
                    <h2 class="header-title">Danh sách đơn hàng</h2>
                    <div class="header-sub-title">
                        <nav class="breadcrumb breadcrumb-dash">
                            <a href="#" class="breadcrumb-item"><i class="anticon anticon-home m-r-5"></i>Home</a>
                            <a class="breadcrumb-item" href="#">Apps</a>
                            <a class="breadcrumb-item" href="#">E-commerce</a>
                            <span class="breadcrumb-item active">Danh sách đơn hàng</span>
                        </nav>
                    </div>
                </div>
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex justify-content-end mb-4">
                            <button type="button" class="btn btn-primary" data-toggle="modal"
                                    data-target="#exampleModalLong">
                                <i class="fa fa-plus"></i>
                            </button>
                        </div>
                        <div class="row m-b-30">
                            <div class="col-lg-8">
                                <div class="d-md-flex">
                                    <div class="m-b-10">
                                        <select class="custom-select" style="min-width: 180px;">
                                            <option selected>Status</option>
                                            <option value="all" href="/admin/order?status=true">Đã xác nhận</option>
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
                                    <th>Tài khoản</th>
                                    <th>Tên</th>
                                    <th>Địa chỉ</th>
                                    <th>Thời gian đặt hàng</th>
                                    <th>Số điện thoại</th>
                                    <th>Tổng tiền</th>
                                    <th>Trạng thái</th>
                                </tr>
                                </thead>
                                <tbody>
                                <jsp:useBean id="listOrder" scope="request" type="java.util.List"/>
                                <c:forEach items="${listOrder}" var="item">
                                    <tr>
                                        <td>${item.user}</td>
                                        <td>${item.name}</td>
                                        <td>${item.address}</td>
                                        <td>${item.createdAt}</td>
                                        <td>${item.phoneNumber}</td>
                                        <td>${item.dinhDang(item.totalPrice)}</td>
                                        <td>${item.status == true ? "Đã duyệt" : "Chưa duyệt"}</td>
<%--                                        <c:if test = "${item.status == true}">--%>
<%--                                            <td>Đã duyệt</td>--%>
<%--                                        </c:if>--%>
                                        <td class="text-right">
                                            <button onclick="location.href='orderdetail?id=${item.orderID}'"
                                                    class="btn btn-icon btn-hover btn-sm btn-rounded">
                                                <i class="anticon anticon-folder-open"></i>
                                            </button>
                                            <button onclick="showMessageAccept(${item.orderID})"
                                                    class="btn btn-icon btn-hover btn-sm btn-rounded pull-right">
                                                <i class="anticon anticon-edit"></i>
                                            </button>
                                            <button onclick="showMessage(${item.orderID})"
                                                    class="btn btn-icon btn-hover btn-sm btn-rounded">
                                                <i class="anticon anticon-delete"></i>
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog"
                     aria-labelledby="exampleModalLongTitle" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4>New item</h4>
                            </div>
                            <div class="modal-body">
                                <form action="<%=request.getContextPath()%>/admin/addbanner" method="post"
                                      enctype="multipart/form-data">

                                    <div class="my-4 table-editor_input-wrapper" data-mdb-field="a3">
                                        <div class="form-outline "><input type="file" name="imageBanner"
                                                                          class="table-editor__input form-control"
                                                                          value="Upload">
                                            <label class="form-label" style="margin-left: 0px;"> Hình Ảnh
                                            </label>
                                            <div class="form-notch">
                                                <div class="form-notch-leading" style="width: 9px;"></div>
                                                <div class="form-notch-middle" style="width: 60.8px;"></div>
                                                <div class="form-notch-trailing"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close
                                        </button>
                                        <button type="submit" class="btn btn-success">Save</button>
                                    </div>
                                </form>
                            </div>

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

