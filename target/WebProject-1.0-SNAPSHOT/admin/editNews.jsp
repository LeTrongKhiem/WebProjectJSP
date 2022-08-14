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
    <title>Sửa tin tức</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    <link rel="stylesheet" href="<c:url value='../assets/font/fontawesome-free-5.15.3-web/css/all.min.css'/>">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="icon" href="<c:url value= '../assets/img/logo3.png'/>">
    <link rel="stylesheet" href="<c:url value='./assets/css/app.min.css'/>">
    <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
            rel="stylesheet"
    />
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
</head>
<style>

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
                            <span class="breadcrumb-item active">Danh sách tin tức</span>
                        </nav>
                    </div>
                </div>
                <main>
                    <div class="container">
                        <!-- Modal -->
                        <div class="" id="edit" tabindex="-1"  aria-labelledby="exampleModalLongTitle">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4>Edit News</h4>
                                    </div>
                                    <div class="modal-body">
                                        <form action="<%=request.getContextPath()%>/admin/editNews" method="post">

                                            <div class="my-4 table-editor_input-wrapper" data-mdb-field="a3">
                                                <div class="my-4 table-editor_input-wrapper" data-mdb-field="mtt">
                                                    <div class="form-outline "><input type="text" name="eMaTinTuc"
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
                                                    <div class="form-outline "><input type="text" name="eTieuDe"
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
                                                    <div class="form-outline "><input type="text" name="eTomTat"
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

                                                        <textarea name="eNoiDung" id="content" rows="10" cols="80">

                    </textarea>

                                                    </div>

                                                </div>
                                                <div class="my-4 table-editor_input-wrapper" data-mdb-field="dnd">
                                                    <div class="form-outline "><input type="date" name="eNgayDang"
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
                                                    <div class="form-outline "><input type="text" name="eTacGia"
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
                                                    <div class="form-outline "><input type="text" name="eLinkanh"
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
                        <!--Section: Content-->
                    </div>
                </main>
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
<script>
    function getFile(filePath) {
        return filePath.substr(filePath.lastIndexOf('\\') + 1).split('.')[0]+'.'+filePath.substr(filePath.lastIndexOf('\\') + 1).split('.')[1];
    }
    function getoutput() {
        outputfile.value ='./assets/img/dssp/'+ getFile(inputfile.value);
    };
</script>
</script>
</body>
</html>
