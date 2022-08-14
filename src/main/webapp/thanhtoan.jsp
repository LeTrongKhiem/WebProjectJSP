<%@ page import="java.text.DecimalFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="common/taglib.jsp" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
%>
<%@include file="common/taglib.jsp" %>
<%--<jsp:useBean id="cart" scope="request" type="vn.edu.hcmuaf.fit.lab5.beans.Cart"/>--%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta http-equiv="x-ua-compatible" content="ie=edge"/>
    <title>Thanh toán</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css"/>
    <!-- Google Fonts Roboto -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap"/>
    <!-- MDB ESSENTIAL -->
    <link rel="stylesheet" href="admin/ventor/css/mdb.min.css"/>
    <!-- MDB PLUGINS -->
    <link rel="stylesheet" href="admin/ventor/plugins/css/all.min.css"/>
    <!-- Custom styles -->
    <link rel="stylesheet" href="assets/css/main.css">
    <link rel="stylesheet" href="assets/css/base.css">
    <link rel="stylesheet" href="assets/css/grid.css">
    <link rel="stylesheet" href="assets/css/thanhtoan.css">
    <link rel="stylesheet" href="assets/css/responsive.css">

    <link
            href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.1.0/mdb.min.css"
            rel="stylesheet"
    />
    <!-- MDB -->
    <script
            type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.1.0/mdb.min.js"
    ></script>

    <style>
        .checkout .form-control {
            padding: 10px 12px !important;
            font-size: 1.6rem;
            border: 1px solid #ccc !important;
        }
    </style>
</head>

<body>
<%--  header  --%>
<%@include file="/header.jsp" %>
<%--  header  --%>

<!--Main layout-->
<main class="mb-6 mt-5 ">
    <div class="container">
        <div class="py-5 text-center header_checkout">
            <i class="fa fa-credit-card" aria-hidden="true"></i>
            <h2 class="header-checkout__heading">Thanh toán</h2>
            <p class="header-checkout__p">Vui lòng kiểm tra thông tin Khách hàng, thông tin Giỏ hàng trước khi Đặt
                hàng.</p>
        </div>
        <!-- Section: Checkout form -->
        <div class="grid wide">
            <section class="checkout">

                <div class="row gx-lg-5">
                    <div class="col-lg-8 mb-4 mb-md-0">
                        <!-- Section: Biling details -->
                        <section class="">
                            <form action="<%=request.getContextPath()+"/order"%>" method="post">
                                <h5 class="mb-4">Thông tin khách hàng</h5>

                                <!-- 2 column grid layout with text inputs for the first and last names -->

                                <div class="form-outline mb-4 d-flex align-items-center">
                                    <input type="text" id="form6Example1" class="form-control" name="name"/>
                                    <label class="form-label" for="form6Example1">Họ và tên</label>
                                </div>
                                <!-- Text input -->


                                <!-- Text input -->
                                <div class="form-outline mb-4">
                                    <input type="text" id="form6Example4" class="form-control" name="address"/>
                                    <label class="form-label" for="form6Example4">Địa chỉ</label>
                                </div>

                                <!-- Email input -->
                                <div class="form-outline mb-4">
                                    <input type="email" id="form6Example5" class="form-control" name="email"/>
                                    <label class="form-label" for="form6Example5">Email</label>
                                </div>

                                <!-- Number input -->
                                <div class="form-outline mb-4">
                                    <input type="text" id="form6Example6" class="form-control" name="phoneNumber"/>
                                    <label class="form-label" for="form6Example6">Số điện thoại</label>
                                </div>

                                <!-- Message input -->
                                <%--                                <h5 class="mb-4">Hình thức thanh toán</h5>--%>

                                <%--                                <div class="d-block my-3">--%>
                                <%--                                    <div class="custom-control custom-radio">--%>
                                <%--                                        <input id="httt-1" name="httt_ma" type="radio" class="custom-control-input"--%>
                                <%--                                            required="" value="1">--%>
                                <%--                                        <label class="custom-control-label" for="httt-1">Tiền mặt</label>--%>
                                <%--                                    </div>--%>
                                <%--                                    <div class="custom-control custom-radio">--%>
                                <%--                                        <input id="httt-2" name="httt_ma" type="radio" class="custom-control-input"--%>
                                <%--                                            required="" value="2">--%>
                                <%--                                        <label class="custom-control-label" for="httt-2">Chuyển khoản</label>--%>
                                <%--                                    </div>--%>
                                <%--                                    <div class="custom-control custom-radio">--%>
                                <%--                                        <input id="httt-3" name="httt_ma" type="radio" class="custom-control-input"--%>
                                <%--                                            required="" value="3">--%>
                                <%--                                        <label class="custom-control-label" for="httt-3">Ship COD</label>--%>
                                <%--                                    </div>--%>
                                <%--                                </div>--%>
                                <%--                                <hr class="mb-4">--%>
                                <button class="btn btn-primary btn-lg btn-block  btn-rounded w-100 ripple-surface btn-checkout"
                                        type="submit" name="btnDatHang">Đặt
                                    hàng
                                </button>

                            </form>
                        </section>
                        <!-- Section: Biling details -->
                    </div>

                    <div class="col-lg-4 mb-4 mb-md-0 m-0">
                        <!-- Section: Summary -->
                        <section class="shadow-4 p-4 rounded-5 mb-4">
                            <h5 class="mb-4">Thanh toán</h5>

                            <div class="d-flex justify-content-between mb-3">
                                <span>Tạm tính</span>
                                <span>${cart.dinhDang(cart.total)}</span>
                            </div>
                            <div class="d-flex justify-content-between">
                                <span>Phí vận chuyển</span>
                                <span>Miễn phí</span>
                            </div>
                            <hr class="my-4"/>
                            <div class="d-flex justify-content-between fw-bold mb-4">
                                <span>Tổng thành tiền</span>
                                <span>${cart.dinhDang(cart.total)}</span>
                            </div>


                            <!-- Section: Summary -->

                            <!-- Section: Summary -->


                            <div class="d-flex align-items-center">
                                <input type="text" class="form-control rounded me-1" placeholder="Mã giảm giá"/>
                                <button type="button" class="btn btn-link btn-rounded overflow-visible w-50 btn-sale ">
                                    Xác nhận
                                </button>
                            </div>
                        </section>
                        <!-- Section: Summary -->
                    </div>
                </div>
            </section>
        </div>
        <!-- Section: Checkout form -->
    </div>
</main>
<%--    footer --%>
<%@include file="/footer.jsp" %>
<%--    footer --%>
</body>
<!-- MDB ESSENTIAL -->
<script type="text/javascript" src="admin/ventor/js/mdb.min.js"></script>
<script type="text/javascript" src="admin/ventor/js/mdb.min.js"></script>
<!-- MDB PLUGINS -->
<script type="text/javascript" src="admin/ventor/plugins/js/all.min.js"></script>
<!-- Custom scripts -->
<!-- Sidenav -->


</html>