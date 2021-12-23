new mlPushMenu(
  document.getElementById("mp-menu-user"),
  document.getElementById("hiddenMenu-user"),
  { type: "cover" }
);
new mlPushMenu(
  document.getElementById("mp-menu"),
  document.getElementById("hiddenMenu"),
  { type: "cover" }
);
function isShowCaptchaRegisterProduct() {
  try {
    let setting = reCaptcha ?? false;
    if (!setting) return false;
    setting = JSON.parse(atob(setting));
    if (setting == null) return false;
    let n = Number(setting["spam_times"] ?? 2);
    let x = Number(setting["spam_seconds"] ?? 60);
    if (!n || !x) return false;
    let data = getCookie("registed_product_data");
    if (data != null) {
      let registered_product = JSON.parse(atob(decodeURIComponent(data)));
      let num_registed = 1;
      let len = registered_product.length;
      if (!len) return false;
      if (len == 1 && n == 1) return true;
      for (i = 0; i < len - 1; i++) {
        if (
          registered_product[i]["product_id"] ==
            registered_product[i + 1]["product_id"] &&
          registered_product[i]["product_type"] ===
            registered_product[i + 1]["product_type"]
        ) {
          num_registed++;
          if (num_registed >= n) return true;
        } else {
          num_registed = 1;
        }
      }
      num_registed = 1;
      for (i = 0; i < len - 1; i++) {
        let date_i = new Date(registered_product[i]["time"] * 1000);
        date_i.setSeconds(date_i.getSeconds() + x);
        let date_j = new Date(registered_product[i + 1]["time"] * 1000);
        if (date_j.getTime() <= date_i.getTime()) {
          num_registed++;
          if (num_registed >= n) return true;
        } else {
          num_registed = 1;
        }
      }
    }
  } catch (error) {
    console.error(error);
  }
  return false;
}
$(document).ready(function () {
  $("#mb-search-btn").on("click", function () {
    $("html, body").css({ overflow: "hidden", height: "100%" });
    $(".mb-search").css("display", "block");
  });
  $(".btn-close-mb-search").on("click", function () {
    $("html, body").css({ overflow: "auto", height: "auto" });
    $(".mb-search").css("display", "none");
  });
  var window_width = $(window).width();
  if (window_width >= 991) {
    $(".mp-menu").css("display", "none");
  }
  if (window_width <= 991) {
    $(".mp-menu").css("display", "block");
  }
  $(window).resize(function () {
    var w = $(window).width();
    if (w > 991) {
      $(".mp-menu").css("display", "none");
      $(".mb-search").hide();
    } else {
      $(".mp-menu").css("display", "block");
    }
    if (w < 768) {
    }
  });
  $(".location-dropdown .location-dropdown-title").click(function () {
    $(".location-dropdown .location-dropdown-list").toggle();
  });
  $(".location_name").change(function () {
    var location_id = $(this).val();
    var l = document.createElement("a");
    l.href = window.location.href;
    var link = l.origin + l.pathname + "?setlocation=" + location_id;
    console.log(link);
    setCookie("location", location_id);
    window.location.href = link;
  });
  $(document).bind("click", function (e) {
    var $clicked = $(e.target);
    if (!$clicked.parents().hasClass("location-dropdown"))
      $(".location-dropdown .location-dropdown-list").hide();
  });
  $(".set_location").click(function (e) {
    e.preventDefault();
    var get = $(this).children(".value-select").html();
    var locate_name = $(this).children(".location_name").html();
    var link =
      window.location.origin +
      window.location.pathname +
      "?setlocation=" +
      get +
      window.location.hash;
    setCookie("location", get);
    setCookie("location_name", locate_name);
    window.location.href = link;
  });
  $(function () {
    $("img.lazy").lazyload({ effect: "fadeIn", failure_limit: 10 });
  });
  $("#show-comment-form").click(function () {
    $("#close-comment-form").show();
    $(".comment-form").slideToggle();
  });
  $("#close-comment-form").click(function () {
    $("#show-comment-form").show();
    $(".comment-form").slideUp();
  });
  $("#gototop").on("click", function () {
    $("html, body").animate({ scrollTop: 0 }, "slow");
  });
  if ($("#garelly-content").length > 0) {
    $("#garelly-content").lightGallery({ thumbnail: true });
  }
  $("body").on("click", "*[data-open]", function () {
    open_element = $(this).data("open");
    $(this)
      .closest("." + open_element)
      .find("*[data-open_box]")
      .css("height", "auto");
    $(this).parent().remove();
  });
  $("body").on("click", "*[data-scroll]", function (e) {
    e.preventDefault();
    id = $(this).attr("href");
    $("html, body").animate({ scrollTop: $(id).offset().top - 10 }, 500);
  });
  $("body").on("click", ".btn-add-cart", function () {
    let _this = $(this);
    let data = {
      product_type: $(this).attr("data-product_type"),
      product_id: $(this).attr("data-product_id"),
      service_product_id: $(this).attr("data-service_product_id") ?? 0,
      location_id: $(this).attr("data-location_id") ?? 0,
      buy_type: _this.hasClass("add-to-cart")
        ? 1
        : _this.hasClass("register")
        ? 3
        : 2,
    };
    if (_this.hasClass("register")) {
      if (
        $(".g-recaptcha").length &&
        isShowCaptchaRegisterProduct() &&
        !isCaptchaValid()
      ) {
        alertMessage("Bạn phải nhập đúng mã captcha!");
        return;
      }
      loadAjax("/cart/register-product", data, {
        beforeSend: function () {
          $("#loading_box")
            .css({ visibility: "visible", opacity: 0.0 })
            .animate({ opacity: 1.0 }, 200);
        },
        success: function (result) {
          $("#loading_box").animate({ opacity: 0.0 }, 200, function () {
            $("#loading_box").css("visibility", "hidden");
          });
          if (result.success) {
            location.href = "/nguoi-dung/lich-su-mua-hang";
          } else {
            if (typeof result.message === "undefined") location.href = "/login";
            else alertMessage(result.message);
          }
        },
        error: function (error) {
          if (error.status == 419) {
            location.href = "/login";
          } else {
            $("#loading_box").animate({ opacity: 0.0 }, 200, function () {
              $("#loading_box").css("visibility", "hidden");
            });
            alertMessage("Đã có lỗi xảy ra, vui lòng thử lại!");
          }
        },
      });
    } else {
      loadAjax("/cart/add", data, {
        beforeSend: function () {
          $("#loading_box")
            .css({ visibility: "visible", opacity: 0.0 })
            .animate({ opacity: 1.0 }, 200);
        },
        success: function (result) {
          if (typeof result.success === "undefined") {
            location.href = "/login";
            return;
          }
          if (result.success) {
            if (_this.hasClass("add-to-cart")) {
              $("#loading_box").animate({ opacity: 0.0 }, 200, function () {
                $("#loading_box").css("visibility", "hidden");
              });
              alertMessage(result.message);
              $(
                ".header-top #total-cart, .responsive-control-box #total-cart"
              ).text(result.sum_quantity_cart);
            } else {
              location.href = "/gio-hang";
            }
          } else {
            $("#loading_box").animate({ opacity: 0.0 }, 200, function () {
              $("#loading_box").css("visibility", "hidden");
            });
            alertMessage(result.message);
          }
        },
        error: function (error) {
          if (error.status == 419) {
            location.href = "/login";
          } else {
            $("#loading_box").animate({ opacity: 0.0 }, 200, function () {
              $("#loading_box").css("visibility", "hidden");
            });
            alertMessage("Đã có lỗi xảy ra, vui lòng thử lại!");
          }
        },
      });
    }
  });
  $("body").on("click", ".pre-order", function () {
    let _this = $(this);
    let data = {
      product_type: $(this).attr("data-product_type") ?? "phones",
      product_id: $(this).attr("data-product_id") ?? 0,
      variant_id: $(this).attr("data-variant_id") ?? 0,
      service_product_id:
        $(".product-content-box")
          .find(".warranty-item.active")
          .data("web_id") ?? 0,
      location_id: $("#location").val() ?? 1,
      link: window.location.href,
    };
    loadAjax("/cart/pre-order", data, {
      beforeSend: function () {
        $("#loading_box")
          .css({ visibility: "visible", opacity: 0.0 })
          .animate({ opacity: 1.0 }, 200);
      },
      success: function (result) {
        $("#loading_box").animate({ opacity: 0.0 }, 200, function () {
          $("#loading_box").css("visibility", "hidden");
        });
        if (result.success) {
          location.href =
            "/nguoi-dung/don-dat-hang/" + result.data + "?pre-order=1";
        } else {
          if (typeof result.message === "undefined") location.href = "/login";
          else alertMessage(result.message);
        }
      },
      error: function (error) {
        if (error.status == 419) {
          location.href = "/login";
        } else {
          $("#loading_box").animate({ opacity: 0.0 }, 200, function () {
            $("#loading_box").css("visibility", "hidden");
          });
          alertMessage("Đã có lỗi xảy ra, vui lòng thử lại!");
        }
      },
    });
  });
  $("body").on("click", ".quantity .update", function () {
    var inputNumber = $(this).parent().find("input[name=quantity]");
    var max = inputNumber.attr("max");
    var quantity = parseInt(inputNumber.val());
    var _qty = 1;
    if ($(this).hasClass("plus")) {
      if (max < quantity + 1) {
        alert("Sản phẩm không đủ số lượng!");
        return;
      }
    } else {
      if (quantity <= 1) {
        alert("Số lượng sản phẩm phải lớn hơn 0!");
        return;
      }
      _qty = -1;
    }
    inputNumber.val(quantity + _qty);
    var data = {
      product_type: inputNumber.attr("data-product_type"),
      product_id: inputNumber.attr("data-product_id"),
      depency_product_id: inputNumber.attr("data-depency_product_id"),
      location_id: inputNumber.attr("data-location_id"),
      quantity: _qty,
    };
    loadAjax("/cart/add", data, {
      beforeSend: function () {
        $("#loading_box")
          .css({ visibility: "visible", opacity: 0.0 })
          .animate({ opacity: 1.0 }, 200);
      },
      success: function (result) {
        $("#loading_box").animate({ opacity: 0.0 }, 200, function () {
          $("#loading_box").css("visibility", "hidden");
        });
        if (result.success) location.reload();
        else alertMessage(result.message);
      },
      error: function (error) {
        if (error.status == 419) {
          location.href = "/login";
        } else {
          $("#loading_box").animate({ opacity: 0.0 }, 200, function () {
            $("#loading_box").css("visibility", "hidden");
          });
          alertMessage("Đã có lỗi xảy ra, vui lòng thử lại!");
        }
      },
    });
  });
  $("body").on("click", ".cart.delete", function () {
    var _this = $(this);
    var id = _this.data("id");
    loadAjaxGet("/cart/delete/" + id, {
      beforeSend: function () {
        $("#loading_box")
          .css({ visibility: "visible", opacity: 0.0 })
          .animate({ opacity: 1.0 }, 200);
      },
      success: function (result) {
        $("#loading_box").animate({ opacity: 0.0 }, 200, function () {
          $("#loading_box").css("visibility", "hidden");
        });
        if (result.success) {
          location.reload();
        } else alertMessage(result.message);
      },
      error: function (error) {
        if (error.status == 419) {
          location.href = "/login";
        } else {
          $("#loading_box").animate({ opacity: 0.0 }, 200, function () {
            $("#loading_box").css("visibility", "hidden");
          });
          alertMessage("Đã có lỗi xảy ra, vui lòng thử lại!");
        }
      },
    });
  });
  $("body").on("click", ".apply-delivery-address", function () {
    var _this = $(this);
    var address_id = $("input[name=delivery_address_id]:checked").val();
    loadAjax(
      "/nguoi-dung/cap-nhat-dia-chi-giao-hang",
      { address_id: address_id },
      {
        beforeSend: function () {
          $("#loading_box")
            .css({ visibility: "visible", opacity: 0.0 })
            .animate({ opacity: 1.0 }, 200);
        },
        success: function (result) {
          if (result.success) {
            $(".delivery-address .main").html(`
	        			<p>${result.data.name} (${result.data.phone})</p>
						<p>Đ/c: ${result.data.show_address ?? ""}</p>
	        		`);
            $("#loading_box").animate({ opacity: 0.0 }, 200, function () {
              $("#loading_box").css("visibility", "hidden");
            });
          } else {
            $("#loading_box").animate({ opacity: 0.0 }, 200, function () {
              $("#loading_box").css("visibility", "hidden");
            });
            alertMessage(result.message);
          }
        },
        error: function (error) {
          if (error.status == 419) {
            location.href = "/login";
          } else {
            $("#loading_box").animate({ opacity: 0.0 }, 200, function () {
              $("#loading_box").css("visibility", "hidden");
            });
            alertMessage("Đã có lỗi xảy ra, vui lòng thử lại!");
          }
        },
      }
    );
    $(".v2-popup-address").css("visibility", "hidden");
    $(".v2-popup-address").bPopup().close();
  });
});
jQuery(window).scroll(function () {
  var loadHeight = jQuery(document).scrollTop();
  if (loadHeight > 100) {
    $("#gototop").css("opacity", 1);
  } else {
    $("#gototop").css("opacity", 0);
  }
});
function alertMessage(message) {
  $(".alert_message").empty().append(message).show();
  setInterval(function () {
    $(".alert_message").fadeOut(1000);
  }, 5000);
}
function formatDate(date) {
  let d = new Date(date);
  function addZero(n) {
    return n < 10 ? "0" + n : n;
  }
  return `${addZero(d.getHours())}:${addZero(d.getMinutes())}:${addZero(
    d.getSeconds()
  )} ${addZero(d.getDate())}/${addZero(d.getMonth() + 1)}/${d.getFullYear()}`;
}
var isCaptchaValid = function () {
  var rcres = grecaptcha.getResponse();
  return rcres.length > 0;
};
function update_link_chat() {
  let link = $(".mobilecity-messenger").attr("href") ?? "javascript:;";
  $(".buy-box-v2 .chat").attr("href", link);
  $(".buy-box-v2 .chat").show();
}
function copy_code(code) {
  console.log(code);
  var $temp = $("<input>");
  $("body").append($temp);
  $temp.val(code).select();
  document.execCommand("copy");
  $temp.remove();
  salert("Đã copy code!");
}
