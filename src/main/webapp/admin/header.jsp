<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by LeTrongKhiem.
  User: User
  Date: 11-Jan-22
  Time: 8:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/taglib.jsp" %>
<header>
    <!-- Sidenav -->
    <nav id="sidenav-1" class="sidenav" role="navigation" data-mdb-mode="side" data-mdb-hidden="false"
         data-mdb-accordion="true">
        <a class="ripple d-flex justify-content-center py-4" href="#!" data-mdb-ripple-color="primary">
        </a>
        <ul class="sidenav-menu">
            <li class="sidenav-item">
                <a class="sidenav-link"><i class="fas fa-cogs fa-fw me-3"></i><span>Settings</span></a>
                <ul class="sidenav-collapse">
                    <li class="sidenav-item">
                        <a class="sidenav-link" href="">Profile</a>
                    </li>
                    <li class="sidenav-item">
                        <a class="sidenav-link" href="">Account</a>
                    </li>
                </ul>
            </li>

            <li class="sidenav-item">
                <a class="sidenav-link" href="">
                    <i class="fas fa-chart-line fa-fw me-3"></i><span>Thống kê</span></a>
            </li>
            <li class="sidenav-item">
                <a class="sidenav-link" href="./trangdathang.jsp">
                    <i class="fas fa-cart-plus fa-fw me-3"></i><span>Đặt hàng</span></a>
            </li>
            <li class="sidenav-item">
                <a class="sidenav-link" href="./quanlinhanvien.jsp">
                    <i class="fas fa-user fa-fw me-3"></i><span>Quản lí nhân viên</span></a>
            </li>
            <li class="sidenav-item">
                <a class="sidenav-link" href="./quanliuser.jsp">
                    <i class="fas fa-user fa-fw me-3"></i><span>Quản lí người dùng</span></a>
            </li>
            <li class="sidenav-item">
                <a class="sidenav-link" href="./quanlisanpham.jsp">
                    <i class="fas fa-phone fa-fw me-3"></i><span>Quản lí điện thoại</span></a>
            </li>
            <li class="sidenav-item">
                <a class="sidenav-link" href="./quanlisanpham.jsp">
                    <i class="fas fa-keyboard fa-fw me-3"></i><span>Quản lí phụ kiện</span></a>
            </li>
            <li class="sidenav-item">
                <a class="sidenav-link" href="./quanlitintuc.jsp">
                    <i class="fas fa-money-bill fa-fw me-3"></i><span>Quản lí tin tức</span></a>
            </li>
            <li class="sidenav-item">
                <a class="sidenav-link" href="./motasanpham.jsp">
                    <i class="fab fa-product-hunt fa-fw me-3"></i><span>Quản lí mô tả sản phẩm</span></a>
            </li>
        </ul>
    </nav>
    <!-- Sidenav -->

    <!-- Navbar -->
    <nav id="main-navbar" class="navbar navbar-expand-lg navbar-light bg-white fixed-top">
        <!-- Container wrapper -->
        <div class="container-fluid">
            <!-- Toggler -->
            <button data-mdb-toggle="sidenav" data-mdb-target="#sidenav-1"
                    class="btn shadow-0 p-0 me-3 d-block d-xxl-none" aria-controls="#sidenav-1" aria-haspopup="true">
                <i class="fas fa-bars fa-lg"></i>
            </button>

            <!-- Search form -->
            <form class="d-none d-md-flex input-group w-auto my-auto">
                <input autocomplete="off" type="search" class="form-control rounded"
                       placeholder='Search (ctrl + "/" to focus)' style="min-width: 225px"/>
                <span class="input-group-text border-0"><i class="fas fa-search"></i></span>
            </form>

            <!-- Right links -->
            <ul class="navbar-nav ms-auto d-flex flex-row">
                <!-- Notification dropdown -->
                <li class="nav-item dropdown">
                    <a class="nav-link me-3 me-lg-0 dropdown-toggle hidden-arrow" href="#"
                       id="navbarDropdownMenuLink" role="button" data-mdb-toggle="dropdown" aria-expanded="false">
                        <i class="fas fa-bell"></i>
                        <span class="badge rounded-pill badge-notification bg-danger">1</span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                        <li><a class="dropdown-item" href="#">Some news</a></li>
                        <li><a class="dropdown-item" href="#">Another news</a></li>
                        <li>
                            <a class="dropdown-item" href="#">Something else here</a>
                        </li>
                    </ul>
                </li>

                <!-- Icon -->
                <li class="nav-item">
                    <a class="nav-link me-3 me-lg-0" href="#">
                        <i class="fas fa-fill-drip"></i>
                    </a>
                </li>
                <!-- Icon -->
                <li class="nav-item me-3 me-lg-0">
                    <a class="nav-link" href="https://github.com/LeTrongKhiem">
                        <i class="fab fa-github"></i>
                    </a>
                </li>

                <!-- Icon dropdown -->
                <li class="nav-item dropdown">
                    <a class="nav-link me-3 me-lg-0 dropdown-toggle hidden-arrow" href="#" id="navbarDropdown"
                       role="button" data-mdb-toggle="dropdown" aria-expanded="false">
                        <i class="united kingdom flag m-0"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                        <li>
                            <a class="dropdown-item" href="#"><i class="united kingdom flag"></i>English
                                <i class="fa fa-check text-success ms-2"></i></a>
                        </li>
                        <li>
                            <hr class="dropdown-divider"/>
                        </li>
                        <li>
                            <a class="dropdown-item" href="#"><i class="poland flag"></i>Polski</a>
                        </li>
                        <li>
                            <a class="dropdown-item" href="#"><i class="china flag"></i>中文</a>
                        </li>
                        <li>
                            <a class="dropdown-item" href="#"><i class="japan flag"></i>日本語</a>
                        </li>
                        <li>
                            <a class="dropdown-item" href="#"><i class="germany flag"></i>Deutsch</a>
                        </li>
                        <li>
                            <a class="dropdown-item" href="#"><i class="france flag"></i>Français</a>
                        </li>
                        <li>
                            <a class="dropdown-item" href="#"><i class="spain flag"></i>Español</a>
                        </li>
                        <li>
                            <a class="dropdown-item" href="#"><i class="russia flag"></i>Русский</a>
                        </li>
                        <li>
                            <a class="dropdown-item" href="#"><i class="portugal flag"></i>Português</a>
                        </li>
                    </ul>
                </li>

                <!-- Avatar -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle hidden-arrow d-flex align-items-center" href="#"
                       id="navbarDropdownMenuLink" role="button" data-mdb-toggle="dropdown" aria-expanded="false">
                        <img src="./assets/img/avatar.jpg" class="rounded-circle"
                             height="22" alt="" loading="lazy"/>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                        <li><a class="dropdown-item" href="#">My profile</a></li>
                        <li><a class="dropdown-item" href="#">Settings</a></li>
                        <li><a class="dropdown-item" href="#">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <!-- Container wrapper -->
    </nav>
    <!-- Navbar -->
</header>
