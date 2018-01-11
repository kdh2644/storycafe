<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp" %>

<div class="container">
	<div class="rows">
		<div class="col-sm-3">
			<div class="card card-body" style="border-bottom: 1px solid #116411; margin-bottom: 10px;">
				<span style="color: #116411;"><font size="3px"><strong><b>회원정보</b></strong></font></span>
			</div>
			<ul class="nav nav-pills nav-stacked" style="background-color: #116411;">				
				<li><a href="${root}/user/modify.cafe" style="background-color: #116411; border:1px solid white; color: white;">내정보수정</a></li>
				<li><a href="${root}/user/outofuser.cafe" style="background-color: #116411; border:1px solid white; color: white;">회원탈퇴</a></li>
			</ul>
		</div>
		<div class="col-sm-9">

