<%@ page import="com.example.buoi4.entity.UserEntity" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 5/25/2023
  Time: 8:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List User</title>
  </head>
<body>
<table border="1" style="width: 100%">
    <tr>
        <th style="width: 40%">Name</th>
        <th style="width: 20%">Age</th>
        <th style="width: 30%">Address</th>
        <th style="width: 10%">Option</th>
    </tr>

        <%
            List<UserEntity> listUser = (List<UserEntity>)request.getAttribute("listUser");
            for(UserEntity u : listUser) {
        %>
    <tr>
        <td ><%= u.getName()%></td>
        <td ><%= u.getAge()%></td>
        <td ><%= u.getAddress()%></td>
<%--        <td >--%>
<%--            <a href="updateUser.jsp" style="text-decoration: none ; color: red" , >Update</a>--%>
<%--            <a href="deleteUser.jsp" style="color: black ; text-decoration: none">Delete</a>--%>
<%--        </td>--%>
        <td>
<%--        <a href="${pageContext.request.contextPath}/users?action=edit&id=${user.id}">Edit</a>--%>
<%--        <a href="${pageContext.request.contextPath}/users?action=delete&id=${user.id}">Delete</a>--%>
    </td>
    </tr>
    <%
        }
    %>
</table>
</body>
</html>
