<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Products - GlamourCosmetics</title>
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
            --sidebar: #2c2330;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f5f7fb;
            color: var(--dark);
            overflow-x: hidden;
        }

        h1, h2, h3, h4, h5 {
            font-family: 'Playfair Display', serif;
            color: var(--dark);
        }

        /* Dashboard Layout */
        .dashboard-container {
            display: flex;
            min-height: 100vh;
        }

        /* Sidebar Styles */
        .sidebar {
            width: 260px;
            background: var(--sidebar);
            color: white;
            transition: all 0.3s;
            position: fixed;
            height: 100vh;
            z-index: 100;
            box-shadow: 3px 0 10px rgba(0, 0, 0, 0.1);
        }

        .sidebar-header {
            padding: 20px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            text-align: center;
        }

        .sidebar-header h3 {
            color: white;
            font-size: 1.5rem;
            margin: 0;
        }

        .sidebar-menu {
            padding: 20px 0;
        }

        .sidebar-menu ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .sidebar-menu li {
            margin-bottom: 5px;
        }

        .sidebar-menu a {
            display: flex;
            align-items: center;
            padding: 12px 20px;
            color: rgba(255, 255, 255, 0.8);
            text-decoration: none;
            transition: all 0.3s;
            border-left: 3px solid transparent;
        }

        .sidebar-menu a:hover, .sidebar-menu a.active {
            background: rgba(255, 255, 255, 0.1);
            color: white;
            border-left: 3px solid var(--primary);
        }

        .sidebar-menu i {
            margin-right: 10px;
            font-size: 1.1rem;
            width: 20px;
            text-align: center;
        }

        /* Main Content Area */
        .main-content {
            flex: 1;
            margin-left: 260px;
            transition: all 0.3s;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        /* Top Navigation */
        .top-navbar {
            background: white;
            padding: 15px 30px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: sticky;
            top: 0;
            z-index: 99;
        }

        .page-title h1 {
            margin: 0;
            font-size: 1.8rem;
            color: var(--admin);
        }

        .admin-profile {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .admin-info {
            text-align: right;
        }

        .admin-name {
            font-weight: 600;
            color: var(--dark);
            margin: 0;
        }

        .admin-role {
            font-size: 0.85rem;
            color: #777;
            margin: 0;
        }

        .admin-avatar {
            width: 45px;
            height: 45px;
            border-radius: 50%;
            overflow: hidden;
            border: 2px solid var(--primary);
        }

        .admin-avatar img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .logout-btn {
            background: transparent;
            border: 1px solid var(--accent);
            color: var(--accent);
            padding: 8px 16px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .logout-btn:hover {
            background: var(--accent);
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
        }

        /* Content Area */
        .content {
            padding: 30px;
            flex: 1;
        }

        /* Products Section */
        .products-section {
            margin-bottom: 30px;
        }

        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            padding-bottom: 15px;
            border-bottom: 1px solid #eee;
        }

        .section-header h2 {
            font-size: 1.8rem;
            margin: 0;
            color: var(--admin);
        }

        .btn-add-product {
            background: var(--admin);
            color: white;
            padding: 10px 20px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .btn-add-product:hover {
            background: var(--dark);
            color: white;
            transform: translateY(-2px);
        }

        /* Products Grid */
        .products-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 25px;
            margin-bottom: 30px;
        }

        .product-card {
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
            transition: all 0.3s ease;
            border: 1px solid #f0f0f0;
        }

        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.12);
        }

        .product-image {
            height: 200px;
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            position: relative;
        }

        .product-category {
            position: absolute;
            top: 15px;
            left: 15px;
            background: var(--primary);
            color: white;
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 500;
        }

        .product-id {
            position: absolute;
            top: 15px;
            right: 15px;
            background: rgba(0, 0, 0, 0.7);
            color: white;
            padding: 4px 10px;
            border-radius: 12px;
            font-size: 0.75rem;
            font-weight: 500;
        }

        .product-info {
            padding: 20px;
        }

        .product-name {
            font-size: 1.3rem;
            font-weight: 600;
            margin-bottom: 10px;
            color: var(--dark);
        }

        .product-description {
            color: #666;
            font-size: 0.9rem;
            margin-bottom: 15px;
            line-height: 1.4;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }

        .product-details {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 10px;
            margin-bottom: 15px;
            padding: 15px;
            background: #f8f9fa;
            border-radius: 8px;
        }

        .detail-item {
            display: flex;
            flex-direction: column;
        }

        .detail-label {
            font-size: 0.8rem;
            color: #666;
            margin-bottom: 4px;
        }

        .detail-value {
            font-weight: 600;
            color: var(--dark);
        }

        .product-price {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--admin);
            text-align: center;
            margin-bottom: 15px;
        }

        .product-stock {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 15px;
            padding: 10px 0;
            border-top: 1px solid #f0f0f0;
        }

        .stock-info {
            font-size: 0.85rem;
            font-weight: 500;
        }

        .stock-available {
            color: #28a745;
        }

        .stock-low {
            color: #ffc107;
        }

        .stock-out {
            color: #dc3545;
        }

        .product-actions {
            display: flex;
            gap: 10px;
        }

        .btn-action {
            padding: 8px 15px;
            border: none;
            border-radius: 6px;
            font-size: 0.85rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s;
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 6px;
        }

        .btn-edit {
            background: var(--primary);
            color: white;
        }

        .btn-delete {
            background: #dc3545;
            color: white;
        }

        .btn-action:hover {
            transform: translateY(-2px);
            box-shadow: 0 3px 8px rgba(0, 0, 0, 0.2);
        }

        .no-products {
            text-align: center;
            padding: 60px 20px;
            color: #666;
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
        }

        .no-products i {
            font-size: 4rem;
            margin-bottom: 20px;
            color: #ccc;
        }

        .no-products h3 {
            margin-bottom: 10px;
            color: #888;
        }

        /* Filters */
        .filters-section {
            background: white;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 30px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
        }

        .filter-group {
            display: flex;
            gap: 15px;
            align-items: center;
            flex-wrap: wrap;
        }

        .filter-select {
            padding: 8px 15px;
            border: 1px solid #e6e6e6;
            border-radius: 6px;
            background: white;
        }

        /* Footer */
        .dashboard-footer {
            background: var(--dark);
            color: white;
            padding: 20px 30px;
            text-align: center;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .sidebar {
                width: 70px;
                overflow: hidden;
            }

            .sidebar-header h3, .sidebar-menu span {
                display: none;
            }

            .sidebar-menu a {
                justify-content: center;
                padding: 15px;
            }

            .sidebar-menu i {
                margin-right: 0;
                font-size: 1.3rem;
            }

            .main-content {
                margin-left: 70px;
            }

            .admin-info {
                display: none;
            }

            .logout-btn span {
                display: none;
            }

            .logout-btn {
                padding: 8px 12px;
            }

            .products-grid {
                grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
                gap: 20px;
            }

            .filter-group {
                flex-direction: column;
                align-items: stretch;
            }

            .filter-select {
                width: 100%;
            }

            .section-header {
                flex-direction: column;
                gap: 15px;
                align-items: flex-start;
            }
        }

        @media (max-width: 480px) {
            .products-grid {
                grid-template-columns: 1fr;
            }

            .product-details {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <!-- Sidebar -->
        <div class="sidebar">
            <div class="sidebar-header">
                <h3><i class="fas fa-spa me-2"></i>Admin Panel</h3>
            </div>
            <div class="sidebar-menu">
                <ul>
                    <li>
                        <a href="adminDashBord.jsp">
                            <i class="fas fa-tachometer-alt"></i>
                            <span>Dashboard</span>
                        </a>
                    </li>
                    <li>
                        <a href="redirectToUser">
                            <i class="fas fa-users"></i>
                            <span>View Users</span>
                        </a>
                    </li>
                    <li>
                        <a href="redirectToProducts">
                            <i class="fas fa-box"></i>
                            <span>Add Products</span>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="active">
                            <i class="fas fa-shopping-cart"></i>
                            <span>View Products</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <!-- Top Navigation -->
            <div class="top-navbar">
                <div class="page-title">
                    <h1>Product Management</h1>
                </div>
                <div class="admin-profile">
                    <div class="admin-info">
                        <p class="admin-name">${adminName}</p>
                        <p class="admin-role">Administrator</p>
                    </div>
                    <div class="admin-avatar">
                        <img src="https://ui-avatars.com/api/?name=${adminName}&background=d4a5c0&color=fff&size=128" alt="Admin Avatar">
                    </div>
                    <a href="logout" class="logout-btn">
                        <i class="fas fa-sign-out-alt"></i>
                        <span>Logout</span>
                    </a>
                </div>
            </div>

            <!-- Content Area -->
            <div class="content">
                <!-- Filters Section -->
                <div class="filters-section">
                    <div class="filter-group">
                        <select class="filter-select" id="categoryFilter">
                            <option value="">All Categories</option>
                            <option value="Skincare">Skincare</option>
                            <option value="Makeup">Makeup</option>
                            <option value="Fragrance">Fragrance</option>
                            <option value="Hair Care">Hair Care</option>
                            <option value="Body Care">Body Care</option>
                            <option value="Men's Grooming">Men's Grooming</option>
                        </select>

                        <select class="filter-select" id="stockFilter">
                            <option value="">All Stock Status</option>
                            <option value="available">In Stock</option>
                            <option value="low">Low Stock</option>
                            <option value="out">Out of Stock</option>
                        </select>

                        <select class="filter-select" id="sortFilter">
                            <option value="newest">Newest First</option>
                            <option value="name">Sort by Name</option>
                            <option value="price-low">Price: Low to High</option>
                            <option value="price-high">Price: High to Low</option>
                            <option value="stock-high">Stock: High to Low</option>
                        </select>

                        <input type="text" class="form-control" id="searchFilter" placeholder="Search products..." style="max-width: 300px;">
                    </div>
                </div>

                <!-- Products Grid -->
                <div class="products-section">
                    <div class="section-header">
                        <h2>All Products</h2>
                        <div class="text-muted">
                            <c:if test="${not empty products}">
                                Showing ${products.size()} products
                            </c:if>
                        </div>
                    </div>

                    <c:choose>
                        <c:when test="${not empty products}">
                            <div class="products-grid" id="productsGrid">
                                <c:forEach var="product" items="${products}" varStatus="status">
                                    <div class="product-card"
                                         data-category="${product.category}"
                                         data-price="${product.price}"
                                         data-stock="${product.stockQuantity}"
                                         data-index="${status.index}">
                                        <div class="product-image" style="background-image: url('${not empty product.imageUrl ? product.imageUrl : 'https://images.unsplash.com/photo-1522335789203-aabd1fc54bc9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=500&q=80'}')">
                                            <span class="product-category">${product.category}</span>
                                            <span class="product-id">ID: ${product.id}</span>
                                        </div>
                                        <div class="product-info">
                                            <h3 class="product-name">${product.productName}</h3>
                                            <p class="product-description">
                                                <c:choose>
                                                    <c:when test="${not empty product.description}">
                                                        ${product.description}
                                                    </c:when>
                                                    <c:otherwise>
                                                        No description available.
                                                    </c:otherwise>
                                                </c:choose>
                                            </p>

                                            <div class="product-details">
                                                <div class="detail-item">
                                                    <span class="detail-label">Category</span>
                                                    <span class="detail-value">${product.category}</span>
                                                </div>
                                                <div class="detail-item">
                                                    <span class="detail-label">Status</span>
                                                    <span class="detail-value">
                                                        <c:choose>
                                                            <c:when test="${product.stockQuantity > 10}">
                                                                <span style="color: #28a745;">Active</span>
                                                            </c:when>
                                                            <c:when test="${product.stockQuantity > 0}">
                                                                <span style="color: #ffc107;">Low Stock</span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span style="color: #dc3545;">Out of Stock</span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </span>
                                                </div>
                                            </div>

                                            <div class="product-price">&#8377;${product.price}</div>

                                            <div class="product-stock">
                                                <span class="stock-info">
                                                    <c:choose>
                                                        <c:when test="${product.stockQuantity > 10}">
                                                            <span class="stock-available"><i class="fas fa-check-circle"></i> In Stock</span>
                                                        </c:when>
                                                        <c:when test="${product.stockQuantity > 0}">
                                                            <span class="stock-low"><i class="fas fa-exclamation-circle"></i> Low Stock</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="stock-out"><i class="fas fa-times-circle"></i> Out of Stock</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </span>
                                                <span class="stock-info">${product.stockQuantity} units</span>
                                            </div>


                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="no-products">
                                <i class="fas fa-box-open"></i>
                                <h3>No Products Available</h3>
                                <p>There are no products in the store yet. <a href="redirectToProducts">Add your first product</a>.</p>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <!-- Footer -->
            <div class="dashboard-footer">
                <p>&copy; 2025 GlamourCosmetics Admin Panel. All rights reserved.</p>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Custom JS -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Sidebar active state management
            const menuItems = document.querySelectorAll('.sidebar-menu a');

            menuItems.forEach(item => {
                item.addEventListener('click', function() {
                    menuItems.forEach(i => i.classList.remove('active'));
                    this.classList.add('active');
                });
            });

            // Logout confirmation
            const logoutLink = document.querySelector('a[href="logout"]');
            if (logoutLink) {
                logoutLink.addEventListener('click', function(e) {
                    if (!confirm('Are you sure you want to logout?')) {
                        e.preventDefault();
                    }
                });
            }

            // Filter functionality
            const categoryFilter = document.getElementById('categoryFilter');
            const stockFilter = document.getElementById('stockFilter');
            const sortFilter = document.getElementById('sortFilter');
            const searchFilter = document.getElementById('searchFilter');
            const productCards = document.querySelectorAll('.product-card');

            function filterProducts() {
                const category = categoryFilter.value;
                const stockStatus = stockFilter.value;
                const searchTerm = searchFilter.value.toLowerCase();
                const sortBy = sortFilter.value;

                let filteredProducts = Array.from(productCards);

                // Filter by category
                if (category) {
                    filteredProducts = filteredProducts.filter(card =>
                        card.getAttribute('data-category') === category
                    );
                }

                // Filter by stock status
                if (stockStatus) {
                    filteredProducts = filteredProducts.filter(card => {
                        const stock = parseInt(card.getAttribute('data-stock'));
                        switch (stockStatus) {
                            case 'available': return stock > 10;
                            case 'low': return stock > 0 && stock <= 10;
                            case 'out': return stock === 0;
                            default: return true;
                        }
                    });
                }

                // Filter by search term
                if (searchTerm) {
                    filteredProducts = filteredProducts.filter(card => {
                        const productName = card.querySelector('.product-name').textContent.toLowerCase();
                        const productDesc = card.querySelector('.product-description').textContent.toLowerCase();
                        return productName.includes(searchTerm) || productDesc.includes(searchTerm);
                    });
                }

                // Sort products
                filteredProducts.sort((a, b) => {
                    switch (sortBy) {
                        case 'price-low':
                            return parseFloat(a.getAttribute('data-price')) - parseFloat(b.getAttribute('data-price'));
                        case 'price-high':
                            return parseFloat(b.getAttribute('data-price')) - parseFloat(a.getAttribute('data-price'));
                        case 'name':
                            return a.querySelector('.product-name').textContent.localeCompare(b.querySelector('.product-name').textContent);
                        case 'stock-high':
                            return parseInt(b.getAttribute('data-stock')) - parseInt(a.getAttribute('data-stock'));
                        case 'newest':
                            return parseInt(b.getAttribute('data-index')) - parseInt(a.getAttribute('data-index'));
                        default:
                            return 0;
                    }
                });

                // Hide all products first
                productCards.forEach(card => card.style.display = 'none');

                // Show filtered products
                filteredProducts.forEach(card => card.style.display = 'block');

                // Update product count
                const productCount = document.querySelector('.section-header .text-muted');
                if (productCount) {
                    productCount.textContent = `Showing ${filteredProducts.length} products`;
                }
            }

            // Add event listeners for filters
            categoryFilter.addEventListener('change', filterProducts);
            stockFilter.addEventListener('change', filterProducts);
            sortFilter.addEventListener('change', filterProducts);
            searchFilter.addEventListener('input', filterProducts);
        });

        // Edit product function
        function editProduct(productId) {
            if (confirm('Are you sure you want to edit this product?')) {
                // Redirect to edit page
                window.location.href = 'editProduct?id=' + productId;
            }
        }

        // Delete product function
        function deleteProduct(productId) {
            if (confirm('Are you sure you want to delete this product? This action cannot be undone.')) {
                // Submit delete request
                const form = document.createElement('form');
                form.method = 'POST';
                form.action = 'deleteProduct';

                const input = document.createElement('input');
                input.type = 'hidden';
                input.name = 'productId';
                input.value = productId;

                form.appendChild(input);
                document.body.appendChild(form);
                form.submit();
            }
        }
    </script>
</body>
</html>