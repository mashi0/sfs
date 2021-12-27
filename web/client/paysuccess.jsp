<%--
  Created by IntelliJ IDEA.
  User: mashi
  Date: 2021/12/24
  Time: 20:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Msmusic</title>
</head>
<body>
<jsp:include page="head.jsp"/>
<br><br>
<h3 id="page_div">支付成功！将在10秒后为您自动跳转到首页……</h3>
<script>
    var num = 10; //倒计时的秒数
    var URL = "index.jsp";
    window.setTimeout("doUpdate()", 1000);
    function doUpdate(){
        if(num != 0){
            document.getElementById('page_div').innerHTML = '支付成功！将在'+num+'秒后为您自动跳转到首页……' ;
            num --;
            window.setTimeout("doUpdate()", 1000);
        }else{
            num = 10;
            window.location = URL;
        }
    }
</script>
</body>
</html>
