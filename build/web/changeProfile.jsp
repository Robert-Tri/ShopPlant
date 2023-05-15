<%-- 
    Document   : changeProfile
    Created on : Apr 18, 2023, 7:32:21 PM
    Author     : ADMIN
--%>

<%@page import="dao.AccountDAO"%>
<%@page import="dto.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%  String report =(String) request.getAttribute("report");
            String name = (String) session.getAttribute("name");
            String email = (String) session.getAttribute("email");
            String password = (String) session.getAttribute("password");
            //show content if login=true;
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
                Account acc = AccountDAO.getAccount(email, password);
            %>
            <form action="MainController?fullname_old=<%= acc.getFullname() %>&phone_old=<%= acc.getPhone() %>" method = "post">
                <table>     
                    <h2><%= report %></h2>
                    <h1>Information User</h1>
                    <tr><td>Email:</td><td><%= acc.getEmail() %></td></tr>
                    <tr><td>Full Name:</td><td><%= acc.getFullname() %></td><td><input type="text" name ="txtfullnameupdate"></td></tr>
                    <tr><td>Phone (10 number):</td><td><%= acc.getPhone() %></td><td><input type="number" name ="txtphoneupdate"></td></tr>
                    <tr><td></td><td></td><td colspan="2"><input type="submit" value ="updateProfileAccount" name="action"></td></tr>
                </table>
            </form>
            <%               
            }
            %>
        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
