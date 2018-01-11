<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp" %>

<div class="container" align="center">
	<h3><font color="#116411"><strong>회원가입 완료</strong></font></h3>
	<div class="card" style="margin-top: 50px; margin-bottom: 50px;">
  		<div class="col-sm-12 card-body" style="border: 5px solid #116411; height: 100%">
  			<div class="col-sm-4" style="margin-top: 100px; margin-bottom: 100px;"></div>
  			<div class="col-sm-4" style="margin-top: 100px; margin-bottom: 100px;">
  			<font size="3px" face="돋움"><b>${registerInfo.mname}</b>님 회원가입 하신 것을 축하드립니다.</font> <br><br>
  			<font size="2px" face="돋움">로그인 하신 후 사이트를 이용해주시기 바랍니다.</font><br><br>
  			<a href="${root}/user/login.cafe">
  				<button type="button" class="btn btn-default btn-block" style="background-color: #116411; color: white;">로그인</button>
  			</a>
			</div>
  			<div class="col-sm-4" style="margin-top: 100px; margin-bottom: 100px;"></div>
  		</div> 
	</div>
</div>

<%@ include file="/common/footer.jsp" %>