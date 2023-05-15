<%-- 
    Document   : updatePlantsByAdmin
    Created on : Mar 14, 2023, 5:31:17 PM
    Author     : ADMIN
--%>


<%@page import="dao.CategoriesDAO"%>
<%@page import="dto.Categories"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.PlantDAO"%>
<%@page import="dto.Plant"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link  rel="stylesheet" href="mycss.css" type="text/css" />
        <title>UpdatePlants Page</title>
    </head>
    <body>
        <c:import url="header_Admin.jsp"/> 
        
        <%
            int plantid = Integer.parseInt(request.getParameter("plantid"));
            Plant pla = PlantDAO.getPlant(plantid);
            ArrayList<Plant> plantall= PlantDAO.getAllPlants();
            ArrayList<Categories> cateall= CategoriesDAO.getAllCategories();
            String report =(String) request.getAttribute("report");
        %>
        <form action="MainController?plantid=<%= plantid %>" method="post">
            <table>
                <%
                    if (report != null) {%>
                    <h1><%= report %></h1>
                <%     
                    }
                %>
                <h1>Information Plant</h1>   
                <tr><td>ID:</td><td><%= pla.getId() %></td></tr>
                <tr><td>Name:</td><td><%= pla.getName() %></td><td><input type="text" name ="txtnameupdate"></td></tr>
                <tr><td>Image:</td><td><img src="<%= pla.getImgpath() %>" class="plantimg"></td><td><input type="text" name ="txtimageupdate"></td></tr>
                <tr><td>Price:</td><td><%= pla.getPrice() %></td><td><input type="text" name ="txtpriceupdate"></td></tr>
                <tr><td>Categories:</td><td><%= pla.getCatename() %></td>
                    <td>                   
                        <select name="txtcategoriesupdate" id="txtcategoriesupdate">
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
                <tr><td>Description:</td><td><%= pla.getDescription() %></td>
                    <td><input type="text" name ="txtdescriptionupdate"></td>                        
                    
                </tr>
                <tr><td>Status:</td>
                    <% if(pla.getStatus() == 1){ %>
                    <td>Availability</td>
                    <% } else %> <td>Out of stock</td>
                    
                    <td>
                        <select name="txtstatussupdate" id="txtstatussupdate">
                            <option value="1">Availability</option>
                            <option value="0">Out of stock</option>
                        </select>
                    </td>
                
                </tr>
                <tr><td colspan="2"><input type="submit" value ="updatePlants" name="action"></td></tr>
            </table>
        </form>
    </body>
</html>
