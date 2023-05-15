<%-- 
    Document   : homePage
    Created on : Apr 13, 2023, 4:25:43 PM
    Author     : ADMIN
--%>

<%@page import="dao.PlantDAO"%>
<%@page import="dto.Plant"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <h1 style="text-align: left; color: red">Home Page</h1>
        <section>
            <%
                String report = (String) request.getAttribute("report");
                if (report != null) {
            %>
                    <h2><%= report %></h2>
            <%            
                }
            %>
            <%
            String keyword = request.getParameter("txtsearch");
            String searchby = request.getParameter("searchby");
            String[] tmp = {"Out of stock", "Available"};
            ArrayList<Plant> list = null;
            if (keyword==null && searchby==null){  //when the page is loaded, all product is displayed
                   list = PlantDAO.getPlants("","");
            }
            else {
                list = PlantDAO.getPlants(keyword, searchby);
            }
            
                if (list!=null && !list.isEmpty()) {
                    for (Plant p : list) {
            %>
                       <table class="product">
                           <tr>
                               <td><img src='<%= p.getImgpath()%>' class="plantimg"></td>
                               <td>Product ID: <%= p.getId() %></td>
                               <td>Product name: <%= p.getName() %></td>
                               <td>Price: <%= p.getPrice() %></td>
                               <td>Status: <%= tmp[p.getStatus()] %></td>
                               <td>Category: <%= p.getCatename() %> </td>
                               <td><a href="MainController?action=addtocart&pid=<%= p.getId() %>&img=<%= p.getImgpath()%>" style="color: gold">Add to cart</a></td>
                           </tr>
                       </table>
            <%
                    }
               } else {
            %>
                    <h2>Not found !!</h2>
            <%
                }
            %>
        </section>                         
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
