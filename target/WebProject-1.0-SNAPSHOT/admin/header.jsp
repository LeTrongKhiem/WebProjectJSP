<%--
  Created by LeTrongKhiem.
  User: User
  Date: 19-Apr-22
  Time: 11:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%--<%--%>
<%--    String uid = (String) session.getAttribute("admin");--%>
<%--    if (uid == null) {--%>
<%--%>--%>
<%--<jsp:forward page="AdminLogin.jsp"/>--%>
<%--<%--%>
<%--} else {--%>

<%--%>--%>
<%--<jsp:forward page="quanlynhanvien.jsp"/>--%>
<%--<%--%>
<%--    }--%>
<%--%>--%>
<style>
    .logo.logo-dark{
        display: flex;
        align-content: center;
        justify-content: center;
    }
    .logo-dark a{
      font-size: 24px;
    }

</style>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:set var="auth" value="${sessionScope.admin}"/>
<c:choose>
    <c:when test="${auth != null}">
        <div class="app">
            <div class="layout">
                <!-- Header START -->
                <div class="header">
                    <div class="logo logo-dark">
                        <a href="index.html">TGMOBILE
                        </a>
                    </div>
                    <div class="logo logo-white">
                        <a href="index.html">
                            TGMOBILE
                        </a>
                    </div>
                    <div class="nav-wrap">
                        <ul class="nav-left">
                            <li class="desktop-toggle">
                                <a href="javascript:void(0);">
                                    <i class="anticon"></i>
                                </a>
                            </li>
                            <li class="mobile-toggle">
                                <a href="javascript:void(0);">
                                    <i class="anticon"></i>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:void(0);" data-toggle="modal" data-target="#search-drawer">
                                    <i class="anticon anticon-search"></i>
                                </a>
                            </li>
                        </ul>
                        <ul class="nav-right">
                            <li class="dropdown dropdown-animated scale-left">
                                <a href="javascript:void(0);" data-toggle="dropdown">
                                    <i class="anticon anticon-bell notification-badge"></i>
                                </a>
                                <div class="dropdown-menu pop-notification">
                                    <div class="p-v-15 p-h-25 border-bottom d-flex justify-content-between align-items-center">
                                        <p class="text-dark font-weight-semibold m-b-0">
                                            <i class="anticon anticon-bell"></i>
                                            <span class="m-l-10">Notification</span>
                                        </p>
                                        <a class="btn-sm btn-default btn" href="javascript:void(0);">
                                            <small>View All</small>
                                        </a>
                                    </div>
                                    <div class="relative">
                                        <div class="overflow-y-auto relative scrollable" style="max-height: 300px">
                                            <a href="javascript:void(0);"
                                               class="dropdown-item d-block p-15 border-bottom">
                                                <div class="d-flex">
                                                    <div class="avatar avatar-blue avatar-icon">
                                                        <i class="anticon anticon-mail"></i>
                                                    </div>
                                                    <div class="m-l-15">
                                                        <p class="m-b-0 text-dark">You received a new message</p>
                                                        <p class="m-b-0"><small>8 min ago</small></p>
                                                    </div>
                                                </div>
                                            </a>
                                            <a href="javascript:void(0);"
                                               class="dropdown-item d-block p-15 border-bottom">
                                                <div class="d-flex">
                                                    <div class="avatar avatar-cyan avatar-icon">
                                                        <i class="anticon anticon-user-add"></i>
                                                    </div>
                                                    <div class="m-l-15">
                                                        <p class="m-b-0 text-dark">New user registered</p>
                                                        <p class="m-b-0"><small>7 hours ago</small></p>
                                                    </div>
                                                </div>
                                            </a>
                                            <a href="javascript:void(0);"
                                               class="dropdown-item d-block p-15 border-bottom">
                                                <div class="d-flex">
                                                    <div class="avatar avatar-red avatar-icon">
                                                        <i class="anticon anticon-user-add"></i>
                                                    </div>
                                                    <div class="m-l-15">
                                                        <p class="m-b-0 text-dark">System Alert</p>
                                                        <p class="m-b-0"><small>8 hours ago</small></p>
                                                    </div>
                                                </div>
                                            </a>
                                            <a href="javascript:void(0);" class="dropdown-item d-block p-15 ">
                                                <div class="d-flex">
                                                    <div class="avatar avatar-gold avatar-icon">
                                                        <i class="anticon anticon-user-add"></i>
                                                    </div>
                                                    <div class="m-l-15">
                                                        <p class="m-b-0 text-dark">You have a new update</p>
                                                        <p class="m-b-0"><small>2 days ago</small></p>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="dropdown dropdown-animated scale-left">
                                <div class="pointer" data-toggle="dropdown">
                                    <div class="avatar avatar-image  m-h-10 m-r-15">
                                        <img src="assets/images/avatars/thumb-3.jpg" alt="">
                                    </div>
                                </div>
                                <div class="p-b-15 p-t-20 dropdown-menu pop-profile">
                                    <div class="p-h-20 p-b-15 m-b-10 border-bottom">
                                        <div class="d-flex m-r-50">
                                            <div class="avatar avatar-lg avatar-image">
                                                <img src="assets/images/avatars/thumb-3.jpg" alt="">
                                            </div>

                                            <div class="m-l-10">
                                                <p class="m-b-0 text-dark font-weight-semibold">${sessionScope.admin.hoTen}</p>
                                                <p class="m-b-0 opacity-07">${sessionScope.admin.sdt}</p>
                                            </div>
                                        </div>
                                    </div>
                                    <a href="javascript:void(0);" class="dropdown-item d-block p-h-15 p-v-10">
                                        <div class="d-flex align-items-center justify-content-between">
                                            <div>
                                                <i class="anticon opacity-04 font-size-16 anticon-user"></i>
                                                <span class="m-l-10">Edit Profile</span>
                                            </div>
                                            <i class="anticon font-size-10 anticon-right"></i>
                                        </div>
                                    </a>
                                    <a href="javascript:void(0);" class="dropdown-item d-block p-h-15 p-v-10">
                                        <div class="d-flex align-items-center justify-content-between">
                                            <div>
                                                <i class="anticon opacity-04 font-size-16 anticon-lock"></i>
                                                <span class="m-l-10">Account Setting</span>
                                            </div>
                                            <i class="anticon font-size-10 anticon-right"></i>
                                        </div>
                                    </a>
                                    <a href="javascript:void(0);" class="dropdown-item d-block p-h-15 p-v-10">
                                        <div class="d-flex align-items-center justify-content-between">
                                            <div>
                                                <i class="anticon opacity-04 font-size-16 anticon-project"></i>
                                                <span class="m-l-10">Projects</span>
                                            </div>
                                            <i class="anticon font-size-10 anticon-right"></i>
                                        </div>
                                    </a>
                                </div>
                            </li>
                            <li class="header__navber-user-item header__navber-user-item--separate">
                                <a href="LogoutAdminController"
                                   class="header-nav__log-link">Đăng
                                    xuất</a>
                            </li>
                            <li>
                                <a href="javascript:void(0);" data-toggle="modal" data-target="#quick-view">
                                    <i class="anticon anticon-appstore"></i>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>

            </div>
        </div>
    </c:when>
    <c:otherwise>
        <jsp:forward page="AdminLogin.jsp"/>
    </c:otherwise>
</c:choose>

