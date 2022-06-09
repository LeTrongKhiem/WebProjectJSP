<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tin tức</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">

    <link rel="stylesheet" href="<c:url value='assets/font/fontawesome-free-5.15.3-web/css/all.min.css'/>">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="icon" href="<c:url value= './assets/img/logo3.png'/>">

    <link rel="stylesheet" href="<c:url value= './assets/css/base.css'/>">
    <link rel="stylesheet" href="<c:url value= './assets/css/grid.css'/>">
    <link rel="stylesheet" href="<c:url value= './assets/css/main.css'/>">
    <link rel="stylesheet" href="<c:url value= './assets/css/responsive.css'/>">
    <link rel="stylesheet" href="<c:url value= './assets/css/tintuc.css'/>">
</head>

<body>

<div class="main">

    <%--  header  --%>
    <%@include file="/header.jsp" %>
    <%--  header  --%>
    <section class="container">
        <div class="breadcrumb">
            <ul itemscope="" itemtype="http://schema.org/BreadcrumbList">

                <li itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
                    <a itemprop="item" href=""><span itemprop="name">Tin tức</span>
                    </a>
                    <meta itemprop="position" content="2">
                </li>
            </ul>
        </div>
        <div class="news-content">
            <div class="news-content-list">
                <div class="news-content-item news-main">
                    <div class="img">
                        <a href=""><img class="stylesheet"
                                        src="https://cdn.mobilecity.vn/mobilecity-vn/images/2021/12/xiaomi-tra-loi-truc-tie-ve-flagship.jpg"
                                        data-original="https://cdn.mobilecity.vn/mobilecity-vn/images/2021/12/xiaomi-tra-loi-truc-tie-ve-flagship.jpg"
                                        alt="xiaomi-tra-loi-truc-tie-ve-flagship" style=""></a>
                    </div>
                    <h3 class="name"><a
                            href="https://mobilecity.vn/tin-tuc/tin-nong-xiaomi-tra-loi-truc-tiep-ve-chip-rieng-o-to-tu-san-xuat-miui-13-va-flagship.html">Tin
                        nóng: Xiaomi Trả Lời Trực Tiếp Về Chip Riêng, Ô Tô Tự Sản Xuất, MIUI 13 Và Flagship</a></h3>
                    <div class="description"> Chào mừng Quý khách đã trở lại với Bản Tin Công Nghệ của MobileCity, cập
                        nhật tin tức công nghệ hot nhất trong 24h qua.
                        Ngay sau đây sẽ là những thông tin chính có trong bản tin ngày hôm nay:
                        1. Khủng hoảng linh kiện ảnh hưởng nghiêm trọng tới Samsung
                        Cuộc khủng hoảng toàn cầu về tình ...
                    </div>
                    <div class="infor-meta">
                        <div class="time" style="margin-right: 10px">11:56 26/12/2021</div>
                        <p class="infor-meta__comment">
                            <svg id="Comment-Reg" viewBox="0 0 32 32" fill="#bdbdbd"
                                 style="height: 20px; width: 25px; margin-right: 5px;">
                                <path d="M2 0h28c0.53 0 1.039 0.211 1.414 0.586s0.586 0.884 0.586 1.414v20c0 0.53-0.211 1.039-0.586 1.414s-0.884 0.586-1.414 0.586h-10l-12 8v-8h-6c-0.53 0-1.039-0.211-1.414-0.586s-0.586-0.884-0.586-1.414v-20c0-0.53 0.211-1.039 0.586-1.414s0.884-0.586 1.414-0.586v0z"></path>
                            </svg>
                            0
                        </p>
                        <p class="infor-meta__view"><i class="fa fa-eye" aria-hidden="true"></i>14</p>
                    </div>
                </div>
                <div class="news-content-right">
                    <div class="news-item">
                        <div class="name">
                            <a href="https://mobilecity.vn/tin-tuc/bat-ngo-lo-thong-tin-bphone-dao-nhai-truoc-gio-ra-mat.html">
                                <h3>Bất ngờ lộ thông tin Bphone "đạo nhái" trước giờ ra mắt</h3></a>
                        </div>
                        <div class="img">
                            <a href="https://mobilecity.vn/tin-tuc/bat-ngo-lo-thong-tin-bphone-dao-nhai-truoc-gio-ra-mat.html"><img
                                    class="lazy"
                                    src="https://cdn.mobilecity.vn/mobilecity-vn/images/2021/12/bphone-4-1.jpg"
                                    data-original="https://cdn.mobilecity.vn/mobilecity-vn/images/2021/12/bphone-4-1.jpg"
                                    alt="bphone-4-1" style=""></a>
                        </div>
                        <div class="description">
                            <div class="text"> Bất ngờ lộ thông tin Bphone "đạo nhái" trước giờ ra mắt , liệu smartphone
                                "đáng mong chờ nhất" của Việt Nam có thực sự như những lời quảng cáo?

                                &nbsp;
                                Hồm nay 11/12/2021, BKAV sẽ chính thức cho 20 khách hàng đầu tiên "đặt móng" trải nghiệm
                                Bphone A-series mới tại các chuỗi cửa hàng của mình. ...
                            </div>
                            <div class="infor-meta">
                                <div class="time" style="margin-right: 10px">09:27 11/12/2021</div>
                                <p class="infor-meta__comment">
                                    <svg id="Comment-Reg" viewBox="0 0 32 32" fill="#bdbdbd"
                                         style="height: 20px; width: 25px; margin-right: 5px;">
                                        <path d="M2 0h28c0.53 0 1.039 0.211 1.414 0.586s0.586 0.884 0.586 1.414v20c0 0.53-0.211 1.039-0.586 1.414s-0.884 0.586-1.414 0.586h-10l-12 8v-8h-6c-0.53 0-1.039-0.211-1.414-0.586s-0.586-0.884-0.586-1.414v-20c0-0.53 0.211-1.039 0.586-1.414s0.884-0.586 1.414-0.586v0z"></path>
                                    </svg>
                                    0
                                </p>
                                <p class="infor-meta__view mr-30"><i class="fa fa-eye" aria-hidden="true"></i>2927</p>
                            </div>
                        </div>
                    </div>
                    <div class="news-item">
                        <div class="name">
                            <a href="https://mobilecity.vn/tin-tuc/moto-edge-s30-co-hon-170-000-don-dat-hang-truoc-se-mo-ban-vao-ngay-mai-tai-trung-quoc.html">
                                <h3>Moto Edge S30 có hơn 170.000 đơn đặt hàng trước, sẽ mở bán vào ngày mai tại Trung
                                    Quốc</h3></a>
                        </div>
                        <div class="img">
                            <a href="https://mobilecity.vn/tin-tuc/moto-edge-s30-co-hon-170-000-don-dat-hang-truoc-se-mo-ban-vao-ngay-mai-tai-trung-quoc.html"><img
                                    class="lazy"
                                    src="https://cdn.mobilecity.vn/mobilecity-vn/images/2021/12/motorola-edge-s30-6.jpg"
                                    data-original="https://cdn.mobilecity.vn/mobilecity-vn/images/2021/12/motorola-edge-s30-6.jpg"
                                    alt="motorola-edge-s30-6" style=""></a>
                        </div>
                        <div class="description">
                            <div class="text"> Vào ngày 9 tháng 12, Motorola đã công bố điện thoại thông minh Moto Edge
                                X30 và Edge S30 tại Trung Quốc. Trong đợt bán X30 đầu tiên diễn ra vào ngày 15/12 tại
                                Trung Quốc, Motorola đã bán được 10.000 chiếc điện thoại này trong vòng chưa đầy 3 phút.
                                Như đã biết, X30 ra mắt là điện thoại đầu tiên trên ...
                            </div>
                            <div class="infor-meta">
                                <div class="time" style="margin-right: 10px">10:13 20/12/2021</div>
                                <p class="infor-meta__comment">
                                    <svg id="Comment-Reg" viewBox="0 0 32 32" fill="#bdbdbd"
                                         style="height: 20px; width: 25px; margin-right: 5px;">
                                        <path d="M2 0h28c0.53 0 1.039 0.211 1.414 0.586s0.586 0.884 0.586 1.414v20c0 0.53-0.211 1.039-0.586 1.414s-0.884 0.586-1.414 0.586h-10l-12 8v-8h-6c-0.53 0-1.039-0.211-1.414-0.586s-0.586-0.884-0.586-1.414v-20c0-0.53 0.211-1.039 0.586-1.414s0.884-0.586 1.414-0.586v0z"></path>
                                    </svg>
                                    0
                                </p>
                                <p class="infor-meta__view mr-30"><i class="fa fa-eye" aria-hidden="true"></i>2051</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="sidebar mobile">
                    <div class="product-sidebar">
                        <div class="product-sidebar-title">Sản phẩm hot</div>
                        <div class="product-sidebar-list">
                            <div class="product-sidebar-item">
                                <div class="img">
                                    <a href="https://mobilecity.vn/asus/asus-rog-phone-5s.html">
                                        <img src="https://cdn.mobilecity.vn/mobilecity-vn/images/2021/11/w80/asus-rog-phone-5s-trang.jpg"
                                             alt="asus-rog-phone-5s-trang">
                                    </a>
                                </div>
                                <p class="name"><a href="https://mobilecity.vn/asus/asus-rog-phone-5s.html">Asus ROG
                                    Phone 5S (Snap 888+)</a></p>
                                <p class="price">14.450.000 ₫</p>
                            </div>
                            <div class="product-sidebar-item">
                                <div class="img">
                                    <a href="https://mobilecity.vn/oppo/realme-gt-neo-2.html">
                                        <img src="https://cdn.mobilecity.vn/mobilecity-vn/images/2021/09/w80/realme-gt-neo-2-mint.jpg"
                                             alt="realme-gt-neo-2-mint">
                                    </a>
                                </div>
                                <p class="name"><a href="https://mobilecity.vn/oppo/realme-gt-neo-2.html">Realme GT Neo
                                    2 (Snap 870)</a></p>
                                <p class="price">7.550.000 ₫</p>
                            </div>
                            <div class="product-sidebar-item">
                                <div class="img">
                                    <a href="https://mobilecity.vn/samsung/samsung-galaxy-note-10-cu.html">
                                        <img src="https://cdn.mobilecity.vn/mobilecity-vn/images/2019/10/w80/samsung-note-10-plus-4.jpg"
                                             alt="samsung-note-10-plus-4">
                                    </a>
                                </div>
                                <p class="name"><a href="https://mobilecity.vn/samsung/samsung-galaxy-note-10-cu.html">Samsung
                                    Galaxy Note 10 Cũ (Mỹ, Hàn Quốc)</a></p>
                                <p class="price">6.350.000 ₫</p>
                            </div>
                            <div class="product-sidebar-item">
                                <div class="img">
                                    <a href="https://mobilecity.vn/apple/iphone-11-cu.html">
                                        <img src="https://cdn.mobilecity.vn/mobilecity-vn/images/2021/07/w80/iphone-11-tim.jpg"
                                             alt="iphone-11-tim">
                                    </a>
                                </div>
                                <p class="name"><a href="https://mobilecity.vn/apple/iphone-11-cu.html">iPhone 11 cũ
                                    (64GB, 256GB)</a></p>
                                <p class="price">10.050.000 ₫</p>
                            </div>
                            <div class="product-sidebar-item">
                                <div class="img">
                                    <a href="https://mobilecity.vn/apple/iphone-11-pro-max-cu.html">
                                        <img src="https://cdn.mobilecity.vn/mobilecity-vn/images/2021/07/w80/iphone-11-pro-max-vang.jpg"
                                             alt="iphone-11-pro-max-vang">
                                    </a>
                                </div>
                                <p class="name"><a href="https://mobilecity.vn/apple/iphone-11-pro-max-cu.html">iPhone
                                    11 Pro Max cũ (64GB-256GB)</a></p>
                                <p class="price">16.050.000 ₫</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="news-content__category">
                    <div class="category">
                        <div class="category--banner">
                            <a href="https://mobilecity.vn/xiaomi/xiaomi-poco-x3-pro.html"><img
                                    src="https://cdn.mobilecity.vn/mobilecity-vn/images/2021/07/w900/poco-x3-pro-dgw.jpg"></a>
                        </div>
                        <div class="category--title">Tin công nghệ</div>
                        <div class="category--list">
                            <div class="news-content-item">
                                <div class="img">
                                    <a href="https://mobilecity.vn/tin-tuc/tin-nong-xiaomi-tra-loi-truc-tiep-ve-chip-rieng-o-to-tu-san-xuat-miui-13-va-flagship.html"><img
                                            class="lazy"
                                            src="https://cdn.mobilecity.vn/mobilecity-vn/images/2021/12/w500/xiaomi-tra-loi-truc-tie-ve-flagship.jpg"
                                            data-original="https://cdn.mobilecity.vn/mobilecity-vn/images/2021/12/w500/xiaomi-tra-loi-truc-tie-ve-flagship.jpg"
                                            alt="xiaomi-tra-loi-truc-tie-ve-flagship" style=""></a>
                                </div>
                                <div class="right">
                                    <div class="detail">
                                        <h3 class="name"><a
                                                href="https://mobilecity.vn/tin-tuc/tin-nong-xiaomi-tra-loi-truc-tiep-ve-chip-rieng-o-to-tu-san-xuat-miui-13-va-flagship.html">Tin
                                            nóng: Xiaomi Trả Lời Trực Tiếp Về Chip Riêng, Ô Tô Tự Sản Xuất, MIUI 13 Và
                                            Flagship</a></h3>
                                        <div class="description">
                                            <div class="text"> Chào mừng Quý khách đã trở lại với Bản Tin Công Nghệ của
                                                MobileCity, cập nhật tin tức công nghệ hot nhất trong 24h qua.
                                                Ngay sau đây sẽ là những thông tin chính có trong bản tin ngày hôm nay:
                                                1. Khủng hoảng linh kiện ảnh hưởng nghiêm trọng tới Samsung
                                                Cuộc khủng hoảng toàn cầu về tình ...
                                            </div>
                                        </div>
                                        <div class="infor-meta">
                                            <div class="news_author"><i class="fa fa-user-circle"
                                                                        aria-hidden="true"></i> Đặng Ái Vân
                                            </div>
                                            <div class="time" style="margin-right: 10px">11:56 26/12/2021</div>
                                            <p class="infor-meta__comment">
                                                <svg id="Comment-Reg" viewBox="0 0 32 32" fill="#bdbdbd"
                                                     style="height: 20px; width: 25px; margin-right: 5px;">
                                                    <path d="M2 0h28c0.53 0 1.039 0.211 1.414 0.586s0.586 0.884 0.586 1.414v20c0 0.53-0.211 1.039-0.586 1.414s-0.884 0.586-1.414 0.586h-10l-12 8v-8h-6c-0.53 0-1.039-0.211-1.414-0.586s-0.586-0.884-0.586-1.414v-20c0-0.53 0.211-1.039 0.586-1.414s0.884-0.586 1.414-0.586v0z"></path>
                                                </svg>
                                                0
                                            </p>
                                            <p class="infor-meta__view"><i class="fa fa-eye" aria-hidden="true"></i>14
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="news-content-item">
                                <div class="img">
                                    <a href="https://mobilecity.vn/tin-tuc/oppo-reno-7-phien-ban-tet-ra-mat.html"><img
                                            class="lazy"
                                            src="https://cdn.mobilecity.vn/mobilecity-vn/images/2021/12/w500/oppo-reno7-new-year-edition-1.jpg"
                                            data-original="https://cdn.mobilecity.vn/mobilecity-vn/images/2021/12/w500/oppo-reno7-new-year-edition-1.jpg"
                                            alt="oppo-reno7-new-year-edition-1" style=""></a>
                                </div>
                                <div class="right">
                                    <div class="detail">
                                        <h3 class="name"><a
                                                href="https://mobilecity.vn/tin-tuc/oppo-reno-7-phien-ban-tet-ra-mat.html">Oppo
                                            Reno 7 phiên bản Tết ra mắt</a></h3>
                                        <div class="description">
                                            <div class="text"> Oppo Reno7 được ra mắt vào tháng trước đã có một phiên
                                                bản đặc biệt, được gọi là Oppo Reno7 New Year Edition. Máy có màu Red
                                                Velvet (Đỏ nhung) và có biểu tượng con hổ ở mặt sau, cạnh logo Oppo vì
                                                năm 2022 là năm Nhâm Dần trong âm lịch Trung Quốc.
                                                Ngoài màu đỏ và biểu tượng con hổ ở mặt sau, Oppo ...
                                            </div>
                                        </div>
                                        <div class="infor-meta">
                                            <div class="news_author"><i class="fa fa-user-circle"
                                                                        aria-hidden="true"></i> Giang Đức
                                            </div>
                                            <div class="time" style="margin-right: 10px">11:05 26/12/2021</div>
                                            <p class="infor-meta__comment">
                                                <svg id="Comment-Reg" viewBox="0 0 32 32" fill="#bdbdbd"
                                                     style="height: 20px; width: 25px; margin-right: 5px;">
                                                    <path d="M2 0h28c0.53 0 1.039 0.211 1.414 0.586s0.586 0.884 0.586 1.414v20c0 0.53-0.211 1.039-0.586 1.414s-0.884 0.586-1.414 0.586h-10l-12 8v-8h-6c-0.53 0-1.039-0.211-1.414-0.586s-0.586-0.884-0.586-1.414v-20c0-0.53 0.211-1.039 0.586-1.414s0.884-0.586 1.414-0.586v0z"></path>
                                                </svg>
                                                0
                                            </p>
                                            <p class="infor-meta__view"><i class="fa fa-eye" aria-hidden="true"></i>95
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="news-content-item">
                                <div class="img">
                                    <a href="https://mobilecity.vn/tin-tuc/nguoi-dung-oneplus-se-co-toan-quyen-truy-cap-vao-cac-trung-tam-dich-vu-sau-ban-hang-cua-oppo.html"><img
                                            class="lazy"
                                            src="https://cdn.mobilecity.vn/mobilecity-vn/images/2021/12/w500/oneplus-hop-nhat-voi-oppo.jpg"
                                            data-original="https://cdn.mobilecity.vn/mobilecity-vn/images/2021/12/w500/oneplus-hop-nhat-voi-oppo.jpg"
                                            alt="oneplus-hop-nhat-voi-oppo" style=""></a>
                                </div>
                                <div class="right">
                                    <div class="detail">
                                        <h3 class="name"><a
                                                href="https://mobilecity.vn/tin-tuc/nguoi-dung-oneplus-se-co-toan-quyen-truy-cap-vao-cac-trung-tam-dich-vu-sau-ban-hang-cua-oppo.html">Người
                                            dùng OnePlus sẽ có toàn quyền truy cập vào các trung tâm dịch vụ sau bán
                                            hàng của OPPO</a></h3>
                                        <div class="description">
                                            <div class="text"> Người dùng OnePlus sẽ có toàn quyền truy cập vào các
                                                trung tâm dịch vụ sau bán hàng của OPPO từ ngày 1 tháng 1 năm 2022.
                                                Sản phẩm bán chạy:&nbsp; OnePlus 9R
                                                Trước đây, đã có tin đồn về sự việc như đã nêu ở tiêu đề và điều này mới
                                                xuất hiện lần đầu tiên khi có tin đồn rằng OnePlus đang có kế hoạch ...
                                            </div>
                                        </div>
                                        <div class="infor-meta">
                                            <div class="news_author"><i class="fa fa-user-circle"
                                                                        aria-hidden="true"></i> Hoàng Văn Hùng
                                            </div>
                                            <div class="time" style="margin-right: 10px">23:18 25/12/2021</div>
                                            <p class="infor-meta__comment">
                                                <svg id="Comment-Reg" viewBox="0 0 32 32" fill="#bdbdbd"
                                                     style="height: 20px; width: 25px; margin-right: 5px;">
                                                    <path d="M2 0h28c0.53 0 1.039 0.211 1.414 0.586s0.586 0.884 0.586 1.414v20c0 0.53-0.211 1.039-0.586 1.414s-0.884 0.586-1.414 0.586h-10l-12 8v-8h-6c-0.53 0-1.039-0.211-1.414-0.586s-0.586-0.884-0.586-1.414v-20c0-0.53 0.211-1.039 0.586-1.414s0.884-0.586 1.414-0.586v0z"></path>
                                                </svg>
                                                0
                                            </p>
                                            <p class="infor-meta__view"><i class="fa fa-eye" aria-hidden="true"></i>59
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
            <div class="sidebar">
                <div class="product-sidebar">
                    <div class="product-sidebar-title">Sản phẩm hot</div>
                    <div class="product-sidebar-list">
                        <div class="product-sidebar-item">

                            <div class="img">
                                <a href="https://mobilecity.vn/asus/asus-rog-phone-5s.html">
                                    <img src="https://cdn.mobilecity.vn/mobilecity-vn/images/2021/11/w80/asus-rog-phone-5s-trang.jpg"
                                         alt="asus-rog-phone-5s-trang">
                                </a>
                            </div>
                            <p class="name"><a href="https://mobilecity.vn/asus/asus-rog-phone-5s.html">Asus ROG Phone
                                5S (Snap 888+)</a></p>
                            <p class="price">14.450.000 ₫</p>
                        </div>
                        <div class="product-sidebar-item">

                            <div class="img">
                                <a href="https://mobilecity.vn/oppo/realme-gt-neo-2.html">
                                    <img src="https://cdn.mobilecity.vn/mobilecity-vn/images/2021/09/w80/realme-gt-neo-2-mint.jpg"
                                         alt="realme-gt-neo-2-mint">
                                </a>
                            </div>
                            <p class="name"><a href="https://mobilecity.vn/oppo/realme-gt-neo-2.html">Realme GT Neo 2
                                (Snap 870)</a></p>
                            <p class="price">7.550.000 ₫</p>
                        </div>
                        <div class="product-sidebar-item">

                            <div class="img">
                                <a href="https://mobilecity.vn/samsung/samsung-galaxy-note-10-cu.html">
                                    <img src="https://cdn.mobilecity.vn/mobilecity-vn/images/2019/10/w80/samsung-note-10-plus-4.jpg"
                                         alt="samsung-note-10-plus-4">
                                </a>
                            </div>
                            <p class="name"><a href="https://mobilecity.vn/samsung/samsung-galaxy-note-10-cu.html">Samsung
                                Galaxy Note 10 Cũ (Mỹ, Hàn Quốc)</a></p>
                            <p class="price">6.350.000 ₫</p>
                        </div>
                        <div class="product-sidebar-item">

                            <div class="img">
                                <a href="https://mobilecity.vn/apple/iphone-11-cu.html">
                                    <img src="https://cdn.mobilecity.vn/mobilecity-vn/images/2021/07/w80/iphone-11-tim.jpg"
                                         alt="iphone-11-tim">
                                </a>
                            </div>
                            <p class="name"><a href="https://mobilecity.vn/apple/iphone-11-cu.html">iPhone 11 cũ (64GB,
                                256GB)</a></p>
                            <p class="price">10.050.000 ₫</p>
                        </div>
                        <div class="product-sidebar-item">

                            <div class="img">
                                <a href="https://mobilecity.vn/apple/iphone-11-pro-max-cu.html">
                                    <img src="https://cdn.mobilecity.vn/mobilecity-vn/images/2021/07/w80/iphone-11-pro-max-vang.jpg"
                                         alt="iphone-11-pro-max-vang">
                                </a>
                            </div>
                            <p class="name"><a href="https://mobilecity.vn/apple/iphone-11-pro-max-cu.html">iPhone 11
                                Pro Max cũ (64GB-256GB)</a></p>
                            <p class="price">16.050.000 ₫</p>
                        </div>
                    </div>
                </div>

            </div>

        </div>
        <div class="grid wide">
            <div class="container-new">
                <div class="row">
                    <div class="col l-6 l-12-m m-12 c-12">
                        <div class="container-new__item">
                            <a href="#" class="container-new__item-link">
                                <img src="https://cdn.mobilecity.vn/mobilecity-vn/images/2020/02/w150/doi-may-moi.jpg"
                                     alt="" class="container-new__img">
                                <div class="container-new__text">
                                    <h2 class="container-new__text-heading">MobileCity đổi máy CŨ lên máy MỚI năm
                                        2020</h2>
                                    <p class="container-new__text-disc">MobileCity kính chào Quý khách! Cám ơn Quý
                                        khách đã ủng hộ và yêu quý MobileCity! Với mong muốn luôn luôn cải tiến và
                                        phục vụ Khách hàng tốt hơn, MobileCity mở chương trình "Đổi máy CŨ để lấy
                                        máy MỚI"</p>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col l-6 l-12-m m-12 c-12">
                        <div class="container-new__item">
                            <a href="#" class="container-new__item-link">
                                <img src="https://cdn.mobilecity.vn/mobilecity-vn/images/2020/02/w150/doi-may-moi.jpg"
                                     alt="" class="container-new__img">
                                <div class="container-new__text">
                                    <h2 class="container-new__text-heading">MobileCity đổi máy CŨ lên máy MỚI năm
                                        2020</h2>
                                    <p class="container-new__text-disc">MobileCity kính chào Quý khách! Cám ơn Quý
                                        khách đã ủng hộ và yêu quý MobileCity! Với mong muốn luôn luôn cải tiến và
                                        phục vụ Khách hàng tốt hơn, MobileCity mở chương trình "Đổi máy CŨ để lấy
                                        máy MỚI"</p>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <%--    footer --%>
    <%@include file="/footer.jsp" %>
    <%--    footer --%>


    <!-- Button -->
    <a href="#" class="go-to-top">
        <i class="go-to-top__icon fas fa-chevron-circle-up"></i>
    </a>

    <a href="#" class="go-to-chat">
        <i class="go-to-chat__icon fab fa-facebook-messenger"></i>
    </a>
