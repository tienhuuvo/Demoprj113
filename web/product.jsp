<%-- 
    Document   : product
    Created on : Mar 5, 2024, 9:07:46 PM
    Author     : HungHa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./CSS/productcss.css" />

        <script src="https://cdn.tailwindcss.com"></script>
        <script
            src="https://kit.fontawesome.com/554d86bd57.js"
            crossorigin="anonymous"
        ></script>
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
            />
    </head>
    <body>
        <div class="header">
            <img src="https://store.bobapop.com.vn/resource/uploads/2016/09/banner-trong.jpg" alt="">
            <div class="header-bar">
                <div class="logo">
                    <a href=""><img src="https://store.bobapop.com.vn/common/images/logo-green.png" alt=""></a>
                </div>
                <ul class="list">
                    <li><a href="category?category_id=C7">NEW PRODUCT</a></li>           
                    <li><a href="">TEAS</a></li>
                    <li><a href="/Account/home">HOME</a></li>
                </ul>
                <div class="Teas-inner">
                    <i class="fa-solid fa-caret-up"></i>
                    <div class="logo-inner">
                        <img src="https://store.bobapop.com.vn/resource/uploads/2016/09/tea.png">
                    </div>
                    <div class="name-produce-inner">
                        <ul class="produce-inner" style="display: flex; gap: 20px;">
                            <c:forEach items="${listC}" var="o">
                                <li><a href="category?category_id=${o.category_id}">${o.name}</a></li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
                <div class="search" style="gap:10px;">
                    <i style="color: black;" class="fa fa-search"></i>
                    <a style="color: black" href=${empty sessionScope.account.full_name ? '/Account/login' : '#'}>${empty sessionScope.account.full_name ? "Đăng Nhập" : sessionScope.account.full_name }</a>
                    <i class="fa fa-shopping-bag fa-2x"></i>
                </div>
            </div>
        </div>
        <div class="content">
            <!--            <div class="banner w-full">
                            <img
                                src="https://store.bobapop.com.vn/resource/uploads/2016/09/banner-trong.jpg"
                                alt="banner"
                                class="w-full h-auto block"
                            />
                        </div>-->
            <!-- Product -->
            <div class="flex justify-center items-center m-10 h-[540px]">
                <div class="mr-8">
                    <img
                        src="${product.product_picture}"
                        alt="product-image"
                        class="w-[540px] object-cover rounded-md"
                        />
                </div>
                <div class="h-full">
                    <form
                        action=""
                        class="form_addcart flex flex-col h-full"
                        name="form_addcart"
                        id="form_addcart"
                        >
                        <!-- name -->
                        <h2 class="font-semibold text-[25px] mb-8">
                            ${product.product_name}
                        </h2>
                        <!-- price -->
                        <div class="mb-8">
                            <p class="text-lg">
                                <span class="text-red-600">${product.price}</span> VND
                            </p>
                        </div>
                        <!-- size -->
                        <div class="flex size mb-4">
                            <div class="flex-1">
                                <label class="font-semibold text-lg"
                                       >Size</label
                                >
                            </div>
                            <div>
                                <input
                                    type="radio"
                                    id="sizeM"
                                    name="sizename"
                                    value="m"
                                    data-price="49000"
                                    checked="checked"
                                    class="hidden size-input"
                                    />
                                <label class="size-label" for="sizeM">M</label>
                                <input
                                    type="radio"
                                    id="sizeL"
                                    name="sizename"
                                    value="l"
                                    data-price="55000"
                                    class="hidden size-input"
                                    />
                                <label class="size-label" for="sizeL">L</label>
                            </div>
                        </div>
                        <hr class="my-4" />
                        <!-- amount -->
                        <div class="flex my-4">
                            <label class="flex-1 text-lg font-semibold"
                                   >Số lượng</label
                            >
                            <div class="form-group">
                                <div class="input-group flex items-center">
                                    <div class="icon-amount icon-amount-add">
                                        <i class="fa fa-plus"></i>
                                    </div>
                                    <input
                                        type="text"
                                        class="form-control input-sm w-[40px] h-[30px] text-center bg-[#EEE] text-lg text-[#666]"
                                        style="text-align: center"
                                        name="quantity"
                                        id="quantity"
                                        value="1"
                                        readonly="true"
                                        />
                                    <div class="icon-amount icon-amount-minus">
                                        <i class="fa fa-minus"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr class="my-4" />
                        <!-- detail -->
                        <div class="radio flex my-4">
                            <div class="ice">
                                <p class="font-bold text-sm">ICE-%</p>
                                <div class="radio-ice flex gap-3">
                                    <div class="ice-select">
                                        <input
                                            type="radio"
                                            id="ice100"
                                            name="ice"
                                            value="100"
                                            checked="checked"
                                            class="ice100 hidden"
                                            />
                                        <label
                                            for="ice100"
                                            class="w-[22px] h-[35px] inline-block cursor-pointer"
                                            ></label>
                                        <span class="text-sm">100</span>
                                    </div>
                                    <div class="ice-select">
                                        <input
                                            type="radio"
                                            id="ice70"
                                            name="ice"
                                            value="70"
                                            class="ice70 hidden"
                                            />
                                        <label
                                            for="ice70"
                                            class="w-[22px] h-[35px] inline-block cursor-pointer"
                                            ></label>
                                        <span class="text-sm">70</span>
                                    </div>
                                    <div class="ice-select">
                                        <input
                                            type="radio"
                                            id="ice50"
                                            name="ice"
                                            value="50"
                                            class="ice50 hidden"
                                            />
                                        <label
                                            for="ice50"
                                            class="w-[22px] h-[35px] inline-block cursor-pointer"
                                            ></label>
                                        <span class="text-sm">50</span>
                                    </div>
                                    <div class="ice-select">
                                        <input
                                            type="radio"
                                            id="ice30"
                                            name="ice"
                                            value="30"
                                            class="ice30 hidden"
                                            />
                                        <label
                                            for="ice30"
                                            class="w-[22px] h-[35px] inline-block cursor-pointer"
                                            ></label>
                                        <span class="text-sm">30</span>
                                    </div>
                                    <div class="ice-select">
                                        <input
                                            type="radio"
                                            id="ice10"
                                            name="ice"
                                            value="10"
                                            class="ice10 hidden"
                                            />
                                        <label
                                            for="ice10"
                                            class="w-[22px] h-[35px] inline-block cursor-pointer"
                                            ></label>
                                        <span class="text-sm">10</span>
                                    </div>
                                </div>
                            </div>
                            <div class="sugar">
                                <p class="font-bold text-sm">SUGAR-%</p>
                                <div class="radio-sugar flex gap-3">
                                    <div class="ice-select">
                                        <input
                                            type="radio"
                                            id="sg100"
                                            name="sg"
                                            value="100"
                                            checked="checked"
                                            class="sg100 hidden"
                                            />
                                        <label
                                            for="sg100"
                                            class="w-[22px] h-[35px] inline-block cursor-pointer"
                                            ></label>
                                        <span class="text-sm">100</span>
                                    </div>
                                    <div class="ice-select">
                                        <input
                                            type="radio"
                                            id="sg70"
                                            name="sg"
                                            value="70"
                                            class="sg70 hidden"
                                            />
                                        <label
                                            for="sg70"
                                            class="w-[22px] h-[35px] inline-block cursor-pointer"
                                            ></label>
                                        <span class="text-sm">70</span>
                                    </div>
                                    <div class="ice-select">
                                        <input
                                            type="radio"
                                            id="sg50"
                                            name="sg"
                                            value="50"
                                            class="sg50 hidden"
                                            />
                                        <label
                                            for="sg50"
                                            class="w-[22px] h-[35px] inline-block cursor-pointer"
                                            ></label>
                                        <span class="text-sm">50</span>
                                    </div>
                                    <div class="ice-select">
                                        <input
                                            type="radio"
                                            id="sg30"
                                            name="sg"
                                            value="30"
                                            class="sg30 hidden"
                                            />
                                        <label
                                            for="sg30"
                                            class="w-[22px] h-[35px] inline-block cursor-pointer"
                                            ></label>
                                        <span class="text-sm">30</span>
                                    </div>
                                    <div class="ice-select">
                                        <input
                                            type="radio"
                                            id="sg10"
                                            name="sg"
                                            value="10"
                                            class="sg10 hidden"
                                            />
                                        <label
                                            for="sg10"
                                            class="w-[22px] h-[35px] inline-block cursor-pointer"
                                            ></label>
                                        <span class="text-sm">10</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr class="my-4 flex-1" />
                        <!-- order button -->
                        <div class="">
                            <button
                                type="submit"
                                class="select-btn bg-black text-white px-6 py-3 rounded-md text-lg"
                                >
                                CHỌN
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="cart">
            <div class="cart-header">
                <h2 class="text-xl">MY BAG</h2>
                <div class="cart-icon">
                    <i class="fa-solid fa-xmark text-xl"></i>
                </div>
            </div>
            <div class="cart-items flex-1"></div>
            <div class="cart-menu-info">
                <hr class="my-4" />
                <span class="text-xs block mb-2">Ghi chú</span>
                <form
                    action="https://store.bobapop.com.vn/gio-hang.html"
                    method="post"
                    name="form_message"
                    id="form_message"
                    >
                    <textarea
                        rows="3"
                        class="notecard text-sm"
                        id="message"
                        name="message"
                        ></textarea>
                    <hr class="mt-4" />
                    <div class="total-info flex items-center mt-1">
                        <!--<span>PHÍ SHIP<small>20,000 VND</small></span>-->
                        <p class="text-xs">TỔNG CỘNG</p>
                        <span class="total_price text-xs flex-1 text-end"
                              >0 VND</span
                        >
                    </div>
                    <input
                        type="submit"
                        class="btn btn-success btn-block mb-4 mt-6 cursor-pointer"
                        value="ĐẶT HÀNG"
                        />
                </form>
            </div>
        </div>
        <div class="footer">
            <div class="footer_Left">
                <h2>Customer Service: 028.3834.1690</h2>
                <hr>
                <div class="footer_content">
                    <div class="footer_link">
                        <ul>
                            <li>Quick Link</li>
                            <li><a href="#">Bobapop.com.vn</a></li>
                            <li><a href="#">Our Store</a></li>
                            <li><a href="#">Sign up</a></li>
                        </ul>
                    </div>
                    <div class="footer_support">
                        <ul>
                            <li>Support</li>
                            <li><a href="#">Contact us</a></li>
                            <li><a href="#">My account</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="footer_Right">
                <h2>Join us for special things</h2>
                <hr>
                <div class="footer_link_icon">
                    <div>
                        <a href="#" class="logo_footer">
                            <img src="https://store.bobapop.com.vn/common/images/logo.png" alt="">
                        </a>
                    </div>
                    <div class="link_icon">
                        <a href="#"><img src="https://store.bobapop.com.vn/common/images/fa.png" alt=""></a>
                        <a href="#"><img src="https://store.bobapop.com.vn/common/images/ins.png" alt=""></a>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://kit.fontawesome.com/554d86bd57.js" crossorigin="anonymous"></script>
        <script>
            // Lấy phần TEAS và TEAS-inner từ DOM
            const teasMenu = document.querySelector('.list li:nth-child(2) a');
            const teasInner = document.querySelector('.Teas-inner');

            // Thêm sự kiện click vào menu TEAS
            teasMenu.addEventListener('click', function (event) {
                // Ngăn chặn hành động mặc định của thẻ <a>
                event.preventDefault();

                // Kiểm tra xem TEAS-inner đã hiển thị hay chưa
                const isActive = teasInner.classList.contains('show');

                // Nếu đã hiển thị, ẩn đi; nếu chưa, hiển thị lên
                if (isActive) {
                    teasInner.classList.remove('show');
                } else {
                    teasInner.classList.add('show');
                }
            });
        </script>
    </body>
    <script>
        document
                .querySelector(".icon-amount-add")
                .addEventListener("click", function () {
                    var input = document.getElementById("quantity");
                    var currentValue = Number(input.value);
                    input.value = currentValue + 1;
                });
        document
                .querySelector(".icon-amount-minus")
                .addEventListener("click", function () {
                    var input = document.getElementById("quantity");
                    var currentValue = Number(input.value);
                    input.value =
                            currentValue === 1 ? currentValue : currentValue - 1;
                });
        document
                .querySelector(".select-btn")
                .addEventListener("click", function (e) {
                    e.preventDefault();
                    document.querySelector(".cart").classList.add("cart-active");
                    document.querySelector(".content").classList.add("filter-blur");
                });
        document
                .querySelector(".cart-icon")
                .addEventListener("click", function (e) {
                    e.preventDefault();
                    document.querySelector(".cart").classList.remove("cart-active");
                    document
                            .querySelector(".content")
                            .classList.remove("filter-blur");
                });
    </script>
    
    <script>
    // Function to handle click on the cart icon
    document.querySelector(".cart-icon").addEventListener("click", function (e) {
        e.preventDefault();

        // Toggle the cart-active class on the cart element
        document.querySelector(".cart").classList.toggle("cart-active");

        // Toggle the filter-blur class on the content element
        document.querySelector(".content").classList.toggle("filter-blur");
    });

    // Function to handle click on the select button
    document.querySelector(".select-btn").addEventListener("click", function (e) {
        e.preventDefault();

        // Check if the current time is within the allowed time limit
        var currentTime = new Date().getTime();
        var endTime = localStorage.getItem('endTime');

        if (endTime && currentTime <= parseInt(endTime)) {
            // If within the time limit, show the cart
            document.querySelector(".cart").classList.add("cart-active");
            document.querySelector(".content").classList.add("filter-blur");
        } else {
            // If outside the time limit, show an alert
            alert("Quá thời gian quy định, không thể đặt hàng.");
        }
    });
</script>


</html>
