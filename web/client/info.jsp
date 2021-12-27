<%--
  Created by IntelliJ IDEA.
  User: mashi
  Date: 2021/12/21
  Time: 0:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Msmusic</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/client/css/main.css" type="text/css" />
</head>
<body class="main">
    <jsp:include page="head.jsp"/>
    <br><br>
    <div id="divpagecontent">
        <table width="100%" border="0" cellspacing="0">
            <tr>
                <td>
                    <div style="text-align:right; margin:5px 10px 5px 0px">
                        <a href="${pageContext.request.contextPath }/index.jsp">
                            首页
                        </a>
                        &nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;
                        <a href="${pageContext.request.contextPath }/showProductByPage?category=${requestScope.p.category}">
                            ${requestScope.p.category}
                        </a>
                        &nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;${requestScope.p.name}
                    </div>
                    <table cellspacing="0" class="infocontent">
                        <tr>
                            <td>
                                <img src="${pageContext.request.contextPath }/client/image/page_ad.jpg" width="900" height="300" />
                                <table width="100%" border="0" cellspacing="0">
                                    <tr>
                                        <td width="30%">
                                            <div class="divbookcover">
                                                <p>
                                                    <img src="${pageContext.request.contextPath }${requestScope.p.imgurl}" width="213" height="269" border="0"/>
                                                </p>
                                            </div>
                                            <div style="text-align:center; margin-top:10px">

<%--                                                <a href="${pageContext.request.contextPath }/addCart?id=${requestScope.p.id}">--%>
<%--                                                    <img src="${pageContext.request.contextPath}/client/image/buybutton.gif" border="0" width="100" height="25"/>--%>
<%--                                                </a>--%>
                                                <a class="btn btn-default" href="${pageContext.request.contextPath }/addCart?id=${requestScope.p.id}" role="button">
                                                    购买
                                                </a>
                                            </div>
                                        </td>
                                        <td style="padding:20px 5px 5px 5px">
                                            <img src="${pageContext.request.contextPath}/client/image/miniicon3.gif" width="16" height="16"/>
                                            <font class="bookname">${requestScope.p.name}</font>
                                            <hr/>售价：<font color="#FF0000">￥${requestScope.p.price}</font>
                                            <hr/>类别：${requestScope.p.category}
                                            <hr/>
                                            <p>
                                                <b>简介：</b>
                                            </p>${requestScope.p.description}
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
</body>
</html>
