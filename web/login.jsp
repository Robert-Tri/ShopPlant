<%-- 
    Document   : login
    Created on : Apr 11, 2023, 1:18:23 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link  rel="stylesheet" href="mycss.css" type="text/css" />
        <title>JSP Page</title>
    </head>
    <body>
        <header>
            <%@include file="header.jsp" %>
        </header>
        <h1 style="text-align: left; color: red">Login Account</h1>
        <h2>${requestScope.report}</h2>
        <section>
            
            <form action="MainController" method = "post" class="formlogin">
                <table>
                    <tr>
                        <td>Email</td>
                        <td><input type="text" name ="txtemail" required=""></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name ="txtpassword" required=""></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit" value ="login" name="action"></td>
                    </tr>
                </table>
            </form>
        </section>    
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
        
    </body>
</html>
