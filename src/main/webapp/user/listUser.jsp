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
<div style="text-align:center">
<form action="userServlet" method="get" style="width: 100%">
    <input type="hidden" name="userId" value="">
    <input type="hidden" name="userName" value="">
    <input type="hidden" name="userAge" value="">
    <input type="hidden" name="userAddress" value="">
    <input type="submit" value="Create" style="
    box-sizing: inherit;
    border: 100px;
    background-origin: border-box;
    background: magenta;
    padding: 20px;
    font-size: 150px;
">
</form>
</div>
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
                        <form action="userServlet" method="get">
                            <input type="hidden" name="userId" value="${user.id}">
                            <input type="hidden" name="userName" value="${user.name}">
                            <input type="hidden" name="userAge" value="${user.age}">
                            <input type="hidden" name="userAddress" value="${user.address}">
                            <input type="submit" value="Edit">
                        </form>
                        <form action="userServlet" method="get">
                            <input type="hidden" name="userId" value="${user.id}">
                            <input type="hidden" name="delete" value="delete">
                            <input type="submit" value="Delete">
                        </form>


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
