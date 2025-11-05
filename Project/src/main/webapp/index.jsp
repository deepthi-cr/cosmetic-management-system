<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GlamourCosmetics - Management System</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;600;700&family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #d4a5c0;
            --secondary: #f8e1e7;
            --dark: #3a2e39;
            --light: #f9f5f6;
            --accent: #c06c84;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: var(--light);
            color: var(--dark);
        }

        h1, h2, h3, h4, h5 {
            font-family: 'Playfair Display', serif;
            color: var(--dark);
        }

        .navbar {
            background-color: white;
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
            padding: 15px 0;
        }

        .navbar-brand {
            font-family: 'Playfair Display', serif;
            font-weight: 700;
            font-size: 1.8rem;
            color: var(--accent) !important;
        }

        .nav-link {
            font-weight: 500;
            color: var(--dark) !important;
            margin: 0 10px;
            transition: all 0.3s;
        }

        .nav-link:hover {
            color: var(--accent) !important;
        }

        .hero-section {
            background: linear-gradient(rgba(58, 46, 57, 0.7), rgba(58, 46, 57, 0.7)),
                        url('https://images.unsplash.com/photo-1522335789203-aabd1fc54bc9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1187&q=80');
            background-size: cover;
            background-position: center;
            color: white;
            padding: 120px 0;
            text-align: center;
        }

        .hero-section h1 {
            font-size: 3.5rem;
            margin-bottom: 20px;
            color: white;
        }

        .hero-section p {
            font-size: 1.2rem;
            max-width: 700px;
            margin: 0 auto 30px;
        }

        .section-title {
            text-align: center;
            margin-bottom: 50px;
            position: relative;
        }

        .section-title:after {
            content: '';
            position: absolute;
            width: 80px;
            height: 3px;
            background: var(--primary);
            bottom: -15px;
            left: 50%;
            transform: translateX(-50%);
        }

        .feature-card {
            background: white;
            border-radius: 10px;
            padding: 30px;
            text-align: center;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            transition: transform 0.3s, box-shadow 0.3s;
            height: 100%;
            border-top: 4px solid var(--primary);
        }

        .feature-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
        }

        .feature-icon {
            font-size: 2.5rem;
            color: var(--accent);
            margin-bottom: 20px;
        }

        .action-section {
            background-color: var(--secondary);
            padding: 80px 0;
        }

        .action-card {
            background: white;
            border-radius: 15px;
            padding: 40px 30px;
            text-align: center;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            transition: all 0.3s;
            height: 100%;
            border: 1px solid rgba(0, 0, 0, 0.05);
        }

        .action-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.12);
        }

        .action-icon {
            font-size: 3rem;
            color: var(--accent);
            margin-bottom: 20px;
        }

        .btn-custom {
            background-color: var(--accent);
            color: white;
            padding: 12px 30px;
            border-radius: 30px;
            font-weight: 500;
            border: none;
            transition: all 0.3s;
        }

        .btn-custom:hover {
            background-color: var(--dark);
            color: white;
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .stats-section {
            padding: 80px 0;
            background-color: white;
        }

        .stat-item {
            text-align: center;
            padding: 20px;
        }

        .stat-number {
            font-size: 3rem;
            font-weight: 700;
            color: var(--accent);
            margin-bottom: 10px;
        }

        footer {
            background-color: var(--dark);
            color: white;
            padding: 60px 0 20px;
        }

        .footer-heading {
            font-family: 'Playfair Display', serif;
            font-size: 1.5rem;
            margin-bottom: 20px;
            color: var(--primary);
        }

        .footer-links a {
            color: #ccc;
            text-decoration: none;
            display: block;
            margin-bottom: 10px;
            transition: color 0.3s;
        }

        .footer-links a:hover {
            color: var(--primary);
        }

        .social-icons a {
            display: inline-block;
            width: 40px;
            height: 40px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            text-align: center;
            line-height: 40px;
            margin-right: 10px;
            color: white;
            transition: all 0.3s;
        }

        .social-icons a:hover {
            background: var(--primary);
            transform: translateY(-5px);
        }

        .copyright {
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            padding-top: 20px;
            margin-top: 40px;
            text-align: center;
            color: #aaa;
            font-size: 0.9rem;
        }

        .product-showcase {
            padding: 80px 0;
        }

        .product-card {
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            transition: transform 0.3s;
            margin-bottom: 30px;
        }

        .product-card:hover {
            transform: translateY(-10px);
        }

        .product-img {
            height: 200px;
            background-size: cover;
            background-position: center;
        }

        .product-info {
            padding: 20px;
        }

        .product-category {
            color: var(--accent);
            font-size: 0.9rem;
            font-weight: 500;
            margin-bottom: 5px;
        }

        .newsletter {
            background: linear-gradient(to right, var(--primary), var(--accent));
            color: white;
            padding: 60px 0;
            text-align: center;
        }

        .newsletter h3 {
            color: white;
            margin-bottom: 20px;
        }

        .newsletter-form {
            max-width: 500px;
            margin: 0 auto;
        }

        /* Added styles for About and Contact sections */
        .about-section, .contact-section {
            padding: 80px 0;
        }

        .about-content {
            background: white;
            border-radius: 15px;
            padding: 40px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
        }

        .contact-form {
            background: white;
            border-radius: 15px;
            padding: 40px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
        }

        .form-control {
            border-radius: 10px;
            padding: 12px 15px;
            border: 1px solid #e0e0e0;
            margin-bottom: 20px;
        }

        .form-control:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 0.2rem rgba(212, 165, 192, 0.25);
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-light sticky-top">
        <div class="container">
            <a class="navbar-brand" href="#">
                <i class="fas fa-spa me-2"></i>GlamourCosmetics
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="home">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#features">Features</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#products">Products</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#about">About</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#contact">Contact</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="hero-section">
        <div class="container">
            <h1>Elevate Your Cosmetics Business</h1>
            <p>Streamline your inventory, sales, and customer management with our comprehensive cosmetics management system designed for beauty brands and retailers.</p>
            <a href="#actions" class="btn btn-custom btn-lg">Get Started</a>
        </div>
    </section>

    <!-- Features Section -->
    <section id="features" class="py-5">
        <div class="container">
            <h2 class="section-title">Why Choose Our System</h2>
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="feature-card">
                        <div class="feature-icon">
                            <i class="fas fa-boxes"></i>
                        </div>
                        <h4>Inventory Management</h4>
                        <p>Track your cosmetics inventory in real-time, set low stock alerts, and manage product variants with ease.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="feature-card">
                        <div class="feature-icon">
                            <i class="fas fa-chart-line"></i>
                        </div>
                        <h4>Sales Analytics</h4>
                        <p>Gain insights into your best-selling products, customer preferences, and sales trends with detailed reports.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="feature-card">
                        <div class="feature-icon">
                            <i class="fas fa-users"></i>
                        </div>
                        <h4>Customer Management</h4>
                        <p>Build lasting relationships with your customers through personalized service and loyalty programs.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Stats Section -->
    <section class="stats-section">
        <div class="container">
            <div class="row text-center">
                <div class="col-md-3 col-6">
                    <div class="stat-item">
                        <div class="stat-number">500+</div>
                        <p>Beauty Brands</p>
                    </div>
                </div>
                <div class="col-md-3 col-6">
                    <div class="stat-item">
                        <div class="stat-number">10K+</div>
                        <p>Products Managed</p>
                    </div>
                </div>
                <div class="col-md-3 col-6">
                    <div class="stat-item">
                        <div class="stat-number">98%</div>
                        <p>Customer Satisfaction</p>
                    </div>
                </div>
                <div class="col-md-3 col-6">
                    <div class="stat-item">
                        <div class="stat-number">24/7</div>
                        <p>Support Available</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- About Section -->
    <section id="about" class="about-section">
        <div class="container">
            <h2 class="section-title">About GlamourCosmetics</h2>
            <div class="row">
                <div class="col-lg-8 mx-auto">
                    <div class="about-content">
                        <p class="lead">GlamourCosmetics is a leading provider of cosmetics management solutions designed to help beauty brands and retailers streamline their operations and grow their business.</p>

                        <h4 class="mt-4 mb-3">Our Mission</h4>
                        <p>We aim to empower beauty businesses with intuitive, powerful tools that simplify inventory management, enhance customer relationships, and drive sales growth.</p>

                        <h4 class="mt-4 mb-3">Our Story</h4>
                        <p>Founded in 2018, GlamourCosmetics emerged from a need we identified in the beauty industry - the lack of specialized management systems tailored for cosmetics businesses. Our team of beauty enthusiasts and tech experts came together to create a solution that addresses the unique challenges of managing cosmetics inventory, tracking trends, and engaging customers.</p>

                        <h4 class="mt-4 mb-3">Why Choose Us</h4>
                        <ul>
                            <li>Industry-specific features designed for cosmetics businesses</li>
                            <li>User-friendly interface that requires minimal training</li>
                            <li>Scalable solutions that grow with your business</li>
                            <li>Dedicated support team with beauty industry expertise</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Action Section -->
    <section id="actions" class="action-section">
        <div class="container">
            <h2 class="section-title">Get Started Today</h2>
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="action-card">
                        <div class="action-icon">
                            <i class="fas fa-user-plus"></i>
                        </div>
                        <h3>Register</h3>
                        <p>Create a new account to access our cosmetics management platform and streamline your business operations.</p>
                        <a href="redirectToRegister" class="btn btn-custom mt-3">Register Now</a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="action-card">
                        <div class="action-icon">
                            <i class="fas fa-user-shield"></i>
                        </div>
                        <h3>Admin Login</h3>
                        <p>Access the administrator dashboard to manage users, products, and system settings.</p>
                        <a href="redirectToAdminLogin" class="btn btn-custom mt-3">Admin Login</a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="action-card">
                        <div class="action-icon">
                            <i class="fas fa-user"></i>
                        </div>
                        <h3>User Login</h3>
                        <p>Returning user? Sign in to your account to continue managing your cosmetics business.</p>
                        <a href="redirectToUserLogin" class="btn btn-custom mt-3">User Login</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Product Showcase -->
    <section id="products" class="product-showcase">
        <div class="container">
            <h2 class="section-title">Popular Categories</h2>
            <div class="row">
                <div class="col-md-3">
                    <div class="product-card">
                        <div class="product-img" style="background-image: url('https://images.unsplash.com/photo-1596462502278-27bfdc403348?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80');"></div>
                        <div class="product-info">
                            <p class="product-category">Skincare</p>
                            <h5>Face Serums & Creams</h5>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="product-card">
                        <div class="product-img" style="background-image: url('https://images.unsplash.com/photo-1526045478516-99145907023c?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80');"></div>
                        <div class="product-info">
                            <p class="product-category">Makeup</p>
                            <h5>Lipsticks & Lip Gloss</h5>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="product-card">
                        <div class="product-img" style="background-image: url('https://images.unsplash.com/photo-1556228578-8c89e6adf883?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80');"></div>
                        <div class="product-info">
                            <p class="product-category">Fragrance</p>
                            <h5>Perfumes & Body Mists</h5>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="product-card">
                        <div class="product-img" style="background-image: url('https://images.unsplash.com/photo-1571781926291-c477ebfd024b?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80');"></div>
                        <div class="product-info">
                            <p class="product-category">Hair Care</p>
                            <h5>Shampoos & Conditioners</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Contact Section -->
    <section id="contact" class="contact-section">
        <div class="container">
            <h2 class="section-title">Contact Us</h2>
            <div class="row">
                <div class="col-lg-8 mx-auto">
                    <div class="contact-form">
                        <p class="text-center mb-4">Have questions or need assistance? Reach out to our team and we'll get back to you as soon as possible.</p>

                        <form>
                            <div class="row">
                                <div class="col-md-6">
                                    <input type="text" class="form-control" placeholder="Your Name" required>
                                </div>
                                <div class="col-md-6">
                                    <input type="email" class="form-control" placeholder="Your Email" required>
                                </div>
                            </div>
                            <input type="text" class="form-control" placeholder="Subject">
                            <textarea class="form-control" rows="5" placeholder="Your Message" required></textarea>
                            <div class="text-center">
                                <button type="submit" class="btn btn-custom btn-lg">Send Message</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Newsletter -->
    <section class="newsletter">
        <div class="container">
            <h3>Stay Updated with Beauty Trends</h3>
            <p class="mb-4">Subscribe to our newsletter for the latest in cosmetics and beauty industry insights.</p>
            <div class="newsletter-form">
                <div class="input-group">
                    <input type="email" class="form-control" placeholder="Your email address">
                    <button class="btn btn-dark" type="button">Subscribe</button>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-4 mb-4">
                    <h4 class="footer-heading">GlamourCosmetics</h4>
                    <p>Your trusted partner in cosmetics management solutions. Streamline your business with our powerful tools.</p>
                    <div class="social-icons mt-4">
                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>
                <div class="col-md-2 mb-4">
                    <h5 class="footer-heading">Quick Links</h5>
                    <div class="footer-links">
                        <a href="#">Home</a>
                        <a href="#features">Features</a>
                        <a href="#products">Products</a>
                        <a href="#about">About Us</a>
                        <a href="#contact">Contact</a>
                    </div>
                </div>
                <div class="col-md-3 mb-4">
                    <h5 class="footer-heading">Services</h5>
                    <div class="footer-links">
                        <a href="#">Inventory Management</a>
                        <a href="#">Sales Analytics</a>
                        <a href="#">Customer Management</a>
                        <a href="#">Product Catalog</a>
                        <a href="#">Order Processing</a>
                    </div>
                </div>
                <div class="col-md-3 mb-4">
                    <h5 class="footer-heading">Contact Us</h5>
                    <div class="footer-links">
                        <p><i class="fas fa-map-marker-alt me-2"></i> 123 Beauty Street, Cosmetica</p>
                        <p><i class="fas fa-phone me-2"></i> +1 (555) 123-4567</p>
                        <p><i class="fas fa-envelope me-2"></i> info@glamourcosmetics.com</p>
                    </div>
                </div>
            </div>
            <div class="copyright">
                <p>&copy; 2025 GlamourCosmetics. All rights reserved.</p>
            </div>
        </div>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Custom JS -->
    <script>
        // Simple animation for stats counter
        document.addEventListener('DOMContentLoaded', function() {
            // Smooth scrolling for anchor links
            document.querySelectorAll('a[href^="#"]').forEach(anchor => {
                anchor.addEventListener('click', function (e) {
                    e.preventDefault();
                    document.querySelector(this.getAttribute('href')).scrollIntoView({
                        behavior: 'smooth'
                    });
                });
            });

            // Navbar background change on scroll
            window.addEventListener('scroll', function() {
                if (window.scrollY > 50) {
                    document.querySelector('.navbar').style.backgroundColor = 'rgba(255, 255, 255, 0.95)';
                } else {
                    document.querySelector('.navbar').style.backgroundColor = 'white';
                }
            });
        });
    </script>
</body>
</html>