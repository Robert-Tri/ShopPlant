<%-- 
    Document   : createPlants
    Created on : 14 Apr 2023, 14:48:28
    Author     : 17148
--%>

<%@page import="dao.PlantDAO"%>
<%@page import="dto.Plant"%>
<%@page import="dao.CategoriesDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Categories"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="mycss.css" type="text/css"/>
    </head>
    <body>
        <c:import url="header_Admin.jsp"/> 
        <%  
            ArrayList<Plant> plantall= PlantDAO.getAllPlants();
            ArrayList<Categories> cateall= CategoriesDAO.getAllCategories();
            String report =(String) request.getAttribute("report");
        %>
        <form action="MainController" method="post" >
            <table>
                <%
                    if (report != null) {%>
                    <h1><%= report %></h1>
                <%     
                    }
                %>
                <tr><td>Name:</td><td><input type="text" name ="txtname" required=""></td></tr>
                <tr><td>Price:</td><td><input type="text" name ="txtprice" required min="0"></td></tr>
                <tr><td>Image:</td><td><input type="text" name ="txtimage" required=""></td></tr>                  
                <tr><td>Description:</td>
                    <td><input type="text" name ="txtdescriptionupdate" required=""></td> 
                </tr>
                <tr><td>Status:</td>
                    <td>
                        <select name="txtstatus" id="txtstatus">
                            <option value="1">Availability</option>
                            <option value="0">Out of stock</option>
                        </select>
                    </td>
                </tr>
                <tr><td>Categories</td>
                    <td>
                        
                        <select name="txtcateName" id="txtcateid">
                        <%             
                            for (Categories cate : cateall) {
                        %>
                                <option value="<%= cate.getCateName() %>"><%= cate.getCateName() %></option>
                        <%
                            }
                        %>
                        </select>
                    </td>
                </tr>
                <tr><td></td><td colspan="2"><input type="submit" value ="addPlant" name="action"></td></tr>
            </table>
        </form>
                
    </body>
</html>
