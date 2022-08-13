<%@ page import="com.example.webproject.DAO.daoimpl.NewsDAOImpl" %>
<%@ page import="com.example.webproject.BEAN.News" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by LeTrongKhiem.
  User: User
  Date: 17-Jun-22
  Time: 3:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<html>
<head>
    <title>Quản lý Tin Tức</title>
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
    function showMessage(maTicTuc) {
        var options = confirm('Bạn có muốn xóa tin tức này');
        if (options === true) {
            window.location.href = 'deleteTinTuc?maTinTuc=' + maTicTuc;
        }
    }
</script>
</head>
<style>
    .btn:hover {
        border: none !important;
    }
</style>
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
                    <h2 class="header-title">Danh sách tin tức</h2>
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
                                    <th>mã tin tức</th>
                                    <th>Tiêu đề</th>
                                    <th>Tóm tắt</th>
                                    <th>Nội dung</th>
                                    <th>Ngày Đăng</th>
                                    <th>Tác giả</th>
                                    <th>Hình ảnh</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${listN}" var="item">
                                <tr>
                                    <td>${item.maTinTuc}
                                    </td>
                                    <td>${item.tieuDe}
                                    </td>
                                    <td>${item.tomTat}
                                    </td>
                                    <td>${item.noiDung}
                                    </td>
                                    <td>${item.ngayDang}
                                    </td>
                                    <td>${item.tacGia}
                                    </td>
                                    <td>${item.link_hinhanh}
                                    </td>
                                    <td class="text-right">
                                        <button onclick="location.href='editNews?maTinTuc=${item.maTinTuc}'" class="btn btn-icon btn-hover btn-sm btn-rounded pull-right">
                                            <i class="anticon anticon-edit"></i>
                                        </button>
                                        <button onclick="window.location.href='deleteNews?maTinTuc=${item.maTinTuc}'" class="btn btn-icon btn-hover btn-sm btn-rounded">
                                            <i class="anticon anticon-delete"></i>
                                        </button>
                                    </td>
                                </tr>
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
                                <h4>New tin tức</h4>
                            </div>
                            <div class="modal-body">
                                <form action="<%=request.getContextPath()%>/admin/addtintuc" method="post"
                                      enctype="multipart/form-data">

                                    <div class="my-4 table-editor_input-wrapper" data-mdb-field="a3">
                                        <div class="my-4 table-editor_input-wrapper" data-mdb-field="mtt">
                                            <div class="form-outline "><input type="text" name="pMaTinTuc"
                                                                              class="table-editor__input form-control"
                                                                              value="">
                                                <label class="form-label" style="margin-left: 0px;">mã tin tức</label>
                                                <div class="form-notch">
                                                    <div class="form-notch-leading" style="width: 9px;"></div>
                                                    <div class="form-notch-middle" style="width: 82.4px;"></div>
                                                    <div class="form-notch-trailing"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="my-4 table-editor_input-wrapper" data-mdb-field="td">
                                            <div class="form-outline "><input type="text" name="pTieuDe"
                                                                              class="table-editor__input form-control"
                                                                              value="">
                                                <label class="form-label" style="margin-left: 0px;">tiêu đề</label>
                                                <div class="form-notch">
                                                    <div class="form-notch-leading" style="width: 9px;"></div>
                                                    <div class="form-notch-middle" style="width: 82.4px;"></div>
                                                    <div class="form-notch-trailing"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="my-4 table-editor_input-wrapper" data-mdb-field="tt">
                                            <div class="form-outline "><input type="text" name="pTomTat"
                                                                              class="table-editor__input form-control"
                                                                              value="">
                                                <label class="form-label" style="margin-left: 0px;">tóm tắt</label>
                                                <div class="form-notch">
                                                    <div class="form-notch-leading" style="width: 9px;"></div>
                                                    <div class="form-notch-middle" style="width: 82.4px;"></div>
                                                    <div class="form-notch-trailing"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="my-4 table-editor_input-wrapper" data-mdb-field="dnd">
                                            <div class="form-outline ">
                                                <%--                                                <input type="text" name="pnd"--%>
                                                <%--                                                                              class="table-editor__input form-control" value="">--%>
                                                <%--                                                <label class="form-label" style="margin-left: 0px;">nội dung</label>--%>
                                                <%--                                                <div class="form-notch">--%>
                                                <%--                                                    <div class="form-notch-leading" style="width: 9px;"></div>--%>
                                                <%--                                                    <div class="form-notch-middle" style="width: 82.4px;"></div>--%>
                                                <%--                                                    <div class="form-notch-trailing"></div>--%>
                                                <%--                                                </div>--%>

                    <textarea name="pNoiDung" id="content" rows="10" cols="80">

                    </textarea>

                                            </div>

                                        </div>
                                        <div class="my-4 table-editor_input-wrapper" data-mdb-field="dnd">
                                            <div class="form-outline "><input type="date" name="pNgayDang"
                                                                              class="table-editor__input form-control"
                                                                              value="">
                                                <label class="form-label" style="margin-left: 0px;">ngày đăng</label>
                                                <div class="form-notch">
                                                    <div class="form-notch-leading" style="width: 9px;"></div>
                                                    <div class="form-notch-middle" style="width: 82.4px;"></div>
                                                    <div class="form-notch-trailing"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="my-4 table-editor_input-wrapper" data-mdb-field="dtg">
                                            <div class="form-outline "><input type="text" name="pTacGia"
                                                                              class="table-editor__input form-control"
                                                                              value="">
                                                <label class="form-label" style="margin-left: 0px;">tác giả</label>
                                                <div class="form-notch">
                                                    <div class="form-notch-leading" style="width: 9px;"></div>
                                                    <div class="form-notch-middle" style="width: 82.4px;"></div>
                                                    <div class="form-notch-trailing"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="my-4 table-editor_input-wrapper" data-mdb-field="dla">
                                            <div class="form-outline "><input type="text" name="pLinkanh"
                                                                              class="table-editor__input form-control"
                                                                              value="">
                                                <label class="form-label" style="margin-left: 0px;">link ảnh</label>
                                                <div class="form-notch">
                                                    <div class="form-notch-leading" style="width: 9px;"></div>
                                                    <div class="form-notch-middle" style="width: 82.4px;"></div>
                                                    <div class="form-notch-trailing"></div>
                                                </div>
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
<script src="https://cdn.ckeditor.com/ckeditor5/35.0.1/classic/ckeditor.js"></script>
<script>
    ClassicEditor
        .create(document.querySelector('#content'))
        .catch(error => {
            console.error(error);
        });
    CKEDITOR.replace('content');
</script>
</body>
</html>