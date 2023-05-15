<%-- 
    Document   : viewOrders
    Created on : Apr 18, 2023, 7:57:32 PM
    Author     : ADMIN
--%>

<%@page import="dao.OrderDAO"%>
<%@page import="dto.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String name = (String) session.getAttribute("name");
            String email = (String) session.getAttribute("email");
            if(email != null){
        %>
        <header>
            <%@include file="header_loginedUser.jsp" %>
        </header>
        <section>
            <h3>Welcome <%= name%> come back</h3>
            <h3><a href="MainController?action=logout">Logout</a></h3>
        </section>
        <section> <!-- load all orders of the user at here -->
            <%
                ArrayList<Order> list = OrderDAO.getOrders(email);
                String[] status = {"", "processing", "completed", "canceled"};
                int or = Integer.parseInt(request.getParameter("or"));
                if (list != null && !list.isEmpty()) {
                    for (Order ord : list) {
                        if (or==ord.getStatus()) {
                                
                            
            %>
                    <table class="order">
                        <tr><td>Order ID</td><td>Order Date</td><td>Ship Date</td><td>Order's status</td><td>action</td></tr>
                        <tr>
                            <td><%= ord.getOrderID() %></td>
                            <td><%= ord.getOrderDate() %></td>
                            <td><%= ord.getShipDate()%></td>
                            <td><%= status[ord.getStatus()] %>
                                <br/><% if(ord.getStatus()==1) {%><a href="MainController?action=updateStatusOrder&orderid=<%= ord.getOrderID() %>&status=<%= ord.getStatus()%>">cancel order</a>
                                <%} else if(ord.getStatus()==3) {%><a href="MainController?action=updateStatusOrder&orderid=<%= ord.getOrderID() %>&status=<%= ord.getStatus()%>">order again</a><%}%>
                            </td>
                            <td><a href="orderDetail.jsp?orderid=<%= ord.getOrderID() %>">detail</a></td>
                        </tr>
                    </table>
            <%          }
                    }
                }
                else {
            %>
            <p>You don't have any order</p>
            <%
                }         
            }
            %>
        </section>         
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
