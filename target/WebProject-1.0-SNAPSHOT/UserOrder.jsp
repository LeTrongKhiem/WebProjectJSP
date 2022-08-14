<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="common/taglib.jsp" %>
<html>
<head>
    <title>Thông tin cá nhân</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    <link rel="stylesheet" href="<c:url value='assets/font/fontawesome-free-5.15.3-web/css/all.min.css'/>">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="icon" href="<c:url value= './assets/img/logo3.png'/>">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.4/js/bootstrap.min.js"
            integrity="sha512-Cy3gSrKCS8aJ7AIaammc0wLXyKRmTa8ntgHvU01Tuz4EdsqVgk/lKzFm/b/8RxOWBaoHI2uGLLU6rXMbqKcGHA=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.4/css/bootstrap.css"
          integrity="sha512-KsdCRnLXUKDOyOPhhh7EjWSh2Mh/ZI64XwaYQPGyvuQYWBE1FGTCPnUKjLvD+DDQevQdks3US94aYJsIQxTiKg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="<c:url value= './assets/css/base.css'/>">
    <link rel="stylesheet" href="<c:url value= './assets/css/main.css'/>">
    <link rel="stylesheet" href="<c:url value= './assets/css/responsive.css'/>">
    <link rel="stylesheet" href="<c:url value= './assets/css/trangthongtin.css'/>">
    <link rel="stylesheet" href="<c:url value= './assets/css/grid.css'/>">
</head>
<body>
<style>
    .table {
        margin-top: 50px !important;
    }
</style>
<%--  header  --%>
<%@include file="/header.jsp" %>
<%--  header  --%>
        <jsp:useBean id="listUserOrder" scope="request" type="java.util.List"/>
      <div class="container">
          <table class="table">
              <thead>
              <tr>
                  <th scope="col">OrderId</th>
                  <th scope="col">Ten SP</th>
                  <th scope="col">Ngay Dat</th>
                  <th scope="col">So luong</th>
                  <th scope="col">Tong gia</th>
              </tr>
              </thead>



              <c:forEach items="${listUserOrder}" var="item">
                  <tbody>
                  <tr>
                      <td>${item.orderId}</td>
                      <td>${item.productName}</td>
                      <td>${item.createDate}</td>
                      <td>${item.quantity}</td>
                      <td>${item.dinhDang(item.total)}</td>
                  </tr>
                  </tbody>
              </c:forEach>
          </table>
      </div>


<%--  header  --%>
<%@include file="/footer.jsp" %>
<%--  header  --%>
</body>
</html>
