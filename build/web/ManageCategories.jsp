<%-- 
    Document   : ManageCategories
    Created on : Apr 18, 2023, 9:11:20 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link  rel="stylesheet" href="mycss.css" type="text/css" />
        <title>ManageCategories Page</title>
    </head>
    <body>
        <c:import url="header_Admin.jsp"/> 
        
        <a href="createCategory.jsp">__Add Categories__</a>                      

        
        <h1></h1>
        <table class="order">
            <tr><th> ID</th>
                <th> Name</th>
                <th> Action</th>
            </tr>

            <c:set var="listCategories" value="${requestScope.listCategories}"/>      
            
            <c:forEach var="cate" items="${listCategories}">
                <tr><th><c:out value="${cate.getCateID()}"></c:out></th>
                    <th><c:out value="${cate.getCateName()}"></c:out></th>
                    <th>
                        <c:url var="mylink" value="updateCategoriesByAdmin.jsp">
                            <c:param name="cateid" value="${cate.getCateID()}"></c:param>
                            <c:param name="action" value="updateCategories"></c:param>
                        </c:url>
                        <a href="${mylink}">Update Categories</a>                       
                    </th>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
