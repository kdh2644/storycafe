<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/common/header.jsp" %>

<div align="center">
	<font size="5px" style="color: #116411;">Story Cafe에 방문하신 것을 환영합니다.</font>	
</div>
<div class="container">
<div id="photo" class="carousel slide" data-ride="carousel" style="margin-top: 20px; margin-bottom: 50px;" align="center">
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
        <img src="${root}/img/photo.jpg" width="1000" height="700">
      </div>

      <div class="item">
        <img src="${root}/img/photo2.jpg" width="1000" height="700">
      </div>
    
      <div class="item">
        <img src="${root}/img/photo3.jpg" width="1000" height="700">
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
</div>
<%@ include file="/common/footer.jsp" %>