<%-- 
    Document   : header_Admin
    Created on : 13 Apr 2023, 22:48:57
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
            <ul>
                <li><a href="MainController?action=manageAccount">Manage Account</a></li>
                <li><a href="MainController?action=manageOrder">Manage Order</a></li>
                <li><a href="MainController?action=managePlants">Manage Plants</a></li>
                <li><a href="MainController?action=manageCategories">Manage Categories</a></li>
                <li style="text-align: right; color: white">Welcome ${sessionScope.name} | <a href="MainController?action=logout">Log out</a></li>
            </ul>
         
        </header>
    </body>
</html>
