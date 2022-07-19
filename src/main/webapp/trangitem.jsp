<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.math.BigDecimal" %>
<jsp:useBean id="detail" scope="request" type="com.example.webproject.BEAN.Product"/>
<%--<jsp:useBean id="productList" scope="request" type="com.example.webproject.BEAN.ProductList"/>--%>
<%--
  Created by LeTrongKhiem.
  User: User
  Date: 03-Dec-21
  Time: 7:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${detail.tenSP}</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">

    <link rel="stylesheet" href="<c:url value='./assets/font/fontawesome-free-5.15.3-web/css/all.min.css'/>">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="icon" href="<c:url value= './assets/img/logo3.png'/>">

    <link rel="stylesheet" href="<c:url value= './assets/css/base.css'/>">
    <link rel="stylesheet" href="<c:url value= './assets/css/grid.css'/>">
    <link rel="stylesheet" href="<c:url value= './assets/css/main.css'/>">
    <link rel="stylesheet" href="<c:url value= './assets/css/responsive.css'/>">
    <link rel="stylesheet" href="<c:url value= './assets/css/trangitem.css'/>">
    <link rel="stylesheet" href="<c:url value='./assets/trangitem/libs/normalize.css'/>">
    <link rel="stylesheet" href="<c:url value='./assets/trangitem/style.css'/>">
    <script type="text/javascript" src="<c:url value='./assets/trangitem/js/jquery.min.js'/>"></script>

    <link rel="stylesheet" href="<c:url value='./assets/trangitem/libs/owl.carousel.min.css'/>">
    <link rel="stylesheet" href="<c:url value='./assets/trangitem/libs/lightgallery.min.css'/>">
    <link rel="stylesheet" href="<c:url value='./assets/trangitem/libs/lightslider.css'/>">
    <link rel="stylesheet" href="<c:url value='./assets/trangitem/pages/phone.css'/>">
    <link rel="stylesheet" href="<c:url value='./assets/trangitem/pages/popup_v2.css'/>">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/lightgallery@1.8.3/dist/css/lightgallery.min.css">
    <!--Đường Dẫn CDN Javascript-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/lightgallery@1.8.3/dist/js/lightgallery-all.min.js"></script>
</head>

<body>
<%--  header  --%>
<%@include file="/header.jsp" %>
<%--  header  --%>

