<%--
  Created by LeTrongKhiem.
  User: User
  Date: 31-Dec-22
  Time: 9:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%@include file="common/taglib.jsp" %>
<html>
<head>
    <title>Download File</title>
</head>
<body>
Download Successfully
<%
    String filename = "download.jsp";
    String filepath = "D:\\LapTrinhWeb\\JSPDemo\\WebProject\\src\\main\\webapp\\common\\privtekey.txt";
    response.setContentType("APPLICATION/OCTET-STREAM");
    response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");

    java.io.FileInputStream fileInputStream = new java.io.FileInputStream(filepath + filename);

    int i;
    while ((i = fileInputStream.read()) != -1) {
        out.write(i);
    }
    fileInputStream.close();
%>
</body>
</html>
