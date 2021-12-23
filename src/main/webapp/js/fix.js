const fix = (() => {
    const products = [
        {
            img: 'url(https://cdn.mobilecity.vn/mobilecity-vn/images/2019/07/w150/ava-thay-mat-kinh-iphone-7.jpg)',
            name: 'Thay mặt kính iPhone 7, 7 Plus (Tặng dán cường lực)',
            price: '200.000đ',
            link: '#',
        },
        {
            img: 'url(https://cdn.mobilecity.vn/mobilecity-vn/images/2021/01/w150/iphone-8-1.jpg)',
            name: 'Thay màn hình iPhone 8, 8 Plus (Tặng dán cường lực)',
            price: '200.000đ',
            link: '#',
        },
        {
            img: 'url(https://cdn.mobilecity.vn/mobilecity-vn/images/2018/02/w150/thay-man-hinh-iphone-se-2.jpg)',
            name: 'Thay màn hình iPhone SE, SE 2 (Tặng dán cường lực)',
            price: '600.000đ',
            link: '#',
        },
        {
            img: 'url(https://cdn.mobilecity.vn/mobilecity-vn/images/2021/01/w150/iphone-6s.jpg)',
            name: 'Thay màn hình, mặt kính cảm ứng iPhone 6, 6S, 6S Plus (Tặng dán cường lực)',
            price: '200.000đ',
            link: '#',
        },
        {
            img: 'url(https://cdn.mobilecity.vn/mobilecity-vn/images/2021/01/w150/iphone-x.jpg)',
            name: 'Thay màn hình iPhone X, XR, XS, XS Max',
            price: '1.350.000đ',
            link: '#',
        },
        {
            img: 'url(https://cdn.mobilecity.vn/mobilecity-vn/images/2021/03/w150/pin-energizer-iphone.jpg)',
            name: 'Thay pin Energizer iPhone 8, 8 Plus',
            price: '270.000đ',
            link: '#',
        },
        {
            img: 'url(https://cdn.mobilecity.vn/mobilecity-vn/images/2021/01/w150/iphone-6-2-1.jpg)',
            name: 'Thay pin Energizer iPhone 6, 6S, 6 Plus, 6S Plus',
            price: '220.000đ',
            link: '#',
        },
        {
            img: 'url(https://cdn.mobilecity.vn/mobilecity-vn/images/2018/11/w150/thay-pin-iphone-x.jpg)',
            name: 'Thay pin iPhone X, XR, XS Max',
            price: '400.000đ',
            link: '#',
        },
    ]

    return {
        render() {
            const htmlFix = products.map((product) => {
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

            document.querySelector('.fix-products').innerHTML = htmlFix;
        },
        init() {
            this.render();
        }
    }
})();

fix.init();

