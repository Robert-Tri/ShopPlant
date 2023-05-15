<%-- 
    Document   : ManageAccount
    Created on : 13 Apr 2023, 22:52:44
    Author     : 17148
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="mycss.css" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <header>
            <%@include file="header_Admin.jsp" %>
        </header>
        <form action="MainController">
            <input type="text" name="txtSearch">
            <input type="submit" value="searchAccount" name="action">
        </form>
        <table class="order">
            <tr>
                <th> ID </th>
                <th> Email </th>
                <th> Full name </th>
                <th> status </th>
                <th> phone </th>
                <th> role </th>
                <th> action </th>
            </tr>
            <h1></h1>
            
            <c:set var="kq" value="${requestScope.emailsearch}"/>
            <c:if test="${kq == null}">
                <c:set var="list" value="${requestScope.accountList}"/>
            </c:if>
            <c:if test="${kq != null}">
                <c:set var="list" value="${requestScope.emailsearch}"/>
            </c:if>
            
            <c:forEach items="${list}" var="acc">
                <tr><th><c:out value="${acc.getAccID()}"></c:out></th>
                    <th><c:out value="${acc.getEmail()}"></c:out></th>
                    <th><c:out value="${acc.getFullname()}"></c:out></th>
                    <th><c:choose>
                            <c:when test="${acc.getStatus() eq 1}"> active </c:when>
                            <c:otherwise> inActive</c:otherwise>
                        </c:choose>
                    </th>
                    <th><c:out value="${acc.getPhone()}"></c:out></th>
                    <th><c:choose>
                            <c:when test="${acc.getRole().equals('AD')}"> admin </c:when>
                            <c:otherwise> user </c:otherwise>
                        </c:choose>
                    </th>
                    <th>
                        <c:if test="${acc.getRole().equals('US')}">
                            <c:url value="MainController" var="mylink">
                                <c:param value="${acc.getEmail()}" name="email"></c:param>
                                <c:param value="${acc.getStatus()}" name="status"></c:param>
                                <c:param name="action" value="updateStatusAccount"></c:param>
                            </c:url>
                            <a href="${mylink}" style="color: black">Block/UnBlock</a>
                        </c:if>
                    </th>
                </tr>
            </c:forEach>
        </table>    
    </body>
</html>
