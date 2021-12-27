<%--
  Created by IntelliJ IDEA.
  User: mashi
  Date: 2021/12/20
  Time: 10:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Msmusic</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/client/css/main.css" type="text/css" />
    <script>
        function confirm_logout(){
            var msg = "您确定要退出登录吗？";
            return confirm(msg) == true;
        }
    </script>
</head>
<body class="main">
    <jsp:include page="head.jsp"/>
    <br><br>
    <div id="divpagecontent">
        <table width="100%" border="0" cellspacing="0">
            <tr>
                <td width="25%">
                    <table width="100%" border="0" cellspacing="100%" style="margin-top:30px">
                        <tr>
                            <td class="listtitle">我的账户</td>
                        </tr>
<%--                        <tr>--%>
<%--                            <td class="listtd">--%>
<%--                                <img src="${pageContext.request.contextPath }/client/image/icon1.png" width="15" height="10"/>--%>
<%--                                &nbsp;&nbsp;&nbsp;&nbsp;--%>
<%--                                <a href="${pageContext.request.contextPath}/client/modifyuserinfo.jsp">--%>
<%--                                    用户信息修改--%>
<%--                                </a>--%>
<%--                            </td>--%>
<%--                        </tr>--%>
                        <tr>
                            <td class="listtd">
                                <img src="${pageContext.request.contextPath }/client/image/icon2.png" width="15" height="10"/>
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="${pageContext.request.contextPath}/findOrderByUser">
                                    订单查询
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td class="listtd">
                                <img src="${pageContext.request.contextPath}/client/image/icon3.png" width="15" height="10"/>
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="${pageContext.request.contextPath}/logout" onclick="javascript:return confirm_logout()">
                                    退出登录
                                </a>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    <div style="text-align:right; margin:5px 10px 5px 0px">
                        <a href="${pageContext.request.contextPath}/index.jsp">
                            首页
                        </a>
                        &nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;
                        我的帐户
                    </div>
                    <table cellspacing="0" class="infocontent">
                        <tr>
                            <td style="padding:20px">
                                <p>
                                    <img src="${pageContext.request.contextPath}/client/image/page_ad.jpg" width="631" height="436"/>
                                </p>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
</body>
</html>
