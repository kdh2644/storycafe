<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
$(document).ready(function() {
	$("#insBtn").click(function() {
	
		if ($("#mid").val() == "") {
			alert("아이디를 입력하세요.");
			return;
		} else if ($("#mpass").val() == "") {
			alert("비밀번호를 입력하세요.");
			return;
		} else if ($("#mname").val() == "") {
			alert("이름을 입력하세요.");
			return;
		} else if ($("#mgender").val() == "gsel") {
			alert("성별을 선택하세요.");
			return;
		} else if ($("#phone1").val() == "psel") {
			alert("연락처를 선택하세요.");
			return;
		} else if ($("#phone2").val() == "") {
			alert("연락처를 입력하세요.");
			return;
		} else if ($("#phone3").val() == "") {
			alert("연락처를 입력하세요.");
			return;
		} else if ($("#email1").val() == "") {
			alert("이메일을 입력하세요.");
			return;
		} else if ($("#email2").val() == "") {
			alert("이메일을 입력하세요.");
			return;
		} else if ($("#mcode").val() == "mcodesel") {
			alert("회원분류를 선택하세요.");
			return;
		} else {
			if(confirm("회원등록을 완료하시겠습니까?") == true){
				document.memberinsertform.action = "${root}/memberadmin/memberinsert.cafe";
				document.memberinsertform.submit();
			} else {
				return;
			}
		}
	});
});
</script>

<!-- Modal content-->
<div class="modal-content">
	<div class="modal-header" align="center" style="background-color: #116411;">
		<div class="col-sm-12">
			<h4 class="modal-title"><font style="color: white;">관리자-회원등록</font></h4>
		</div>
	</div>
	<div class="modal-body" style="margin-top: 20px; margin-bottom: 500px;">
		<div class="col-sm-12">
			<div class="col-sm-2"></div>					
			<div class="col-sm-8">
			<form id="memberinsertform" name="memberinsertform" method="post" action="">
				<div class="form-group" style="padding-bottom: 60px;" align="left">
					<div class="col-sm-12">
						<label>이름</label>
					</div>
					<div class="col-sm-12">
						<input type="text" id="mname" name="mname" class="form-control" maxlength="16">
					</div>
				</div>
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
				<div class="form-group" style="padding-bottom: 60px;" align="left">
					<div class="col-sm-12">
						<label for="gender">성별</label>
					</div>
					<div class="col-sm-12">
					<select id="mgender" name="mgender" class="form-control">
						<option value="gsel" selected="selected">선택</option>
						<option value="1">남</option>
						<option value="2">여</option>
					</select>				
					</div>						
				</div>
				<div class="form-group" style="padding-bottom: 60px;" align="left">
					<div class="col-sm-12">
						<label for="phone">휴대폰번호</label>
					</div>
					<div class="col-sm-4">
					<select id="phone1" name="phone1" class="form-control">
						<option value="psel" selected="selected">선택</option>
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="019">019</option>
					</select>
					</div>
					<div class="col-sm-4">
						<input type="text" id="phone2" name="phone2" class="form-control" max="4" maxlength="4" placeholder="">
					</div>
					
					<div class="col-sm-4">
						<input type="text" id="phone3" name="phone3" class="form-control" max="4" maxlength="4" placeholder="">					
					</div>				
				</div>
				<div class="form-group" style="padding-bottom: 60px;" align="left">
					<div class="col-sm-12">
						<label for="mail">이메일</label>
					</div>					
					<div class="col-sm-6">
						<input type="text" id="email1" name="email1" class="form-control" max="20" maxlength="20" placeholder="">
					</div>
					<div class="col-sm-6">
					<select id="email2" name="email2" class="form-control">
						<option value="msel" selected="selected">선택</option>
						<option value="@naver.com">네이버</option>
						<option value="@nate.com">네이트</option>
						<option value="@daum.net">다음</option>
						<option value="@gmail.com">구글</option>
					</select>
					</div>									
				</div>
				<div class="form-group" style="padding-bottom: 60px;" align="left">
					<div class="col-sm-12">
						<label for="mcode">회원분류</label>
					</div>
					<div class="col-sm-12">
					<select id="mcode" name="mcode" class="form-control">
						<option value="mcodesel" selected="selected">선택</option>
						<option value="관리자">관리자</option>
						<option value="회원">회원</option>
					</select>				
					</div>						
				</div>																													
			</form>
			</div>
			<div class="col-sm-2"></div>		
		</div>
	</div>

	<div class="modal-footer" align="center">
		<div class="col-sm-12">
			<button type="button" class="btn btn-default" data-dismiss="modal"
			style="color:white; background-color: #116411; border-color: #116411;">취소</button>
			<button type="button" class="btn btn-default" data-dismiss="modal" 
			style="color:white; background-color: #116411; border-color: #116411;" id="insBtn" name="insBtn">등록</button>
		</div>
	</div>
</div>