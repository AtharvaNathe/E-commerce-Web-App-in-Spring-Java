<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Products</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #121212;
            color: #f1f1f1;
            padding-top: 20px;
            font-family: 'Segoe UI', sans-serif;
        }
        .container {
            max-width: 1200px;
        }
        .product-card {
            background-color: #1e1e1e;
            border: 1px solid #333;
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 20px;
            box-shadow: 0 2px 4px rgba(0,0,0,.3);
            height: 100%;
        }
        .product-card h5 {
            color: #0d6efd;
        }
        .product-card .price {
            font-size: 1.2em;
            font-weight: bold;
            color: #28a745;
        }
        .btn-success {
            background-color: #198754;
            border-color: #198754;
        }
        .btn-danger {
            border-radius: 0.375rem;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h1 class="text-white">Available Products</h1>
        <a href="${pageContext.request.contextPath}/logout" class="btn btn-danger">Logout</a>
    </div>

    <c:if test="${empty products}">
        <div class="alert alert-info" role="alert">
            No products available at the moment.
        </div>
    </c:if>

    <div class="row">
        <c:forEach var="product" items="${products}">
            <div class="col-md-4 d-flex">
                <div class="product-card w-100">
                    <h5>${product.modelName}</h5>
                    <p><strong>Brand:</strong> ${product.brand}</p>
                    <p class="price">
                        Price: ₹<fmt:formatNumber value="${product.price}" pattern="#,##0.00"/>
                    </p>
                    <p><strong>Stock:</strong> ${product.stockQuantity} units</p>
                    <c:if test="${not empty product.features}">
                        <p><strong>Features:</strong> ${product.features}</p>
                    </c:if>
                    <c:if test="${not empty product.warrantyPeriod}">
                        <p><strong>Warranty:</strong> ${product.warrantyPeriod}</p>
                    </c:if>
                    <button class="btn btn-success btn-sm">Buy Now</button>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
