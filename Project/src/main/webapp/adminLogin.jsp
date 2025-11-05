<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login - GlamourCosmetics</title>
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
            --admin: #8a4f7d;
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

        .admin-login-container {
            max-width: 900px;
            margin: 50px auto;
            background: white;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
        }

        .admin-login-left {
            background: linear-gradient(rgba(138, 79, 125, 0.9), rgba(106, 58, 95, 0.9)),
                        url('https://images.unsplash.com/photo-1556228578-8c89e6adf883?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80');
            background-size: cover;
            background-position: center;
            color: white;
            padding: 50px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .admin-login-left h2 {
            color: white;
            font-size: 2.2rem;
            margin-bottom: 20px;
        }

        .admin-login-left p {
            font-size: 1rem;
            opacity: 0.9;
        }

        .admin-login-right {
            padding: 40px;
            border-left: 1px solid #f0f0f0;
        }

        .admin-badge {
            background: var(--admin);
            color: white;
            padding: 5px 15px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 600;
            display: inline-block;
            margin-bottom: 10px;
        }

        .form-control {
            border: 1px solid #e6e6e6;
            border-radius: 10px;
            padding: 12px 15px;
            margin-bottom: 20px;
            transition: all 0.3s;
        }

        .form-control:focus {
            border-color: var(--admin);
            box-shadow: 0 0 0 0.25rem rgba(138, 79, 125, 0.25);
        }

        .form-label {
            font-weight: 500;
            margin-bottom: 8px;
            color: var(--dark);
        }

        .btn-admin-login {
            background-color: var(--admin);
            color: white;
            padding: 12px 30px;
            border-radius: 30px;
            font-weight: 500;
            border: none;
            width: 100%;
            transition: all 0.3s;
            margin-top: 10px;
        }

        .btn-admin-login:hover {
            background-color: var(--dark);
            color: white;
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .user-login-link {
            text-align: center;
            margin-top: 25px;
            color: var(--dark);
        }

        .user-login-link a {
            color: var(--admin);
            text-decoration: none;
            font-weight: 500;
        }

        .user-login-link a:hover {
            text-decoration: underline;
        }

        .input-icon {
            position: relative;
        }

        .input-icon i {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--admin);
        }

        .input-icon input {
            padding-left: 45px;
        }

        .admin-features-list {
            list-style: none;
            padding: 0;
            margin-top: 30px;
        }

        .admin-features-list li {
            margin-bottom: 15px;
            display: flex;
            align-items: flex-start;
        }

        .admin-features-list i {
            color: white;
            background: rgba(255, 255, 255, 0.2);
            width: 24px;
            height: 24px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 10px;
            flex-shrink: 0;
        }

        footer {
            background-color: var(--dark);
            color: white;
            padding: 40px 0 20px;
            margin-top: 50px;
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

        .password-toggle {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            color: #aaa;
        }

        .form-title {
            text-align: center;
            margin-bottom: 30px;
            color: var(--admin);
        }

        .remember-forgot {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .remember-me {
            display: flex;
            align-items: center;
        }

        .remember-me input {
            margin-right: 8px;
        }

        .forgot-password {
            color: var(--admin);
            text-decoration: none;
        }

        .forgot-password:hover {
            text-decoration: underline;
        }

        .security-notice {
            background: #f8f9fa;
            border-left: 4px solid var(--admin);
            padding: 15px;
            border-radius: 5px;
            margin-top: 20px;
            font-size: 0.9rem;
        }

        .security-notice i {
            color: var(--admin);
            margin-right: 10px;
        }

        @media (max-width: 768px) {
            .admin-login-left {
                padding: 30px;
            }

            .admin-login-right {
                padding: 30px;
            }
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-light sticky-top">
        <div class="container">
            <a class="navbar-brand" href="index.html">
                <i class="fas fa-spa me-2"></i>GlamourCosmetics
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="index.html">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="index.html#features">Features</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="index.html#products">Products</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="index.html#about">About</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="index.html#contact">Contact</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="redirectToUserLogin">User Login</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Admin Login Form -->
    <div class="container">
        <div class="admin-login-container">
            <div class="row g-0">
                <div class="col-lg-6">
                    <div class="admin-login-left">
                        <span class="admin-badge">Administrator Access</span>
                        <h2>Admin Portal</h2>
                        <p>Access the administrative dashboard to manage your cosmetics business operations and analytics.</p>

                        <ul class="admin-features-list">
                            <li>
                                <i class="fas fa-check"></i>
                                <span>Manage user accounts and permissions</span>
                            </li>
                            <li>
                                <i class="fas fa-check"></i>
                                <span>View comprehensive business analytics</span>
                            </li>
                            <li>
                                <i class="fas fa-check"></i>
                                <span>Monitor inventory and product performance</span>
                            </li>
                            <li>
                                <i class="fas fa-check"></i>
                                <span>Generate detailed sales reports</span>
                            </li>
                            <li>
                                <i class="fas fa-check"></i>
                                <span>Configure system settings</span>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="admin-login-right">
                        <h3 class="form-title">Admin Login</h3>
                        <form action="adminLogin" method="post">
                            <div class="mb-3">
                                <label for="email" class="form-label">Admin Email</label>
                                <div class="input-icon">
                                    <i class="fas fa-envelope"></i>
                                    <input type="email" class="form-control" name="email" id="email" required>
                                </div>
                            </div>

                            <div class="mb-3">
                                <label for="psw" class="form-label">Password</label>
                                <div class="input-icon">
                                    <i class="fas fa-lock"></i>
                                    <input type="password" class="form-control" name="psw" id="psw" required>
                                    <span class="password-toggle" onclick="togglePassword('psw')">
                                        <i class="fas fa-eye"></i>
                                    </span>
                                </div>
                            </div>

                            <div class="remember-forgot">
                                <div class="remember-me">
                                    <input type="checkbox" id="remember" name="remember">
                                    <label for="remember">Remember this device</label>
                                </div>
                                <a href="#" class="forgot-password">Forgot password?</a>
                            </div>

                            <button type="submit" class="btn btn-admin-login">Access Admin Dashboard</button>

                            <div class="security-notice">
                                <i class="fas fa-shield-alt"></i>
                                <span>This is a secure administrative portal. Unauthorized access is prohibited.</span>
                            </div>

                            <div class="user-login-link">
                                Regular user? <a href="redirectToUserLogin">Login here</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

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
                        <a href="index.html">Home</a>
                        <a href="index.html#features">Features</a>
                        <a href="index.html#products">Products</a>
                        <a href="index.html#about">About Us</a>
                        <a href="index.html#contact">Contact</a>
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
        // Toggle password visibility
        function togglePassword(inputId) {
            const passwordInput = document.getElementById(inputId);
            const toggleIcon = passwordInput.nextElementSibling.querySelector('i');

            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
                toggleIcon.classList.remove('fa-eye');
                toggleIcon.classList.add('fa-eye-slash');
            } else {
                passwordInput.type = 'password';
                toggleIcon.classList.remove('fa-eye-slash');
                toggleIcon.classList.add('fa-eye');
            }
        }

        // Form validation
        document.addEventListener('DOMContentLoaded', function() {
            const form = document.querySelector('form');

            form.addEventListener('submit', function(e) {
                const email = document.getElementById('email');
                const password = document.getElementById('psw');

                // Basic validation
                if (!email.value || !password.value) {
                    e.preventDefault();
                    alert('Please fill in all required fields.');
                    return false;
                }

                // Email format validation
                const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                if (!emailRegex.test(email.value)) {
                    e.preventDefault();
                    alert('Please enter a valid email address.');
                    email.focus();
                    return false;
                }

                // If all validations pass, form will submit normally
                return true;
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