</div>

<script src="<c:url value='./js/phone.js'/>"></script>
<script src="<c:url value='./js/tool.js'/>"></script>
<script src="<c:url value='./js/fix.js'/>"></script>
<script src="<c:url value='./js/unlock.js'/>"></script>
<script>
    const $ = document.querySelector.bind(document);
    const $$ = document.querySelectorAll.bind(document);

    const event = (() => {

        return {
            handleEvent() {
                // Search in mobile
                const mobileSearchBtn = $('.header-mobile-search');

                mobileSearchBtn.onclick = () => {
                    $('.header-mobile-search-box__wrap').classList.toggle('active');
                };

                // Menu nav in mobile
                const mobileMenuBtn = $('.header-mobile-menu');
                const overlayMobileScreen = $('.header-mobile-nav__overlay');
                const mobileNav = $('.header-mobile-nav');
                const mobileCloseNavBtn = $('.header-mobile-nav__close');

                function handleMobileNav() {
                    overlayMobileScreen.classList.toggle('active');
                    mobileNav.classList.toggle('active');
                }

                mobileMenuBtn.onclick = () => {
                    handleMobileNav();
                };

                overlayMobileScreen.onclick = () => {
                    handleMobileNav();
                };

                mobileCloseNavBtn.onclick = () => {
                    handleMobileNav()
                };

                // Menu subnav in mobile
                const mobileSubNavs = $$('.header-mobile-nav__item-select');

                Array.from(mobileSubNavs).forEach((mobileSubNav) => {
                    mobileSubNav.onclick = () => {
                        mobileSubNav.classList.toggle('active');
                        mobileSubNav.firstElementChild.classList.toggle('active');
                        if (mobileSubNav.nextElementSibling) {
                            mobileSubNav.nextElementSibling.classList.toggle('active');
                        }
                    };
                });

                // Scroll Screen
                const goToTopBtn = $('.go-to-top');
                document.onscroll = () => {
                    const scrollTop = window.scrollY || document.documentElement.scrollTop;
                    if (scrollTop > 120) {
                        goToTopBtn.classList.add('active');
                    } else {
                        goToTopBtn.classList.remove('active');
                    }
                };
            },
            init() {
                this.handleEvent();
            }
        }

    })();

    event.init();
</script>
</body>

</html>