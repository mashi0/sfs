<%--
  Created by IntelliJ IDEA.
  User: mashi
  Date: 2021/12/25
  Time: 13:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Msmusic</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/client/css/main.css" type="text/css" />
    <script>
        function o_del(){
            var msg="您确定要删除该订单吗？"
            return (confirm(msg)===true)
        }
    </script>
</head>
<body>
<jsp:include page="head.jsp"/>
<br><br>
<div>
    <div style="text-align:right; margin:5px 10px 5px 0px">
        <a href="${pageContext.request.contextPath }/index.jsp">首页</a>
        &nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;
        <a href="${pageContext.request.contextPath }/client/myAccount.jsp">&nbsp;我的帐户</a>
        &nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;
        订单查询
    </div>
    <table class="table table-hover">
        <tr>
            <td width="40%" >订单号</td>
            <td width="15%" >收件人</td>
            <td width="15%" >下单时间</td>
            <td width="15%" >支付状态</td>
            <td width="15%" >操作</td>
        </tr>
        <c:forEach items="${requestScope.orders}" var="order">
            <tr>
                <td width="40%">${order.id}</td>
                <td width="15%">${order.receiverName}</td>
                <td width="15%">${order.ordertime}</td>
                <td width="15%" >${order.paystate==0?"未支付":"已支付"}</td>
                <td width="15%">
                    <a href="${pageContext.request.contextPath}/findOrderById?id=${order.id}">查看</a>
<%--                    <c:if test="${order.paystate==0}">--%>
<%--                        <a href="${pageContext.request.contextPath}/delOrderById?id=${order.id}" onclick="javascript:return o_del()">删除</a>--%>
<%--                    </c:if>--%>
<%--                    <c:if test="${order.paystate!=0}">--%>
<%--                        <a href="${pageContext.request.contextPath}/delOrderById?id=${order.id}&type=client" onclick="javascript:return o_del()">删除</a>--%>
<%--                    </c:if>--%>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
