<%-- 
    Document   : registration
    Created on : Apr 12, 2023, 2:18:36 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link  rel="stylesheet" href="mycss.css" type="text/css" />
    </head>
    <body >
        <header>
            <%@include file="header.jsp" %>
        </header>
        <%
            String report =(String) request.getAttribute("report");
            if (report != null) {                  
        %>
                <h1><%= report %></h1>
        <%
            }
        %>
        
        <h1 style="text-align: left; color: red">Create New Account</h1>
        <form action="MainController" method="post">
            <table>
                <tr>
                    <td>Email</td><td> <input type="text" name="Email" required=""></td>
                </tr>
                <tr>
                    <td>Full Name</td><td><input type="text" name="Name" required=""></td>
                </tr>
                <tr>
                    <td>Phone Number (10 number)</td><td> <input type="tel" name="Phone" pattern="[0-9]{10}" maxlength="10" required=""></td>
                </tr>
                <tr>
                    <td>Password</td><td><input type="password" name="Pass" required=""></td>
                </tr>
                <tr><td colspan="2"><input type="submit" value="register" name="action"></td></tr> 
            </table>
        </form>
        

        
    </body>
</html>
