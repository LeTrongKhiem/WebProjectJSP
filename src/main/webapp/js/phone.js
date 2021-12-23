const phones = (() => {
    const products = [
        {
            img: 'url(https://cdn.mobilecity.vn/mobilecity-vn/images/2021/07/w300/iphone-xs-max-den.jpg)',
            name: 'iPhone XS Max Cũ (64GB, 256GB) - Fullbox',
            price: '8.750.000 đ',
            markerList: ['hot', 'new'],
            linkProduct: './trangitem.jsp',
            linkGuarantee: '#',
        },
        {
            img: 'url(https://cdn.mobilecity.vn/mobilecity-vn/images/2021/03/w150/redmi-k40-full.jpg)',
            name: 'Xiaomi Redmi K40',
            price: '7.350.000 đ',
            markerList: [],
            linkProduct: '#',
            linkGuarantee: '#',
        },
        {
            img: 'url(https://cdn.mobilecity.vn/mobilecity-vn/images/2021/02/w150/asus-rog-phone-5-render-1-1200x675-800-resize.jpg)',
            name: 'Asus ROG Phone 5 (Snap888)',
            price: '14.650.000 đ',
            markerList: ['hot', 'new'],
            linkProduct: '#',
            linkGuarantee: '#',
        },
        {
            img: 'url(https://cdn.mobilecity.vn/mobilecity-vn/images/2021/02/w150/vivo-iqoo-7-white.jpg)',
            name: 'Vivo iQOO 7 (Snap 888)',
            price: '12.450.000 đ',
            markerList: [],
            linkProduct: '#',
            linkGuarantee: '#',
        },
        {
            img: 'url(https://cdn.mobilecity.vn/mobilecity-vn/images/2021/04/w150/asus-rog-phone-3.jpg)',
            name: 'Asus ROG Phone 3 Tencent',
            price: '11.950.000 đ',
            markerList: [],
            linkProduct: '#',
            linkGuarantee: '#',
        },
        {
            img: 'url(https://cdn.mobilecity.vn/mobilecity-vn/images/2019/09/w150/iphone-11-pro.jpg)',
            name: 'iPhone 11 Pro (64GB, 256GB)',
            price: '19.950.000 đ',
            markerList: [],
            linkProduct: '#',
            linkGuarantee: '#',
        },
        {
            img: 'url(https://cdn.mobilecity.vn/mobilecity-vn/images/2019/09/w150/iphone-11-3.jpg)',
            name: 'iPhone 11 (64GB, 256GB)',
            price: '11.450.000 đ',
            markerList: [],
            linkProduct: '#',
            linkGuarantee: '#',
        },
        {
            img: 'url(https://cdn.mobilecity.vn/mobilecity-vn/images/2019/09/w150/iphone-11-3.jpg)',
            name: 'iPhone 11 (64GB, 256GB)',
            price: '11.450.000 đ',
            markerList: [],
            linkProduct: '#',
            linkGuarantee: '#',
        },
        {
            img: 'url(https://cdn.mobilecity.vn/mobilecity-vn/images/2019/09/w150/iphone-11-3.jpg)',
            name: 'iPhone 11 (64GB, 256GB)',
            price: '11.450.000 đ',
            markerList: [],
            linkProduct: '#',
            linkGuarantee: '#',
        },
        {
            img: 'url(https://cdn.mobilecity.vn/mobilecity-vn/images/2019/09/w150/iphone-11-3.jpg)',
            name: 'iPhone 11 (64GB, 256GB)',
            price: '11.450.000 đ',
            markerList: [],
            linkProduct: '#',
            linkGuarantee: '#',
        },
        
    ];

    const banners = [
        {
            img: './assets/img/banner1.jpg',
            link: '#'
        },
        {
            img: './assets/img/banner2.jpg',
            link: '#'
        },
        {
            img: './assets/img/banner3.jpg',
            link: '#'
        },
    ]

    let currentBanner = 0;
    const prevBtn = document.querySelector('.phone-banner__btn-prev');
    const nextBtn = document.querySelector('.phone-banner__btn-next');
    let firstBanner;
    let bannerPaginationBtns;
    let setTimeChangeBanner;

    return {
        render() {
            const htmlPhone = products.map(product => {
                const markers = product.markerList.reduce((acc, curr) => {
                    return acc + `active-marker--${curr} `;
                }, '');
                return `
                <div class="col l-2-4 l-3-m m-4 c-6">
                    <div class="container-product__item">
                        <div class="container-product__item-heading">
                            <div class="container-product__item-img" style="background-image: ${product.img};"></div>
                    
                            <div class="container-product-guarantee">
                                <a href=${product.linkProduct} class="container-product__item-link">
                                    <div class="container-product-guarantee__heading">
                                        <img src="https://mobilecity.vn/public/assets/img/icon-mobilecity-care.png" alt="Guarantee" class="container-product-guarantee__heading-img">
                                        <h3 class="container-product-guarantee__heading-text">Mobile Care</h3>
                                    </div>

                                    <ul class="container-product-guarantee__list">
                                        <li class="container-product-guarantee__item">BH 12 tháng nguồn, màn hình</li>
                                        <li class="container-product-guarantee__item">Đổi mới 30 ngày đầu tiên</li>
                                        <li class="container-product-guarantee__item">Tặng ốp lưng, dán cường lực</li>
                                        <li class="container-product-guarantee__item">Hỗ trợ phần mềm trọn đời máy</li>
                                    </ul>
                                </a>
                                <a href=${product.linkGuarantee} class="container-product-guarantee__btn">Bảo hành vàng</a>
                            </div>
                        </div>
                        <div class="container-product__item-wrap">
                            <div class="container-product__item-info">
                                <a href="#" class="container-product__item-name">
                                    ${product.name}
                                </a>
                                <i class="container-product__item-sale-icon fas fa-gift"></i>
                            </div>
                            <div class="container-product__item-buy">
                                <span class="container-product__item-price">
                                    ${product.price}
                                </span>
                                <a href=${product.linkProduct} class="container-product__item-btn">MUA</a>
                            </div>
                        </div>
                        <ul class="container-product__item-gifts-list">
                            <li class="container-product__item-gift">
                                1. Tặng: 
                                <span class="container-product__item-gift--highlight">
                                    Cường lực - Ốp lưng - Tai nghe
                                </span>
                                khi mua BHV
                            </li>
                            <li class="container-product__item-gift">
                                2. Giảm: 
                                <span class="container-product__item-gift--highlight">
                                    100K
                                </span>
                                áp dụng HSSV mua BHV tại 
                                <span class="container-product__item-gift--highlight">
                                    Thủ Đức
                                </span>
                            </li>
                        </ul>
                        <ul class="container-product-marker__list ${markers}">
                            <li class="container-product-marker__item container-product-marker__item--new">Mới</li>
                            <li class="container-product-marker__item container-product-marker__item--hot">Hot</li>
                        </ul>
                    </div>
                </div>
                `;
            }).join('');

            document.querySelector('.phone-products').innerHTML = htmlPhone;

            const percent = 100 / banners.length;
            const bannerPaginations = [];
            const htmlBanner = banners.map((banner, index) => {
                let first = '';
                if (index === 0) {
                    first = 'banner--first';
                    bannerPaginations.push(`<div data-set="${percent*index}%" class="phone-banner-pagination__item active"></div>`);
                } else {
                    bannerPaginations.push(`<div data-set="-${percent*index}%" class="phone-banner-pagination__item"></div>`);
                }
                return `
                    <a href=${banner.link} class="banner__link ${first}" style="width: ${percent}%">
                        <img src=${banner.img} alt="Banner ${index + 1}" class="banner__img">
                    </a>
                `
            }, '').join('');

            document.querySelector('.phone-banner__list').innerHTML = htmlBanner;
            document.querySelector('.phone-banner__list').style.width = `${banners.length * 100}%`;
            document.querySelector('.phone-banner-pagination').innerHTML = bannerPaginations.join('');
        },
        handleBanner() {
            const _this = this;
            firstBanner = document.querySelector('.banner--first');
            bannerPaginationBtns = document.querySelectorAll('.phone-banner-pagination__item');

            prevBtn.onclick = () => {
                this.prevBanner();
                this.autoChangeBanner(true);
            }

            nextBtn.onclick = () => {
                this.nextBanner();
                this.autoChangeBanner(true);
            }

            bannerPaginationBtns.forEach(function(btn, index) {
                btn.onclick = () => {
                    currentBanner = index;
                    firstBanner.style.marginLeft = bannerPaginationBtns[currentBanner].dataset.set;
                    document.querySelector('.phone-banner-pagination__item.active').classList.remove('active');
                    bannerPaginationBtns[currentBanner].classList.add('active');
                    _this.autoChangeBanner(true);
                }
            });
        },
        prevBanner() {
            currentBanner -= 1;
            if (currentBanner < 0) {
                currentBanner = banners.length - 1;
            };
            firstBanner.style.marginLeft = bannerPaginationBtns[currentBanner].dataset.set;
            document.querySelector('.phone-banner-pagination__item.active').classList.remove('active');
            bannerPaginationBtns[currentBanner].classList.add('active');
        },
        nextBanner() {
            currentBanner += 1;
            if (currentBanner > banners.length - 1) {
                currentBanner = 0;
            };
            firstBanner.style.marginLeft = bannerPaginationBtns[currentBanner].dataset.set;
            document.querySelector('.phone-banner-pagination__item.active').classList.remove('active');
            bannerPaginationBtns[currentBanner].classList.add('active');
        },
        autoChangeBanner(isClick) {
            const _this = this;
            if (isClick) {
                clearInterval(setTimeChangeBanner);
                setTimeChangeBanner = setInterval(function() {
                    _this.nextBanner();
                }, 3000);
            } else {  
                setTimeChangeBanner = setInterval(function() {
                    _this.nextBanner();
                }, 3000);
            }
        },
        init() {
            this.render();
            this.handleBanner();
            this.autoChangeBanner();
        }
    }
})();

phones.init();