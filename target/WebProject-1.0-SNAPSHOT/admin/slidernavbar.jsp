<%--
  Created by LeTrongKhiem.
  User: User
  Date: 19-Apr-22
  Time: 3:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="common/taglib.jsp" %>
<div class="side-nav">
    <div class="side-nav-inner">
        <ul class="side-nav-menu scrollable">
            <li class="nav-item dropdown">
                <a class="dropdown-toggle" href="javascript:void(0);">
                                <span class="icon-holder">
                                    <i class="anticon anticon-dashboard"></i>
                                </span>
                    <span class="title">Dashboard</span>
                    <span class="arrow">
                                    <i class="arrow-icon"></i>
                                </span>
                </a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="index.html">Default</a>
                    </li>
                    <li>
                        <a href="index-crm.html">CRM</a>
                    </li>
                    <li>
                        <a href="index-e-commerce.html">E-commerce</a>
                    </li>
                    <li>
                        <a href="index-projects.html">Projects</a>
                    </li>
                </ul>
            </li>
            <li class="nav-item dropdown open">
                <a class="dropdown-toggle" href="javascript:void(0);">
                                <span class="icon-holder">
                                    <i class="anticon anticon-appstore"></i>
                                </span>
                    <span class="title">Quản lý hệ thống</span>
                    <span class="arrow">
                                    <i class="arrow-icon"></i>
                                </span>
                </a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="<%=request.getContextPath()%>/admin/quan-ly-nhan-vien">Quản lý nhân viên</a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath()%>/admin/quanlykhachhang.jsp">Quản lý khách hàng</a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath()%>/admin/product">Quản lý sản phẩm</a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath()%>/admin/banner">Quản lý Banner</a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath()%>/admin/category">Quản lý danh mục</a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath()%>/admin/order">Quản lý đơn hàng</a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath()%>/admin/ShowStatistic">Thống kê doanh thu</a>
                    </li>

                </ul>
            </li>
        </ul>
    </div>
</div>
