<%--
  Created by IntelliJ IDEA.
  User: mashi
  Date: 2021/12/20
  Time: 19:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Msmusic</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/client/css/main.css" type="text/css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/client/js/order.js"></script>
</head>
<body class="main">
<jsp:include page="head.jsp"/>
<br><br>
<div id="divpagecontent">
    <table width="100%" border="0" cellspacing="0">
        <tr>
            <td>
                <div style="text-align: right;margin: 5px 10px 5px 0px">
                    <a href="${pageContext.request.contextPath}/index.jsp">首页</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;
                    <a href="${pageContext.request.contextPath}/client/cart.jsp">购物车</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;订单
                </div>
                <form  id="orderForm" action="${pageContext.request.contextPath}/creatOrder" method="post">
                    <table cellspacing="0" class="infocontent">
                        <tr>
                            <td>
                            <table width="100%" border="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <p>你好，${sessionScope.user.username}欢迎来到Msmusic结算中心!</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table cellspacing="1" class="carttable">
                                            <tr>
                                                <td width="10%">序号</td>
                                                <td width="40%">商品名称</td>
                                                <td width="10%">价格</td>
                                                <td width="10%">类别</td>
                                                <td width="10%">数量</td>
                                                <td width="10%">小计</td>
                                            </tr>
                                        </table>
                                        <c:set value="0" var="totalPrice"/>
                                        <c:forEach items="${sessionScope.cart}" var="entry" varStatus="vs">
                                            <table width="100%" border="0" cellspacing="0">
                                                <tr>

                                                    <td width="10%">${vs.count}</td>
                                                    <td width="40%">${entry.key.name}</td>
                                                    <td width="10%">${entry.key.price}</td>
                                                    <td width="10%">${entry.key.category}</td>
                                                    <td width="10%">
                                                        <input name="text" type="text" value="${entry.value}" style="width:20px" readonly="readonly"/>
                                                    </td>>
                                                    <td>${entry.key.price*entry.value}</td>
                                                </tr>
                                            </table>
                                            <c:set var="totalPrice" value="${totalPrice+entry.key.price*entry.value}"/>
                                        </c:forEach>

                                        <table cellspacing="1" class="carttable">
                                            <tr>
                                                <td style="text-align:right; padding-right:40px;"><font
                                                        style="color:#FF0000">合计：&nbsp;&nbsp;${totalPrice}元</font>
                                                    <input type="hidden" name="money" value="${totalPrice}">
                                                </td>
                                            </tr>
                                        </table>

                                        <div>
                                        <div class="form-group">
                                            <label for="inputEmail3" class="col-sm-2 control-label">收货地址</label>
                                            <div class="col-sm-10">
                                                <input type="text" name="receiverAddress" value=""style="width:350px"
                                                       class="form-control" id="inputEmail3" onkeyup="checkReceiverAddress();">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputPassword3" class="col-sm-2 control-label">收货人</label>
                                            <div class="col-sm-10">
                                                <input type="text" name="receiverName" value="${sessionScope.user.username}"
                                                       class="form-control" id="inputPassword3" style="width:150px" onkeyup="checkReceiverName();" >
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputPassword4" class="col-sm-2 control-label">联系方式</label>
                                            <div class="col-sm-10">
                                                <input type="text" name="receiverPhone" value="${sessionScope.user.telephone}"
                                                       class="form-control" id="inputPassword4" style="width:150px" onkeyup="checkReceiverPhone();" >
                                            </div>
                                        </div>
                                        </div>

                                        <hr/>
                                        <p style="text-align:right"  >
<%--                                            <b onclick="checkOnSubmit();">提交订单</b>--%>
                                            <button type="submit" class="btn btn-default">Submit</button>
                                        </p>

                                    </td>
                                </tr>
                            </table>
                            </td>
                        </tr>
                    </table>
                </form>
            </td>
        </tr>
    </table>
</div>
</body>
</html>
