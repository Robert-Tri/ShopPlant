<%-- 
    Document   : orderDetail
    Created on : Apr 18, 2023, 8:04:05 PM
    Author     : ADMIN
--%>

<%@page import="dao.OrderDAO"%>
<%@page import="dto.OrderDetail"%>
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
            <h3>Welcome <%= name%> come back</h3>
            <h3><a href="MainController?action=logout">Logout</a></h3>
            <a href="homePage.jsp">View all orders</a>
        </section>
        <section>
            <%
                String orderid = request.getParameter("orderid");
                if (orderid != null) {
                    int orderID = Integer.parseInt(orderid.trim());
                    ArrayList<OrderDetail> list = OrderDAO.getOrderDetail(orderID);
                    if (list != null && !list.isEmpty()) {
                        int money = 0;
                        for (OrderDetail detail : list) {
            %>
                            <table class="order">
                                <tr><td>Order ID</td><td>Plant ID</td><td>Plant Name</td><td>Image</td><td>quantity</td></tr>
                                <tr><td><%= detail.getOrderID()%></td><td><%= detail.getPlantID()%></td>
                                    <td><%= detail.getPlantName()%></td>
                                    <td><img src="<%= detail.getImgPath()%>" class="plantimg"/> <br/> <%= detail.getPrice()%></td>
                                    <td><%= detail.getQuantity()%></td>
                                    <% money = money + detail.getPrice() * detail.getQuantity(); %>
                                </tr>
                            </table>
            <%
                        }//end for %>
            <h3> Total money: <%= money%> VND</h3>
            <%      }//end if
                    else {
            %>
            <p>You don't have any order</p>
            <%
                    }
                }//end if
        }
            %>
        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
