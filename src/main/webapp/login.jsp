<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 6/3/2023
  Time: 7:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login Servlet</title>
</head>
<body>
<form method="post" action="j_security_check">
    UserName <input type="text" name="j_username">
    Password <input type="text" name="j_password">
    <input type="submit" value="submit">
</form>
</body>
</html>
