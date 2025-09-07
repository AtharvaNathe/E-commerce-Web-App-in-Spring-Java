<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
    body {
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        background-color: #121212; /* dark background */
        font-family: 'Segoe UI', sans-serif;
        color: #f1f1f1; /* default light text */
    }

    .login-container {
        background-color: #1e1e1e;
        padding: 30px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.4);
        width: 100%;
        max-width: 400px;
        color: #f1f1f1; /* light text inside card */
    }

    .login-container h2 {
        color: #0d6efd; /* blue heading */
    }

    .form-label {
        color: #f1f1f1; /* ensure labels visible */
    }

    .form-control {
        background-color: #2c2c2c;
        border: 1px solid #444;
        color: #f1f1f1; /* light text inside input */
    }

    .form-control:focus {
        background-color: #2c2c2c;
        border-color: #0d6efd;
        color: #f1f1f1;
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
<div class="container">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h1 class="text-white">Product List</h1>
        <div>
            <a href="${pageContext.request.contextPath}/admin/products/new" class="btn btn-primary me-2">Add New Product</a>
            <a href="${pageContext.request.contextPath}/admin/logout" class="btn btn-danger">Logout</a>
        </div>
    </div>

    <c:if test="${not empty message}">
        <div class="alert alert-success" role="alert">
            <p>${message}</p>
        </div>
    </c:if>

    <div class="filter-section">
        <form action="${pageContext.request.contextPath}/admin/products" method="get" class="row g-3 align-items-end">
            <div class="col-md-4">
                <label for="search" class="form-label text-light">Search by Model/Brand:</label>
                <input type="text" class="form-control" id="search" name="search" value="${param.search}">
            </div>
            <div class="col-md-2">
                <label for="minPrice" class="form-label text-light">Min Price:</label>
                <input type="number" step="0.01" class="form-control" id="minPrice" name="minPrice" value="${param.minPrice}">
            </div>
            <div class="col-md-2">
                <label for="maxPrice" class="form-label text-light">Max Price:</label>
                <input type="number" step="0.01" class="form-control" id="maxPrice" name="maxPrice" value="${param.maxPrice}">
            </div>
            <div class="col-md-2">
                <label for="brand" class="form-label text-light">Filter by Brand:</label>
                <input type="text" class="form-control" id="brand" name="brand" value="${param.brand}">
            </div>
            <div class="col-md-2 d-flex align-items-center">
                <div class="form-check me-3">
                    <input class="form-check-input" type="checkbox" id="lowStock" name="lowStock"
                        <c:if test="${param.lowStock eq 'true'}">checked</c:if>>
                    <label class="form-check-label text-light" for="lowStock">
                        Low Stock (&lt; 5)
                    </label>
                </div>
                <button type="submit" class="btn btn-info">Apply Filters</button>
            </div>
        </form>
    </div>

    <table class="table table-striped table-hover">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Model Name</th>
            <th scope="col">Brand</th>
            <th scope="col">Price</th>
            <th scope="col">Stock</th>
            <th scope="col">Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="product" items="${products}">
            <tr class="<c:if test='${product.stockQuantity < 5}'>table-warning</c:if>">
                <td>${product.prodid}</td>
                <td>${product.modelName}</td>
                <td>${product.brand}</td>
                <td><fmt:formatNumber value="${product.price}" type="currency" currencySymbol="₹"/></td>
                <td>${product.stockQuantity}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/admin/products/edit/${product.prodid}" class="btn btn-sm btn-warning">Edit</a>
                    <button type="button" class="btn btn-sm btn-danger" data-bs-toggle="modal" data-bs-target="#deleteConfirmationModal" data-product-id="${product.prodid}">Delete</button>
                </td>
            </tr>
        </c:forEach>
        <c:if test="${empty products}">
            <tr>
                <td colspan="6" class="text-center text-light">No products found.</td>
            </tr>
        </c:if>
        </tbody>
    </table>

    <!-- Delete Confirmation Modal -->
    <div class="modal fade" id="deleteConfirmationModal" tabindex="-1" aria-labelledby="deleteConfirmationModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content bg-dark text-light">
                <div class="modal-header">
                    <h5 class="modal-title" id="deleteConfirmationModalLabel">Confirm Deletion</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Are you sure you want to delete this product? This action cannot be undone.
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <form id="deleteProductForm" action="${pageContext.request.contextPath}/admin/products/delete/0" method="post" style="display: inline;">
                        <button type="submit" class="btn btn-danger">Delete</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    var deleteConfirmationModal = document.getElementById('deleteConfirmationModal');
    deleteConfirmationModal.addEventListener('show.bs.modal', function (event) {
        var button = event.relatedTarget;
        var productId = button.getAttribute('data-product-id');
        var deleteForm = document.getElementById('deleteProductForm');
        deleteForm.action = '${pageContext.request.contextPath}/admin/products/delete/' + productId;
    });
    deleteConfirmationModal.addEventListener('hidden.bs.modal', function () {
        document.getElementById('deleteProductForm').action =
            '${pageContext.request.contextPath}/admin/products/delete/0';
    });
</script>
</body>
</html>
