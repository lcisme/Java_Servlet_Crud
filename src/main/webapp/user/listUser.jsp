<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 5/27/2023
  Time: 7:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>List User</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>
<body>

<h1 style="text-align: center; color: Red; text-decoration: none"><a href=user/createUser.jsp>Create</a></h1>
<h1>List User</h1>
<jsp:useBean id="listUser" type="java.util.List" scope="request"/>
<table class="table">
    <thead>
    <tr>
        <th scope="col">STT</th>
        <th scope="col">Name</th>
        <th scope="col">Age</th>
        <th scope="col">Address</th>
        <th scope="col">Option</th>
    </tr>
    </thead>
    <tbody>
    <c:choose>
    <c:when test="${listUser.size() > 0}">
        <c:forEach items="${listUser}" var="user" varStatus="loop">
            <tr>
                <th scope="row">${loop.index + 1}</th>
                <td>${user.name}</td>
                <td><c:out value="${user.age}"/></td>
                <td>${user.address}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/userServlet?check=editUser&id=${user.id}">Edit</a>
                    <a href="${pageContext.request.contextPath}/userServlet?check=deleteUser&id=${user.id}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </c:when>
    <c:otherwise>
        <td colspan="4">Chưa có user nào trong đó</td>
    </c:otherwise>
    </c:choose>
    </tbody>
</table>
</div>
</body>
</html>
