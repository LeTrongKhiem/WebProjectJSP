const unlock = (() => {
    const products = [
        {
            img: 'url(https://cdn.mobilecity.vn/mobilecity-vn/images/2020/02/w150/unlock-iphone-11.jpg)',
            name: 'Mở mạng, Unlock iPhone 11 Pro | Max',
            price: 'Liên hệ',
            link: '#',
        },
        {
            img: 'url(https://cdn.mobilecity.vn/mobilecity-vn/images/2020/02/w150/unlock-samsung-galaxy-s10.jpg)',
            name: 'Mở mạng, Unlock Samsung Galaxy S10e | S10 Plus | Lite',
            price: 'Liên hệ',
            link: '#',
        },
        {
            img: 'url(https://cdn.mobilecity.vn/mobilecity-vn/images/2020/02/w150/mo-khoa-cloud-iphone-x.jpg)',
            name: 'Bẻ / Mở khóa iCloud iPhone X, XS, XS Max, Xr',
            price: '68.000.000đ',
            link: '#',
        },
        {
            img: 'url(https://cdn.mobilecity.vn/mobilecity-vn/images/2020/02/w150/unlock-icloud-ipad-pro.jpg)',
            name: 'Bẻ / Mở khóa iCloud iPad Pro',
            price: 'Liên hệ',
            link: '#',
        },
    ];

    return {
        render() {
            const htmlUnlock = products.map((product) => {
                return `
                <div class="col l-2-4 l-3-m m-4 c-6">
                    <div class="container-product__item">
                        <div class="container-product__item-heading">
                            <a href=${product.link} class="container-product__item-link">
                                <div class="container-product__item-img" style="background-image: ${product.img};"></div>
                            </a>
                    
                            <div class="container-product-guarantee container-product-guarantee--fix-unlock">
                                <a href=${product.link} class="container-product__item-link">
                                    <ul class="container-product-guarantee__list">
                                        <li class="container-product-guarantee__item">Miễn phí cài đặt phần mềm</li>
                                        <li class="container-product-guarantee__item">Tặng tấm dán màn hình chống xước</li>
                                        <li class="container-product-guarantee__item">
                                            Tặng Gift Cards giảm giá sửa chữa
                                            <span class="text--highlight-red">50.000 đ</span> 
                                        </li>
                                    </ul>
                                </a>
                            </div>
                        </div>
                        <div class="container-product__item-wrap">
                            <div class="container-product__item-info">
                                <a href="#" class="container-product__item-name">
                                    ${product.name}
                                </a>
                            </div>
                            <div class="container-product__item-buy">
                                <span class="container-product__item-price">
                                    ${product.price}
                                </span>
                                <a href=${product.link} class="container-product__item-btn">MUA</a>
                            </div>
                        </div>
                    </div>
                </div>
                `;
            }, '').join('');

            document.querySelector('.unlock-products').innerHTML = htmlUnlock;
        },
        init() {
            this.render();
        }
    }
})();

unlock.init();