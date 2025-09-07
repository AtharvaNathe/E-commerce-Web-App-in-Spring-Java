<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-color: #121212; /* dark background */
            font-family: 'Segoe UI', sans-serif;
        }
        .login-container {
            background-color: #1e1e1e; /* dark card */
            color: #f1f1f1;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.4);
            width: 100%;
            max-width: 400px;
        }
        .login-container h2 {
            color: #0d6efd;
        }
        .form-label {
            color: #f1f1f1;
        }
        .form-control {
            background-color: #2c2c2c;
            border: 1px solid #444;
            color: #f1f1f1;
        }
        .form-control:focus {
            background-color: #2c2c2c;
            color: #f1f1f1;
            border-color: #0d6efd;
            box-shadow: none;
        }
        .btn-primary {
            background-color: #0d6efd;
            border-color: #0d6efd;
        }
        .btn-primary:hover {
            background-color: #0b5ed7;
        }
        a {
            color: #0d6efd;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="login-container">
    <h2 class="text-center mb-4">User Login</h2>

    <c:if test="${not empty error}">
        <div class="alert alert-danger" role="alert">
            <p>${error}</p>
        </div>
    </c:if>
    <c:if test="${not empty message}">
        <div class="alert alert-info" role="alert">
            <p>${message}</p>
        </div>
    </c:if>

    <form action="${pageContext.request.contextPath}/login" method="post">
        <div class="mb-3">
            <label for="username" class="form-label">Username</label>
            <input type="text" class="form-control" id="username" name="username" required>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input type="password" class="form-control" id="password" name="password" required>
        </div>
        <button type="submit" class="btn btn-primary w-100">Login</button>
    </form>

    <p class="text-center mt-3">
        Don't have an account? <a href="${pageContext.request.contextPath}/register">Register here</a>
    </p>
    <p class="text-center mt-3">
        <a href="${pageContext.request.contextPath}/admin/login" class="btn btn-sm btn-secondary">Admin Login</a>
    </p>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
