<%-- 
    Document   : createCategory
    Created on : Apr 18, 2023, 9:18:41 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link  rel="stylesheet" href="mycss.css" type="text/css" />
        <title>AddCategories Page</title>
    </head>
    <body>
        <c:import url="header_Admin.jsp"/> 
        
        <h1>Add Categories</h1>
        <form action="MainController" method="post">
            <table>
                <tr><td>Name Categories:</td><td><input type="text" name ="txtnameCategories" required=""></td></tr>
                <tr><td></td><td colspan="2"><input type="submit" value ="addCategory" name="action"></td></tr>
            </table>
        </form>
        <%
            String report = (String) request.getAttribute("report");
            if (report != null) {
        %>
                <h1><%= report %></h1>
        <%
            }
        %>
    </body>
</html>
