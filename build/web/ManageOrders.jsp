<%-- 
    Document   : ManageOrders
    Created on : Mar 12, 2023, 6:39:37 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link  rel="stylesheet" href="mycss.css" type="text/css" />
        <title>ManageOrders Page</title>
    </head>
    <body>
        <c:import url="header_Admin.jsp"/> 

        <form action="manageOrdersServlet" method="post" class="formsearch">
            <li>
                <input type="text" name="txtsearch">
                <input type="submit" value="SearchByEmail" name="action">
            </li>        
        </form>
                
        <br>
        
        <form action="manageOrdersServlet" method="get">
            <li>
                From <input type="date" name="from"> to <input type="date" name="to">
                    <input type="submit" value="searchDate" name="action">                   
            </li>
        </form>
        
        <h1></h1>
        <table class="order">
            <tr><th> Email User</th>
                <th> Order ID</th>
                <th> Order Date</th>
                <th> Ship Date</th>
                <th> Order's status</th>
                <th> Action</th>
            </tr>

            <c:set var="listOrders" value="${requestScope.ordersList}"/>
            <c:set var="listAccounts" value="${requestScope.accountsList}"/>
            
            
            
            <c:forEach var="ord" items="${listOrders}">
                <tr><th>
                        <c:forEach var="acc" items="${listAccounts}">
                            <c:if test="${ord.getAccID() eq acc.getAccID()}">
                                <c:out value="${acc.getEmail()}"></c:out>
                            </c:if>
                        </c:forEach>                                      
                    </th>
                    <th><c:out value="${ord.getOrderID ()}"></c:out></th>
                    <th><c:out value="${ord.getOrderDate()}"></c:out></th>
                    <th><c:out value="${ord.getShipDate()}"></c:out></th>
                    <th><c:choose >
                            <c:when test="${ord.getStatus() eq 1}"> processing</c:when>
                            <c:when test="${ord.getStatus() eq 2}"> completed</c:when>
                            <c:when test="${ord.getStatus() eq 3}"> canceled</c:when>
                        </c:choose>
                    </th>
                    <th><c:if test="${(ord.getStatus() eq 1)}">
                            <c:url var="mylink" value="MainController">
                                <c:param name="orderid" value="${ord.getOrderID()}"></c:param>
                                <c:param name="status" value="${ord.getStatus()}"></c:param>
                                <c:param name="action" value="updateStatusOrder"></c:param>
                            </c:url>
                            <a href="${mylink}">Cancel order</a>
                        </c:if>
                        
                    </th>
                </c:forEach>
            </table>
        </body>
</html>
