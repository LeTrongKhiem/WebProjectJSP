<%@ page import="com.example.webproject.DAO.daoimpl.CategoryDAOImpl" %>
<%@ page import="com.example.webproject.BEAN.Category" %><%--
  Created by LeTrongKhiem.
  User: User
  Date: 03-Dec-21
  Time: 9:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<style>
    .header__cart-wrap {
        position: relative;
        display: inline-block;
        padding: 0 12px;
        cursor: pointer;
        -webkit-tap-highlight-color: transparent;
    }

    .header__card-notice {
        position: absolute;
        top: -10px;
        right: -4px;
        padding: 2px 4px;
        font-size: 1.2rem;
        line-height: 1.2rem;
        border-radius: 10px;
        border: 2px solid red;
        color: #fff;
        background-color: red;
    }
</style>
<%
    CategoryDAOImpl categoryDAO = new CategoryDAOImpl();
%>
<div class="header">
    <div class="header-nav">
        <div class="grid wide no-margin">
            <div class="row">
                <div class="col l-4 m-12 c-12">
                    <div class="header-nav__item">
                        <span>Bạn đang xem giá, tồn kho tại: </span>
                        <span class="header-nav__location">
                                    Hồ Chí Minh
                                    <i class="header-nav__icon-down fas fa-chevron-down"></i>
                                    <ul class="header-nav__areas-list">
                                        <li class="header-nav__area-name">Hồ Chí Minh</li>
                                        <li class="header-nav__area-name">Hà Nội</li>
                                        <li class="header-nav__area-name">Bình Dương</li>
                                    </ul>
                                </span>
                    </div>
                </div>
                <div class="col l-4 m-0 c-0">
                    <div class="header-nav__item">
                        <p class="header-nav__info">
                            Hotline:
                            <span class="header-nav__info-address">
                                        HN: 0372253243 - SG: 0372253243 - ĐN: 0372253243 - CSKH Online 0372253243
                                    </span>
                        </p>
                    </div>
                </div>
                <div class="col l-4 m-0 c-0">
                    <div class="header-nav__item">
                        <ul class="header-nav__logs-list" style="width: 100%">
                            <c:choose>
                                <c:when test="${sessionScope.user != null}">
                                    <li class="header__navbar-items">
                                        <a href="#" class="header__navbar-items-link" style="margin-left: 100px">
                                            <i class="header__navbar--icon fas fa-bell"></i>
                                        </a>
                                    </li>
                                    <li class="header__navbar-items header__navbar-user header__navbar-items--separate">
                                    <li class="header__navbar-items header__navbar-user header__cart-wrap">
                                        <a href="#" class="header__navbar-items-link ">
                                            <i class="header__navbar--icon fas fa-shopping-cart"></i>
                                            <span class="header__card-notice">3</span>
                                        </a>
                                    </li>
                                    <li class="header__navbar-items header__navbar-user header__navbar-items--separate">
                                    <img src="https://avatar-redirect.appspot.com/google/108477473411482458497?size=400"
                                         alt="" class="header__navbar-user-img">
                                    <span class="header__navbar-user-name"
                                          style="width: 120px"> ${sessionScope.user.name}</span>
                                    <ul class="header__navbar-user-menu">
                                        <li class="header__navber-user-item">
                                            <a href="./thongtincanhan.jsp" class="header-nav__log-link">Tài khoản của
                                                tôi</a>
                                        </li>
                                        <li class="header__navber-user-item">
                                            <a href="" class="header-nav__log-link">Tra cứu bảo hành</a>
                                        </li>
                                        <li class="header__navber-user-item">
                                            <a href="" class="header-nav__log-link">Đơn đặt hàng</a>
                                        </li>
                                        <li class="header__navber-user-item">
                                            <a href="" class="header-nav__log-link">Lịch sử mua hàng</a>
                                        </li>
                                        <li class="header__navber-user-item">
                                            <a href="" class="header-nav__log-link">Lịch sử sữa chữa</a>
                                        </li>
                                        <li class="header__navber-user-item">
                                            <a href="" class="header-nav__log-link">Sổ địa chỉ</a>
                                        </li>
                                        <li class="header__navber-user-item header__navber-user-item--separate">
                                            <a href="LogOutController" class="header-nav__log-link">Đăng
                                                xuất</a>
                                        </li>
                                    </ul>
                                </c:when>
                                <c:otherwise>
                                    <li class="header-nav__log-item">
                                        <a href="./trangbaohanh.jsp" class="header-nav__log-link"
                                           style="width: 150px">Tra cứu bảo
                                            hành</a>
                                    </li>
                                    <li class="header-nav__log-item">
                                        <a href="./dangnhap.jsp" class="header-nav__log-link">Đăng nhập</a>
                                    </li>
                                    <li class="header-nav__log-item">
                                        <a href="./dangki.jsp" class="header-nav__log-link">Đăng ký</a>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="header-with-search">
        <div class="grid wide">
            <div class="header-with-search__wrap">
                <!-- Mobile menu button -->
                <div class="header-mobile-menu display-on-mobile-and-tablet">
                    <i class="header-mobile-menu__icon fas fa-bars"></i>
                </div>

                <a href="index.jsp" class="header-logo__link">
                    <!-- <div class="header-logo__img">TG Mobile</div> -->
                    <div class="header-mobile-nav__logo1" style="background-image: url('assets/img/logo3.png');">
                    </div>
                </a>

                <form class="header-search hide-on-mobile-and-tablet" action="SearchController?index=1" method="post">
                    <input value="${txts}" name="txt" type="text" placeholder="Nhập tên sản phẩm..."
                           class="header-search__input">
                    <button type="submit" style="background: #fff;border: none;"><i
                            class="header-search__icon fas fa-search"></i></button>
                </form>

                <ul class="header-menu hide-on-mobile-and-tablet">
                    <%for (Category categoryParent : categoryDAO.getListCategoryParent()) {%>
                    <li class="header-menu__item">
                        <a href="productlist.jsp" class="header-menu__item-link">
                            <i class="header-menu__item-icon <%=categoryParent.getIcon()%>"></i>
                            <p class="header-menu__item-name"><%=categoryParent.getTenDanhMuc()%>
                            </p>
                        </a>
                        <div class="header-sub-menu">
                            <div class="grid">
                                <div class="row">
                                    <div class="col l-9 m-9">
                                        <h3 class="header-sub-menu__title">Hãng sản xuất</h3>
                                        <div class="row">
                                            <%for (Category categoryChild : categoryDAO.getListCategoryChild(categoryParent.getMaDanhMuc())) {%>
                                            <div class="col l-4 m-4">
                                                <div class="header-sub-menu__item">
                                                    <a href="ProductListController?madanhmuc=<%=categoryChild.getMaDanhMuc()%>"
                                                       class="header-sub-menu__link">
                                                        <i
                                                                class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                        <%=categoryChild.getTenDanhMuc()%>
                                                    </a>
                                                </div>
                                            </div>
                                            <%}%>
                                        </div>
                                    </div>

                                    <div class="col l-3 m-4">
                                        <h3 class="header-sub-menu__title">Mức giá</h3>
                                        <div class="row">
                                            <div class="col l-12">
                                                <div class="header-sub-menu__item">
                                                    <a href="#" class="header-sub-menu__link">
                                                        <i
                                                                class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                        Dưới 1 triệu
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="col l-12">
                                                <div class="header-sub-menu__item">
                                                    <a href="#" class="header-sub-menu__link">
                                                        <i
                                                                class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                        Dưới 2 triệu
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="col l-12">
                                                <div class="header-sub-menu__item">
                                                    <a href="#" class="header-sub-menu__link">
                                                        <i
                                                                class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                        Dưới 3 triệu
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="col l-12">
                                                <div class="header-sub-menu__item">
                                                    <a href="#" class="header-sub-menu__link">
                                                        <i
                                                                class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                        Dưới 5 triệu
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="col l-12">
                                                <div class="header-sub-menu__item">
                                                    <a href="#" class="header-sub-menu__link">
                                                        <i
                                                                class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                        Dưới 8 triệu
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="col l-12">
                                                <div class="header-sub-menu__item">
                                                    <a href="#" class="header-sub-menu__link">
                                                        <i
                                                                class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                        Dưới 10 triệu
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="col l-12">
                                                <div class="header-sub-menu__item">
                                                    <a href="#" class="header-sub-menu__link">
                                                        <i
                                                                class="header-sub-menu__icon fas fa-angle-double-right"></i>
                                                        Trên 10 triệu
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col l-12 m-12">
                                        <div class="header-sub-menu__ranking">
                                            <i class="header-sub-menu__ranking-icon fas fa-trophy"></i>
                                            <a href="#" class="header-sub-menu__ranking-title">Xếp hạng điện
                                                thoại</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <%}%>
                    <!-- Menu news -->
                    <li class="header-menu__item">
                        <a href="./tintuc.jsp" class="header-menu__item-link">
                            <i class="header-menu__item-icon fas fa-newspaper"></i>
                            <p class="header-menu__item-name">Tin tức</p>
                        </a>
                    </li>
                </ul>

                <!-- Button search in mobile -->
                <div class="header-mobile-search display-on-mobile-and-tablet">
                    <i class="header-mobile-search__icon fas fa-search"></i>
                </div>

                <!-- Mobile search input -->
                <div class="header-mobile-search-box__wrap">
                    <input type="text" placeholder="Nhập tên sản phẩm..."
                           class="header-mobile-search-box__input">
                    <button class="header-mobile-search-box__btn">
                        <i class="header-mobile-search-box__icon fas fa-search"></i>
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- Mobile and Tablet sub menu -->
    <label class="header-mobile-nav__overlay"></label>

    <nav class="header-mobile-nav">
        <div class="header-mobile-nav__heading">
            <a href="#" class="header-mobile-nav__heading-link">
                <div class="header-mobile-nav__logo"></div>
            </a>
            <i class="header-mobile-nav__close fas fa-times"></i>
        </div>

        <ul class="header-mobile-nav__list">
            <!-- Mobile -->
            <%for (Category categoryParent : categoryDAO.getListCategoryParent()) {%>
            <li class="header-mobile-nav__item">
                <label class="header-mobile-nav__item-select">
                    <i class="header-mobile-nav__icon-open fas fa-chevron-right"></i>
                    <%=categoryParent.getTenDanhMuc()%>
                </label>

                <ul class="header-mobile-sub-nav__list" style="--num-row: 8;">
                    <%for (Category categoryChild : categoryDAO.getListCategoryChild(categoryParent.getMaDanhMuc())) {%>
                    <li class="header-mobile-sub-nav__item">
                        <a href="#" class="header-mobile-sub-nav__item-link"><%=categoryChild.getTenDanhMuc()%>
                        </a>
                    </li>
                    <%}%>
                </ul>
            </li>
            <%}%>
            <!-- News -->
            <li class="header-mobile-nav__item">
                <a href="./tintuc.jsp" class="header-mobile-nav__item-select">
                    <i class="header-mobile-nav__icon-open fas fa-chevron-right"></i>
                    Tin tức
                </a>
            </li>
            <li class="header-mobile-nav__item pd-none" style="--num-row: 2;">
                <a href="#" class="header-mobile-nav__item-link">Liên hệ</a>
            </li>
            <li class="header-mobile-nav__item pd-none">
                <a href="#" class="header-mobile-nav__item-link">Diễn đàn</a>
            </li>
            <li class="header-mobile-nav__item pd-none">
                <a href="#" class="header-mobile-nav__item-link">Tra cứu bảo hành</a>
            </li>
            <c:choose>
                <c:when test="${sessionScope.user == null}">
                    <li class="header-mobile-nav__item pd-none">
                        <a href="./dangnhap.jsp" class="header-mobile-nav__item-link">Đăng nhập</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="header-mobile-nav__item">
                        <label class="header-mobile-nav__item-select">
                            <i class="header-mobile-nav__icon-open fas fa-chevron-right"></i>
                                ${sessionScope.user.name}
                        </label>

                        <ul class="header-mobile-sub-nav__list" style="--num-row: 8;">
                            <li class="header-mobile-sub-nav__item">
                                <a href="thongtincanhan.jsp" class="header-mobile-sub-nav__item-link">Tài khoản của
                                    tôi</a>
                            </li>
                            <li class="header-mobile-sub-nav__item">
                                <a href="trangbaohanh.jsp" class="header-mobile-sub-nav__item-link">Tra cứu bảo hành</a>
                            </li>
                            <li class="header-mobile-sub-nav__item">
                                <a href="#" class="header-mobile-sub-nav__item-link">Đơn đặt hàng</a>
                            </li>
                            <li class="header-mobile-sub-nav__item">
                                <a href="#" class="header-mobile-sub-nav__item-link">Lịch sử mua hàng</a>
                            </li>
                            <li class="header-mobile-sub-nav__item">
                                <a href="#" class="header-mobile-sub-nav__item-link">Lịch sử sửa chữa</a>
                            </li>
                            <li class="header-mobile-sub-nav__item">
                                <a href="#" class="header-mobile-sub-nav__item-link">Sổ địa chỉ</a>
                            </li>
                            <li class="header-mobile-sub-nav__item">
                                <a href="LogOutController" class="header-mobile-sub-nav__item-link">Đăng xuất</a>
                            </li>
                        </ul>
                    </li>
                </c:otherwise>
            </c:choose>
        </ul>
    </nav>
</div>