<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/taglib.jsp" %>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>Quản lí sản phẩm</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css" />
    <!-- Google Fonts Roboto -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" />
    <!-- MDB ESSENTIAL -->
    <link rel="stylesheet" href="<c:url value='../ventor/css/mdb.min.css'/>">
    <!-- MDB PLUGINS -->
    <link rel="stylesheet" href="<c:url value='../ventor/plugins/css/all.min.css'/>">
    <!-- Custom styles -->
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.1.0/css/buttons.dataTables.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/fixedheader/3.2.0/css/fixedHeader.bootstrap4.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
        @media (min-width: 1400px) {

            main,
            header,
            #main-navbar {
                padding-left: 240px;
            }
        }

        body {
            background-color: #fbfbfb;
        }
    </style>
</head>

<body>
<body>
<%--  header  --%>
<%@include file="/admin/header.jsp" %>
<%--  header  --%>

<!--Main layout-->
<main style="margin-top: 58px">
    <div class="container">
        <h1 class="h5 text-center py-5 mb-0">Quản lí sản phẩm</h1>
        <!-- Modal -->
        <div class="" id="edit" tabindex="-1"  aria-labelledby="exampleModalLongTitle">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4>Edit Item</h4>
                    </div>
                    <div class="modal-body">
                        <form action="<%=request.getContextPath()%>/admin/edit" method="post">
                            <div class="my-4 table-editor_input-wrapper" data-mdb-field="msp">
                                <div class="form-outline "><input type="text" name="Eid"
                                                                  class="table-editor__input form-control" value="${detail.maSP}" readonly>
                                    <label class="form-label" style="margin-left: 0px;">Mã SP</label>
                                    <div class="form-notch">
                                        <div class="form-notch-leading" style="width: 9px;"></div>
                                        <div class="form-notch-middle" style="width: 41.6px;"></div>
                                        <div class="form-notch-trailing"></div>
                                    </div>
                                </div>
                            </div>

                            <div class="my-4 table-editor_input-wrapper" data-mdb-field="tsp">
                                <div class="form-outline "><input type="text" name="EName"  value="${detail.tenSP}"
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
                                <div class="form-outline "><input type="text" name="Eimage"
                                                                  class="table-editor__input form-control" value="${detail.link_hinhanh}">
                                    <label class="form-label" style="margin-left: 0px;">Link ảnh
                                        3</label>
                                    <div class="form-notch">
                                        <div class="form-notch-leading" style="width: 9px;"></div>
                                        <div class="form-notch-middle" style="width: 60.8px;"></div>
                                        <div class="form-notch-trailing"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="my-4 table-editor_input-wrapper" data-mdb-field="tsp">
                                <div class="form-outline "><input type="text" name="EPrice"
                                                                  class="table-editor__input form-control" value="${detail.giaSP}">
                                    <label class="form-label" style="margin-left: 0px;">Giá Sản Phẩm</label>
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
                                    <select name="EloaiSP" class="form-select" aria-label="Default select example">
                                        <option>DT</option>
                                        <option>Laptop</option>
                                        <option>Phu Kien</option>
                                    </select>
                                </div>
                            </div>
                            <div class="my-4 table-editor_input-wrapper" data-mdb-field="a3">
                                <div class="form-group">
                                    <label>Danh Mục</label>
                                    <select name="Ecategory" class="form-select" aria-label="Default select example">
                                        <c:forEach items="${listC}" var="o">
                                            <option ${o.maDanhMuc} value="${o.maDanhMuc}">${o.tenDanhMuc}</option>
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
        <!--Section: Content-->
    </div>
</main>
<!--Main layout-->

<!--Footer-->
<footer></footer>
<!--Footer-->
</body>
<!-- MDB ESSENTIAL -->
<script type="text/javascript" src="<c:url value='../ventor/js/mdb.min.js'/>"></script>
<!-- MDB PLUGINS -->
<script type="text/javascript" src="<c:url value='../ventor/plugins/js/all.min.js'/>"></script>
<!-- Sidenav -->
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap4.min.js"></script>
<script src="https://cdn.datatables.net/fixedheader/3.2.0/js/dataTables.fixedHeader.min.js"></script>


<!-- Table editor -->
<script>
    $(document).ready(function () {
        var table = $('#example').DataTable({
            fixedHeader: true
        });
    });
</script>
</body>
</html>