<%@ page import="java.util.List" %>
<%@ page import="com.example.webproject.admin.BEAN.Admin" %>
<%@ page import="com.example.webproject.admin.dao.impl.AdminDAOImpl" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by LeTrongKhiem.
  User: User
  Date: 11-Jan-22
  Time: 8:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/taglib.jsp" %>
<%
    String error = (String) request.getAttribute("error");
    Map<String, Admin> listAdmin = AdminDAOImpl.getInstance().listAdmin();
    session.setAttribute("listAdmin", listAdmin);
%>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <link rel="stylesheet" href="<c:url value='./assets/css/login.css'/>">
    <link rel="stylesheet" href="<c:url value='../ventor/css/mdb.min.css'/>">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet"/>
    <script src="<c:url value='../ventor/js/mdb.min.js'/>"></script>
</head>
<body>
<main style="margin-top: 58px">
    <div class="container pt-5">
        <div class="row d-flex justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body p-4">
                        <!-- Pills navs -->
                        <ul class="nav nav-pills nav-justified mb-3" id="ex1" role="tablist">
                            <li class="nav-item" role="presentation">
                                <a class="nav-link active" id="tab-login" data-mdb-toggle="pill" href="#pills-login"
                                   role="tab" aria-controls="pills-login" aria-selected="true">Login</a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <a class="nav-link" id="tab-register" data-mdb-toggle="pill" href="#pills-register"
                                   role="tab" aria-controls="pills-register" aria-selected="false">Register</a>
                            </li>
                        </ul>
                        <!-- Pills navs -->

                        <!-- Pills content -->
                        <div class="tab-content">
                            <div class="tab-pane fade show active" id="pills-login" role="tabpanel"
                                 aria-labelledby="tab-login">
                                <form id="formdn" name="formdn" action="" method="">
                                    <div class="text-center mb-3">
                                        <p>Sign in with:</p>
                                        <button type="button" class="btn btn-primary btn-floating mx-1">
                                            <i class="fab fa-facebook-f"></i>
                                        </button>

                                        <button type="button" class="btn btn-primary btn-floating mx-1">
                                            <i class="fab fa-google"></i>
                                        </button>

                                        <button type="button" class="btn btn-primary btn-floating mx-1">
                                            <i class="fab fa-twitter"></i>
                                        </button>

                                        <button type="button" class="btn btn-primary btn-floating mx-1">
                                            <i class="fab fa-github"></i>
                                        </button>
                                    </div>

                                    <p class="text-center">or:</p>

                                    <!-- Email input -->
                                    <div class="form-outline mb-4">
                                        <input type="text" id="loginName" class="form-control" name="username"/>
                                        <label class="form-label" for="loginName">Username</label>
                                    </div>

                                    <!-- Password input -->
                                    <div class="form-outline mb-4">
                                        <input type="password" id="loginPassword" class="form-control" name="pass"/>
                                        <label class="form-label" for="loginPassword">Password</label>
                                    </div>

                                    <!-- 2 column grid layout -->
                                    <div class="row mb-4">
                                        <div class="col-md-6 d-flex justify-content-center">
                                            <!-- Checkbox -->
                                            <div class="form-check mb-3 mb-md-0">
                                                <input class="form-check-input" type="checkbox" value=""
                                                       id="loginCheck" checked/>
                                                <label class="form-check-label" for="loginCheck">
                                                    Remember me
                                                </label>
                                            </div>
                                        </div>

                                        <div class="col-md-6 d-flex justify-content-center">
                                            <!-- Simple link -->
                                            <a href="#!">Forgot password?</a>
                                        </div>
                                    </div>

                                    <!-- Submit button -->
                                    <button type="submit" class="btn btn-primary btn-block mb-4">
                                        Sign in
                                    </button>

                                    <!-- Register buttons -->
                                    <div class="text-center">
                                        <p>Not a member? <a href="#!">Register</a></p>
                                    </div>
                                </form>
                            </div>
                            <div class="tab-pane fade" id="pills-register" role="tabpanel"
                                 aria-labelledby="tab-register">
                                <form id="formdk" name="formdk" action="../RegisterAdminController" method="post">
                                    <!-- Name input -->
                                    <!-- Username input -->
                                    <div class="form-outline mb-4">
                                        <input type="text" id="name" class="form-control" name="name"/>
                                        <label class="form-label" for="name">Name</label>
                                    </div>
                                    <div class="form-outline mb-4">
                                        <input type="date" id="bd" class="form-control" name="bd"/>
                                        <label class="form-label" for="bd">BirthDay</label>
                                    </div>
                                    <div class="form-outline mb-4">
                                        <input type="text" id="address" class="form-control" name="address"/>
                                        <label class="form-label" for="address">Address</label>
                                    </div>
                                    <!-- Email input -->
                                    <div class="form-outline mb-4">
                                        <input type="email" id="email" class="form-control" name="email"/>
                                        <label class="form-label" for="email">Email</label>
                                        <p><font size="2" color="red" id="emailError"></font></p>
                                    </div>

                                    <!-- Phone input -->
                                    <div class="form-outline mb-4">
                                        <input type="text" id="phone" class="form-control" name="phone"/>
                                        <label class="form-label" for="phone">Phone</label>
                                        <p><font size="2" color="red" id="phoneError"></font></p>
                                    </div>

                                    <!-- Password input -->
                                    <div class="form-outline mb-4">
                                        <input type="password" id="password" class="form-control" name="pass"/>
                                        <label class="form-label" for="password">Password</label>
                                        <p><font size="2" color="red" id="passError"></font></p>
                                    </div>

                                    <!-- Repeat Password input -->
                                    <div class="form-outline mb-4">
                                        <input type="password" id="re_password" class="form-control"
                                               name="repass"/>
                                        <label class="form-label" for="re_password">Repeat
                                            password</label>
                                        <p><font size="2" color="red" id="repassError"></font></p>
                                    </div>

                                    <!-- Checkbox -->
                                    <div class="form-check d-flex justify-content-center mb-4">
                                        <input class="form-check-input me-2" type="checkbox" value=""
                                               id="registerCheck" checked aria-describedby="registerCheckHelpText"/>
                                        <label class="form-check-label" for="registerCheck">
                                            I have read and agree to the terms
                                        </label>
                                    </div>

                                    <!-- Submit button -->
                                    <button type="submit" class="btn btn-primary btn-block mb-3">
                                        Sign in
                                    </button>
                                </form>
                            </div>
                        </div>
                        <!-- Pills content -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<!--Main layout-->

<!--Footer-->
<footer></footer>
</body>
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
                 for (Admin admin: listAdmin.values()) {
                     userDB.add(admin.getEmail());
                 }
            %>
            var arrUs = new Array();
            <%for (int i = 0; i < userDB.size(); i++) { %>
            arrUs[<%=i%>] = '<%=userDB.get(i)%>';
            <%}%>
            <%List<String> listEmail = AdminDAOImpl.getInstance().getListEmail();%>
            var arrEmail = new Array();
            <%for (int i = 0; i < userDB.size(); i++) {%>
            arrEmail[<%=i%>] = '<%=listEmail.get(i)%>';
            <%}%>
            for (var i = 0; i < arrUs.length; i++) {
                if ($('#email').val() === arrUs[i]) {
                    $('#emailError').html('Tài khoản đã tồn tại. Vui lòng đăng ký tài khoản khác');
                    return false;
                }
            }
            for (var i = 0; i < arrEmail.length; i++) {
                if ($('#email').val() === arrEmail[i]) {
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
</html>
