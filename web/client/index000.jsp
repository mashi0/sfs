<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<%--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">--%>
	<title>首页</title>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/client/css/main.css" />
	<!-- 导入首页轮播图css和js脚本 -->
	<link type="text/css" href="${pageContext.request.contextPath}/client/css/autoplay.css" rel="stylesheet" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/client/js/autoplay.js"></script>

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
		.carousel-inner .item img {
			width:100%;
			height:400px;
		}
	</style>

</head>
<body class="main">
<!-- 1.顶部 start -->
<%--    <%@include file="head.jsp"%>--%>

<!-- 1.顶部  end -->

<!-- 2.网上书城菜单列表  start -->
<%--	<%@include file="menu_search.jsp" %>--%>
<nav class="navbar navbar-inverse navbar-fixed-top " role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>

			<a class="navbar-brand" href="#">首页</a>
		</div>

		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active">
					<a href="#">书报杂志</a>
				</li>
				<li>
					<a href="#">磁带</a>
				</li>
				<li>
					<a href="#">黑胶唱片LP</a>
				</li>
				<li>
					<a href="#">乐队/个人专区</a>
				</li>
				<li>
					<a href="#">乐队周边</a>-
				</li>
				<li>
					<a href="#" style="color:#FFFF00">全部商品目录</a>
				</li>
			</ul>

			<form class="navbar-form navbar-left" role="search">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Search">
				</div>
				<button type="submit" class="btn btn-default">Submit</button>
			</form>

			<ul class="nav navbar-nav navbar-right">

				</li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
										data-toggle="dropdown" role="button" aria-expanded="false">更多
					<span class="caret"></span>
				</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">购物车</a>
						</li>
						<li><a href="#">我的账户</a>
						</li>
						<li><a href="#">新用户注册</a>
						</li>
						<li class="divider"></li>
						<li><a href="#">帮助中心</a>
						</li>
					</ul></li>
			</ul>

		</div>
		<!-- /.navbar-collapse -->
	</div>
</nav>
<!-- 网上书城菜单列表  end -->

<!-- 3.网上书城首页轮播图  start -->
<%--	<div id="box_autoplay">--%>
<%--    	<div class="list">--%>
<%--        	<ul>--%>
<%--            	<li><img src="${pageContext.request.contextPath}/client/ad/index_ad1.jpg" width="900" height="335" /></li>--%>
<%--            	<li><img src="${pageContext.request.contextPath}/client/ad/index_ad2.jpg" width="900" height="335" /></li>--%>
<%--            	<li><img src="${pageContext.request.contextPath}/client/ad/index_ad3.jpg" width="900" height="335" /></li>--%>
<%--            	<li><img src="${pageContext.request.contextPath}/client/ad/index_ad4.jpg" width="900" height="335" /></li>--%>
<%--            	<li><img src="${pageContext.request.contextPath}/client/ad/index_ad5.jpg" width="900" height="335" /></li>--%>
<%--        	</ul>--%>
<%--    	</div>--%>
<%--	</div>--%>
<!-- 网上书城首页轮播图  end -->
<!-- 4.公告板和本周热卖  start -->
<%--    <div id="divcontent">--%>
<%--		<table width="900px" border="0" cellspacing="0">--%>
<%--			<tr>--%>
<%--				<td width="497">--%>
<%--				--%>
<%--					<img src="${pageContext.request.contextPath}/client/images/billboard.gif" width="497" height="38" />--%>
<%--					<table cellspacing="0" class="ctl">--%>
<%--						<tr>--%>
<%--							<td width="485" height="29">--%>
<%--				                            尊敬的网上书城用户， 　　<br>--%>
<%--							　　为了让大家有更好的购物体验，3月25日起，当日达业务关小黑屋回炉升级！<br>具体开放时间请留意公告，感谢大家的支持与理解，祝大家购物愉快！<br>--%>
<%--							        3月23日<br>--%>
<%--							        传智播客 网上书城系统管理部<br>--%>
<%--							</td>--%>
<%--						</tr>--%>
<%--					</table>--%>
<%--				</td>--%>
<%--				<td style="padding:5px 15px 10px 40px">--%>
<%--					<table width="100%" border="0" cellspacing="0">--%>
<%--						<tr>--%>
<%--							<td>--%>
<%--								<img src="${pageContext.request.contextPath}/client/images/hottitle.gif" width="126" height="29" />--%>
<%--							</td>--%>
<%--						</tr>--%>
<%--					</table>--%>
<%--					<table width="100%" border="0" cellspacing="0">--%>
<%--						<tr>						--%>
<%--				             <td style="width:80; text-align:center">--%>
<%--								<a href="#">--%>
<%--								<img src="${pageContext.request.contextPath}/client/bookcover/105.jpg" width="102" height="130" border="0" />--%>
<%--								</a>--%>
<%--								<br /> 							--%>
<%--							</td>		--%>
<%--							<td style="width:80; text-align:center">--%>
<%--								<a href="#">--%>
<%--								<img src="${pageContext.request.contextPath}/client/bookcover/106.jpg" width="102" height="130" border="0" />--%>
<%--								</a>--%>
<%--								<br /> 							--%>
<%--							</td>			--%>
<%--						</tr>--%>
<%--					</table>--%>
<%--				</td>--%>
<%--			</tr>--%>
<%--		</table>--%>
<%--	</div>--%>
<!-- 公告板和本周热卖  end -->		
<!--5. 网上书城底部 start -->
<%--      <%@ include file="foot.jsp" %>--%>
<!-- 网上书城底部  end -->
</body>
</html>