<%-- 
    Document   : ManagerPlant
    Created on : 14 Apr 2023, 14:22:03
    Author     : 17148
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="mycss.css" type="text/css"/>
    </head>
    <body>
        <header>
            <%@include file="header_Admin.jsp" %>
        </header>
        <a style="color: red" href="MainController?action=createPlant">create</a>
                <c:set var="list" value="${requestScope.plants}"></c:set>
                <table border="1">
                    <thead>
                        <tr>
                            <th>PID</th>
                            <th>PName</th>
                            <th>Price</th>
                            <th>img</th>
                            <th>description</th>
                            <th>status</th>
                            <th>CateID</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${list}" var="p">
                        <tr>
                            <td>${p.id}</td>
                            <td>${p.name}</td>
                            <td>${p.price}</td>
                            <td><img style="width: 50px" src="${p.imgpath}"></td>
                            <td>${p.description}</td>
                            <td>${p.status}</td>
                            <td>${p.cateid}</td>
                            <td>
                                <c:url var="mylink" value="updatePlantsByAdmin.jsp">
                                    <c:param name="plantid" value="${p.id}"></c:param>
                                </c:url>
                                <a href="${mylink}">Update Plant</a>
                            </td>
                        </tr>
                    </c:forEach>
                        
                    </tbody>
                </table>
    </body>
</html>
