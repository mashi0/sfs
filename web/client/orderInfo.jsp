<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Msmusic</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/client/css/main.css" type="text/css" />

</head>
<body class="main">
    <jsp:include page="head.jsp"/>
    <br><br><br><br><br>
    <div>
        <div style="text-align:right; margin:5px 10px 5px 0px">
            <a href="${pageContext.request.contextPath }/index.jsp">首页</a>
            &nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;
            <a href="${pageContext.request.contextPath }/client/myAccount.jsp">&nbsp;我的帐户</a>
            &nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="${pageContext.request.contextPath }/findOrderByUser">订单查询</a>
            &nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;订单详细信息
        </div>
        <h4>订单编号：${requestScope.order.id}</h4>
        <table class="table table-hover">
            <tr>
                <td width="10%">序号</td>
                <td width="40%">商品</td>
                <td width="10%">价格</td>
                <td width="10%">数量</td>
                <td width="10%">小计</td>
            </tr>
            <c:forEach items="${requestScope.order.orderItems}" var="item" varStatus="vs">
                <tr>
                        <td width="10%">${vs.count}</td>
                        <td width="40%">${item.p.description}</td>
                        <td width="10%">${item.p.price}</td>
                        <td width="10%">${item.buynum}</td>
                        <td width="10%">${item.buynum*item.p.price}</td>
                </tr>
            </c:forEach>
            <tr>
                <td>收货地址：${requestScope.order.receiverAddress }</td>
            </tr>
            <tr>
                <td>收货人：&nbsp;&nbsp;&nbsp;&nbsp;${requestScope.order.receiverName }&nbsp;&nbsp;&nbsp;&nbsp;</td>
            </tr>
            <tr>
                <td>联系方式：${requestScope.order.receiverPhone }&nbsp;&nbsp;&nbsp;&nbsp;</td>
            </tr>
        </table>
        <hr>
        <c:if test="${requestScope.order.paystate!=1}">
            <p style="text-align:right">
                <a href="${pageContext.request.contextPath}/confirm?id=${requestScope.order.id}&money=${requestScope.order.money}">
                    支付订单
                </a>
            </p>
        </c:if>

    </div>



</body>
</html>
