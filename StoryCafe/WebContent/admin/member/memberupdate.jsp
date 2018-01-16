<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
$(document).ready(function() {
	$("#updateBtn").click(function() {
		if ($(".mid").val() == "") {
			alert("회원분류를 변경할 아이디를 입력하세요");
			return;
		} else if ($("mcode").val() == "mcodesel") {
			alert("회원분류를 선택해주세요.");
			return;
		} else {
			if (confirm("회원 분류 변경을 완료하시겠습니까?") == true) {
				document.memberupdateform.action = "${root}/memberadmin/memberupdate.cafe";
				document.memberupdateform.submit();				
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
			<h4 class="modal-title"><font style="color: white;">관리자-회원분류수정</font></h4>
		</div>
	</div>
	<div class="modal-body" style="margin-top: 20px; margin-bottom: 150px;">
		<div class="col-sm-12">
			<div class="col-sm-2"></div>					
			<div class="col-sm-8">
			<form id="memberupdateform" name="memberupdateform" method="post" action="">
				<div class="form-group" style="padding-bottom: 60px;" align="left">
					<div class="col-sm-12">
						<label>회원분류를 변경할 아이디</label>
					</div>
					<div class="col-sm-12">
						<input type="text" name="mid" class="mid form-control" maxlength="16">
					</div>
				</div>			
				<div class="form-group" style="padding-bottom: 60px;" align="left">
					<div class="col-sm-12">
						<label for="mcode">회원분류</label>
					</div>
					<div class="col-sm-12">
					<select name="mcode" class="mcode form-control">
						<option value="mcodesel" selected="selected">선택</option>
						<option value="관리자">관리자</option>
						<option value="회원">회원</option>
						<option value="정지">정지</option>
						<option value="탈퇴">탈퇴</option>
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
			<button type="button" class="btn btn-default" data-dismiss="modal" id="updateBtn" name="updateBtn"
			style="color:white; background-color: #116411; border-color: #116411;">완료</button>
		</div>
	</div>
</div>