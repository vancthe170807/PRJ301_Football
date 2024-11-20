<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin - Manage Users</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <style>
            body {
                background-color: #f8f9fa;
                font-family: Arial, sans-serif;
            }
            .container {
                margin-top: 50px;
                background-color: #ffffff;
                padding: 30px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            h2 {
                text-align: center;
                margin-bottom: 30px;
                font-weight: bold;
                color: #343a40;
            }
            .table {
                width: 100%;
                color: #212529;
                border-collapse: separate;
                border-spacing: 0 0.5rem;
            }
            .table th,
            .table td {
                padding: 1.5rem; /* Increased padding for better readability */
                vertical-align: middle; /* Center align text vertically */
                border: none;
                background-color: #ffffff;
                border-radius: 5px;
                box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
            }
            .table thead th {
                background-color: #e9ecef;
                font-weight: bold;
                color: #495057;
            }
            .btn-primary {
                background-color: #007bff;
                border-color: #007bff;
            }
            .btn-update {
                background-color: #6c757d;
                border-color: #6c757d;
                margin-right: 10px;
            }
            .btn-update:hover {
                background-color: #5a6268;
                border-color: #545b62;
            }
            .btn-close {
                border: none;
                color: #6c757d;
                font-size: 1.5rem;
            }
            .modal-header {
                border-bottom: 1px solid #dee2e6;
            }
            .modal-footer {
                border-top: 1px solid #dee2e6;
            }
        </style>
    </head>
    <body>
        <%@include file="/components/header.jsp"%>
        <div class="container">
            <h2>Manage Users</h2>
            <table class="table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Username</th>
                        <th>Phone</th>
                        <th>Email</th>
                        <th>Address</th>
                        <th>Role</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="user" items="${getAllUser}">
                        <tr>
                            <td>${user.user_id}</td>
                            <td>${user.username}</td>
                            <td>${user.phone}</td>
                            <td>${user.email}</td>
                            <td>${user.address}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${user.role eq 1}">
                                        Admin
                                    </c:when>
                                    <c:when test="${user.role eq 2}">
                                        Customer
                                    </c:when>
                                    <c:when test="${user.role eq 3}">
                                        Staff
                                    </c:when>
                                </c:choose>
                            </td>
                            <td>Active</td>
                            <td>
                                <c:if test="${sessionScope.currentUser.role == 1}">
                                    <c:if test="${user.role != 1}">
                                        <button class="btn btn-update" data-id="${user.user_id}" data-role="${user.role}">Update</button>
                                    </c:if>
                                </c:if>
                                <c:if test="${sessionScope.currentUser.role == 3}">
                                    <a href="viewdetailuser?customerid=${user.user_id}" class="btn btn-primary">View History</a>
                                </c:if>
                            </td>
                        </tr>
                        <!-- Update Modal -->
                        <div class="modal fade" id="updateModal_${user.user_id}" tabindex="-1" aria-labelledby="updateModalLabel_${user.user_id}" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="updateModalLabel_${user.user_id}">Update User Role</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form id="updateForm_${user.user_id}" method="post" action="updaterole">
                                            <input type="hidden" name="user_id" value="${user.user_id}">
                                            <div class="mb-3">
                                                <label for="userRole_${user.user_id}" class="form-label">Role</label>
                                                <c:choose>
                                                    <c:when test="${user.role == 2}">
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="radio" id="userRole_${user.user_id}_staff" name="role" value="3" checked>
                                                            <label class="form-check-label" for="userRole_${user.user_id}_staff">Staff</label>
                                                        </div>
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="radio" id="userRole_${user.user_id}_admin" name="role" value="1">
                                                            <label class="form-check-label" for="userRole_${user.user_id}_admin">Admin</label>
                                                        </div>
                                                    </c:when>
                                                    <c:when test="${user.role == 3}">
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="radio" id="userRole_${user.user_id}_admin" name="role" value="1" checked>
                                                            <label class="form-check-label" for="userRole_${user.user_id}_admin">Admin</label>
                                                        </div>
                                                    </c:when>
                                                </c:choose>
                                            </div>
                                            <button type="submit" class="btn btn-primary">Save changes</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- End Modal -->
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                var updateButtons = document.querySelectorAll('.update-btn');
                updateButtons.forEach(function (button) {
                    button.addEventListener('click', function () {
                        var userId = button.getAttribute('data-id');
                        var userRole = button.getAttribute('data-role');

                        // Hide any open modals first
                        var modals = document.querySelectorAll('.modal');
                        modals.forEach(function (modal) {
                            var bsModal = bootstrap.Modal.getInstance(modal);
                            if (bsModal) {
                                bsModal.hide();
                            }
                        });

                        // Show the modal for the clicked button
                        var updateModal = new bootstrap.Modal(document.getElementById('updateModal_' + userId));
                        updateModal.show();

                        // Set the initial role value in the modal
                        document.getElementById('userRole_' + userId).value = userRole;
                    });
                });
            });
        </script>
    </body>
</html>
