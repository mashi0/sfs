<%@ page import="cn.itcast.msmusic.domain.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- 可选的Bootstrap主题文件（一般不用引入） -->
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="http://cdn.bootcss.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <style type="text/css">
        body {
            padding-top: 50px;
        }
        #carousel-example-generic img{
            width: 100%;
            height: 600px;
        }
        .jumbotron{
            height: 650px;
        }
        #foot {
            width: 100%;
            clear: both;
            background-color: #efefef;
            margin-top: 15px;
        }
    </style>
    <script>
        function confirm_logout() {
            var msg = "您确定要退出登录吗？";
            if (confirm(msg)==true){
                return true;
            }else{
                return false;
            }
        }
    </script>
</head>
<body>
    <div>
        <nav class="navbar navbar-inverse navbar-fixed-top " role="navigation">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed"
                            data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span> <span
                            class="icon-bar"></span> <span class="icon-bar"></span> <span
                            class="icon-bar"></span>
                    </button>

                    <a class="navbar-brand" href="${pageContext.request.contextPath}/client/index.jsp">首页</a>
                </div>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class="active">
                            <a href="${pageContext.request.contextPath}/showProductByPage?category=书报杂志">书报杂志</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/showProductByPage?category=磁带">磁带</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/showProductByPage?category=黑胶唱片LP">黑胶唱片LP</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/showProductByPage?category=乐队的夏天">乐队的夏天</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/showProductByPage?category=乐队周边">乐队周边</a>-
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/showProductByPage" style="color:#FFFF00">全部商品目录</a>
                        </li>
                    </ul>

                    <form class="navbar-form navbar-left" role="search">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Search">
                        </div>
                        <button type="submit" class="btn btn-default">Submit</button>
                    </form>

                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="${pageContext.request.contextPath}/client/register.jsp">新用户注册</a></li>
                        <li><a href="${pageContext.request.contextPath}/client/cart.jsp">购物车</a></li>
                        <li><a href="${pageContext.request.contextPath}/client/myAccount.jsp">我的账户</a></li>
                        <%
                            User user = (User) request.getSession().getAttribute("user");
                            if(user==null){
                        %>
                        <li><a href="${pageContext.request.contextPath}/client/login.jsp">登录</a></li>
                        <%
                        }else{
                        %>
                        <li><a href="${pageContext.request.contextPath}/logout" onclick="javascript:return confirm_logout()">(${sessionScope.user.username})退出登录</a></li>
                        <%
                            }
                        %>
                        <li class="dropdown"><a href="#" class="dropdown-toggle"
                                                data-toggle="dropdown" role="button" aria-expanded="false">更多
                            <span class="caret"></span>
                        </a>
                            <ul class="dropdown-menu" role="menu">
                                <li class="divider"></li>
                                <li><a href="#">帮助中心</a>
                                </li>
                            </ul>
                        </li>
                    </ul>

                </div>
                <!-- /.navbar-collapse -->
            </div>
        </nav>
    </div>
</body>
</html>
