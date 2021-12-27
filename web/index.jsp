<%--
  Created by IntelliJ IDEA.
  User: mashi
  Date: 2021/12/13
  Time: 17:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
<%--  <jsp:forward page="/ShowIndexServlet"></jsp:forward>--%>
  <%
    response.sendRedirect(request.getContextPath()+"/client/index.jsp");
  %>
  </body>
</html>
