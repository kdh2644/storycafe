<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp" %>

<div class="container" align="center">
	<div class="rows">
		<div class="col-sm-3" style="height: 100px;">
			<div class="card card-body" style="border-bottom: 1px solid #116411; margin-bottom: 10px;">
				<span style="color: #116411;"><font size="3px"><strong><b>회원관리</b></strong></font></span>
			</div>			      	      	
			<ul class="nav nav-pills nav-stacked" style="border:1px solid white; background-color: #116411;">				
      		    <li><a href="${root}/memberadmin/memberlist.cafe?pg=1&key=&word=">
      		    <font color="white">회원목록</font>      		    
      		    </a></li>   		          		    
			</ul>      		
		</div>
		<div class="col-sm-9" style="height: 100%;">