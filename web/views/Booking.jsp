<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }
        .container {
            margin-top: 50px;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }
        .check-date {
            font-weight: bold;
            font-size: 1.5rem;
            color: #007bff;
            margin-bottom: 20px;
            display: block;
        }
        .table {
            margin-top: 20px;
        }
        .table th,
        .table td {
            vertical-align: middle;
        }
        .table-striped tbody tr:hover {
            background-color: #f1f3f5;
        }
        .status-booked {
            background-color: #dc3545;
            color: white;
            padding: 0.5rem 1rem;
            border-radius: 0.25rem;
            display: inline-block;
        }
        .status-available {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 0.5rem 1rem;
            border-radius: 0.25rem;
            display: inline-block;
            cursor: pointer;
        }
        .modal-header {
            background-color: #007bff;
            color: white;
        }
        .modal-content {
            border-radius: 10px;
            overflow: hidden;
        }
        .btn-close {
            color: white;
            opacity: 1;
        }
        .modal-footer .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }
    </style>
</head>
<body>
    <%@include file="/components/header.jsp"%>
    <div class="container">
        <span class="check-date">Check Date: ${checkDate}</span>
        <h2>Field Time Schedule</h2>
        <form action="booking" method="get" class="row g-3 align-items-center mb-4">
            <div class="col-auto">
                <label for="checkDate" class="col-form-label">Choose date to check status:</label>
            </div>
            <div class="col-auto">
                <input type="date" id="checkDate" name="checkDate" class="form-control" value="${checkDate}">
            </div>
            <div class="col-auto">
                <button type="submit" class="btn btn-primary">Check</button>
            </div>
        </form>

        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Field ID</th>
                    <th>Start Time</th>
                    <th>End Time</th>
                    <th>Price</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="fieldTime" items="${fieldTimelist}">
                    <tr>
                        <td>${fieldTime.fieldId}</td>
                        <td>${fieldTime.startTime}</td>
                        <td>${fieldTime.endTime}</td>
                        <td>${fieldTime.price}</td>
                        <c:set var="isBooked" value="false" />
                        <c:forEach var="book" items="${listAllFieldTimeOnDay}">
                            <c:if test="${book.fieldTimeId == fieldTime.fieldTimeId}">
                                <c:set var="isBooked" value="true" />
                            </c:if>
                        </c:forEach>
                        <td>
                            <c:choose>
                                <c:when test="${isBooked}">
                                    <span class="status-booked">Booked</span>
                                </c:when>
                                <c:otherwise>
                                    <button type="button" class="status-available" data-bs-toggle="modal" data-bs-target="#fieldInfoModal${fieldTime.fieldTimeId}">
                                        Available
                                    </button>

                                    <!-- Modal -->
                                    <div class="modal fade" id="fieldInfoModal${fieldTime.fieldTimeId}" tabindex="-1" aria-labelledby="fieldInfoModalLabel${fieldTime.fieldTimeId}" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="fieldInfoModalLabel${fieldTime.fieldTimeId}">Field Details</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <form id="bookNowForm${fieldTime.fieldId}" action="fieldtimeorder" method="post">
                                                    <div class="modal-body">
                                                        <p><strong>ID:</strong> ${fieldTime.fieldTimeId}</p>
                                                        <p><strong>Field ID:</strong> ${fieldTime.fieldId}</p>
                                                        <p><strong>Start Time:</strong> ${fieldTime.startTime}</p>
                                                        <p><strong>End Time:</strong> ${fieldTime.endTime}</p>
                                                        <p><strong>Price:</strong> ${fieldTime.price}</p>
                                                        <input type="hidden" name="checkDate" value="${checkDate}" />
                                                        <input type="hidden" name="fieldId" value="${fieldTime.fieldTimeId}" />
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="submit" class="btn btn-primary">
                                                            Book Now
                                                        </button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </td>
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
