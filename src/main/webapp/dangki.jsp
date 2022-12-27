
<%@ page import="java.util.Map" %>
<%@ page import="com.example.webproject.BEAN.User" %>
<%@ page import="com.example.webproject.DAO.daoimpl.UserDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="common/taglib.jsp" %>
<%
    String error = (String) request.getAttribute("error");
    Map<String, User> listUser = UserDAO.getInstance().listUser();
    session.setAttribute("listUser", listUser);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng ký tài khoản</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">

    <link rel="stylesheet" href="<c:url value='assets/font/fontawesome-free-5.15.3-web/css/all.min.css'/>">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="icon" href="<c:url value= './assets/img/logo3.png'/>">

    <link rel="stylesheet" href="<c:url value= './assets/css/base.css'/>">
    <link rel="stylesheet" href="<c:url value= './assets/css/main.css'/>">
    <link rel="stylesheet" href="<c:url value= './assets/css/grid.css'/>">
    <link rel="stylesheet" href="<c:url value= './assets/css/responsive.css'/>">
    <link rel="stylesheet" href="<c:url value= './assets/css/dangki.css'/>">
</head>
<body>
<div class="main">
    <%--  header  --%>
    <%@include file="/header.jsp" %>
    <%--  header  --%>
    <div class="verification-code">
        <div class="v2-verification-code">
            <form class="form-signin" action="RegisterController" method="post" name="formdk" id="formdk">
                <input type="hidden" name="_token">
                <div class="">
                    <div class="v2-title">
                        <p>Thông tin cá nhân</p>
                    </div>
                    <div class="v2-group-info">
                        <input type="hidden" name="user_id" value="58097">
                        <input type="hidden" name="username" class="username" value="618653ec8ddd6">
                        <p class="v2-error-check v2-color-red" id="error-name"></p>
                        <div class="form-group">
                            <input type="text" name="name" class="name" value="" placeholder="Họ và tên..." required=""
                                   id="name">
                        </div>
                        <p class="v2-error-check v2-color-red" id="error-email"></p>
                        <div class="form-group">
                            <input type="email" name="email" class="email" value="" placeholder="Email..." required=""
                                   id="email"> <br>
                            <p><font size="2" color="red" id="emailError"></font></p>
                        </div>
                        <p class="v2-error-check v2-color-red" id="error-phone"></p>
                        <div class="form-group">
                            <input type="text" name="phone" class="phone" placeholder="Số Điện Thoại" value=""
                                   required="" id="phone"> <br>
                            <p><font size="2" color="red" id="phoneError"></font></p>
                        </div>
                        <div class="form-group">
                            <input type="radio" name="gender" class="gender" value="1" checked="">
                            <span class="gender-label">Nam</span>
                            <input type="radio" name="gender" class="gender" value="2">
                            <span class="gender-label">Nữ</span>
                        </div>
                        <div class="form-group">
                            <div class="birth-day">
                                <div class="title">Ngày sinh</div>
                                <div class="select">
                                    <select name="date" id="date">
                                        <option value="01">01</option>
                                        <option value="02">02</option>
                                        <option value="03">03</option>
                                        <option value="04">04</option>
                                        <option value="05">05</option>
                                        <option value="06">06</option>
                                        <option value="07">07</option>
                                        <option value="08">08</option>
                                        <option value="09">09</option>
                                        <option value="10">10</option>
                                        <option value="11">11</option>
                                        <option value="12">12</option>
                                        <option value="13">13</option>
                                        <option value="14">14</option>
                                        <option value="15">15</option>
                                        <option value="16">16</option>
                                        <option value="17">17</option>
                                        <option value="18">18</option>
                                        <option value="19">19</option>
                                        <option value="20">20</option>
                                        <option value="21">21</option>
                                        <option value="22">22</option>
                                        <option value="23">23</option>
                                        <option value="24">24</option>
                                        <option value="25">25</option>
                                        <option value="26">26</option>
                                        <option value="27">27</option>
                                        <option value="28">28</option>
                                        <option value="29">29</option>
                                        <option value="30">30</option>
                                        <option value="31">31</option>
                                    </select>
                                </div>
                                <div class="select">
                                    <select name="month" id="month">
                                        <option value="01">Tháng 01</option>
                                        <option value="02">Tháng 02</option>
                                        <option value="03">Tháng 03</option>
                                        <option value="04">Tháng 04</option>
                                        <option value="05">Tháng 05</option>
                                        <option value="06">Tháng 06</option>
                                        <option value="07">Tháng 07</option>
                                        <option value="08">Tháng 08</option>
                                        <option value="09">Tháng 09</option>
                                        <option value="10">Tháng 10</option>
                                        <option value="11">Tháng 11</option>
                                        <option value="12">Tháng 12</option>
                                    </select>
                                </div>
                                <div class="select year">
                                    <select name="year" id="year">
                                        <option value="2021">2021</option>
                                        <option value="2020">2020</option>
                                        <option value="2019">2019</option>
                                        <option value="2018">2018</option>
                                        <option value="2017">2017</option>
                                        <option value="2016">2016</option>
                                        <option value="2015">2015</option>
                                        <option value="2014">2014</option>
                                        <option value="2013">2013</option>
                                        <option value="2012">2012</option>
                                        <option value="2011">2011</option>
                                        <option value="2010">2010</option>
                                        <option value="2009">2009</option>
                                        <option value="2008">2008</option>
                                        <option value="2007">2007</option>
                                        <option value="2006">2006</option>
                                        <option value="2005">2005</option>
                                        <option value="2004">2004</option>
                                        <option value="2003">2003</option>
                                        <option value="2002">2002</option>
                                        <option value="2001">2001</option>
                                        <option value="2000">2000</option>
                                        <option value="1999">1999</option>
                                        <option value="1998">1998</option>
                                        <option value="1997">1997</option>
                                        <option value="1996">1996</option>
                                        <option value="1995">1995</option>
                                        <option value="1994">1994</option>
                                        <option value="1993">1993</option>
                                        <option value="1992">1992</option>
                                        <option value="1991">1991</option>
                                        <option value="1990">1990</option>
                                        <option value="1989">1989</option>
                                        <option value="1988">1988</option>
                                        <option value="1987">1987</option>
                                        <option value="1986">1986</option>
                                        <option value="1985">1985</option>
                                        <option value="1984">1984</option>
                                        <option value="1983">1983</option>
                                        <option value="1982">1982</option>
                                        <option value="1981">1981</option>
                                        <option value="1980">1980</option>
                                        <option value="1979">1979</option>
                                        <option value="1978">1978</option>
                                        <option value="1977">1977</option>
                                        <option value="1976">1976</option>
                                        <option value="1975">1975</option>
                                        <option value="1974">1974</option>
                                        <option value="1973">1973</option>
                                        <option value="1972">1972</option>
                                        <option value="1971">1971</option>
                                        <option value="1970">1970</option>
                                        <option value="1969">1969</option>
                                        <option value="1968">1968</option>
                                        <option value="1967">1967</option>
                                        <option value="1966">1966</option>

                                    </select>

                                </div>
                            </div>
                        </div>
                        <p class="v2-error-check v2-color-red" id="error-password"></p>
                        <div class="form-group">
                            <input type="password" name="password" class="password" placeholder="Mật khẩu" required=""
                                   id="password"><br>
                            <p><font size="2" color="red" id="passError"></font></p>
                        </div>
                        <p class="v2-error-check v2-color-red" id="check-re-password"></p>
                        <div class="form-group">
                            <input type="password" name="re_password" class="re-password"
                                   placeholder="Nhập lại mật khẩu" required="" id="re_password"><br>
                            <p><font size="2" color="red" id="repassError"></font></p>
                        </div>
                        <div class="form-group">
                            <div id="signature-pad" class="m-signature-pad">
                                <div class="signature-pad--body">
                                    <canvas></canvas>
                                </div>
                            </div>
                        </div>
                        <input type="hidden" name="step" value="3">
                        <div class="form-group">
                            <button type="submit">Xác nhận</button>
                            <s:hidden id="signature-data" path="signature"/>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<%--    footer --%>
