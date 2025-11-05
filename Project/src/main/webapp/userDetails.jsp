<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Management - GlamourCosmetics</title>
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

        /* Table Styles */
        .table-container {
            background: white;
            border-radius: 10px;
            padding: 25px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            margin-bottom: 30px;
        }

        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            padding-bottom: 15px;
            border-bottom: 1px solid #eee;
        }

        .section-header h2 {
            font-size: 1.5rem;
            margin: 0;
            color: var(--admin);
        }

        .admin-table {
            width: 100%;
            border-collapse: collapse;
        }

        .admin-table th {
            background: #f8f9fa;
            padding: 12px 15px;
            text-align: left;
            font-weight: 600;
            color: var(--dark);
            border-bottom: 2px solid #dee2e6;
        }

        .admin-table td {
            padding: 12px 15px;
            border-bottom: 1px solid #dee2e6;
        }

        .admin-table tr:hover {
            background: #f8f9fa;
        }

        .serial-number {
            text-align: center;
            font-weight: 600;
            color: var(--admin);
            width: 60px;
        }

        .status-badge {
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 500;
        }

        .status-active {
            background: #e8f5e9;
            color: #2e7d32;
        }

        .status-inactive {
            background: #ffebee;
            color: #c62828;
        }

        .user-avatar-small {
            width: 35px;
            height: 35px;
            border-radius: 50%;
            overflow: hidden;
        }

        .user-avatar-small img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .action-buttons {
            display: flex;
            gap: 8px;
        }

        .btn-action {
            padding: 5px 10px;
            border: none;
            border-radius: 4px;
            font-size: 0.8rem;
            cursor: pointer;
            transition: all 0.3s;
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

        .no-data {
            text-align: center;
            padding: 40px;
            color: #666;
        }

        .no-data i {
            font-size: 3rem;
            margin-bottom: 15px;
            color: #ccc;
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
                        <a href="#" class="active">
                            <i class="fas fa-users"></i>
                            <span>View Users</span>
                        </a>
                    </li>
                    <li>
                        <a href="redirectToProducts">
                            <i class="fas fa-box"></i>
                            <span>Products</span>
                        </a>
                    </li>
                    <li>
                        <a href="redirectToViewProducts">
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
                    <h1>User Management</h1>
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
                <div class="table-container">
                    <div class="section-header">
                        <h2>Registered Users</h2>
                        <div class="d-flex gap-2">
                            <input type="text" class="form-control" placeholder="Search users..." style="width: 250px;">
                            <button class="btn" style="background: var(--admin); color: white;">
                                <i class="fas fa-search"></i>
                            </button>
                        </div>
                    </div>

                    <div class="table-responsive">
                        <c:choose>
                            <c:when test="${not empty entityList}">
                                <table class="admin-table">
                                    <thead>
                                        <tr>
                                            <th class="serial-number">S.No</th>
                                            <th>User</th>
                                            <th>Email</th>
                                            <th>Phone Number</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="user" items="${entityList}" varStatus="loop">
                                            <tr>
                                                <td class="serial-number">
                                                    ${loop.index + 1}
                                                </td>
                                                <td>
                                                    <div class="d-flex align-items-center gap-2">
                                                        <div class="user-avatar-small">
                                                            <img src="https://ui-avatars.com/api/?name=${user.firstName}+${user.secondName}&background=d4a5c0&color=fff&size=128" alt="User Avatar">
                                                        </div>
                                                        <div>
                                                            <strong>${user.firstName} ${user.secondName}</strong>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>${user.email}</td>
                                                <td>${user.phoneNumber}</td>

                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </c:when>
                            <c:otherwise>
                                <div class="no-data">
                                    <i class="fas fa-users-slash"></i>
                                    <h3>No Users Found</h3>
                                    <p>There are no registered users in the system yet.</p>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <!-- User Count -->
                    <c:if test="${not empty entityList}">
                        <div class="d-flex justify-content-between align-items-center mt-4">
                            <div class="text-muted">
                                Total Users: ${entityList.size()}
                            </div>
                        </div>
                    </c:if>
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

            // Search functionality
            const searchInput = document.querySelector('input[type="text"]');
            const searchButton = document.querySelector('.btn');

            searchButton.addEventListener('click', function() {
                const searchTerm = searchInput.value.trim();
                if (searchTerm) {
                    // Implement search functionality here
                    alert('Searching for: ' + searchTerm);
                    // You can redirect to a search endpoint or filter the table
                    // window.location.href = '?search=' + encodeURIComponent(searchTerm);
                }
            });

            // Enter key search
            searchInput.addEventListener('keypress', function(e) {
                if (e.key === 'Enter') {
                    searchButton.click();
                }
            });
        });

        // Edit user function
        function editUser(userId) {
            if (confirm('Are you sure you want to edit this user?')) {
                // Redirect to edit page or show edit modal
                window.location.href = 'editUser?id=' + userId;
            }
        }

        // Delete user function
        function deleteUser(userId) {
            if (confirm('Are you sure you want to delete this user? This action cannot be undone.')) {
                // Submit delete request
                const form = document.createElement('form');
                form.method = 'POST';
                form.action = 'deleteUser';

                const input = document.createElement('input');
                input.type = 'hidden';
                input.name = 'userId';
                input.value = userId;

                form.appendChild(input);
                document.body.appendChild(form);
                form.submit();
            }
        }
    </script>
</body>
</html>