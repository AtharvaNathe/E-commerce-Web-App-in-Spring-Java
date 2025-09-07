<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background: linear-gradient(135deg, #2563eb, #1e40af);
            font-family: 'Segoe UI', sans-serif;
        }
        .login-container {
            background-color: #ffffff;
            padding: 40px 30px;
            border-radius: 1rem;
            box-shadow: 0 10px 20px rgba(0,0,0,0.2);
            width: 100%;
            max-width: 420px;
            animation: fadeIn 0.8s ease-in-out;
        }
        .login-container h2 {
            font-weight: 600;
            color: #1e40af;
        }
        .form-label {
            font-weight: 500;
        }
        .form-control:focus {
            border-color: #2563eb;
            box-shadow: 0 0 0 0.2rem rgba(37,99,235,0.25);
        }
        .btn-primary {
            background-color: #2563eb;
            border: none;
            transition: background-color 0.3s ease;
        }
        .btn-primary:hover {
            background-color: #1e40af;
        }
        /* Make switch link clearly visible on white */
        .switch-link {
            color: #1e40af;
            font-weight: 500;
            text-decoration: none;
            transition: color 0.3s ease;
        }
        .switch-link:hover {
            color: #2563eb;
            text-decoration: underline;
        }
        @keyframes fadeIn {
            from {opacity: 0; transform: translateY(-15px);}
            to {opacity: 1; transform: translateY(0);}
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2 class="text-center mb-4">🔐 Admin Login</h2>
        <c:if test="${not empty error}">
            <div class="alert alert-danger text-center" role="alert">
                ${error}
            </div>
        </c:if>
        <c:if test="${not empty message}">
            <div class="alert alert-info text-center" role="alert">
                ${message}
            </div>
        </c:if>
        <form action="${pageContext.request.contextPath}/admin/login" method="post">
            <div class="mb-3">
                <label for="username" class="form-label">Username</label>
                <input type="text" class="form-control" id="username" name="username" placeholder="Enter admin username" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
            </div>
            <button type="submit" class="btn btn-primary w-100">Login</button>
        </form>

        <p class="text-center mt-3 mb-0">
            <a href="${pageContext.request.contextPath}/login" class="switch-link">🔄 Switch to User Login</a>
        </p>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
