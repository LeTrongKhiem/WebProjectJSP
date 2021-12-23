const tool = (() => {
    const products = [
        {
            img: 'url(https://cdn.mobilecity.vn/mobilecity-vn/images/2021/03/w80/tai-nghe-ap-pro-mobilecity.png)',
            name: 'Tai nghe Bluetooth TWS AP Pro Rp 1:1 (Sạc không dây, xuyên âm) ',
            price: '450.000 đ',
            link: '#',
        },
        {
            img: 'url(https://cdn.mobilecity.vn/mobilecity-vn/images/2019/06/w80/xiaomi-mi-band-4-3jpg.png)',
            name: 'Xiaomi Mi Band 4',
            price: '650.000 đ',
            link: '#',
        },
        {
            img: 'url(https://cdn.mobilecity.vn/mobilecity-vn/images/2019/05/w80/tai-nghe-a1523-airpods.jpg)',
            name: 'Tai nghe Bluetooth AP 2 Rep 1:1 (Có định vị, sạc không dây)',
            price: '299.000 đ',
            link: '#',
        },
        {
            img: 'url(https://cdn.mobilecity.vn/mobilecity-vn/images/2019/05/w80/tai-nghe-bluetooth-ti8s.JPG)',
            name: 'Tai nghe Bluetooth T-I8S',
            price: '390.000 đ',
            link: '#',
        },
        {
            img: 'url(https://cdn.mobilecity.vn/mobilecity-vn/images/2019/09/w80/0-02-06-dd50b3cb1079e6e4ffd01fb24abfd5b3c0dac46df4c88174326a2a4015bdd008-34ceb327.jpg)',
            name: 'Tai nghe Bluetooth i27',
            price: '400.000 đ',
            link: '#',
        },
        {
            img: 'url(https://cdn.mobilecity.vn/mobilecity-vn/images/2018/10/w80/tai-nghe-samsung-galaxy-s8-akg-didongviet.jpg)',
            name: 'Tai nghe Samsung AKG S8, S9, Plus (Chính hãng)',
            price: '149.000 đ',
            link: '#',
        },
        {
            img: 'url(https://cdn.mobilecity.vn/mobilecity-vn/images/2016/11/w80/Xiaomi-In-Ear-headphones-Basic-2016.jpg)',
            name: 'Tai nghe Xiaomi In-Ear Headphones Basic',
            price: '69.000 đ',
            link: '#',
        },
        {
            img: 'url(https://cdn.mobilecity.vn/mobilecity-vn/images/2019/04/w80/cu-sac-nhanh-samsung-12v.JPG)',
            name: 'Củ sạc nhanh Samsung',
            price: '250.000 đ',
            link: '#',
        },
    ]

    return {
        render() {
            const htmlTool = products.map((product) => {
                return `
                <div class="col l-2 m-3 c-6">
                    <div class="container-product__item">
                        <div class="container-product__item-heading item-heading--s-size">
                            <a href=${product.link} class="container-product__item-link">
                                <div class="container-product__item-img container-product__item-img--s-size" style="background-image: ${product.img}"></div>
                            </a>
                        </div>
                        <div class="container-product__item-wrap">
                            <div class="container-product__item-info">
                                <a href=${product.link} class="container-product__item-name">
                                    ${product.name} 
                                </a>
                                <!-- <i class="container-product__item-sale-icon fas fa-gift"></i> -->
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
                `
            }, '').join('');

            document.querySelector('.tool-products').innerHTML = htmlTool;
        },
        init() {
            this.render();
        }
    }
})();

tool.init();