<%-- 
    Document   : account-form
    Created on : Jun 6, 2022, 8:32:38 PM
    Author     : ldanh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" 
          prefix="mvc" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Register</h2>
        <mvc:form action="${pageContext.request.contextPath}/result" 
                  method="post" modelAttribute="account">
            <c:if test="${action == 'update'}" >
                <mvc:input path="id" type="hidden" />
            </c:if>
            <table>
                <tr>
                    <td><mvc:label path="fullName">Full Name </mvc:label></<td>
                    <td><mvc:input path="fullName" /></<td>
                </tr>
                <tr>
                    <td><mvc:label path="email">Email </mvc:label></<td>
                    <td><mvc:input path="email" /></<td>
                </tr>
                <tr>
                    <td><mvc:label path="password">Password </mvc:label></<td>
                    <td><mvc:password path="password" /></<td>
                </tr>
                <tr>
                    <td><mvc:label path="description">Description </mvc:label></<td>
                    <td><mvc:textarea path="description" /></<td>
                </tr>
                <tr>
                    <td><mvc:label path="birthDate">Birth Date </mvc:label></<td>
                    <td><mvc:input path="birthDate" type="date" /></<td>
                </tr>
                <tr>
                    <td> <mvc:label path="country">Country </mvc:label></<td>
                    <td><mvc:select path="country" items="${countries}" /></<td>
                </tr>
                <tr>
                    <td><mvc:label path="gender">Gender </mvc:label></<td>
                    <td><mvc:radiobuttons path="gender" items="${genders}" /></<td>
                </tr>
                <tr>
                    <td><mvc:label path="isLock">Lock? </mvc:label></<td>
                    <td><mvc:checkbox path="isLock" /></<td>
                </tr>
                <tr>
                    <td colspan="2"><mvc:button type="submit" >Submit</mvc:button></<td>
                    </tr>
                </table>
        </mvc:form>
    </body>
</html>
