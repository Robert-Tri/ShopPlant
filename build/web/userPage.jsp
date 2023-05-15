<%-- 
    Document   : userPage
    Created on : Apr 11, 2023, 10:25:15 PM
    Author     : ADMIN
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
            if (name == null) {
        %>
        <p><font color='red'>you must login to view personal page</font></p>
        <p></p>
        <%
        } else {
        %>
        <header>
            <%@include file="header_loginedUser.jsp" %>
        </header>
        <section>
            <h3>Welcome <%= name%> come back </h3>
            <!--            <form action="logoutServlet">
                            <input type="submit" value="logout">
                        </form>-->
            <h3><a href="MainController?action=logout">Logout</a></h3>
        </section>
        <section> <!-- load all orders of the user at here -->
            <%
                Date datenow = new Date();
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                String date = dateFormat.format(datenow);
                
                String from = request.getParameter("from");
                String to = request.getParameter("to");
                ArrayList<Order> list = new ArrayList<>();
                
                if ((from == null || from.isEmpty()) && (to == null || to.isEmpty())) {                
                    list = OrderDAO.getOrders(email);
                } else if (to == null || to.isEmpty()) {
                    list = OrderDAO.getOrdersByDate(email, from, date);
                } else if (from == null || from.isEmpty()) {
                    list = OrderDAO.getOrdersByDate(email, from, to);
                } else {                
                    list = OrderDAO.getOrdersByDate(email, from, to);
                }
                
                String[] status = {"", "processing", "completed", "canceled"};
                if (list != null && !list.isEmpty()) {
                    for (Order ord : list) {
        %>
                    <table class="order">
                        <tr><td>Order ID</td><td>Order Date</td><td>Ship Date</td><td>Order's status</td><td>action</td></tr>
                        <tr>
                            <td><%= ord.getOrderID() %></td>
                            <td><%= ord.getOrderDate() %></td>
                            <td><%= ord.getShipDate() %></td>
                            <td><%= status[ord.getStatus()] %>
                                <br/><% if(ord.getStatus()==1) {%><a href="MainController?action=updateStatusOrder&orderid=<%= ord.getOrderID() %>&status=<%= ord.getStatus()%>">cancel order</a>
                                <%} else if(ord.getStatus()==3) {%><a href="MainController?action=updateStatusOrder&orderid=<%= ord.getOrderID() %>&status=<%= ord.getStatus()%>">order again</a><%}%>
                            </td>
                            <td><a href="orderDetail.jsp?orderid=<%= ord.getOrderID() %>">detail</a></td>
                        </tr>
                    </table>
        <%               }
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
