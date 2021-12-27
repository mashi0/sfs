<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Msmusic首页</title>
</head>
<body>
<%--导航栏开始--%>
<%--<%@include file="head.jsp"%>--%>
<jsp:include page="head.jsp" />
<%--导航栏结束--%>
<%--轮播图--%>
      <div  >
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
          <!-- Indicators -->
          <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
          </ol>

          <!--  修改图片路径和要轮播的图片个数.  -->
          <div class="carousel-inner" role="listbox">
            <div class="item active">
              <img src="./image/wutiaoren.jpg" alt="图片已丢失">
              <div class="carousel-caption">
              </div>
            </div>
            <div class="item">
              <img src="./image/lunbo1.jpg" alt="图片已丢失">
              <div class="carousel-caption">
              </div>
            </div>
            <div class="item">
              <img src="./image/lunbo2.jpg" alt="图片已丢失">
              <div class="carousel-caption">
              </div>
            </div>
          </div>

          <!-- Controls -->
          <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>
      </div>


<hr>
<h4>本周热卖<span class="label label-default">Hot</span></h4>
<table>
  <tr>
    <td style="width: 20%;height: 300px">
      <div class="thumbnail" >
        <img src="./image/guozu.jpg" alt="...">
        <div class="caption">
          <h5>Chinese Football  国足 首张同名专辑CD再版现货</h5>
          <p><a href="#" class="btn btn-primary" role="button">了解详情</a> <a href="#" class="btn btn-default" role="button">购买</a></p>
        </div>
      </div>
    </td >
    <td style="width: 1%" >
      <div>

      </div>
    </td>
    <td style="width: 20%;height: 300px">
      <div class="thumbnail" >
        <img src="./image/juzihai.jpg" alt="...">
        <div class="caption">
          <h5>推荐摇滚橘子海乐队Orange Ocean潮湿的形状 录音室专辑CD全新现货</h5>
          <p><a href="#" class="btn btn-primary" role="button">了解详情</a> <a href="#" class="btn btn-default" role="button">购买</a></p>
        </div>
      </div>
    </td >
    <td style="width: 1%" >
      <div>
      </div>
    </td>
    <td style="width: 20%;height: 300px">
      <div class="thumbnail" >
        <img src="./image/yehe.jpg" alt="...">
        <div class="caption">
          <h5>野外合作社《台风来了》正版2CD+1DVD 全新未拆</h5>
          <p><a href="#" class="btn btn-primary" role="button">了解详情</a> <a href="#" class="btn btn-default" role="button">购买</a></p>
        </div>
      </div>
    </td >
    <td style="width: 1%" >
      <div>

      </div>
    </td>
    <td style="width: 20%;height: 300px">
      <div class="thumbnail" >
        <img src="../client/image/shengsui.jpg" alt="...">
        <div class="caption">
          <h5>声音碎片乐队 昔日我曾苍老 精选集2CD全新现货</h5>
          <p><a href="#" class="btn btn-primary" role="button">了解详情</a> <a href="#" class="btn btn-default" role="button">购买</a></p>
        </div>
      </div>
    </td >
  </tr>
</table>

<%--<%@include file="foot.jsp"%>--%>
<jsp:include page="foot.jsp"/>
</body>
</html>
