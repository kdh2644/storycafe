<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp" %>
<script type="text/javascript">
$(document).ready(function() {
	$("#loginBtn").click(function() {
		if ($("#mid").val() == "") {
			alert("로그인 하실 아이디를 입력해주세요.");
			return;
		} else if ($("#mpass").val() == "") {
			alert("로그인 하실 비밀번호를 입력해주세요.");
			return;
		} else {
			document.loginform.action = "${root}/user/login.cafe";
			document.loginform.submit();
		}
	});
});

</script>

<form id="loginform" name="loginform" method="post" action="">
<div class="container" align="center">
	<h3><font color="#116411"><strong>로그인</strong></font></h3>
	<div class="card" style="margin-top: 50px; margin-bottom: 50px;">
  		<div class="col-sm-12 card-body" style="border: 5px solid #116411; height: 100%">
  			<div class="col-sm-4" style="margin-top: 100px; margin-bottom: 100px;"></div>
  			<div class="col-sm-4" style="margin-top: 100px; margin-bottom: 100px;">
				<div class="form-group" style="padding-bottom: 60px;" align="left">
					<div class="col-sm-12">
					<label>아이디</label>
					</div>
					<div class="col-sm-12">
					<input type="text" id="mid" name="mid" class="form-control" maxlength="16">
					</div>
				</div>
				<div class="form-group" style="padding-bottom: 60px;" align="left">
					<div class="col-sm-12">
						<label>비밀번호</label>
					</div>
					<div class="col-sm-12">
						<input type="password" id="mpass" name="mpass" class="form-control" maxlength="16">
					</div>
				</div>

				<div class="col-sm-12" style="padding-bottom: 10px;" align="left">
					<button type="button" id="loginBtn" name="loginBtn" class="btn btn-success btn-block" style="background-color: #116411; color: white;">로그인</button>
				</div>																
			</div>
  			<div class="col-sm-4" style="margin-top: 100px; margin-bottom: 100px;"></div>
  		</div> 
	</div>
</div>
</form>

<%@ include file="/common/footer.jsp" %>