<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
    </head>
    <body>
        <h3>Accounts</h3>
        <button onclick="location.href = '<c:url value="/register"/>'">Add Account</button>
        <table>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Birth Date</th>
                <th>Gender</th>
                <th>Country</th>
                <th>Lock</th>
                <th>Action</th>
            </tr>

            <c:forEach items="${accounts}" var="acc">
                <tr>
                    <td>${acc.fullName}</td>
                    <td>${acc.email}</td>
                    <td>${acc.birthDate}</td>
                    <td>${acc.gender}</td>
                    <td>${acc.country}</td>
                    <td>${acc.isLock}</td>
                    <td>
                        <button onclick="location.href = '<c:url value="/update/${acc.id}"/>'">Update</button>
                        <button onclick="location.href = '<c:url value="/delete/${acc.id}"/>'">Delete</button>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
