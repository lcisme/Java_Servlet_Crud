<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 6/1/2023
  Time: 7:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<fmt:setLocale value="${param.lang}"/>
<c:set var="lang" value="${not empty param.lang? param.lang : ' vi_VN'}"/>
<fmt:bundle basename="ApplicationResources"/>
<fmt:setBundle basename="ApplicationResources" var="bundler"/>
<html>
<head>
    <title>Demo Locale</title>
</head>
<body>
<h1><a href="/localeServlet?lang=vi_VN">VN</a> | <a href="/localeServlet?lang=en_US">US</a></h1>
<%--<h1>welcome : ${welcome}</h1>--%>
<%--<h1> Country : ${country}</h1>--%>
<%--<h1>Number format : ${numberFormat}</h1>--%>
<%--<h1>Currency format : ${currencyFormat}</h1>--%>
<%--<h1>Percent format : ${percentFormat}</h1>--%>
<%--<h1>FullDate format : ${fullDateForamt}</h1>--%>
<%--<h1>ShortDate format : ${shortDateFormat}</h1>--%>
<%--<h1>SimpleDate format : ${simpleDateFormat}</h1>--%>
<h1><fmt:message key="welcome" bundle="${bundler}"/> : ${welcome}</h1>
<h1><fmt:message key="lable.country" bundle="${bundler}"/> : ${country}</h1>
<h1><fmt:message key="lable.number.format" bundle="${bundler}"/> : ${numberFormat}</h1>
<h1><fmt:message key="lable.number.currency" bundle="${bundler}"/> : ${currencyFormat}</h1>
<h1><fmt:message key="lable.number.percent" bundle="${bundler}"/> : ${percentFormat}</h1>
<h1><fmt:message key="lable.date.format.full" bundle="${bundler}"/> : ${fullDateForamt}</h1>
<h1><fmt:message key="lable.date.format.short" bundle="${bundler}"/> : ${shortDateFormat}</h1>
<h1><fmt:message key="lable.format.simple" bundle="${bundler}"/> : ${simpleDateFormat}</h1>




<h1>Using JSTL</h1>
<fmt:formatNumber var="formatNumber" type="number" value="987654321"/>
<h1>Number format : ${formatNumber}</h1>
<fmt:formatNumber var="formatCurrency" type="currency" value="987654321"/>
<h1>Currency format : ${formatCurrency}</h1>
<fmt:formatNumber var="formatPercent" type="percent" value="0.3"/>
<h1>Percent format : ${formatPercent}</h1>
<fmt:formatDate value="<%= new Date()%>" var="fullDate" dateStyle="FULL"/>
<h1>Full date format : ${fullDate}</h1>
<fmt:formatDate value="<%= new Date()%>" var="shortDate" dateStyle="SHORT"/>
<h1>Full date format : ${shortDate}</h1>
<h1><fmt:message bundle="${bundler}" key="welcome" /></h1>




</body>
</html>
