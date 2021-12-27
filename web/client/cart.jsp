<%--
  Created by IntelliJ IDEA.
  User: mashi
  Date: 2021/12/20
  Time: 14:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
    <title>Msmusic</title>
    <script>
        //改变商品数量
        function changeProductNum(count, totalCount, id){
            count = parseInt(count);
            totalCount = parseInt(totalCount);
            //如果数量为0，判断是否要删除商品
            if(count===0){
                var flag = window.confirm("是否确认删除商品？")
                if(!flag){
                    count = 1;
                }
            }
            if(count>totalCount){
                alert("已达到商品最大购买量");
                count = totalCount
            }

            location.href = "${pageContext.request.contextPath}/changeCart?id="
                +id+"&count="+count
        }

        function cart_del(){
            var msg = "您确定要删除该商品吗？";
            if(confirm(msg)==true){
                return true;
            }else{
                return  false;
            }
        }

    </script>
</head>
<body class="main">
    <jsp:include page="head.jsp"/>
    <br><br>
    <div>
        <div style="text-align: right;margin: 5px 10px 5px 0px">
            <a href="${pageContext.request.contextPath}/index.jsp">
                首页
            </a>
            &nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;购物车
        </div>
        <table class="table table-hover">
            <tr>
                <td width="10%">序号</td>
                <td width="30%">商品名称</td>
                <td width="10%">价格</td>
                <td width="20%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数量&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td width="10%">库存</td>
                <td width="10%">小计</td>
                <td width="10%">取消</td>
            </tr>
            <c:set var="total" value="0" />
            <c:forEach items="${sessionScope.cart}" var="entry" varStatus="vs">
                <tr>
                    <td width="10%">${vs.count}</td>
                    <td width="30%">${entry.key.name }</td>
                    <td width="10%">${entry.key.price}</td>
                    <td width="20%">
                        <!-- 减少商品数量 -->
                        <input type="button" value="-" style="width: 20px"
                               onclick="changeProductNum('${entry.value-1}','${entry.key.pnum}','${entry.key.id}')">
                        <!-- 商品数量显示 -->
                        <input type="text" name="text" value="${entry.value}" style="width:40px;text-align:center" />
                        <!-- 增加商品数量 -->
                        <input type="button" value="+" style="width: 20px"
                               onclick="changeProductNum('${entry.value+1}','${entry.key.pnum}','${entry.key.id}')">
                    </td>
                    <td width="10%">${entry.key.pnum}</td>
                    <td width="10%">${entry.key.price*entry.value}</td>
                    <td width="10%">
                        <a href="${pageContext.request.contextPath}/changeCart?id=${entry.key.id}&count=0"
                           style="color:#FF0000; font-weight:bold" onclick="javascript:return cart_del()">X</a>
                    </td>
                </tr>
                <c:set value="${total+entry.key.price*entry.value}" var="total" />
            </c:forEach>
            <tr>
                <td>
                    合计：&nbsp;&nbsp;${total}元
                </td>
            </tr>
        </table>
        <div style="text-align: right;margin-top: 10px">
            <a class="btn btn-default" href="${pageContext.request.contextPath}/showProductByPage" role="button">
                继续购物
            </a>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <a class="btn btn-default" href="${pageContext.request.contextPath}/client/order.jsp" role="button">
                结账
            </a>
        </div>
    </div>
</body>
</html>
