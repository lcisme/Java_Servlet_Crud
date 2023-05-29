<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 5/23/2023
  Time: 7:14 PM
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <title>JSP - Hello BayBe</title>
</head>
<body>
<h1> Hello mother f*cker</h1>

<%
    String name = request.getParameter("name");
%>

<h1>Name in testInclude.jsp: <%= name %></h1>
<jsp:useBean id="userBean" type="com.example.buoi4.entity.UserEntity" scope="request"/>
<h1>Name: <jsp:getProperty name="userBean" property="name"/></h1>
<h1>Age: <jsp:getProperty name="userBean" property="age"/></h1>


<h1>buoi 7</h1>
<h1>applicationScope: ${applicationScope.applicationScope}</h1>
<h1>applicationScope: ${applicationScope.application}</h1>
<h1>sessionScope: ${sessionScope.sessionScope}</h1>
<h1>requestScope: ${requestScope.requestScope}</h1>
<h1>compare: ${4 > "3"}</h1>
<h1>compare: ${4 > "3" && "3" > 1}</h1>
</body>
</html>

