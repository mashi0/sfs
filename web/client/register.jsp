<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Msmusic注册页面</title>
    <style>
        .a{
            margin-left: 150px;
            width: 40%;
        }
    </style>
<%--    <script>--%>
<%--        function changeImage() {--%>
<%--            // 改变验证码图片中的文字--%>
<%--            document.getElementById("img").src = "${pageContext.request.contextPath}/CheckImageServlet?time="--%>
<%--                + new Date().getTime();--%>
<%--        }--%>
<%--    </script>--%>
</head>


<body>
<%@include file="head.jsp"%>
<br><br>

<h2 style="margin-left: 100px"><span class="label label-default" >新用户注册页面</span></h2>
<br><br>

<form action="${pageContext.request.contextPath}/register" method="post" class="form-horizontal a" >
    <div class="form-group">
        <label for="inputname" class="col-sm-2 control-label">用户名</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="inputname" name="username" placeholder="由字母、数字、下划线组成，1到10位, 不能是数字开头">
        </div>
    </div>
    <div class="form-group">
        <label for="inputPassword3" class="col-sm-2 control-label">密码</label>
        <div class="col-sm-10">
            <input type="password" class="form-control" name="password" id="inputPassword3" placeholder="由数字、字母组成，至少8位">
        </div>
    </div>
    <div class="form-group">
        <label for="inputPassword2" class="col-sm-2 control-label">确认密码</label>
        <div class="col-sm-10">
            <input type="password" class="form-control" id="inputPassword2" name="repassword" placeholder="由数字、字母组成，至少8位">
        </div>
    </div>
    <div class="form-group">
        <label for="inputEmail3" class="col-sm-2 control-label">邮箱</label>
        <div class="col-sm-10">
            <input type="email" class="form-control" id="inputEmail3" name="email" placeholder="Email">
        </div>
    </div>
    <div class="form-group">
        <label for="phone" class="col-sm-2 control-label">电话号码</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="phone" name="telephone" placeholder="phone number">
        </div>
    </div>

<%--    <div class="form-group">--%>
<%--        <label for="checkcode" class="col-sm-2 control-label">验证码</label>--%>
<%--        <div class="col-sm-10">--%>
<%--            <input type="text" class="form-control" id="checkcode" >--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <div>--%>
<%--    <img src="${pageContext.request.contextPath}/CheckImageServlet" width="180"--%>
<%--             height="30" class="textinput" style="height: 30px;" id="img" alt="..." />--%>
<%--    <a href="javascript:void(0);" onclick="changeImage()">看不清换一张</a>--%>
<%--    </div>--%>
    <br>

    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-default" name="submit">注册</button>
        </div>
   </div>
</form>
</body>
</html>
