<%@ page import="com.example.webproject.BEAN.User" %>
<%@ page import="com.example.webproject.admin.dao.impl.AdminDAOImpl" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.webproject.BEAN.Category" %>
<%@ page import="com.example.webproject.DAO.daoimpl.CategoryDAOImpl" %><%--
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
    <title>Quản lý admin</title>

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
        <%@include file="./Header.jsp" %>
        <%--  header  --%>

        <%@include file="./slidernavbar.jsp" %>

        <div class="page-container">
            <!-- Content Wrapper START -->
            <div class="main-content">
                <div class="page-header">
                    <h2 class="header-title">Danh sách admin</h2>
                    <div class="header-sub-title">
                        <nav class="breadcrumb breadcrumb-dash">
                            <a href="#" class="breadcrumb-item"><i class="anticon anticon-home m-r-5"></i>Home</a>
                            <a class="breadcrumb-item" href="#">Apps</a>
                            <a class="breadcrumb-item" href="#">E-commerce</a>
                            <span class="breadcrumb-item active">Danh sách admin</span>
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
                            <table id="table" class="table table-hover e-commerce-table">
                                <thead>
                                <tr>
                                    <th>Admin ID</th>
                                    <th>Mật khẩu</th>
                                    <th>Họ tên</th>
                                    <th>Email</th>
                                    <th>Số điện thoại</th>
                                    <th>Ngày bắt đầu</th>
                                    <th>Quyền</th>
                                    <th>role</th>
                                    <th>Active</th>
                                    <th>Code</th>
                                    <th>Địa chỉ</th>
                                    <th>Action</th>

                                </tr>
                                </thead>
                                <tbody>
                                <%--                                <jsp:useBean id="getListAdmin" scope="request" type="java.util.List"/>--%>
                                <%--                                <c:forEach items="${getListAdmin}" var="ad">--%>
                                <c:forEach items="${listA}" var="item">

                                    <td>
                                       ${item.id}
                                    </td>
                                    <td>
                                        <div class="d-flex align-items-center">

                                            <h6 class="m-b-0">${item.matKhau}</h6>
                                        </div>
                                    </td>
                                    <td>${item.hoTen}
                                    </td>
                                    <td>${item.email}
                                    </td>
                                    <td>${item.sdt}
                                    </td>
                                    <td>${item.ngayBD}
                                    </td>
                                    <td>${item.quyen}
                                    </td>
                                    <td>${item.role}
                                    </td>
                                    <td>${item.active}
                                    </td>
                                    <td>${item.code}
                                    </td>
                                    <td>${item.address}>
                                    </td>

                                    <td class="text-right">
                                        <button onclick="location.href='editAdmin?id=${item.id}'" class="btn btn-icon btn-hover btn-sm btn-rounded pull-right">
                                            <i class="anticon anticon-edit"></i>
                                        </button>
                                        <button onclick="window.location.href='deleteAdmin?id=${item.id}'" class="btn btn-icon btn-hover btn-sm btn-rounded">
                                            <i class="anticon anticon-delete"></i>
                                        </button>
                                    </td>
                                </tr>
                                <%--                                </c:forEach>--%>
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
                                <h4>New admin</h4>
                            </div>
                            <div class="modal-body">
                                <form action="<%=request.getContextPath()%>/admin/addadmin" method="post">
                                    <div class="my-4 table-editor_input-wrapper" data-mdb-field="mdm">
                                        <div class="form-outline "><input name="pAdminId" type="text"
                                                                          class="table-editor__input form-control" value="">
                                            <label class="form-label" style="margin-left: 0px;">Admin ID</label>
                                            <div class="form-notch">
                                                <div class="form-notch-leading" style="width: 9px;"></div>
                                                <div class="form-notch-middle" style="width: 41.6px;"></div>
                                                <div class="form-notch-trailing"></div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="my-4 table-editor_input-wrapper" data-mdb-field="tdm">
                                        <div class="form-outline "><input type="text" name="pHoTen"
                                                                          class="table-editor__input form-control" value="">
                                            <label class="form-label" style="margin-left: 0px;">Họ tên</label>
                                            <div class="form-notch">
                                                <div class="form-notch-leading" style="width: 9px;"></div>
                                                <div class="form-notch-middle" style="width: 82.4px;"></div>
                                                <div class="form-notch-trailing"></div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="my-4 table-editor_input-wrapper" data-mdb-field="dmc">
                                        <div class="form-outline "><input type="text" name="pEmail"
                                                                          class="table-editor__input form-control" value="">
                                            <label class="form-label" style="margin-left: 0px;">Email</label>
                                            <div class="form-notch">
                                                <div class="form-notch-leading" style="width: 9px;"></div>
                                                <div class="form-notch-middle" style="width: 82.4px;"></div>
                                                <div class="form-notch-trailing"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="my-4 table-editor_input-wrapper" data-mdb-field="tdm">
                                        <div class="form-outline "><input type="text" name="pSDT"
                                                                          class="table-editor__input form-control" value="">
                                            <label class="form-label" style="margin-left: 0px;">SDT</label>
                                            <div class="form-notch">
                                                <div class="form-notch-leading" style="width: 9px;"></div>
                                                <div class="form-notch-middle" style="width: 82.4px;"></div>
                                                <div class="form-notch-trailing"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="my-4 table-editor_input-wrapper" data-mdb-field="tdm">
                                        <div class="form-outline "><input type="date" name="pNgayBD"
                                                                          class="table-editor__input form-control" value="">
                                            <label class="form-label" style="margin-left: 0px;">Ngày bắt đầu</label>
                                            <div class="form-notch">
                                                <div class="form-notch-leading" style="width: 9px;"></div>
                                                <div class="form-notch-middle" style="width: 82.4px;"></div>
                                                <div class="form-notch-trailing"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="my-4 table-editor_input-wrapper" data-mdb-field="tdm">
                                        <div class="form-outline "><input type="text" name="pQuyen"
                                                                          class="table-editor__input form-control" value="">
                                            <label class="form-label" style="margin-left: 0px;">Quyền</label>
                                            <div class="form-notch">
                                                <div class="form-notch-leading" style="width: 9px;"></div>
                                                <div class="form-notch-middle" style="width: 82.4px;"></div>
                                                <div class="form-notch-trailing"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="my-4 table-editor_input-wrapper" data-mdb-field="tdm">
                                        <div class="form-outline "><input type="text" name="pRole"
                                                                          class="table-editor__input form-control" value="">
                                            <label class="form-label" style="margin-left: 0px;">Role</label>
                                            <div class="form-notch">
                                                <div class="form-notch-leading" style="width: 9px;"></div>
                                                <div class="form-notch-middle" style="width: 82.4px;"></div>
                                                <div class="form-notch-trailing"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="my-4 table-editor_input-wrapper" data-mdb-field="tdm">
                                        <div class="form-outline "><input type="text" name="pActive"
                                                                          class="table-editor__input form-control" value="">
                                            <label class="form-label" style="margin-left: 0px;">Active</label>
                                            <div class="form-notch">
                                                <div class="form-notch-leading" style="width: 9px;"></div>
                                                <div class="form-notch-middle" style="width: 82.4px;"></div>
                                                <div class="form-notch-trailing"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="my-4 table-editor_input-wrapper" data-mdb-field="tdm">
                                        <div class="form-outline "><input type="text" name="pCode"
                                                                          class="table-editor__input form-control" value="">
                                            <label class="form-label" style="margin-left: 0px;">Code</label>
                                            <div class="form-notch">
                                                <div class="form-notch-leading" style="width: 9px;"></div>
                                                <div class="form-notch-middle" style="width: 82.4px;"></div>
                                                <div class="form-notch-trailing"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="my-4 table-editor_input-wrapper" data-mdb-field="tdm">
                                        <div class="form-outline "><input type="text" name="PAddress"
                                                                          class="table-editor__input form-control" value="">
                                            <label class="form-label" style="margin-left: 0px;">Địa chỉ</label>
                                            <div class="form-notch">
                                                <div class="form-notch-leading" style="width: 9px;"></div>
                                                <div class="form-notch-middle" style="width: 82.4px;"></div>
                                                <div class="form-notch-trailing"></div>
                                            </div>
                                        </div>
                                    </div>
<%--                                    <div class="my-4 table-editor_input-wrapper" data-mdb-field="icon">--%>
<%--                                        <div class="form-outline "><input type="text" name="pIcon"--%>
<%--                                                                          class="table-editor__input form-control" value="">--%>
<%--                                            <label class="form-label" style="margin-left: 0px;">Icon</label>--%>
<%--                                            <div class="form-notch">--%>
<%--                                                <div class="form-notch-leading" style="width: 9px;"></div>--%>
<%--                                                <div class="form-notch-middle" style="width: 82.4px;"></div>--%>
<%--                                                <div class="form-notch-trailing"></div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
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
