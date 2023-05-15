<%-- 
    Document   : updateCategoriesByAdmin
    Created on : Apr 18, 2023, 9:14:21 PM
    Author     : ADMIN
--%>

<%@page import="dao.CategoriesDAO"%>
<%@page import="dto.Categories"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link  rel="stylesheet" href="mycss.css" type="text/css" />
        <title>UpdateCategories Page</title>
    </head>
    <body>
        <c:import url="header_Admin.jsp"/> 
        
        <%
            int cateid = Integer.parseInt(request.getParameter("cateid"));
            Categories cate = CategoriesDAO.getCategories(cateid);
            String report =(String) request.getAttribute("report");
        %>
        <form action="MainController?cateid=<%= cateid %>" method="post">
            <table>
                <%
                    if (report != null) {%>
                    <h1><%= report %></h1>
                <%     
                    }
                %>
                <h1>Information Categories</h1>   
                <tr><td>ID:</td><td><%= cate.getCateID() %></td></tr>
                <tr><td>Name:</td><td><%= cate.getCateName() %></td><td><input type="text" name ="txtnameCategories"></td></tr>
                <tr><td></td><td></td><td colspan="2"><input type="submit" value ="updateCategories" name="action"></td></tr>
            </table>
        </form>
    </body>
</html>
