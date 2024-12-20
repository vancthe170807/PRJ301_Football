<%-- 
    Document   : FieldOrderHistory
    Created on : Jul 8, 2024, 3:59:11 PM
    Author     : rg
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Field Order History</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <style>
            .container {
                margin-top: 30px;
            }
            .table {
                width: 100%;
                margin-bottom: 1rem;
                color: #212529;
            }
            .table th,
            .table td {
                padding: 2rem; /* Increased padding for better readability */
                vertical-align: middle; /* Center align text vertically */
                border-top: 1px solid #dee2e6;
                height: 50px;
            }
            .table thead th {
                vertical-align: middle; /* Center align text vertically */
                border-bottom: 2px solid #dee2e6;
            }
            .table-striped tbody tr:nth-of-type(odd) {
                background-color: rgba(0, 0, 0, 0.05);
            }
            .table-striped tbody tr:hover {
                background-color: rgba(0, 0, 0, 0.075);
            }
        </style>
    </head>
    <body>
        <%@include file="/components/header.jsp"%>
        <div style="height: 50px"></div>
        <div class="container">
            <h2 style="text-align: center;padding:10px">Field Order History</h2>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Field Name</th>
                        <th>Start Time</th>
                        <th>End Time</th>
                        <th>Price</th>
                        <th>Location</th>
                        <th>Order Date</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="order" items="${getHistoryBooking}">
                        <tr>
                            <td>${order.fieldName}</td>
                            <td>${order.startTime}</td>
                            <td>${order.endTime}</td>
                            <td>${order.price}</td>
                            <td>${order.location}</td>
                            <td>${order.orderDate}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
    </body>
</html>
