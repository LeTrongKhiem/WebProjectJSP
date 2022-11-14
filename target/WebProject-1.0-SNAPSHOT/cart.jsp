<%@ page import="com.google.gson.Gson" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="common/taglib.jsp" %>
<%--<%--%>
<%--    request.setCharacterEncoding("UTF-8");--%>
<%--    response.setCharacterEncoding("UTF-8");--%>
<%--%>--%>
<%--<jsp:useBean id="cart" scope="request" type="com.example.webproject.BEAN.Cart"/>--%>
<%--<jsp:useBean id="cart" scope="request" type="com.example.webproject.BEAN.Cart"/>--%>
<%--<jsp:useBean id="a" class="com.example.webproject.DAO.daoimpl.ProductListDAOImpl" scope="request"></jsp:useBean>--%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giỏ Hàng</title>
    <link rel="stylesheet" href="<c:url value= './assets/font/fontawesome-free-5.15.3-web/css/all.css'/>">
    <link rel="stylesheet" href="<c:url value= './assets/lib/css/bootstrap.min.css'/>">
    <link rel="stylesheet" href="<c:url value='./assets/lib/css/owl.carousel.css'/>">
    <link rel="stylesheet" href="<c:url value= './assets/css/base.css'/>">
    <link rel="stylesheet" href="<c:url value= './assets/css/main.css'/>">
    <link rel="stylesheet" href="<c:url value= './assets/css/grid.css'/>">
    <link rel="stylesheet" href="<c:url value= './assets/css/responsive.css'/>">
    <link rel="stylesheet" href="<c:url value= './assets/css/mobile.css'/>">
    <link rel="stylesheet" href="<c:url value= './assets/css/giohang.css'/>">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.12.1/datatables.min.css"/>
</head>
<style>
    #table input {
        height: 41px;
        width: 60px;
        text-align: center;
        background: #fff;
        color: #616161;
        border: 1px solid #e8e8e8;
        border-radius: 5px;
        font-size: 18px;
        margin: 0;
    }
</style>
<body>
<%@include file="/header.jsp" %>
<div class="container">
    <div class="grid wide">
        <div class="xv-cart pt-60">
            <div class="xv-cart-top pb-45">
                <div class="table-responsive cart-cal  text-center">
                    <table class="table" id="table">
                        <thead>
                        <tr class="table-head">
                            <th>Hình ảnh</th>
                            <th class="th_description">Thông tin sản phẩm</th>
                            <th>&nbsp;</th>
                            <th>&nbsp;</th>
                            <th>Số lượng</th>
                            <th>Giá</th>
                            <th>Xóa</th>
                        </tr>
                        <jsp:useBean id="cart" scope="request" type="com.example.webproject.BEAN.Cart"/>
                        <c:if test="${cart.productList.size() == 0}">
                            <div class="alert alert-warning" role="alert">
                                Không còn sản phẩm nào trong giỏ hàng
                            </div>
                        </c:if>
                        </thead>
                        <tbody class="shadow-around">

                        <c:set var="products" value="${cart.productList}"/>
                        <c:forEach items="${products}" var="product">

                            <tr class="table-body">
                                <td>
                                    <figure><img src="${product.link_hinhanh}" style="width:160px"/></figure>
                                </td>
                                <td>
                                    <div class="cart-wrappper text-left th_description">
                                        <h6>${product.tenSP}</h6>
                                        <p><span>Availability</span>: Available in Stock</p>
                                        <p><span>Product Code</span>: CwT4a</p>
                                    </div>
                                </td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>

                                        <%--                                            <span class="btn-cart btn-square btn-plus btn-qty"><i--%>
                                        <%--                                                    class="fa fa-plus"></i></span>--%>
                                    <input class="cart-quantity" type="number" pid="${product.maSP}"
                                           value="${product.quantitySold}">

                                        <%--                                            <span class="btn-cart btn-square btn-minus btn-qty"><i--%>
                                        <%--                                                    class="fa fa-minus"></i></span>--%>


                                </td>
                                <td><span class="cart-price">${product.dinhDang(product.giaSP)}</span></td>
                                <td>
                                    <ul class="cart-action">
                                        <li><a pid="${product.maSP}" class="btn-cart btn-delete btn-blue"><i
                                                class="fa fa-trash"></i></a></li>
                                    </ul>
                                </td>
                            </tr>
                            <%--                            <jsp:useBean id="error" scope="request" type="com.example.webproject.controller.cart.UpdateQuantityController"/>--%>
                            <%--                            <tr>${error}</tr>--%>
                        </c:forEach>

                        </tbody>
                    </table>
                </div>
            </div>
            <!--xv-cart-top-->
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="buttons-cart--inner">
                        <div class="buttons-cart">
                            <a href="#">Tiếp tục mua hàng</a>
                        </div>
                        <div class="buttons-cart checkout--btn">
                            <a href="#">Cập nhật</a>
                            <a href="#">Thanh Toán</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 col-sm-12 col-xs-12">
                    <div class="ht__coupon__code">
                        <span>NHẬP MÃ GIẢM GIÁ CỦA BẠN</span>
                        <div class="coupon__box">
                            <input type="text" placeholder="">
                            <div class="ht__cp__btn">
                                <a href="#">enter</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-sm-12 col-xs-12 smt-40 xmt-40">
                    <div class="htc__cart__total">
                        <h6>Tổng giỏ hàng</h6>
                        <div class="cart__desk__list">
                            <ul class="cart__desc">
                                <li>Tổng giỏ hàng</li>

                                <li>Phí ship</li>
                            </ul>
                            <ul class="cart__price">
                                <li class="total-cart"></li>

                                <li>Miễn phí</li>
                            </ul>
                        </div>
                        <div class="cart__total">
                            <span>Tổng đơn hàng</span>
                            <span class="total-cart"></span>
                        </div>
                        <ul class="payment__btn">
                            <li class="active">
                                <a href="<%=request.getContextPath()+"/checkout"%>"> Tiến hành thanh
                                    toán</a>

                            </li>
                            <li>
                                <a href="/">Tiếp tục mua sắm</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<footer>
    <%@include file="/footer.jsp" %>
