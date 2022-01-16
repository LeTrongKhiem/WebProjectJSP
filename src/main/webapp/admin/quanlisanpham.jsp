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

            <!--Section: Content-->
            <section>
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex justify-content-end mb-4">
                            <div class="form-outline">
                                <input data-mdb-search data-mdb-target="#table_modal" type="text" id="search_modal"
                                    class="form-control" />
                                <label class="form-label" for="search_modal">Search</label>
                            </div>
                            <button class="btn btn-primary btn-sm ms-3" data-mdb-add-entry
                                data-mdb-target="#table_modal">
                                <i class="fa fa-plus"></i>
                            </button>
                        </div>
                        <hr />
                        <div id="table_modal"></div>
                    </div>
                </div>
            </section>
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
<script type="text/javascript">
    const sidenav = document.getElementById("sidenav-1");
    const instance = mdb.Sidenav.getInstance(sidenav);

    let innerWidth = null;

    const setMode = (e) => {
        // Check necessary for Android devices
        if (window.innerWidth === innerWidth) {
            return;
        }

        innerWidth = window.innerWidth;

        if (window.innerWidth < 1400) {
            instance.changeMode("over");
            instance.hide();
        } else {
            instance.changeMode("side");
            instance.show();
        }
    };

    setMode();

    // Event listeners
    window.addEventListener("resize", setMode);
</script>

<!-- Table editor -->
<script>
    const advancedColumns = [
    {
            width: 200,
            label: "Mã SP",
            field: "id",
        },
        {
            width: 250,
            label: "Link ảnh",
            field: "linkanh",
        },
        {
            width: 250,
            label: "Link SP",
            field: "linksp",
        },
        {
            width: 250,
            label: "Tên Sản Phẩm",
            field: "tsp",
        },
        {
            width: 250,
            inputType: "number",
            label: "Giá",
            field: "gia",
        },
        {
            width: 250,
            label: "Tên thương hiệu",
            field: "tth",
        },
        {
            width: 250,
            label: "Loại SP",
            field: "lsp",
        },
    ];

    const advancedRows = [
        {
            id: "ip11",
            linkanh: "./assets/img/dssp/iphone-xi.jpg",
            linksp: "trangitem.jsp",
            tsp: "iPhone 11",
            gia: 15990000,
            tth:"Apple",
            lsp: "DT",
        },
        {
            id: "ip11",
            linkanh: "./assets/img/dssp/iphone-xi.jpg",
            linksp: "trangitem.jsp",
            tsp: "iPhone 11",
            gia: 15990000,
            tth:"Apple",
            lsp: "DT",
        },
        {
            id: "ip11",
            linkanh: "./assets/img/dssp/iphone-xi.jpg",
            linksp: "trangitem.jsp",
            tsp: "iPhone 11",
            gia: 15990000,
            tth:"Apple",
            lsp: "DT",
        },
        {
            id: "ip11",
            linkanh: "./assets/img/dssp/iphone-xi.jpg",
            linksp: "trangitem.jsp",
            tsp: "iPhone 11",
            gia: 15990000,
            tth:"Apple",
            lsp: "DT",
        },
        
    ];

    const tableModal = new TableEditor(
        document.getElementById("table_modal"),
        {
            columns: advancedColumns,
            rows: advancedRows,
        },
        { mode: "modal", entries: 5, entriesOptions: [5, 10, 15], confirm: true }
    );
</script>

</html>