<%@include file="/footer.jsp" %>
<%--    footer --%>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
    function validatePhone(phone) {
        var fillter = /((09|03|07|08|05)+([0-9]{8})\b)/g;
        if (fillter.test(phone + "") && phone.length >= 10 && phone.length < 12) {
            return true;
        } else {
            return false;
        }
    }

    function validateEmail(email) {
        var fillter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
        if (fillter.test(email + "")) {
            return true;
        } else
            return false;
    }

    $(document).ready(function () {
        $('#formdk').on('submit', function () {
            <%
                 List<String> userDB = new ArrayList<>();
                 for (User user: listUser.values()) {
                     userDB.add(user.getEmail());
                 }
            %>
            var arrUs = new Array();
            <%for (int i = 0; i < userDB.size(); i++) { %>
            arrUs[<%=i%>] = '<%=userDB.get(i)%>';
            <%}%>
            <%List<String> listEmail = UserDAO.getInstance().getListEmail();%>
            var arrEmail = new Array();
            <%for (int i = 0; i < userDB.size(); i++) {%>
            arrEmail[<%=i%>] = '<%=listEmail.get(i)%>';
            <%}%>
            for (var i = 0; i < arrUs.length; i++) {
                if ($('#email').val() == arrUs[i]) {
                    $('#emailError').html('Tài khoản đã tồn tại. Vui lòng đăng ký tài khoản khác');
                    return false;
                }
            }
            for (var i = 0; i < arrEmail.length; i++) {
                if ($('#email').val() == arrEmail[i]) {
                    $('#emailError').html('Tài khoản đã tồn tại. Vui lòng đăng ký tài khoản khác');
                    return false;
                }
            }
            if (!validateEmail($('#email').val())) {
                $('#emailError').html('Email không hợp lệ');
                return false;
            }
            if ($('#password').val().length < 5) {
                $('#passError').html('Mật khẩu phải nhiều hơn 6 kí tự');
                return false;
            }
            if ($('#password').val() !== $('#re_password').val()) {
                $('#repassError').html('Mật khẩu nhập lại không chính xác!');
                return false;
            }
            if (!validatePhone($('#phone').val())) {
                $('#phoneError').html('Số điện thoại không hợp lệ');
                return false;
            }
            return true;
        });
        $('#formdk').on('keydown', function () {
            if ($('#password').val() !== '') {
                $('#passError').html('');
            }
            if ($('#re_password').val() === $('#password').val()) {
                $('#repassError').html('');
            }
            if ($('#phone').val() !== '') {
                $('#phoneError').html('');
            }
            if ($('#email').val() !== '') {
                $('#emailError').html('');
            }
        });
    });
</script>
</body>

</html>