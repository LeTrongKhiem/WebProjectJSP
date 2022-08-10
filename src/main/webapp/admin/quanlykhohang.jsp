<%--
  Created by LeTrongKhiem.
  User: User
  Date: 21-Jul-22
  Time: 10:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý kho hang</title>

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
        <%@include file="Header.jsp" %>
        <%--  header  --%>

        <%@include file="./slidernavbar.jsp" %>

        <div class="page-container">
            <!-- Content Wrapper START -->
            <div class="main-content">
                <div class="page-header">
                    <h2 class="header-title">Quản lý kho hang</h2>
                    <div class="header-sub-title">
                        <nav class="breadcrumb breadcrumb-dash">
                            <a href="#" class="breadcrumb-item"><i class="anticon anticon-home m-r-5"></i>Home</a>
                            <a class="breadcrumb-item" href="#">Apps</a>
                            <a class="breadcrumb-item" href="#">E-commerce</a>
                            <span class="breadcrumb-item active">Quản lý kho hang</span>
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
                                        <h4>Quản lý kho hang</h4>
                                    </div>
                                    <div class="modal-body">
                                        <form action="<%=request.getContextPath()%>/admin/WareHouseController" method="post">
                                            <div class="my-4 table-editor_input-wrapper" data-mdb-field="msp">
                                                <div class="form-outline "><input type="text" name="productId" autofocus
                                                                                  class="table-editor__input form-control" value="${warehouse.productId}" readonly>
                                                    <label class="form-label" style="margin-left: 0px;">Mã SP</label>
                                                    <div class="form-notch">
                                                        <div class="form-notch-leading" style="width: 9px;"></div>
                                                        <div class="form-notch-middle" style="width: 41.6px;"></div>
                                                        <div class="form-notch-trailing"></div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="my-4 table-editor_input-wrapper" data-mdb-field="tsp">
                                                <div class="form-outline "><input type="text" name="quantity"  value="${warehouse.quantity}"
                                                                                  class="table-editor__input form-control" checked >
                                                    <label class="form-label">Số lượng còn lại trong kho</label>
                                                    <div class="form-notch">
                                                        <div class="form-notch-leading" style="width: 9px;"></div>
                                                        <div class="form-notch-middle" style="width: 82.4px;"></div>
                                                        <div class="form-notch-trailing"></div>
                                                    </div>
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
</body>
</html>
