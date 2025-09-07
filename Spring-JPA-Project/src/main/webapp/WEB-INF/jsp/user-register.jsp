<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>
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
        .register-container {
            background-color: #1e1e1e; /* dark card */
            color: #f1f1f1;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.4);
            width: 100%;
            max-width: 400px;
        }
        .register-container h2 {
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
        .text-danger {
            font-size: 0.85rem;
        }
    </style>
</head>
<body>
<div class="register-container">
    <h2 class="text-center mb-4">User Registration</h2>

    <form:form action="${pageContext.request.contextPath}/register" modelAttribute="user" method="post">
        <div class="mb-3">
            <label for="username" class="form-label">Username</label>
            <form:input path="username" type="text" class="form-control" id="username" required="true"/>
            <form:errors path="username" cssClass="text-danger"/>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <form:input path="password" type="password" class="form-control" id="password" required="true"/>
            <form:errors path="password" cssClass="text-danger"/>
        </div>
        <button type="submit" class="btn btn-primary w-100">Register</button>
    </form:form>

    <p class="text-center mt-3">
        Already have an account? <a href="${pageContext.request.contextPath}/login">Login here</a>
    </p>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
