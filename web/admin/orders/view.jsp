<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: mashi
  Date: 2021/12/26
  Time: 9:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Language" content="zh-cn">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <LINK href="${pageContext.request.contextPath}/admin/css/Style.css" type="text/css" rel="stylesheet">
    <script language="javascript" src="${pageContext.request.contextPath}/admin/js/public.js"></script>
    <title>Msmusic管理系统</title>
</head>
<body>
<jsp:include page="../login/head.jsp"/>
<br><br>
    <div>
        <div style="text-align:right; margin:5px 10px 5px 0px">
           首页
            &nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;
           销售状况
            &nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;
            订单明细
        </div>
        <table class="table table-hover">
            <tr>
                <td  width="7%">序号</td>
                <td width="8%">商品</td>
<%--                <td  width="18%" align="center">商品编号</td>--%>
                <td  width="10%">商品名称</td>
                <td  width="18%" align="center">商品编号</td>
                <td  width="10%">商品价格</td>
                <td width="7%" >购买数量</td>
<%--                <td width="7%" >商品类别</td>--%>
                <td width="31%" align="center">商品描述</td>
            </tr>
            <c:forEach items="${requestScope.order.orderItems}" var="item" varStatus="vs">
                <td  width="7%">${vs.count}</td>
                <td width="8%">
                    <img src="${pageContext.request.contextPath}${item.p.imgurl}" style="width: 50px;height: 50px">
                </td>
<%--                <td  width="18%">${item.p.id}</td>--%>
                <td  width="10%">${item.p.name}</td>
                <td  width="18%">${item.p.category}</td>
                <td  width="10%" align="center">${item.p.price}</td>
                <td width="7%" >${item.buynum}</td>
<%--                <td width="7%" >${item.p.category}</td>--%>
                <td width="31%" align="center" >${item.p.description}</td>
            </c:forEach>
        </table>
    </div>
</body>
</html>
