<%-- 
    Document   : header_loginedUser
    Created on : Apr 16, 2023, 6:08:32 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="mycss.css" type="text/css" />
        <title>JSP Page</title>
    </head>
    <body>
        <nav>
            <ul>
                <li><a href="homePage.jsp">Home</a></li>
                <li><a href="changeProfile.jsp">Change Profile</a></li>
                <li><a href="viewOrders.jsp?or=<%= 2 %>">Completed Orders</a></li>
                <li><a href="viewOrders.jsp?or=<%= 3 %>">Canceled Orders</a></li>
                <li><a href="viewOrders.jsp?or=<%= 1 %>">Processing Orders</a></li>
                <form action="userPage.jsp"><li>From<input type="date" name="from"> To <input type="date" name="to">
                <input type="submit" value="Search" name="action"></form>
            </li>
        </ul>
        </nav>
    </body>
</html>
