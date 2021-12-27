
<%--
  Created by IntelliJ IDEA.
  User: mashi
  Date: 2021/12/20
  Time: 18:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Msmusic</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/client/css/main.css" type="text/css" />
</head>
<body>
    <jsp:include page="head.jsp"/>
    <br><br>
    <div>
        <div style="text-align:right; margin:5px 10px 5px 0px">
            <a href="${pageContext.request.contextPath}/client/index.jsp">首页</a>
            >
            ${requestScope.bean.category}
            >商品列表
        </div>
        <h4>${requestScope.bean.category}&nbsp;&nbsp;&nbsp;&nbsp;共&nbsp;${requestScope.bean.totalCount}&nbsp;件商品</h4>
        <table>
            <tr>
                <c:forEach items="${requestScope.bean.ps}" var="p" varStatus="vs">
                    <td style="width: 350px;height: 300px">
                        <div class="thumbnail" >
                            <img src="${pageContext.request.contextPath}${p.imgurl}"/>
                            <div class="caption">
                                <h5>${p.description}</h5>
                                <p>
                                    <a href="${pageContext.request.contextPath}/findProductyId?id=${p.id}" class="btn btn-primary" role="button">
                                        了解详情
                                    </a>
                                </p>
                            </div>
                        </div>
                    </td >
                    <td style="width: 50px" >
                        <div>

                        </div>
                    </td>
                </c:forEach>

            </tr>
        </table>
    </div>

    <div align="center">
        <nav aria-label="..." >
            <ul class="pagination" >
                <c:if test="${requestScope.bean.currentPage!=1}">
                    <li  class="active">
                        <a href="${pageContext.request.contextPath}/showProductByPage?currentPage=${requestScope.bean.currentPage-1}&category=${requestScope.bean.category}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                </c:if>
                <c:if test="${requestScope.bean.currentPage==1}">
                    <li  class="disabled">
                        <a href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                </c:if>

                <c:forEach begin="1" end="${requestScope.bean.totalPage}" var="pageNum">
                    <c:if test="${pageNum==requestScope.bean.totalPage}">
                        <li class="disabled">
                            <a href="#">${pageNum}<span class="sr-only">(current)</span></a>
                        </li>
                    </c:if>
                    <c:if test="${pageNum!=requestScope.bean.totalPage}">
                        <li class="active">
                            <a href="${pageContext.request.contextPath}/showProductByPage?currentPage=${pageNum}&category=${requestScope.bean.category}">${pageNum}<span class="sr-only">(current)</span></a>
                        </li>
                    </c:if>
                </c:forEach>

                <c:if test="${requestScope.bean.currentPage==requestScope.bean.totalPage||requestScope.bean.totalPage==0}">
                    <li  class="disabled">
                        <a href="#" aria-label="Previous">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>
                <c:if test="${requestScope.bean.currentPage!=requestScope.bean.totalPage&&requestScope.bean.totalPage!=0}">
                    <li  class="active">
                        <a href="${pageContext.request.contextPath}/showProductByPage?currentPage=${requestScope.bean.currentPage+1}&category=${requestScope.bean.category}" aria-label="Previous">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>
            </ul>
        </nav>
    </div>


</body>
</html>
