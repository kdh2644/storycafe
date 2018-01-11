<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<c:set var="root" value="${pageContext.request.contextPath}"/> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
root = "${root}";
</script>
<title>Insert title here</title>
</head>
<body>
<header>
	<div align="center">
		<img src="${root}/img/sclogo.png" alt="StoryCafe Logo">
	</div>
<c:if test="${userInfo != null}">	
	<div class="container" align="right">
		<b>${userInfo.mname}(${userInfo.mid})</b>님 안녕하세요.<br>
	</div>	
</c:if>	
</header>
<nav class="navbar navbar-inverse" style="background-color: #116411; border: #eb8be7;">
  <div class="container">
  
<c:if test="${userInfo.mname == '관리자'}">  
    <ul class="nav navbar-nav">
      <li><a href="${root}/index.jsp" class="glyphicon glyphicon-home"></a></li>
      <li>
      	<a href="${root}/memberadmin/memberlist.cafe">회원관리</a>
      </li>

	  <li class="dropdown dropdown-toggle">
      	<a href="#menuitem" data-toggle="dropdown">게시판 관리</a>
      	<ul class="dropdown-menu">
      		<li class="dropdown-item" role="presentation"><a role="menuitem" tabindex="-1" href="${root}/boardadmin/reboardlist.cafe">답변게시판 관리</a></li>
      		<li class="dropdown-item" role="presentation"><a role="menuitem" tabindex="-1" href="${root}/boardadmin/boardlist.cafe">자유게시판 관리</a></li>
      		<li class="dropdown-item" role="presentation"><a role="menuitem" tabindex="-1" href="${root}/boardadmin/albumlist.cafe">사진게시판 관리</a></li>
      		<li class="dropdown-item" role="presentation"><a role="menuitem" tabindex="-1" href="${root}/boardadmin/bbslist.cafe">자료실 관리</a></li>
      	</ul>
      </li>
      
      <li>
      	<a href="${root}/boardadmin/catelist.cafe">카테고리 관리</a>
      </li>                  
    </ul>
</c:if>     
  
  
<c:if test="${userInfo.mname != '관리자'}">  
    <ul class="nav navbar-nav">
      <li><a href="${root}/index.jsp" class="glyphicon glyphicon-home"></a></li>
      <li>
      	<a href="${root}/community/community-header.jsp">
      		커뮤니티
      	</a>
      </li>
    </ul>
</c:if>    
	<c:if test="${userInfo == null}">
		<%@ include file="/log/logoff.jsp" %>
	</c:if>
	
	<c:if test="${userInfo != null}">
		<%@ include file="/log/loginok.jsp" %>
	</c:if>
	
  </div>
</nav>

<c:set var="bcode" value="${querystring.bcode}"/>
<c:set var="pg" value="${querystring.pg}"/>
<c:set var="key" value="${querystring.key}"/>
<c:set var="word" value="${querystring.word}"/>

<script type="text/javascript" src="${root}/js/board.js"></script>

<form id="commonForm" name="commonForm" method="get" action="">
	<input type="hidden" id="bcode" name="bcode" value="${bcode}">
	<input type="hidden" id="pg" name="pg" value="${pg}">
	<input type="hidden" id="key" name="key" value="${key}">
	<input type="hidden" id="word" name="word" value="${word}">
	<input type="hidden" id="seq" name="seq" value="">
</form>
