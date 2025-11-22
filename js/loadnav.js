document.addEventListener("DOMContentLoaded", function () {
    const navbarHTML = `
    <!-- Computer nav -->
    <nav class="navbar" id="navbar">
        <div class="logo">Elettronica</div>
        <div class="nav-menu">
            <div class="nav-item"><a href="index.html" class="nav-link">Home</a></div>
            <div class="nav-item">
                <div class="dropdown-trigger">Products <span class="dropdown-arrow">▼</span></div>
                <div class="dropdown">
                    <a href="products.html">All Products</a>
                    <a href="product-laptop.html">Laptops</a>
                    <a href="product-phone.html">Smartphones</a>
                    <a href="product-earbuds.html">Earbuds</a>
                    <a href="product-charger.html">Chargers</a>
                    <a href="product-smartwatch.html">Smartwatches</a>
                </div>
            </div>
            <div class="nav-item"><a href="about.html" class="nav-link">About</a></div>
            <div class="nav-item"><a href="contact.html" class="nav-link">Contact</a></div>
            <div class="nav-item"><a href="feedback.html" class="nav-link">Feedback</a></div>
            <div class="nav-item">
                <div class="dropdown-trigger">Account <span class="dropdown-arrow">▼</span></div>
                <div class="dropdown">
                    <a href="login-customer.html">Customer Login</a>
                    <a href="login-staff.html">Staff Login</a>
                    <a href="register.html">Register</a>
                    <a href="register-success.html">Register Success</a>
                </div>
            </div>
        </div>
        <div class="hamburger" id="hamburger">
            <span></span><span></span><span></span>
        </div>
    </nav>

    <!-- Mobile nav -->
    <div class="sidebar" id="sidebar">
        <a href="index.html">Home</a>
        <div class="menu-title" data-target="products">Products</div>
        <div class="sub-menu" id="products">
            <a href="products.html">All Products</a>
            <a href="product-laptop.html">Laptops</a>
            <a href="product-phone.html">Smartphones</a>
            <a href="product-earbuds.html">Earbuds</a>
            <a href="product-charger.html">Chargers</a>
            <a href="product-smartwatch.html">Smartwatches</a>
        </div>
        <a href="about.html">About</a>
        <a href="contact.html">Contact</a>
        <a href="feedback.html">Feedback</a>
        <div class="menu-title" data-target="account">Account</div>
        <div class="sub-menu" id="account">
            <a href="login-customer.html">Customer Login</a>
            <a href="login-staff.html">Staff Login</a>
            <a href="register.html">Register</a>
            <a href="register-success.html">Register Success</a>
        </div>
    </div>
    <div class="overlay" id="overlay"></div>
    `;

    const loadPoint = document.getElementById("loadnavbar");
    if (loadPoint) {
        loadPoint.innerHTML = navbarHTML;

        const script = document.createElement("script");
        script.src = "../js/nav.js";
        script.defer = true;
        document.body.appendChild(script);
    }
});