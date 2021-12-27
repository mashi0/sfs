<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
      <meta http-equiv="Content-Language" content="zh-cn">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <link href="${pageContext.request.contextPath}/admin/css/Style.css" rel="stylesheet" type="text/css" />
      <script language="javascript" src="${pageContext.request.contextPath}/admin/js/public.js"></script>
    <title>Msmusic管理系统</title>
    <script>
        function addProduct(){
            window.location.href = "${pageContext.request.contextPath}/admin/products/add.jsp";
        }
        function p_del(){
            var msg = "您确定要删除该商品吗？";
            return confirm(msg)===true;
        }
    </script>
</head>
<body>
    <jsp:include page="../login/head.jsp"/>
    <br><br>
    <form id="Form1" name="Form1" action="${pageContext.request.contextPath}/findProductByManyCondition" method="post">
          <table cellSpacing="1" cellPadding="0" width="100%" align="center" bgColor="#f5fafe" border="0">
              <tbody>
              <tr>
                <td class="ta_01" align="center"  bgColor="#afd1f3">
                  <strong>查 询 条 件</strong>
                </td>
              </tr>
              <tr>
                  <td>
                      <table cellpadding="0" cellspacing="0" border="0" width="100%">
                          <tr>
                              <td height="22" align="center" bgColor="#f5fafe" class="ta_01">商品编号</td>
                              <td class="ta_01" bgColor="#ffffff">
                                  <input type="text" name="id" size="15" value="" class="bg"/>
                              </td>
                              <td height="22" align="center" bgColor="#f5fafe" class="ta_01">类别：</td>
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
                          <td height="22" align="center" bgColor="#f5fafe" class="ta_01">商品名称：</td>
                          <td class="ta_01" bgColor="#ffffff">
                            <input type="text" name="name" size="15" value="" id="Form1_userName" class="bg" />
                          </td>
                          <td height="22" align="center" bgColor="#f5fafe" class="ta_01">价格区间(元)：</td>
                          <td class="ta_01" bgColor="#ffffff">
                            <input type="text" name="minprice" size="10" value="" />
                            -
                            <input type="text" name="maxprice" size="10" value="" />
                          </td>
                        </tr>
                        <tr>
                          <td width="100" height="22" align="center" bgColor="#f5fafe" class="ta_01"></td>
                          <td class="ta_01" bgColor="#ffffff">
                            <font face="宋体" color="red"> &nbsp;</font>
                          </td>
                          <td align="right" bgColor="#ffffff" class="ta_01">
                            <br /><br />
                          </td>
                          <td align="right" bgColor="#ffffff" class="ta_01">
                            <button type="submit" id="search" name="search" value="&#26597;&#35810;" class="button_view">
                              &#26597;&#35810;
                            </button>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="reset" name="reset" value="&#37325;&#32622;" class="button_view" />
                          </td>
                        </tr>
                      </table>
                  </td>
              </tr>
              <tr>
                  <td class="ta_01" align="center" bgColor="#afd1f3">
                      <strong>商 品 列 表</strong>
                  </td>
              </tr>
              <tr>
                    <td class="ta_01" align="right">
                          <button type="button" id="add" name="add" value="&#28155;&#21152;" class="button_add" onclick="addProduct()">
                            &#28155;&#21152;
                          </button>
                    </td>
              </tr>
              <tr>
                  <td class="ta_01" align="center" bgColor="#f5fafe">
                      <table cellspacing="0" cellpadding="1" rules="all"
                             bordercolor="gray" border="1" id="DataGrid1"
                             style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
                          <tr style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">
                              <td align="center" width="24%">商品编号</td>
                              <td align="center" width="18%">商品名称</td>
                              <td align="center" width="9%">商品价格</td>
                              <td align="center" width="9%">商品数量</td>
                              <td width="8%" align="center">商品类别</td>
                              <td width="16%" align="center" colspan="2">操作</td>
<%--                              <td width="8%" align="center">编辑</td>--%>
<%--                              <td width="8%" align="center">删除</td>--%>
                          </tr>
                          <c:forEach items="${requestScope.ps}" var="p">
                              <tr onmouseover="this.style.backgroundColor = 'white'"
                                  onmouseout="this.style.backgroundColor = '#F5FAFE'">
                                  <td style="CURSOR: hand; HEIGHT: 22px" align="center" width="200">${p.id }</td>
                                  <td style="CURSOR: hand; HEIGHT: 22px" align="center" width="18%">${p.name }</td>
                                  <td style="CURSOR: hand; HEIGHT: 22px" align="center" width="8%">${p.price }</td>
                                  <td style="CURSOR: hand; HEIGHT: 22px" align="center" width="8%">${p.pnum }</td>
                                  <td style="CURSOR: hand; HEIGHT: 22px" align="center">${p.category}</td>
                                  <td align="center" style="HEIGHT: 22px" width="7%">
                                      <a href="${pageContext.request.contextPath}/findProductyId?id=${p.id}&type=admin">
<%--                                          <img src="${pageContext.request.contextPath}/admin/images/i_edit.gif" border="0" style="CURSOR: hand">--%>
                                          编辑
                                      </a>
                                  </td>
                                  <td align="center" style="HEIGHT: 22px" width="7%">
                                      <a href="${pageContext.request.contextPath}/deleteProduct?id=${p.id}" onclick="javascript:return p_del()">
<%--                                          <img src="${pageContext.request.contextPath}/admin/images/i_del.gif"--%>
<%--                                               width="16" height="16" border="0" style="CURSOR: hand">--%>
                                          删除
                                      </a>
                                  </td>
                              </tr>
                          </c:forEach>
                      </table>
                  </td>
              </tr>
            </tbody>
          </table>
    </form>
</body>
</html>