</footer
>
<script type="text/javascript" src="https://cdn.datatables.net/v/bs4/jq-3.6.0/dt-1.12.1/datatables.min.js"></script>

<script>
    var cart;
    var table;
    $(document).ready(function () {
        <% String data = session.getAttribute("cart")==null?"{}": new Gson().toJson(session.getAttribute("cart"));%>
        <%--cart = JSON.parse('<%=data%>');--%>
        cart = JSON.parse(JSON.stringify(<%=data%>));
        table = $('#table').DataTable({
            paging: false,
            searching: false,
        });
        loadCart(cart)
        $('#table .btn-delete').on('click', function () {
            var id = $(this).attr("pid");
            _this = $(this);
            $.ajax({
                url: '<%=request.getContextPath()+"/remove"%>',
                type: 'POST',
                data: {
                    id: id,
                },
                success: function (data) {
                    delete cart.productsList[id];
                    table.row(_this.parents('tr')).remove().draw();
                    loadCart(cart)
                },
                error: function (data) {
                    alert("San pham k con trong gio hang");
                }
            })
        })
        $('#table .cart-quantity').on('blur', function () {
            var id = $(this).attr("pid");
            var quantity = $(this).val();
            _this = $(this)
            $.ajax({
                url: '<%=request.getContextPath()+"/updateQuantity"%>',
                type: 'POST',
                data: {
                    id: id,
                    quantity: quantity
                },
                success: function (data) {
                    JSQuantity = JSON.parse(data);
                    _this.val(JSQuantity.quantity);
                    updateQuantity(cart, id, JSQuantity.quantity)
                    if (quantity == 0) {
                        table.row(_this.parents('tr')).remove().draw();
                    }
                    var quantityK = cart.productsList[id].soLuongKho;
                    console.log("soLuongKho", quantityK)
                    if (quantity > quantityK) {
                        alert("Só lượng hiện tại trong kho không đủ")
                    }
                    loadCart(cart)
                },
                error: function (data) {
                }
            })
        })
        console.log(cart)
    });

    function loadCart(cart) {
        sumTotal = 0;
        for (const x in cart.productsList) {
            sumTotal += cart.productsList[x].giaSP * cart.productsList[x].quantitySold;
            console.log(x);
        }
        sumTotal = sumTotal.toLocaleString('it-IT', {style: 'currency', currency: 'VND'});
        $(".total-cart").html(sumTotal);
    }

    function updateQuantity(cart, id, quantity) {
        cart.productsList[id].quantitySold = quantity;
    }

    // sum quantity
    // function update() {
    //     const quantity = document.getElementsByClassName('cart-quantity');
    //     const cart = document.querySelector('.header__card-notice');
    //     for(let i = 0 ; i < quantity.length;i++){
    //        var sum = 0;
    //        for (let j = 0 ; i < quantity.length;j++){
    //            sum+= parseInt(quantity[j].value);
    //        }
    //
    //         cart.innerHTML = sum;
    //     }
    //
    // }
    // function update() {
    //     var s = document.getElementsByClassName('cart-quantity');
    //     for (let i = 0; i < s.length; i++) {
    //         //sum quantity
    //         var sum = 0;
    //         for (let j = 0; j < s.length; j++) {
    //             sum += parseInt(s[j].value);
    //         }
    //         document.getElementsByClassName('header__card-notice')[0].innerHTML = sum;
    //     }
    // }
    // update();
</script>
</body>

</html>