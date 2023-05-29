
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 5/25/2023
  Time: 8:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Edit User</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>
<body>
<form action="${pageContext.request.contextPath}/userServlet" method="post">
  <input type="hidden" name="check" value="editUser">

  <div class="col-md-12">
    <input style="width: 50%;margin: 0 auto" type="hidden" name="userId" class="form-control" id="userId" value="${user.id}">
  </div>
  <div class="col-md-12" style="width: 50%;margin: 0 auto"  >
    <label for="userName" class="form-label">User Name</label>
    <input type="text" name="userName" class="form-control" id="userName" value="${user.name}">
  </div>
  <div class="col-md-12" style="width: 50%;margin: 0 auto" >
    <label for="userAge" class="form-label">User Age</label>
    <input  type="text" name="userAge" class="form-control" id="userAge" value="${user.age}">
  </div>
  <div class="col-md-12" style="width: 50%;margin: 0 auto"  >
    <label for="userAddress" class="form-label">User Address</label>
    <input type="text" name="userAddress" class="form-control" id="userAddress" value="${user.address}">
  </div>
  <div style="margin-top: 10px; text-align: center"  >
    <button  type="submit" class="btn btn-primary mb-3">Save</button>
  </div>
</form>
</body>
</html>
