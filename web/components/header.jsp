<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Home | FPT</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <style>
            body {
                font-family: 'Montserrat', sans-serif;
                background-color: #f8f9fa;
                margin: 0;
                padding: 0;
            }
            .navbar-custom {
                background-color: #ff5733;
                padding: 10px 20px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }
            .navbar-custom .navbar-brand img {
                height: 50px;
            }
            .navbar-custom .navbar-nav .nav-link {
                color: white;
                font-size: 18px;
                margin-right: 20px;
                transition: color 0.3s ease;
            }
            .navbar-custom .navbar-nav .nav-link:hover {
                color: #fdd835;
            }
            .dropdown-menu-custom {
                background-color: #343a40;
                border-radius: 0;
                margin-top: 0;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            }
            .dropdown-menu-custom .dropdown-item {
                color: white;
                padding: 10px 20px;
                transition: background-color 0.3s ease;
            }
            .dropdown-menu-custom .dropdown-item:hover {
                background-color: #495057;
            }
            .user-info {
                display: flex;
                align-items: center;
                color: white;
            }
            .user-info img {
                border-radius: 50%;
                margin-right: 10px;
            }
            .username {
                font-size: 16px;
                margin-right: 10px;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-custom fixed-top">
            <div class="container-fluid">
                <a class="navbar-brand" href="home">
                    <img src="img/fpt.jpg" alt="FPT Logo">
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="home" style="color: #fdd835;">Trang chủ</a>
                        </li>
                        <c:if test="${sessionScope.currentUser.role == 2 || sessionScope.currentUser.role == 3}">
                            <li class="nav-item">
                                <a class="nav-link" href="booking">Đặt sân</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="">Tin tức</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="equipment">Phụ kiện</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="food">Đồ ăn</a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.currentUser.role == 3}">
                            <li class="nav-item">
                                <a class="nav-link" href="admin">Quản Lí</a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.currentUser.role == 1}">
                            <li class="nav-item">
                                <a class="nav-link" href="admin">Quản lí người dùng</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="managebooking">Quản lí Sân</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="manageequipment">Quản lí Phụ kiện</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="managefood">Quản lí Đồ ăn</a>
                            </li>
                        </c:if>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Giới thiệu</a>
                        </li>
                    </ul>
                    <c:if test="${sessionScope.currentUser != null}">
                        <div class="dropdown">
                            <a class="nav-link dropdown-toggle user-info" href="#" id="userDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <img src="https://th.bing.com/th/id/OIP.HVfKqvRnZdWUc2fsEkSAKgAAAA?w=350&h=350&rs=1&pid=ImgDetMain" width="40px" height="40px" alt="User Image">
                                <span class="username">${sessionScope.currentUser.email}</span>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-custom dropdown-menu-end" aria-labelledby="userDropdown">
                                <li><a class="dropdown-item" href="#">Thông tin cá nhân</a></li>
                                <li><a class="dropdown-item" href="historybooking">Lịch sử đặt sân</a></li>
                                <li><a class="dropdown-item" href="historyequipment">Lịch sử mua phụ kiện</a></li>
                                <li><a class="dropdown-item" href="historyfood">Lịch sử mua đồ ăn</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="logout" onclick="return confirm('Bạn có chắc chắn muốn đăng xuất?');">Đăng xuất</a></li>
                            </ul>
                        </div>
                    </c:if>
                </div>
            </div>
        </nav>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
