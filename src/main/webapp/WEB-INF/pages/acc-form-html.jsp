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
                <input name="id" type="hidden" value="${id}" />
            </c:if>
            <table>
                <tr>
                    <td><label for="fullNameId">Full Name <span style="color: red">(*)</span></label></<td>
                    <td><input id="fullNameId" name="fullName" value="${account.fullName}"/></<td>
                    <td style="color: red"><mvc:errors path="fullName" /> </td>
                </tr>
                <tr>
                    <td><label for="emailId">Email <span style="color: red">(*)</span></label></<td>
                    <td><input id="emailId" name="email" value="${account.email}"/></<td>
                    <td style="color: red"><mvc:errors path="email" /> </td>
                </tr>
                <tr>
                    <td><label for="passwordId">Password <span style="color: red">(*)</span></label></<td>
                    <td><input id="passwordId" name="password" type="password" /></<td>
                    <td style="color: red"><mvc:errors path="password" /> </td>
                </tr>
                <tr>
                    <td><label for="descriptionId">Description </label></<td>
                    <td>
                        <textarea id="descriptionId" name="description"
                                  rows="3">${account.description}</textarea>
                    </<td>
                </tr>
                <tr>
                    <td><label for="birthDateId">Birth Date </label></<td>
                    <td><input id="birthDateId" name="birthDate" type="date"
                               value="${account.birthDate}"/></<td>
                </tr>
                <tr>
                    <td> <label for="countryId">Country </label></<td>
                    <td>
                        <select name="country">
                            <c:forEach items="${countries}" var="c">
                                <c:if test="${account.country == c}">
                                    <option value="${c}" selected>${c}</option>
                                </c:if>
                                <c:if test="${account.country != c}">
                                    <option value="${c}">${c}</option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </<td>
                </tr>
                <tr>
                    <td><label>Gender </label></<td>
                    <td>
                        <c:forEach items="${genders}" var="g">
                            <c:if test="${account.gender == g}">
                                <input type="radio" name="gender" value="${g}" checked/>
                                <label>${g}</label>
                            </c:if>
                            <c:if test="${account.gender != g}">
                                <input type="radio" name="gender" value="${g}"/>
                                <label>${g}</label>
                            </c:if>
                        </c:forEach>
                    </<td>
                </tr>
                <tr>
                    <td><label>Lock? </label></<td>
                        <c:if test="${account.isLock}">
                        <td><input name="isLock" type="checkbox" checked /></<td>
                        </c:if>
                        <c:if test="${!account.isLock}">
                        <td><input name="isLock" type="checkbox" /></<td>
                        </c:if>
                </tr>
                <tr>
                    <td colspan="2"><button type="submit" >Submit</button></<td>
                </tr>
            </table>
        </mvc:form>
    </body>
</html>
