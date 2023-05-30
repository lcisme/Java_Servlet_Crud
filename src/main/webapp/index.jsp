<%@ page import="javax.swing.text.html.parser.Entity" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="a" uri="WEB-INFO/tld/myCustomTag.tld" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<br/>

<h1><%= "Hello World!" %></h1>

<%--<%@include file="testinclude.jsp"%>--%>
<%--<jsp:text>using stardard action include</jsp:text>--%>
<%--<jsp:include page="testinclude.jsp">--%>
<%--    <jsp:param name="name" value="T2108E"/>--%>
<%--</jsp:include>--%>

<%
    session.setAttribute("session", "session implicit object");
    application.setAttribute("application" , "application implicit object");
    pageContext.setAttribute("pageScope","page scope object", PageContext.PAGE_SCOPE);
    pageContext.setAttribute("sessionScope","session scope object", PageContext.SESSION_SCOPE);
    pageContext.setAttribute("requestScope","request scope object", PageContext.REQUEST_SCOPE);
    pageContext.setAttribute("applicationScope","application scope object", PageContext.APPLICATION_SCOPE);
   // request.getRequestDispatcher("demo?name=T2108E&age=22").forward(request,response);


%>

<jsp:useBean id="userBean" class="com.example.buoi4.entity.UserEntity" scope="request"/>
<jsp:setProperty name="userBean" property="id" value="1"/>
<jsp:setProperty name="userBean" property="name" value="T2108E 2"/>
<jsp:setProperty name="userBean" property="age" value="22" />

<%--        <jsp:forward page="testinclude.jsp">--%>
<%--            <jsp:param name="name" value="value form index"/>--%>
<%--        </jsp:forward>--%>

<h1>Tổng: ${"2" + 2}</h1>
<h1>String: ${"Hello".concat(" T2108E") }</h1>
<h1>param value: ${param.name}</h1>
<h1>check param value: ${empty param.name}</h1>
<br/>

<%-- buoi8--%>
<a:myFirstCustomTag name="${userBean.name}"/>
<%----%>
<a href="hello-servlet">Hello Servlet</a><br/>
<a href="">Demo JSP-Scope</a><br/>
<a href="demo.jsp?name=T2108E&age=20">Demo</a>
</body>
</html>