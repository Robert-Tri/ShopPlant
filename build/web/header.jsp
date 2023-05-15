<%-- 
    Document   : header
    Created on : Apr 11, 2023, 1:20:43 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link  rel="stylesheet" href="mycss.css" type="text/css" />
        <title>JSP Page</title>
    </head>
    <body>
        <header>
            <nav>
                <ul>
                    <li><a href="homePage.jsp"><img src="img/logo.png" width="80" ></a> </li>
                    <li><a href="homePage.jsp">Home</a></li>
                    <li><a href="registration.jsp">Register</a></li>
                    <li><a href="login.jsp" >Login</a></li>
                    <li><a href="MainController?action=viewcart" >View cart</a></li> 
                    <li>
                        <form action="MainController" method="post" class="formsearch">
                            <input type="text" name="txtsearch" value="<%= (request.getParameter("txtsearch")==null)?"":request.getParameter("txtsearch") %>">
                            <select name="searchby">
                                <option value="byname">by name</option>
                                <option value="bycate">by category</option>
                            </select>
                            <input type="submit" value="search" name="action">
                        </form>
                    </li>
                </ul>
            </nav>
            
        </header>
    </body>
</html>
