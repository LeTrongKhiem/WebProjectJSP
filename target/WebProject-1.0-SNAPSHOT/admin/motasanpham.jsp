<%--
  Created by LeTrongKhiem.
  User: User
  Date: 11-Jan-22
  Time: 9:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/taglib.jsp" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta http-equiv="x-ua-compatible" content="ie=edge"/>
    <title>Quản lí mô tả sản phẩm</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css"/>
    <!-- Google Fonts Roboto -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap"/>
    <!-- MDB ESSENTIAL -->
    <link rel="stylesheet" href="<c:url value='./ventor/css/mdb.min.css'/>">
    <!-- MDB PLUGINS -->
    <link rel="stylesheet" href="<c:url value='./ventor/plugins/css/all.min.css'/>">
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
<%--  header  --%>
<%@include file="/admin/header.jsp" %>
<%--  header  --%>
<main style="margin-top: 58px">
    <div class="container">
        <h1 class="h5 text-center py-5 mb-0">Quản lí mô tả sản phẩm</h1>

        <!--Section: Content-->
        <section>
            <div class="card">
                <div class="card-body">
                    <div class="d-flex justify-content-end mb-4">
                        <div class="form-outline">
                            <input data-mdb-search data-mdb-target="#table_modal" type="text" id="search_modal"
                                   class="form-control"/>
                            <label class="form-label" for="search_modal">Search</label>
                        </div>
                        <button class="btn btn-primary btn-sm ms-3" data-mdb-add-entry
                                data-mdb-target="#table_modal">
                            <i class="fa fa-plus"></i>
                        </button>
                    </div>
                    <hr/>
                    <div id="table_modal"></div>
                </div>
            </div>
        </section>
        <!--Section: Content-->
    </div>
</main>
</body>
<script type="text/javascript" src="<c:url value='./ventor/js/mdb.min.js'/>"></script>
<!-- MDB PLUGINS -->
<script type="text/javascript" src="<c:url value='./ventor/plugins/js/all.min.js'/>"></script>
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
            width: 100,
            inputType: "number",
            defaultValue: 1,
            label: "ID",
            field: "id",
        },
        {
            width: 200,
            label: "Mã SP",
            field: "msp",
        },
        {
            width: 250,
            label: "Tên Sản Phẩm",
            field: "tsp",
        },
        {
            width: 250,
            label: "Tiêu đề 1",
            field: "td1",
        },
        {
            width: 250,
            label: "Mô tả 1",
            field: "mt1",
        },
        {
            width: 250,
            label: "Link ảnh 1",
            field: "a1",
        }, {
            width: 250,
            label: "Tiêu đề 2",
            field: "td2",
        },
        {
            width: 250,
            label: "Mô tả 2",
            field: "mt2",
        },
        {
            width: 250,
            label: "Link ảnh 2",
            field: "a2",
        }, {
            width: 250,
            label: "Tiêu đề 3",
            field: "td3",
        },
        {
            width: 250,
            label: "Mô tả 3",
            field: "mt3",
        },
        {
            width: 250,
            label: "Link ảnh 3",
            field: "a3",
        },

    ];

    const advancedRows = [
        {
            id: 1,
            msp: "ip11",
            tsp: "iPhone11",
            td1: "iphonw 11",
            mt1: "Apple",
            a1: "./img/apple/ip11.jpg",
            td2: "iphonw 11",
            mt2: "Apple",
            a2: "./img/apple/ip11.jpg",
            td3: "iphonw 11",
            mt3: "Apple",
            a3: "./img/apple/ip11.jpg",

        },


    ];

    const tableModal = new TableEditor(
        document.getElementById("table_modal"),
        {
            columns: advancedColumns,
            rows: advancedRows,
        },
        {mode: "modal", entries: 5, entriesOptions: [5, 10, 15], confirm: true}
    );
</script>
</html>
