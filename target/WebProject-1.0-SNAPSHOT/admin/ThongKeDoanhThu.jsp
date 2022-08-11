<%@ page import="com.google.gson.Gson" %><%--
  Created by LeTrongKhiem.
  User: User
  Date: 06-Aug-22
  Time: 4:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<html>
<head>
    <title>Thống kê doanh thu</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    <link rel="stylesheet" href="<c:url value='../assets/font/fontawesome-free-5.15.3-web/css/all.min.css'/>">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="icon" href="<c:url value= '../assets/img/logo3.png'/>">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.12.1/datatables.min.css"/>
    <!-- page css -->
    <link rel="stylesheet" href="<c:url value='./assets/vendors/datatables/dataTables.bootstrap.min.css'/>">

    <!-- Core css -->
    <link rel="stylesheet" href="<c:url value='./assets/css/app.min.css'/>">
</head>
<body>
<div class="app">
    <div class="layout">
        <%@include file="Header.jsp" %>
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
                        <div class="row">
                            <div class="col-md-12">
                                <select id="select-day-from" class="form-control" style="width : 200px;">
                                    <option value="2022/02/22">2022/02/01</option>
                                    <option value="2022/04/22">2022/03/01</option>
                                    <option></option>
                                    <option></option>
                                    <option></option>
                                </select>
                                <select id="select-day-to" class="form-control" style="width : 200px;">
                                    <option value="2022/03/22">2022/03/01</option>
                                    <option value="2022/04/22">2022/04/01</option>
                                    <option value="2022/05/22">2022/05/01</option>
                                    <option></option>
                                    <option></option>
                                </select>
                                <a id="btn-submit-day">Xem thống kê</a>
                                <div>
                                    <canvas id="chartStatistic"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
        integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
<script src="<c:url value='./assets/js/chartsjs.js'/>"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.8.0/dist/chart.min.js"></script>
<script>
    function registerChart(lsData) {
        var lsLabel = [];
        var lsDatasource = [];

        $.each(lsData, function (index, item) {
            lsLabel.push(item.Date);
            lsDatasource.push(item.Benefit)
        })
        var ctx = document.getElementById("chartStatistic");//.getContext("2d");
        var barChartData = {
            labels: lsLabel,
            datasets: [{
                label: 'Doanh thu theo ngày',
                backgroundColor: '#0b9663',
                borderWidth: 1,
                data: lsDatasource
            }]
        };
        var myBarChart = new Chart(ctx, {
            type: "bar",
            data: barChartData
        });
    }

    var st;
    <% String data = request.getAttribute("st")==null?"{}": new Gson().toJson(request.getAttribute("st"));%>
    st = JSON.parse(JSON.stringify(<%=data%>));
    $('#btn-submit-day').on('click', function () {
        // e.preventDefault();
        const selectdayfrom = $('#select-day-from').val();
        const selectdayto = $('#select-day-to').val();
        console.log(selectdayfrom)
        $.ajax({
            url: '<%=request.getContextPath()+"/admin/ShowStatistic"%>',
            type: 'GET',
            success: function () {
                registerChart(st)
            },
            data: {
                fromDate: selectdayfrom,
                toDate: selectdayto
            },
        });
    })
</script>
<%--<script src="<c:url value='assets/js/vendors.min.js'/>"></script>--%>
<script src="<c:url value='assets/vendors/datatables/jquery.dataTables.min.js'/>"></script>
<script src="<c:url value='assets/vendors/datatables/dataTables.bootstrap.min.js'/>"></script>
<script src="<c:url value='assets/js/pages/e-commerce-order-list.js'/>"></script>
<script src="<c:url value='assets/js/app.min.js'/>"></script>


</body>

</html>
