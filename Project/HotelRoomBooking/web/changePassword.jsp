<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="model.Account" %>

<%
    HttpSession sessionUser = request.getSession(false);
    Account user = (sessionUser != null) ? (Account) sessionUser.getAttribute("user") : null;
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Sona Template">
        <meta name="keywords" content="Sona, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css?family=Lora:400,700&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Cabin:400,500,600,700&display=swap" rel="stylesheet">

        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/flaticon.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <link rel="stylesheet" href="css/profile.css" type="text/css">


        <style>
            .header-section {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                z-index: 999;
                background-color: #fff;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            }
            body {
                padding-top: 80px;
            }
            .error-message {
                color: red;
                font-size: 14px;
            }
            .bg-light {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            .box {
                max-width: 500px;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
                background: white;
                width: 100%;
            }
            .toggle-password {
                width: 50px;
            }
        </style>
        <title>Change Password</title>
    </head>
    <body>
        <header class="header-section">
            <div class="menu-item">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-2">
                            <div class="logo">
                                <a href="./index.html">
                                    <img src="img/logo.png" alt="">
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-10">
                            <div class="nav-menu">
                                <nav class="mainmenu">
                                    <ul>
                                        <li><a href="./index.html">Home</a></li>
                                        <li><a href="userList.jsp">User List</a></li>
                                        <li><a href="roomListForAdmin.jsp">Room List</a></li>
                                        <li><a href="serviceList.jsp">Service List</a></li>
                                        <li><a href="dashboard.jsp">Dashboard</a></li>
                                        <li class="active"><a href="profile.jsp">Profile</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <div class="bg-light">
            <div class="box">
                <h3 class="text-center">Change Password</h3>
                <form action="ChangePasswordServlet" method="post">
                    <div class="mb-3">
                        <label for="oldPassword" class="form-label">Current Password</label>
                        <div class="input-group">
                            <input type="password" name="oldPassword" id="oldPassword" class="form-control" required>
                            <button class="btn btn-outline-secondary toggle-password" type="button" onclick="togglePassword('oldPassword', 'toggleOldPasswordIcon')">
                                <i id="toggleOldPasswordIcon" class="fa fa-eye"></i>
                            </button>
                        </div>
                        <% if (request.getAttribute("oldPasswordError") != null) { %>
                        <div class="error-message"><%= request.getAttribute("oldPasswordError") %></div>
                        <% } %>
                    </div>

                    <div class="mb-3">
                        <label for="newPassword" class="form-label">New Password</label>
                        <div class="input-group">
                            <input type="password" name="newPassword" id="newPassword" class="form-control" required>
                            <button class="btn btn-outline-secondary toggle-password" type="button" onclick="togglePassword('newPassword', 'toggleNewPasswordIcon')">
                                <i id="toggleNewPasswordIcon" class="fa fa-eye"></i>
                            </button>
                        </div>
                        <% if (request.getAttribute("newPasswordError") != null) { %>
                        <div class="error-message"><%= request.getAttribute("newPasswordError") %></div>
                        <% } %>
                    </div>

                    <div class="mb-3">
                        <label for="confirmPassword" class="form-label">Confirm New Password</label>
                        <div class="input-group">
                            <input type="password" name="confirmPassword" id="confirmPassword" class="form-control" required>
                            <button class="btn btn-outline-secondary toggle-password" type="button" onclick="togglePassword('confirmPassword', 'toggleConfirmPasswordIcon')">
                                <i id="toggleConfirmPasswordIcon" class="fa fa-eye"></i>
                            </button>
                        </div>
                        <% if (request.getAttribute("confirmPasswordError") != null) { %>
                        <div class="error-message"><%= request.getAttribute("confirmPasswordError") %></div>
                        <% } %>
                    </div>


                    <% if (request.getAttribute("successMessage") != null) { %>
                    <div class="alert alert-success"><%= request.getAttribute("successMessage") %></div>
                    <% } %>

                    <% if (request.getAttribute("errorMessage") != null) { %>
                    <div class="alert alert-danger"><%= request.getAttribute("errorMessage") %></div>
                    <% } %>

                    <button type="submit" class="btn btn-primary w-100">Change Password</button>
                </form>
                <a href="profile.jsp" class="btn btn-secondary w-100 mt-3">Back to Profile</a>
            </div>
        </div>

        <footer class="footer-section">
            <div class="container">
                <div class="footer-text">
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="ft-about">
                                <div class="logo">
                                    <a href="#">
                                        <img src="img/footer-logo.png" alt="">
                                    </a>
                                </div>
                                <p>We inspire and reach millions of travelers<br /> across 90 local websites</p>
                            </div>
                        </div>
                        <div class="col-lg-3 offset-lg-1">
                            <div class="ft-contact">
                                <h6>Contact Us</h6>
                                <ul>
                                    <li>(12) 345 67890</li>
                                    <li>hotelroombooking@gmail.com</li>
                                    <li>856 Cordia Extension Apt. 356, Lake, United State</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>

        <script>
            function togglePassword(inputId, iconId) {
                var input = document.getElementById(inputId);
                var icon = document.getElementById(iconId);

                if (input.type === "password") {
                    input.type = "text";
                    icon.classList.remove("fa-eye");
                    icon.classList.add("fa-eye-slash");
                } else {
                    input.type = "password";
                    icon.classList.remove("fa-eye-slash");
                    icon.classList.add("fa-eye");
                }
            }
        </script>

    </body>
</html>
