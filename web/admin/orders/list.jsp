<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta http-equiv="Content-Language" content="zh-cn">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link href="${pageContext.request.contextPath}/admin/css/Style.css" rel="stylesheet" type="text/css" />
  <script language="javascript" src="${pageContext.request.contextPath}/admin/js/public.js"></script>
  <title>Msmusic管理系统</title>
</head>
<body>
    <jsp:include page="../login/head.jsp"/>
    <br><br>
    <div>
        <div>
            <div style="text-align:right; margin:5px 10px 5px 0px">
              首页
              &nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;
              销售状况
            </div>
        </div>
        <table class="table table-hover">
            <tr>
                <td  width="22%">订单编号</td>
                <td  width="11%">收件人</td>
                <td  width="16%">地址</td>
                <td  width="11%">联系电话</td>
                <td width="12%" >总价</td>
                <td width="9%" >所属用户</td>
                <td width="10%" >订单状态</td>
                <td width="8%">查看</td>
            </tr>
            <c:forEach items="${requestScope.orders}" var="order">
                <tr>
                  <td  width="22%">${order.id}</td>
                  <td  width="11%">${order.receiverName}</td>
                  <td  width="16%">${order.receiverPhone}</td>
                  <td  width="11%">${order.receiverPhone}</td>
                  <td width="12%" >${order.money}</td>
                  <td width="9%" >${order.user.username}</td>
                  <td width="10%" >${order.paystate==0?"未支付":"已支付"}</td>
                  <td width="8%">
                      <a href="${pageContext.request.contextPath}/findOrderById?id=${order.id}&type=admin">
                          查看
                      </a>
                  </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>
