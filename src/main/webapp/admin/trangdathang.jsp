<%--
  Created by LeTrongKhiem.
  User: User
  Date: 11-Jan-22
  Time: 9:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/taglib.jsp" %>
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta http-equiv="x-ua-compatible" content="ie=edge"/>
    <title>Other Page Admin</title>
    <!-- MDB icon -->
    <link rel="icon" href="img/mdb-favicon.ico" type="image/x-icon"/>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css"/>
    <!-- Google Fonts Roboto -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap"/>
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
<%--  header  --%>
<%@include file="/admin/header.jsp" %>
<%--  header  --%>
<!--Main layout-->
<main style="margin-top: 58px">
    <div class="container">
        <h1 class="h4 text-center py-5 mb-0">Order dashboard</h1>

        <!--Section: Order chart-->
        <section class="mb-4">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6 mb-4">
                            <canvas data-mdb-chart="line" data-mdb-dataset-label="Sales in $"
                                    data-mdb-labels="['Monday', 'Tuesday' , 'Wednesday' , 'Thursday' , 'Friday' , 'Saturday' , 'Sunday ']"
                                    data-mdb-dataset-data="[2112, 2343, 2545, 3423, 2365, 1985, 987]"></canvas>
                        </div>

                        <div class="col-md-6 mb-4">
                            <canvas data-mdb-chart="bar" data-mdb-dataset-label="Number of orders"
                                    data-mdb-labels="['Monday', 'Tuesday' , 'Wednesday' , 'Thursday' , 'Friday' , 'Saturday' , 'Sunday ']"
                                    data-mdb-dataset-data="[21, 23, 25, 34, 23, 19, 9]"></canvas>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--Section: Order chart-->

        <!--Section: Order table-->
        <section>
            <div class="card">
                <div class="card-header">
                    <div class="form-outline my-3">
                        <input type="text" class="form-control" id="datatable-search-input"/>
                        <label class="form-label" for="datatable-search-input">Search</label>
                    </div>
                </div>

                <div class="card-body">
                    <div id="datatable" data-mdb-stripped="true"></div>
                </div>
            </div>
        </section>
        <!--Section: Order table-->
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

<!-- Datatable -->
<script>
    const basicData = {
        columns: ["Order ID", "Mã SP", "Mã KH", "Tên Khách hàng", "Ngày đặt", "Giá", "Status"],
        rows: [
            [1, "ip11", "01", "Lê Trọng Khiêm", "10/10/2021", "22.000.000", "Paid"],
            [2, "ip12", "02", "Lê Hoàng Ân", "11/10/2021", "23.000.000", "Paid"],
            [3, "ip13", "03", "Tằng Minh Thuận", "12/10/2021", "24.000.000", "Paid"],
            [4, "ipxsmax", "04", "Lê Trọng Khiêm", "10/10/2021", "22.000.000", "Paid"],],
    };

    const options = {
        striped: true,
        selectable: true,
        loaderClass: "bg-info",
        borderColor: "light",
        bordered: true,
        multi: true
    }

    const searchInstance = new mdb.Datatable(
        document.getElementById("datatable"),
        basicData, options
    );

    document
        .getElementById("datatable-search-input")
        .addEventListener("input", (e) => {
            searchInstance.search(e.target.value);
        });
</script>

</html>