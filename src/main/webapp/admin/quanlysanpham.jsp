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

    <!-- Google Fonts -->
    <link
            href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
            rel="stylesheet"
    />
    <!-- MDB -->
    <link
            href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.1.0/mdb.min.css"
            rel="stylesheet"
    />
    <!-- MDB -->
    <script
            type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.1.0/mdb.min.js"
    ></script>
    <link rel="stylesheet" href="<c:url value='./assets/css/app.min.css'/>">
    <script>
        function showMessage(id) {
            var options = confirm('Bạn có muốn xóa sản phẩm này');
            if (options===true){
                window.location.href = 'delete?id='+id;
            }
        }
    </script>
</head>
<style>
  .btn:hover{
      border: none !important;
  }
</style>
<body>
<div class="app">
    <div class="layout">
        <%--  header  --%>
        <%@include file="Header.jsp" %>
        <%--  header  --%>

        <%@include file="./slidernavbar.jsp" %>

        <div class="page-container">
            <!-- Content Wrapper START -->
            <div class="main-content">
                <div class="page-header">
                    <h2 class="header-title">Danh sách sản phẩm</h2>
                    <div class="header-sub-title">
                        <nav class="breadcrumb breadcrumb-dash">
                            <a href="#" class="breadcrumb-item"><i class="anticon anticon-home m-r-5"></i>Home</a>
                            <a class="breadcrumb-item" href="#">Apps</a>
                            <a class="breadcrumb-item" href="#">E-commerce</a>
                            <span class="breadcrumb-item active">Danh sách sản phẩm</span>
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
                            <table class="table table-hover e-commerce-table">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Hình</th>
                                    <th>Tên Sản Phẩm</th>
                                    <th>Giá</th>
                                    <th>Loại Sản Phẩm</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <%int i = 1;%>
                                <tbody>
                                <c:forEach items="${listP}" var="item">
                                <td><%=i++%></td>
                                <td><img src=".${item.link_hinhanh}" style="width: 100px"></td>
                                <td>${item.tenSP}</td>
                                <td>${item.giaSP}</td>
                                <td>${item.loaiSP}</td>
                                    <td class="text-right">
                                        <button onclick="location.href='edit-product?id=${item.maSP}'" class="btn btn-icon btn-hover btn-sm btn-rounded pull-right">
                                            <i class="anticon anticon-edit"></i>
                                        </button>
                                        <button onclick="window.location.href='delete?id=${item.maSP}'" class="btn btn-icon btn-hover btn-sm btn-rounded">
                                            <i class="anticon anticon-delete"></i>
                                        </button>
                                        <button onclick="window.location.href='WareHouseController?productId=${item.maSP}'" class="btn btn-icon btn-hover btn-sm btn-rounded">
                                            <i class="anticon anticon-inbox"></i>
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
                                <form action="<%=request.getContextPath()%>/admin/add" method="post" enctype="multipart/form-data">
                                    <div class="my-4 table-editor_input-wrapper" data-mdb-field="msp">
                                        <div class="form-outline "><input name="pid" type="text"
                                                                          class="table-editor__input form-control" value="">
                                            <label class="form-label" style="margin-left: 0px;">Mã SP</label>
                                            <div class="form-notch">
                                                <div class="form-notch-leading" style="width: 9px;"></div>
                                                <div class="form-notch-middle" style="width: 41.6px;"></div>
                                                <div class="form-notch-trailing"></div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="my-4 table-editor_input-wrapper" data-mdb-field="tsp">
                                        <div class="form-outline "><input type="text" name="pName"
                                                                          class="table-editor__input form-control" value="">
                                            <label class="form-label" style="margin-left: 0px;">Tên Sản
                                                Phẩm</label>
                                            <div class="form-notch">
                                                <div class="form-notch-leading" style="width: 9px;"></div>
                                                <div class="form-notch-middle" style="width: 82.4px;"></div>
                                                <div class="form-notch-trailing"></div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="my-4 table-editor_input-wrapper" data-mdb-field="a3">
                                        <div class="form-outline "><input type="file" name="image"
                                                                          class="table-editor__input form-control" value="Upload">
                                            <label class="form-label" style="margin-left: 0px;"> Hình Ảnh
                                                </label>
                                            <div class="form-notch">
                                                <div class="form-notch-leading" style="width: 9px;"></div>
                                                <div class="form-notch-middle" style="width: 60.8px;"></div>
                                                <div class="form-notch-trailing"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="my-4 table-editor_input-wrapper" data-mdb-field="tsp">
                                        <div class="form-outline "><input type="text" name="pPrice"
                                                                          class="table-editor__input form-control" value="">
                                            <label class="form-label" style="margin-left: 0px;">Giá Sản Phẩm</label>
                                            <div class="form-notch">
                                                <div class="form-notch-leading" style="width: 9px;"></div>
                                                <div class="form-notch-middle" style="width: 82.4px;"></div>
                                                <div class="form-notch-trailing"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="my-4 table-editor_input-wrapper" data-mdb-field="tsp">
                                        <div class="form-outline "><input type="text" name="pManHinh"
                                                                          class="table-editor__input form-control" value="">
                                            <label class="form-label" style="margin-left: 0px;">Màn Hình</label>
                                            <div class="form-notch">
                                                <div class="form-notch-leading" style="width: 9px;"></div>
                                                <div class="form-notch-middle" style="width: 82.4px;"></div>
                                                <div class="form-notch-trailing"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="my-4 table-editor_input-wrapper" data-mdb-field="tsp">
                                        <div class="form-outline "><input type="text" name="pHDH"
                                                                          class="table-editor__input form-control" value="">
                                            <label class="form-label" style="margin-left: 0px;">Hệ Điều Hành</label>
                                            <div class="form-notch">
                                                <div class="form-notch-leading" style="width: 9px;"></div>
                                                <div class="form-notch-middle" style="width: 82.4px;"></div>
                                                <div class="form-notch-trailing"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="my-4 table-editor_input-wrapper" data-mdb-field="tsp">
                                        <div class="form-outline "><input type="text" name="pRAM"
                                                                          class="table-editor__input form-control" value="">
                                            <label class="form-label" style="margin-left: 0px;">RAM</label>
                                            <div class="form-notch">
                                                <div class="form-notch-leading" style="width: 9px;"></div>
                                                <div class="form-notch-middle" style="width: 82.4px;"></div>
                                                <div class="form-notch-trailing"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="my-4 table-editor_input-wrapper" data-mdb-field="tsp">
                                        <div class="form-outline "><input type="text" name="pCPU"
                                                                          class="table-editor__input form-control" value="">
                                            <label class="form-label" style="margin-left: 0px;">CPU</label>
                                            <div class="form-notch">
                                                <div class="form-notch-leading" style="width: 9px;"></div>
                                                <div class="form-notch-middle" style="width: 82.4px;"></div>
                                                <div class="form-notch-trailing"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="my-4 table-editor_input-wrapper" data-mdb-field="tsp">
                                        <div class="form-outline "><input type="text" name="pThietKe"
                                                                          class="table-editor__input form-control" value="">
                                            <label class="form-label" style="margin-left: 0px;">Thiết Kế</label>
                                            <div class="form-notch">
                                                <div class="form-notch-leading" style="width: 9px;"></div>
                                                <div class="form-notch-middle" style="width: 82.4px;"></div>
                                                <div class="form-notch-trailing"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="my-4 table-editor_input-wrapper" data-mdb-field="a3">
                                        <div class="form-group">
                                            <label>Loại Sản Phẩm</label>
                                            <select name="loaiSP" class="form-select" aria-label="Default select example">
                                                <option>DT</option>
                                                <option>Laptop</option>
                                                <option>Phu Kien</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="my-4 table-editor_input-wrapper" data-mdb-field="a3">
                                        <div class="form-group">
                                            <label>Danh Mục</label>
                                            <select name="category" class="form-select" aria-label="Default select example">
                                                <c:forEach items="${listC}" var="o">
                                                    <option value="${o.maDanhMuc}">${o.tenDanhMuc}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
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
