<%--
  Created by IntelliJ IDEA.
  User: mashi
  Date: 2021/12/24
  Time: 20:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>确认支付</title>

</head>
<body>
<jsp:include page="head.jsp"/>
<br><br>

    <form action="${pageContext.request.contextPath}/orderstate" method="get">
        <h3>订单号：${requestScope.id},付款金额 ：${requestScope.money}</h3>
        <input type="hidden" name="orderid" value="${requestScope.id}">
        <input type="submit" value="确认支付">
    </form>
</body>
</html>