<div class="container">
    <div class="grid wide">
        <div class="container_item">
            <div class="breadcrumb">
                <ul itemscope itemtype="http://schema.org/BreadcrumbList">
                    <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
                        <a itemprop="item" href="./productlist.jsp"><span itemprop="name">Điện thoại di
                                        động</span>
                            <i class="fa fa-angle-right" aria-hidden="true" style="margin: 0 5px"></i>
                        </a>
                        <meta itemprop="position" content="2"/>
                    </li>
                    <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
                        <a itemprop="item" href="list apple"><span itemprop="name">Apple</span>
                        </a>
                        <meta itemprop="position" content="3"/>
                    </li>
                </ul>
            </div>
            <div class="product-title is-desktop">
                <h1 class="title">${detail.tenSP}</h1>
            </div>
            <div class="product-content-box">
                <div class="grid wide">
                    <div class="row">
                        <div class="product-image-store-list col l-4 m-4 c-12">
                            <div class="product-slide-image">
                                <div class="product_image v2-product-image">
                                    <li class="active"><img
                                            src="${detail.link_hinhanh}"
                                            alt="${detail.tenSP}" data-color="1"/></li>
                                </div>
                            </div>
                        </div>
                        <div class="col l-5 m-8 c-12">
                            <div class="product-more-info">
                                <div class="warranty-default-box">
                                    <p class="warranty-text" style="">
                                        Thời gian bảo hành: <span class="warranty-content">
                                                    <span class="warranty-content-default">BH Thường 6 Tháng</span>
                                                    <span class="warranty-content-selected"></span></span>
                                        <span class="warranty-help-link">(<a href="" target="_blank">Xem chi
                                                        tiết</a>)</span>
                                    </p>
                                    <p>Giao hàng tận nơi miễn phí trong 30 phút (<a
                                            href="/page/chinh-sach-van-chuyen.html">Tìm hiểu
                                        thêm</a>)</p>
                                </div>
                                <div class="sale-box v2-promotion">
                                    <p class="sale-box-title">Khuyến mãi</p>
                                    <ul>
                                        <li>
                                            <p>Tặng: <span style="color: #ff0000;">Cường lực -</span> <span
                                                    style="color: #ff0000;">Ốp
                                                            lưng - Tai nghe</span> khi mua BHV</p>
                                        </li>
                                        <li>
                                            <p>Giảm: <span style="color: #ff0000;">100K</span> áp dụng HSSV mua
                                                BHV
                                                tại
                                                <span style="color: #ff0000;">Linh Trung - Thủ Đức</span>
                                            </p>
                                        </li>
                                        <li>
                                            <p>Mua: Dán cường lực 5D chỉ <span
                                                    style="color: #ff0000;">30K</span>
                                            </p>
                                        </li>
                                        <li>
                                            <p>Giảm 100K khi mua BHV và đặt hàng tại: <a title=""
                                                                                         href="https://bit.ly/mc42-voucher">Đây</a>
                                            </p>
                                        </li>
                                        <li>
                                            <p>Mua SHOPEE giá Rẻ: <a title="MobileCity Shopee" href=""
                                                                     rel="nofollow" target="_blank">CLICK</a></p>
                                        </li>
                                    </ul>
                                </div>
                                <div class="product-address">
                                    <ul>
                                        <li>Fullbox: máy, sạc, cáp, sách hướng dẫn, que chọc sim</li>
                                    </ul>
                                </div>
                                <div class="product-messsage hidden-promotion" style=""></div>

                                <div class="product-address">Hotline: 0372.253.243 (HN) | 0372.253.243 (HCM) |
                                    0372.253.243 (ĐN)
                                </div>

                                <a href="cart-add?id=${detail.maSP}">
                                    <button class="button-add-cart btn-payment">
                                        <i class="fas fa-shopping-cart"></i>
                                        THÊM VÀO GIỎ HÀNG
                                    </button>
                                </a>
                                <a href="cart-add?id=${detail.maSP}">
                                    <button class="button-buy btn-payment">
                                        MUA HÀNG NGAY
                                    </button>
                                </a>
                                <div class="installment">
                                    <a href="" target="_blank" class="installment-btn"><span class="title">MUA
                                                    TRẢ
                                                    GÓP
                                                    0%</span><span class="line">(Duyệt HS 5
                                                    phút, Trả góp qua thẻ)</span></a>
                                </div>
                            </div>
                        </div>
                        <div class="product-related-box phone-related-box col l-3 m-0 c-0" style="">
                            <div class="product-related-title">Sản phẩm tương tự</div>
                            <div class="product-related-list phone-related-box-mobile product-box-mobile">
                                <jsp:useBean id="related" scope="request" type="java.util.List"/>
                                <c:forEach items="${related}" var="r">
                                    <div class="product-related-item">
                                        <div class="product-related-image">
                                            <a target="_blank" href="DetailController?id=${r.id}">
                                                <img src="${r.link_hinhanh}" alt="xiaomi-12s-ultra-black">
                                            </a>
                                        </div>
                                        <div class="product-related-content">
                                            <div class="product-related-name-price">
                                                <p class="name"><a target="_blank" href="DetailController?id=${r.id}">${r.ten}</a></p>
                                                <p class="price">${r.dinhDang(r.gia)}</p>
                                            </div>
                                            <a class="link-detail" href="DetailController?id=${r.id}">Xem chi tiết</a>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="product-related-title">Phụ kiện liên quan</div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="grid wide">
        <div class="product-content-box">
            <div class="product-info-box">
                <div class="product-info-title">Thông số kỹ thuật</div>
                <div class="product-info-content">
                    <table>
                        <tbody>
                        <tr>
                            <td>Màn hình:</td>
                            <td>
                                ${detail.manHinh}
                            </td>
                        </tr>
                        <tr>
                            <td>Hệ điều hành:</td>
                            <td>${detail.hdh}</td>
                        </tr>
                        <tr>
                            <td>Camera sau:</td>
                            <td>${detail.camSau}
                            </td>
                        </tr>
                        <tr>
                            <td>Camera trước:</td>
                            <td>${detail.camTr}
                            </td>
                        </tr>
                        <tr>
                            <td>CPU:</td>
                            <td>${detail.CPU}
                            </td>
                        </tr>
                        <tr>
                            <td>RAM:</td>
                            <td>${detail.RAM}</td>
                        </tr>
                        <tr>
                            <td>Bộ nhớ trong:</td>
                            <td>${detail.boNhoTrong}
                            </td>
                        </tr>
                        <tr>
                            <td>Thẻ SIM:</td>
                            <td>${detail.theSim}
                            </td>
                        </tr>
                        <tr>
                            <td>Dung lượng pin:</td>
                            <td>${detail.pin}
                            </td>
                        </tr>
                        <tr>
                            <td>Thiết kế:</td>
                            <td>${detail.thietKe}</td>
                        </tr>
                        </tbody>
                    </table>
                    <span id="product-show-lightbox" class="show-lightbox-btn">Xem thêm cấu hình chi tiết</span>
                </div>
                <div class="product-info-lightbox lightbox">
                            <span id="product-close-lightbox" class="close-lightbox-btn"><i class="fa fa-times"
                                                                                            aria-hidden="true"></i></span>
                    <marquee class="product-lightbox-title">
                        <p>${detail.tenSP}</p>
                    </marquee>
                    <%--                    </c:forEach>--%>
                    <div class="product-lightbox-content">
                        <table>
                            <tbody>
                            <tr>
                                <td colspan="2">Thông tin chung</td>
                            </tr>
                            <tr>
                                <td>Hệ điều hành:</td>
                                <td>IOS 12</td>
                            </tr>
                            <tr>
                                <td>Ngôn ngữ:</td>
                                <td>Đa ngôn ngữ, có hỗ trợ Tiếng Việt</td>
                            </tr>
                            <tr>
                                <td colspan="2">Màn hình</td>
                            </tr>
                            <tr>
                                <td>Loại màn hình:</td>
                                <td>OLED</td>
                            </tr>
                            <tr>
                                <td>Màu màn hình:</td>
                                <td>16 triệu màu</td>
                            </tr>
                            <tr>
                                <td>Chuẩn màn hình:</td>
                                <td>Super Retina OLED, HDR10, 625 nits (HBM)<br/>
                                    6.5 inches, 1242 x 2688 pixels, tỷ lệ 19.5:9<br/>
                                    Kính chống xước, 3D Touch
                                </td>
                            </tr>
                            <tr>
                                <td>Độ phân giải:</td>
                                <td>1242 x 2688 pixels</td>
                            </tr>
                            <tr>
                                <td>Màn hình rộng:</td>
                                <td>6.5</td>
                            </tr>
                            <tr>
                                <td>Công nghệ cảm ứng:</td>
                                <td>Cảm ứng điện dung đa điểm</td>
                            </tr>
                            <tr>
                                <td colspan="2">Chụp hình &amp; Quay phim</td>
                            </tr>
                            <tr>
                                <td>Camera sau:</td>
                                <td>12 MP, f/1.8, 26mm (góc rộng), dual pixel PDAF, OIS<br/>
                                    12 MP, f/2.4, 52mm (chân dung), PDAF, OIS, 2x optical zoom<br/>
                                    Quay phim <a href="/cdn-cgi/l/email-protection" class="__cf_email__"
                                                 data-cfemail="66522d265452">[email&#160;protected]</a>/30/60fps, <a
                                            href="/cdn-cgi/l/email-protection" class="__cf_email__"
                                            data-cfemail="497879717939097a79">[email&#160;protected]</a>/60/120/240fps
                                </td>
                            </tr>
                            <tr>
                                <td>Camera trước:</td>
                                <td>7 MP, f/2.2, 32mm (tiêu chuẩn)<br/>
                                    Quay phim <a href="/cdn-cgi/l/email-protection" class="__cf_email__"
                                                 data-cfemail="aa9b9a929adaea999a">[email&#160;protected]</a>/60fps,
                                    gyro-EIS
                                </td>
                            </tr>
                            <tr>
                                <td>Đèn Flash:</td>
                                <td>Có</td>
                            </tr>
                            <tr>
                                <td>Tính năng camera:</td>
                                <td>OIS, PDAF, 2x optical zoom, Quad-LED dual-tone flash, HDR
                                    (photo/panorama)
                                </td>
                            </tr>
                            <tr>
                                <td>Quay phim:</td>
                                <td><a href="/cdn-cgi/l/email-protection" class="__cf_email__"
                                       data-cfemail="162427202666562422">[email&#160;protected]</a>/30/60fps,
                                    <a href="/cdn-cgi/l/email-protection" class="__cf_email__"
                                       data-cfemail="7d4c4d454d0d3d4e4d">[email&#160;protected]</a>/60/120/240fps,
                                    HDR,
                                    stereo sound rec.
                                </td>
                            </tr>
                            <tr>
                                <td>Videocall:</td>
                                <td>Có</td>
                            </tr>
                            <tr>
                                <td colspan="2">CPU &amp; RAM</td>
                            </tr>
                            <tr>
                                <td>Tốc độ CPU:</td>
                                <td>Hexa-core (2x Vortex + 4x Tempest)</td>
                            </tr>
                            <tr>
                                <td>Số nhân:</td>
                                <td>6 nhân</td>
                            </tr>
                            <tr>
                                <td>Chipset:</td>
                                <td>Apple A12 Bionic (7 nm), 6 nhân<br/>
                                    (2x2.5 GHz Vortex + 4x1.6 GHz Tempest)<br/>
                                    GPU: Apple GPU, 4 nhân
                                </td>
                            </tr>
                            <tr>
                                <td>RAM:</td>
                                <td>4 GB</td>
                            </tr>
                            <tr>
                                <td>Chip đồ họa (GPU):</td>
                                <td>Apple GPU (4-core graphics)</td>
                            </tr>
                            <tr>
                                <td colspan="2">Bộ nhớ &amp; Lưu trữ</td>
                            </tr>
                            <tr>
                                <td>Danh bạ:</td>
                                <td>Không giới hạn</td>
                            </tr>
                            <tr>
                                <td>Bộ nhớ trong (ROM):</td>
                                <td>64-256-512 GB, NVMe<br/>
                                    Thẻ nhớ: không
                                </td>
                            </tr>
                            <tr>
                                <td>Thẻ nhớ ngoài:</td>
                                <td>Không hỗ trợ</td>
                            </tr>
                            <tr>
                                <td>Hỗ trợ thẻ tối đa:</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td colspan="2">Thiết kế &amp; Trọng lượng</td>
                            </tr>
                            <tr>
                                <td>Kiểu dáng:</td>
                                <td>Thanh + Cảm ứng</td>
                            </tr>
                            <tr>
                                <td>Kích thước:</td>
                                <td>157.5 x 77.4 x 7.7 mm</td>
                            </tr>
                            <tr>
                                <td>Trọng lượng (g):</td>
                                <td>208</td>
                            </tr>
                            <tr>
                                <td colspan="2">Thông tin pin</td>
                            </tr>
                            <tr>
                                <td>Loại pin:</td>
                                <td>Li-Ion</td>
                            </tr>
                            <tr>
                                <td>Dung lượng pin:</td>
                                <td>Li-Ion 3174 mAh<br/>
                                    Sạc nhanh 15W, 50% trong 30 phút (quảng cáo)<br/>
                                    USB Power Delivery 2.0
                                </td>
                            </tr>
                            <tr>
                                <td>Pin có thể tháo rời:</td>
                                <td>Không</td>
                            </tr>
                            <tr>
                                <td colspan="2">Kết nối &amp; Cổng giao tiếp</td>
                            </tr>
                            <tr>
                                <td>3G:</td>
                                <td>có</td>
                            </tr>
                            <tr>
                                <td>4G:</td>
                                <td>Có</td>
                            </tr>
                            <tr>
                                <td>Loại Sim:</td>
                                <td>1 SIM - 2 SIM (tùy phiên bản thị trường), Dual SIM (Nano-SIM, dual
                                    stand-by)
                                    thị
                                    trường Trung Quốc
                                </td>
                            </tr>
                            <tr>
                                <td>Khe gắn Sim:</td>
                                <td>1 SIM - 2 SIM (tùy phiên bản thị trường), Dual SIM (Nano-SIM, dual
                                    stand-by)
                                    thị
                                    trường Trung Quốc
                                </td>
                            </tr>
                            <tr>
                                <td>Wifi:</td>
                                <td>Wi-Fi 802.11 a/b/g/n/ac, dual-band, hotspot</td>
                            </tr>
                            <tr>
                                <td>GPS:</td>
                                <td>Yes, with A-GPS, GLONASS, GALILEO, QZSS</td>
                            </tr>
                            <tr>
                                <td>Bluetooth:</td>
                                <td>5.0, A2DP, LE</td>
                            </tr>
                            <tr>
                                <td>GPRS/EDGE:</td>
                                <td>Có</td>
                            </tr>
                            <tr>
                                <td>Jack tai nghe:</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>NFC:</td>
                                <td>Có</td>
                            </tr>
                            <tr>
                                <td>Kết nối USB:</td>
                                <td>2.0, proprietary reversible connector</td>
                            </tr>
                            <tr>
                                <td>Kết nối khác:</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>Cổng sạc:</td>
                                <td>2.0, proprietary reversible connector</td>
                            </tr>
                            <tr>
                                <td colspan="2">Giải trí &amp; Ứng dụng</td>
                            </tr>
                            <tr>
                                <td>Xem phim:</td>
                                <td>MP4/H.265 player</td>
                            </tr>
                            <tr>
                                <td>Nghe nhạc:</td>
                                <td>MP3/WAV/AAX+/AIFF/Apple Lossless player</td>
                            </tr>
                            <tr>
                                <td>Cổng sạc:</td>
                                <td>2.0, proprietary reversible connector</td>
                            </tr>
                            <tr>
                                <td>Ghi âm:</td>
                                <td>Có</td>
                            </tr>
                            <tr>
                                <td>FM radio:</td>
                                <td>Không</td>
                            </tr>
                            <tr>
                                <td>Chức năng khác:</td>
                                <td>- Face ID, accelerometer, gyro, proximity, compass, barometer<br/>
                                    - Fast battery charging: 50% in 30 min<br/>
                                    - Qi wireless charging<br/>
                                    - Siri natural language commands and dictation<br/>
                                    - iCloud cloud service<br/>
                                    - Audio/video/photo editor<br/>
                                    - Document editor
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="product-video-box">
                <div class="product-video-title">Video đánh giá &amp; review ${detail.tenSP}
                </div>
            </div>
        </div>
    </div>

    <div class="grid wide">
        <div class="product-content-box fix-content-right">
            <div class="product-content-left">
                <div class="product-detail product-subdetail">
                    <h2 class="product-content-title">
                        <img src="assets/img/logo3.png" alt="">
                        Đánh giá nhanh ${detail.tenSP}
                    </h2>
                    <div class="product-detail-content css-content">
                        <p style="text-align: justify;"><strong>iPhone XS Max cũ</strong> chính hãng, giá rẻ
                            nhất Hà
                            Nội, Đà
                            Nẵng, TP HCM. Mua iPhone XS Max cũ xách tay trả góp lãi suất thấp. Bán iPhone XS Max
                            cũ
                            xách tay
                            BH 12 tháng chính hãng.</p>
                        <h2 id="mcetoc_1d6apkjha0" style="text-align: justify;">iPhone XS Max cũ - Sự hoàn hảo
                            trên
                            một
                            chiếc smartphone</h2>
                        <p style="text-align: justify;">Bộ ba siêu phẩm iPhone chính thức ra mắt người dùng vào
                            ngày
                            13/9
                            vừa qua. Với hàng loạt công nghệ tiên tiến cùng những nâng cấp về phần cứng, <a
                                    href="../../../apple/iphone-xs-max-cu.html" target="_blank"
                                    rel="noopener noreferrer"><strong>iPhone XS Max cũ</strong></a> xứng đáng là
                            chiếc
                            smartphone cao cấp nhất trên thị trường hiện nay. Hãy cùng MobileCity đánh giá chi
                            tiết
                            chiếc
                            smartphone này nhé!</p>
                        <p style="text-align: justify;">
                            <iframe src="https://www.youtube.com/embed/axvnuPnzLHw"
                                    width="100%" height="350" frameborder="0"
                                    allowfullscreen="allowfullscreen"></iframe>
                        </p>
                        <h3 id="mcetoc_1d6apkjha1" style="text-align: justify;">iPhone XS Max cũ sở hữu thiết kế
                            thời thượng
                            cùng màn hình cực lớn</h3>
                        <p style="text-align: justify;">iPhone XS Max cũ là chiếc smartphone được trang bị màn
                            hình
                            lớn nhất
                            từ trước tới giờ của Apple. Dù sở hữu màn hình tràn viền 6.5 inch nhưng kích thước
                            tổng
                            của
                            chiếc iPhone XS Max cũ chỉ tương đương iPhone 8 nhờ tỷ lệ màn hình 19.5:9. Bên cạnh
                            đó,
                            iPhone
                            XS Max cũ sở hữu tấm nền Super Retina OLED cùng những công nghệ hiển thị hình ảnh
                            HDR10,
                            Dolby
                            Vision giúp hình ảnh hiển thị một cách sống động, chân thực hơn bao giờ hết.</p>
                        <table class="sudo-content-img">
                            <tbody>
                            <tr class="sudo-content-img-item">
                                <td><img class="lazy" title="iPhone XS Max cũ"
                                         src="https://mobilecity.vn/public/assets/img/load_video.svg"
                                         data-original="https://cdn.mobilecity.vn/mobilecity-vn/images/2018/10/iPhone-XS-Max-cu-1.jpg"
                                         alt="iPhone XS Max cũ" data-id="19681"/></td>
                            </tr>
                            </tbody>
                        </table>
                        <p style="text-align: justify;">Về thiết kế, iPhone XS Max cũ vẫn giữ nguyên thiết kế so
                            với
                            iPhone
                            X với màn hình tai thỏ, mặt kính và khung thép không gỉ. Ngoài ra, Apple đã chăm
                            chút
                            từng đường
                            nét, góc cạnh của chiếc smartphone này để biến nó trở thành biểu tượng của sự hoàn
                            hảo
                            trong
                            thiết kế.</p>
                        <h3 id="mcetoc_1d6apkjha2" style="text-align: justify;">iPhone XS Max cũ có hiệu năng
                            cực
                            "khủng"
                        </h3>
                        <p style="text-align: justify;">Cả ba chiếc smartphone của Apple đều được trang bị
                            chipset
                            A12
                            Bionic mới nhất từ Apple. Đây là bộ vi xử lý đầu tiên được xây dựng trên tiến trình
                            7nm
                            và được
                            đánh giá là con chip mạnh mẽ nhất từ trước tới giờ. Cụ thể, chúng tôi đã sử dụng
                            công cụ
                            Geekbench 4 để kiểm tra hiệu năng của máy. Theo đó, iPhone XS Max cũ đạt 11.515
                            điểm, bỏ
                            xa tất
                            cả các đối thủ khác.</p>
                        <table class="sudo-content-img">
                            <tbody>
                            <tr class="sudo-content-img-item">
                                <td><img class="lazy" title="iPhone XS Max cũ"
                                         src="https://mobilecity.vn/public/assets/img/load_video.svg"
                                         data-original="https://cdn.mobilecity.vn/mobilecity-vn/images/2018/10/iphone-xs-max-cu-2.jpg"
                                         alt="iPhone XS Max cũ" data-id="19682"/></td>
                            </tr>
                            </tbody>
                        </table>
                        <p style="text-align: justify;">Trên thực tế, khi trải nghiệm các tựa game khủng, game
                            3D,
                            máy đều
                            xử lý cực kỳ mượt mà. Điều này giúp mang lại những trải nghiệm vô cùng tuyệt vời cho
                            người dùng.
                        </p>
                        <h3 id="mcetoc_1d6apkjha3" style="text-align: justify;">Đánh giá Camera iPhone XS Max
                            cũ:
                            Điểm nâng
                            cấp đáng giá nhất</h3>
                        <p style="text-align: justify;">iPhone XS Max cũ được trang bị camera kép ở mặt sau. Cảm
                            biến chính
                            độ phân giải 12MP, khẩu độ f/1.8 cùng cảm biến tele 12MP khẩu độ f/2.4 có hỗ trợ OIS
                            cho
                            khả
                            năng chụp góc rộng cực tốt.</p>
                        <table class="sudo-content-img">
                            <tbody>
                            <tr class="sudo-content-img-item">
                                <td><img class="lazy" title="iPhone XS Max cũ"
                                         src="https://mobilecity.vn/public/assets/img/load_video.svg"
                                         data-original="https://cdn.mobilecity.vn/mobilecity-vn/images/2018/10/iphone-xs-max-cu-3.jpg"
                                         alt="iPhone XS Max cũ" data-id="19683"/></td>
                            </tr>
                            </tbody>
                        </table>
                        <p style="text-align: justify;">Con chip thần kinh thế hệ mới được trang bị trên chiếc
                            smartphone
                            này có khả năng thực hiện 1 ngàn tỷ phép toán mỗi giây. Nhờ đó, camera của máy nhận
                            biết
                            chủ thể
                            một cách rõ ràng, xóa phông tốt hơn và có thể chụp trong mọi điều kiện ánh sáng.</p>
                        <h3 id="mcetoc_1d6apkjha4" style="text-align: justify;">Thời lượng pin iPhone XS Max cũ
                            được
                            gia
                            tăng đáng kể</h3>
                        <p style="text-align: justify;">Với việc trang bị cho chiếc smartphone của mình viên pin
                            3.174 mAh,
                            Apple đã giải quyết được điểm yếu về pin trên một chiếc iPhone. Đây cũng là viên pin
                            có
                            dung
                            lượng lớn nhất được Apple trang bị cho một chiếc <a
                                    href="../../../dien-thoai-apple/" target="_blank"
                                    rel="noopener noreferrer"><strong>iPhone cũ</strong></a>. Nhờ đó,
                            người dùng
                            có thể thỏa sức lướt web, xem phim, sử dụng các tác vụ cơ bản trong suốt 1.5 ngày
                            liên
                            tục.</p>
                        <table class="sudo-content-img">
                            <tbody>
                            <tr class="sudo-content-img-item">
                                <td><img class="lazy" title="iPhone XS Max cũ"
                                         src="https://mobilecity.vn/public/assets/img/load_video.svg"
                                         data-original="https://cdn.mobilecity.vn/mobilecity-vn/images/2018/10/iphone-xs-max-cu-4.jpg"
                                         alt="iPhone XS Max cũ" data-id="19684"/></td>
                            </tr>
                            </tbody>
                        </table>
                        <h2 id="mcetoc_1d6apkjha5" style="text-align: justify;">Cảm nhận thực tế trên tay iPhone
                            XS
                            Max cũ
                        </h2>
                        <p style="text-align: justify;">Sau gần 1 tháng trải nghiệm chiếc điện thoại này, có thể
                            nói
                            đây
                            chính là chiếc smartphone hoàn hảo về mọi mặt từ thiết kế cho tới các phần cứng bên
                            trong. Máy
                            đem lại một trải nghiệm tuyệt vời, đặc biệt là khi chơi game và chụp ảnh. Nếu bạn
                            vẫn
                            băn khoăn
                            có nên mua iPhone XS Max cũ hay không, hãy đến cửa hàng gần nhất của Mobile City để
                            trải
                            nghiệm
                            sản phẩm nhé!</p>
                        <table class="sudo-content-img">
                            <tbody>
                            <tr class="sudo-content-img-item">
                                <td><img class="lazy" title="iPhone XS Max cũ"
                                         src="https://mobilecity.vn/public/assets/img/load_video.svg"
                                         data-original="https://cdn.mobilecity.vn/mobilecity-vn/images/2018/10/iphone-xs-max-cu-5.jpg"
                                         alt="iPhone XS Max cũ" data-id="19685"/></td>
                            </tr>
                            </tbody>
                        </table>
                        <h3 id="mcetoc_1d6apkjha6" style="text-align: justify;">Giá iPhone XS Max cũ bao nhiêu
                            hiện
                            nay?
                        </h3>
                        <p style="text-align: justify;">iPhone XS Max cũ có giá như thế nào đang là vấn đề mà
                            rất
                            nhiều
                            người dùng quan tâm. Hiện nay, Mobile City là chuỗi cửa hàng có mức giá iPhone XS
                            Max cũ
                            tốt
                            nhất trên thị trường. Không những thế, bạn còn nhận được rất nhiều ưu đãi cùng các
                            chương trình
                            bảo hành hấp dẫn của cửa hàng.</p>
                        <p style="text-align: center;"></p>
                        <p></p>
                        <p></p>
                    </div>
                    <div class="product-detail-show">
                        <button class="product-detail-view product-detail-viewall">
                            <i class="fa fa-long-arrow-down"></i> Xem thêm chi tiết bài viết
                        </button>
                        <button class="product-detail-view product-detail-viewdefault">
                            <i class="fa fa-long-arrow-up"></i> Ẩn bớt chi tiết bài viết
                        </button>
                    </div>
                </div>

            </div>
            <div class="product-content-right">
                <div class="product-summary">
                    <p class="product-summary-title">${detail.tenSP}</p>
                    <p class="product-summary-price">${detail.giaSP} ₫</p>
                    <div class="sale-box v2-promotion">
                        <p class="sale-box-title">Khuyến mãi</p>
                        <ol>
                            <li>
                                <p>Tặng: <span style="color: #ff0000;">Cường lực -</span> <span
                                        style="color: #ff0000;">Ốp
                                                lưng - Tai nghe</span> khi mua BHV</p>
                            </li>
                            <li>
                                <p>Giảm: <span style="color: #ff0000;">100K</span> áp dụng HSSV mua BHV tại
                                    <span style="color: #ff0000;">Thủ Đức</span>
                                </p>
                            </li>
                            <li>
                                <p>Mua: Dán cường lực 5D chỉ <span style="color: #ff0000;">30K</span></p>
                            </li>
                            <li>
                                <p>Giảm 100K khi mua BHV và đặt hàng tại: <a title="#" href="#">Đây</a></p>
                            </li>
                            <li>
                                <p>Mua SHOPEE giá Rẻ: <a title="MobileTG Shopee" href="#" rel="nofollow"
                                                         target="_blank">CLICK</a></p>
                            </li>
                        </ol>
                    </div>
                    <a href="#">
                        <button class="button-add-cart" style="width: 100%">
                            <i class="fas fa-shopping-cart"></i>
                            THÊM VÀO GIỎ HÀNG
                        </button>
                    </a>
                    <a href="#">
                        <button class="button-buy" style="width: 100%">
                            MUA HÀNG NGAY
                        </button>
                    </a>
                    <div class="product-summary-address">
                        <span><strong>037.225.3243</strong> (HN)</span>
                        <span><strong>037.225.3243</strong> (HCM)</span>
                        <span><strong>037.225.3243</strong> (ĐN)</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%--    footer --%>
<%@include file="/footer.jsp" %>
<%--    footer --%>

<!-- Button -->
<a href="#" class="go-to-top">
    <i class="go-to-top__icon fas fa-chevron-circle-up"></i>
</a>
<script type="text/javascript" src="<c:url value= 'assets/trangitem/js/function.js'/>"></script>
<script type="text/javascript" src="<c:url value= 'assets/trangitem/js/owl.carousel.js'/>"></script>
<script type="text/javascript" src="<c:url value= 'assets/trangitem/js/lightslider.js'/>"></script>
<script type="text/javascript" src="<c:url value= 'assets/trangitem/js/lightgallery-all.min.js'/>"></script>
<script type="text/javascript" src="<c:url value= 'assets/trangitem/js/function.js'/>"></script>
<script type="text/javascript" src="<c:url value= 'assets/trangitem/js/phone.js'/>"></script>
<script src="https://www.google.com/recaptcha/api.js" async defer></script>

<script> var reCaptcha = 'eyJzcGFtX3RpbWVzIjoiMyIsInNwYW1fc2Vjb25kcyI6IjEwIn0=';</script>
</body>

</html>
