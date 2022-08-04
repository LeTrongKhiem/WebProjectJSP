var CartJS = function () {
    this.initialize = function () {
        loadCart()
        EventListener()
    }
    function EventListenerBase(id, quantity) {
        $.ajax({
            type: "POST",
            url: '/updateQuantity',
            data: {
                id: id,
                quantity: quantity,
            },
            success: function (response) {
                const count = response.reduce((item, object) => {
                    return item + object.quanitty;
                }, 0);
                loadCart();//load lai cart update price
                $('#count-cart-quantity').text(count);
            },
            error: function (err) {
                console.log(err)
            },
        })
    }
    function EventListener() {
        $('body').on('click', '.btn_asc', function (e) {
            e.preventDefault();
            const id = $(this).data('id');
            const quantity = parseInt($('#txt_quantity_' + id).val()) + 1;
            EventListenerBase(id, quantity);
        });
        $('body').on('click', '.btn_desc', function (e) {
            e.preventDefault();
            const id = $(this).data('id');
            const quantity = parseInt($('#txt_quantity_' + id).val()) - 1;
            EventListenerBase(id, quantity);
        });
        $('body').on('click', '.btn_remove', function (e) {
            e.preventDefault();
            const id = $(this).data('id');
            EventListenerBase(id, 0);
        });
    }
    function loadCart() {
        $.ajax({
            type: "GET",
            url: '/WebProject/cart',
            success: function (response) {
                console.log(response);
                var html = '';
                var total = 0;
                var count = 0;
                var row = document.getElementById('cart-body');
                row.innerHTML += response;
                // $.each(response, function (e, item) {
                //     html += "<tr class=\"table-body\">"
                //     +"<td>"
                //     +"<figure><img src=\""+item.productsList.link_hinhanh+"\" style=\"width:160px\"/></figure>"
                //     +"</td>"
                //     +"<td>"
                //     +"<div class=\"cart-wrappper text-left th_description\">"
                //     +"<h6>${product.tenSP}</h6>"
                //     +"<p><span>Availability</span>: Available in Stock</p>"
                //     +"<p><span>Product Code</span>: CwT4a</p>"
                //     +"</div>"
                //     +"</td>"
                //     +"<td>&nbs\"p;</td>"
                //     +"<td>&nbs\"p;</td>"
                //     +"<td>"
                //     +"<form class=\"quantity-control\""
                //     +"action=\"<%=request.getContextPath()+\"/updateQuantity\"%>\" method=\"post\">"
                //     +"<span data-id=\"asc_${product.maSP}\" class=\"btn-cart btn-square btn-plus btn-qty btn-asc\"><i"
                //     +"class=\"fa fa-plus\"></i></span>"
                //     +"<input type=\"text\" disabled value=\"${product.quantitySold}\" data-min=\"0\""
                //     +"data-minalert=\"Số lượng không được nhỏ hơn 0\""
                //     +"data-invalid=\"Nhập số lượng hợp lệ\""
                //     +"name=\"quantity\" id=\"txt_quantity_${product.maSP}\">"
                //     + "<input value=\"${product.maSP}\" type=\"hidden\" name=\"id\" data-min=\"0\">"
                //     + "<span data-id=\"desc_${product.maSP}\" class=\"btn-cart btn-square btn-minus btn-qty btn-desc\"><i"
                //     + "class=\"fa fa-minus\"></i></span>"
                //     + "</form>"
                //     + "</td>"
                //     + "<td><span class=\"cart-price\">${product.dinhDang(product.giaSP)}</span></td>"
                //     + "<td>"
                //     + "<ul class=\"cart-action\">"
                //     + "<li><a href=\"remove?id=${product.maSP}\" class=\"btn-cart btn-delete btn-blue\"><i"
                //     + "class=\"fa fa-trash\"></i></a></li>"
                //     + "</ul>"
                //     + "</td>"
                //     + "</tr>"
                //     total += item.price * item.quantity
                //     count += item.quantity
                //     console.log(count);
                // });
                // $('#cart-body').html(html);
                // $('.total-cart').text(total.toLocaleString('it-IT', { style: 'currency', currency: 'VND' }));
                // $('.count-cart').text(count);
            },
        });
    }

}