<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="divmenu">
	<a href="#">首页</a>
	<a href="#">书报杂志</a>
	<a href="#">磁带</a>
	<a href="#">黑胶唱片LP</a>
	<a href="#">乐队/个人专区</a>
	<a href="#">乐队周边</a>-
	<a href="#" style="color:#FFFF00">全部商品目录</a>
</div>
<div id="divsearch">
<form action="#" id="searchform">
	<table width="100%" border="0" cellspacing="0">
		<tr>
			<td style="text-align:right; padding-right:220px">
				Search 
				<input type="text" name="textfield" class="inputtable" id="textfield" value="请输入书名"
				onmouseover="this.focus();"
				onclick="my_click(this, 'textfield');"
				onBlur="my_blur(this, 'textfield');"/> 
				<a href="#">
					<img src="${pageContext.request.contextPath}/client/images/serchbutton.gif" border="0" style="margin-bottom:-4px" onclick="search()"/> 
				</a>
			</td>
		</tr>
	</table>
</form>
</div>