<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #1f2937, #4b5563);
            font-family: 'Segoe UI', sans-serif;
            padding-top: 40px;
        }
        .card {
            border: none;
            border-radius: 1rem;
            box-shadow: 0 10px 20px rgba(0,0,0,0.2);
        }
        .card-header {
            background: #2563eb;
            color: #fff;
            border-top-left-radius: 1rem;
            border-top-right-radius: 1rem;
            text-align: center;
            padding: 1.5rem;
        }
        .form-label {
            font-weight: 500;
        }
        .form-control:focus, textarea:focus {
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
        .btn-secondary:hover {
            background-color: #6b7280;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="card mx-auto" style="max-width: 700px;">
            <div class="card-header">
                <h2 class="mb-0">✏️ Edit Product</h2>
                <p class="mb-0 small text-light">Update the details and click “Update Product”</p>
            </div>
            <div class="card-body p-4">
                <form:form action="${pageContext.request.contextPath}/admin/products/edit/${product.prodid}" modelAttribute="product" method="post">
                    <form:hidden path="prodid"/>
                    <div class="mb-3">
                        <label for="modelName" class="form-label">Model Name</label>
                        <form:input path="modelName" type="text" class="form-control" id="modelName" required="true"/>
                        <form:errors path="modelName" cssClass="text-danger small"/>
                    </div>
                    <div class="mb-3">
                        <label for="brand" class="form-label">Brand</label>
                        <form:input path="brand" type="text" class="form-control" id="brand" required="true"/>
                        <form:errors path="brand" cssClass="text-danger small"/>
                    </div>
                    <div class="mb-3 row">
                        <div class="col-md-6">
                            <label for="price" class="form-label">Price (₹)</label>
                            <form:input path="price" type="number" step="0.01" class="form-control" id="price" required="true" min="0"/>
                            <form:errors path="price" cssClass="text-danger small"/>
                        </div>
                        <div class="col-md-6">
                            <label for="stockQuantity" class="form-label">Stock Quantity</label>
                            <form:input path="stockQuantity" type="number" class="form-control" id="stockQuantity" required="true" min="0"/>
                            <form:errors path="stockQuantity" cssClass="text-danger small"/>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="features" class="form-label">Features</label>
                        <form:textarea path="features" class="form-control" id="features" rows="4"/>
                    </div>
                    <div class="mb-4">
                        <label for="warrantyPeriod" class="form-label">Warranty Period</label>
                        <form:input path="warrantyPeriod" type="text" class="form-control" id="warrantyPeriod"/>
                    </div>
                    <div class="d-flex justify-content-between">
                        <button type="submit" class="btn btn-primary px-4">💾 Update Product</button>
                        <a href="${pageContext.request.contextPath}/admin/products" class="btn btn-secondary px-4">↩ Cancel</a>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
