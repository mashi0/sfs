<%--
  Created by IntelliJ IDEA.
  User: mashi
  Date: 2021/12/26
  Time: 0:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Language" content="zh-cn">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="${pageContext.request.contextPath}/admin/css/Style.css" type="text/css" rel="stylesheet">
    <title>Msmusic管理系统</title>
</head>
<body>
<form id="userAction_save_do" name="Form1"
      action="${pageContext.request.contextPath}/addProduct" method="post"
      enctype="multipart/form-data">
    &nbsp;
    <table cellSpacing="1" cellPadding="5" width="100%" align="center"
           bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
        <tr>
            <td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4"
                height="26">
                <strong>添加商品</strong>
            </td>
        </tr>
        <tr>
            <td align="center" bgColor="#f5fafe" class="ta_01">商品名称：</td>
            <td class="ta_01" bgColor="#ffffff"><input type="text" name="name" class="bg" /></td>
            <td align="center" bgColor="#f5fafe" class="ta_01">商品价格：</td>
            <td class="ta_01" bgColor="#ffffff">
                <input type="text" name="price" class="bg" />
            </td>
        </tr>
        <tr>
            <td align="center" bgColor="#f5fafe" class="ta_01">商品数量：</td>
            <td class="ta_01" bgColor="#ffffff">
                <input type="text" name="pnum" class="bg" />
            </td>
            <td align="center" bgColor="#f5fafe" class="ta_01">商品类别：</td>
            <td class="ta_01" bgColor="#ffffff">
                <select name="category" id="category">
                    <option value="" selected="selected">--选择商品类别--</option>
                    <option value="书报杂志">书报杂志</option>
                    <option value="磁带">磁带</option>
                    <option value="黑胶唱片LP">黑胶唱片LP</option>
                    <option value="乐队的夏天">乐队的夏天</option>
                    <option value="乐队周边">乐队周边</option>
                </select>
            </td>
        </tr>
        <tr>
            <td align="center" bgColor="#f5fafe" class="ta_01">商品图片：</td>
            <td class="ta_01" bgColor="#ffffff" colspan="3">
                <input type="file" name="upload" size="30" value="">
            </td>
        </tr>
        <tr>
            <TD class="ta_01" align="center" bgColor="#f5fafe">商品描述：</TD>
            <TD class="ta_01" bgColor="#ffffff" colSpan="3">
                <textarea name="description" cols="30" rows="3" style="WIDTH: 96%"></textarea>
            </TD>
        </tr>
        <tr>
            <td align="center" colSpan="4" class="sep1">
                <img
                        src="${pageContext.request.contextPath}/admin/images/shim.gif">
            </td>
        </tr>
        <tr>
            <td class="ta_01" style="WIDTH: 100%" align="center"
                bgColor="#f5fafe" colSpan="4">
                <input type="submit" class="button_ok" value="确定">
                <FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
                <input type="reset" value="重置" class="button_cancel">
                <FONT face="宋体">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </FONT>
                <INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回" />
                <span id="Label1"></span>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
