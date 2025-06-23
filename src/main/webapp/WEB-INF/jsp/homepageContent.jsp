<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<style>
/* Basic styling */
.container-fluid {
    padding: 20px;
}

.card {
    transition: transform 0.2s;
    box-shadow: 0 4px 8px rgba(0,0,0,0.1);
}

.card:hover {
    transform: translateY(-5px);
}

.card-header {
    background-color: #f8f9fa;
    border-bottom: 2px solid #dee2e6;
}

.card-title {
    color: #2c3e50;
    font-weight: 600;
}

.btn-primary {
    background-color: #3498db;
    border: none;
}

.btn-primary:hover {
    background-color: #2980b9;
}

.btn-secondary {
    background-color: #95a5a6;
    border: none;
}

.image-wrapper img {
    border-radius: 4px;
    transition: opacity 0.2s;
}

.image-wrapper img:hover {
    opacity: 0.9;
}

.modal-content {
    border-radius: 8px;
}

.modal-header {
    background-color: #f8f9fa;
}

/* Stats boxes styling */
.bg-light.border.rounded {
    padding: 15px;
    transition: background-color 0.2s;
}

.bg-light.border.rounded:hover {
    background-color: #e9ecef;
}

/* Search form styling */
.form-control {
    border-radius: 4px;
    border: 1px solid #ced4da;
}

.form-control:focus {
    border-color: #3498db;
    box-shadow: 0 0 0 0.2rem rgba(52,152,219,0.25);
}

</style>

[REST OF THE ORIGINAL CODE REMAINS THE SAME]
