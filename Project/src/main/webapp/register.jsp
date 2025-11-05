<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - GlamourCosmetics</title>
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

        .register-container {
            max-width: 900px;
            margin: 50px auto;
            background: white;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
        }

        .register-left {
            background: linear-gradient(rgba(212, 165, 192, 0.9), rgba(192, 108, 132, 0.9)),
                        url('https://images.unsplash.com/photo-1522335789203-aabd1fc54bc9?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80');
            background-size: cover;
            background-position: center;
            color: white;
            padding: 50px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .register-left h2 {
            color: white;
            font-size: 2.2rem;
            margin-bottom: 20px;
        }

        .register-left p {
            font-size: 1rem;
            opacity: 0.9;
        }

        .register-right {
            padding: 40px;
        }

        .form-control {
            border: 1px solid #e6e6e6;
            border-radius: 10px;
            padding: 12px 15px;
            margin-bottom: 20px;
            transition: all 0.3s;
        }

        .form-control:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 0.25rem rgba(212, 165, 192, 0.25);
        }

        .form-label {
            font-weight: 500;
            margin-bottom: 8px;
            color: var(--dark);
        }

        .btn-register {
            background-color: var(--accent);
            color: white;
            padding: 12px 30px;
            border-radius: 30px;
            font-weight: 500;
            border: none;
            width: 100%;
            transition: all 0.3s;
            margin-top: 10px;
        }

        .btn-register:hover {
            background-color: var(--dark);
            color: white;
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .login-link {
            text-align: center;
            margin-top: 25px;
            color: var(--dark);
        }

        .login-link a {
            color: var(--accent);
            text-decoration: none;
            font-weight: 500;
        }

        .login-link a:hover {
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
            color: var(--accent);
        }

        .input-icon input {
            padding-left: 45px;
        }

        .benefits-list {
            list-style: none;
            padding: 0;
            margin-top: 30px;
        }

        .benefits-list li {
            margin-bottom: 15px;
            display: flex;
            align-items: flex-start;
        }

        .benefits-list i {
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
            color: var(--accent);
        }

        @media (max-width: 768px) {
            .register-left {
                padding: 30px;
            }

            .register-right {
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
                        <a class="nav-link" href="redirectToUserLogin">Login</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Registration Form -->
    <div class="container">
        <div class="register-container">
            <div class="row g-0">
                <div class="col-lg-6">
                    <div class="register-left">
                        <h2>Join Our Beauty Community</h2>
                        <p>Create your account to access our cosmetics management system and streamline your business operations.</p>

                        <ul class="benefits-list">
                            <li>
                                <i class="fas fa-check"></i>
                                <span>Manage your cosmetics inventory with ease</span>
                            </li>
                            <li>
                                <i class="fas fa-check"></i>
                                <span>Track sales and customer preferences</span>
                            </li>
                            <li>
                                <i class="fas fa-check"></i>
                                <span>Access exclusive beauty industry insights</span>
                            </li>
                            <li>
                                <i class="fas fa-check"></i>
                                <span>Get personalized product recommendations</span>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="register-right">
                        <h3 class="form-title">Create Your Account</h3>
                        <form action="register" method="post">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="fName" class="form-label">First Name</label>
                                        <div class="input-icon">
                                            <i class="fas fa-user"></i>
                                            <input type="text" class="form-control" name="firstName" id="fName" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="sName" class="form-label">Second Name</label>
                                        <div class="input-icon">
                                            <i class="fas fa-user"></i>
                                            <input type="text" class="form-control" name="secondName" id="sName" required>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="pNumber" class="form-label">Phone Number</label>
                                        <div class="input-icon">
                                            <i class="fas fa-phone"></i>
                                            <input type="tel" class="form-control" name="phoneNumber" id="pNumber" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="email" class="form-label">Email</label>
                                        <div class="input-icon">
                                            <i class="fas fa-envelope"></i>
                                            <input type="email" class="form-control" name="email" id="email" required>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="psw" class="form-label">Password</label>
                                        <div class="input-icon">
                                            <i class="fas fa-lock"></i>
                                            <input type="password" class="form-control" name="password" id="psw" required>
                                            <span class="password-toggle" onclick="togglePassword('psw')">
                                                <i class="fas fa-eye"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="cpsw" class="form-label">Confirm Password</label>
                                        <div class="input-icon">
                                            <i class="fas fa-lock"></i>
                                            <input type="password" class="form-control" name="conformPassword" id="cpsw" required>
                                            <span class="password-toggle" onclick="togglePassword('cpsw')">
                                                <i class="fas fa-eye"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="mb-3 form-check">
                                <input type="checkbox" class="form-check-input" id="terms" required>
                                <label class="form-check-label" for="terms">
                                    I agree to the <a href="#" class="text-accent">Terms of Service</a> and <a href="#" class="text-accent">Privacy Policy</a>
                                </label>
                            </div>

                            <button type="submit" class="btn btn-register">Create Account</button>

                            <div class="login-link">
                                Already have an account? <a href="redirectToUserLogin">Sign In</a>
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
            const password = document.getElementById('psw');
            const confirmPassword = document.getElementById('cpsw');

            form.addEventListener('submit', function(e) {
                // Check if passwords match
                if (password.value !== confirmPassword.value) {
                    e.preventDefault();
                    alert('Passwords do not match. Please try again.');
                    confirmPassword.focus();
                    return false;
                }

                // Check password strength (optional)
                if (password.value.length < 8) {
                    e.preventDefault();
                    alert('Password should be at least 8 characters long.');
                    password.focus();
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