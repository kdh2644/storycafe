<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/member/mypage_header.jsp"%>
<script type="text/javascript">
$(document).ready(function() {
	$("#cancelBtn").click(function() {
		if (confirm("개인정보수정을 취소하시겠습니까?") == true) {
			document.location.href = "${root}/member/mypage_header.jsp"
		} else {
			return;
		}
	});
	
	$("#modifyBtn").click(function() {
		
		if (confirm("개인정보수정을 완료하시겠습니까?") == true) {
			if($("#mpass").val() != $("#mpassok").val()) {
				$("#mpass").val('');
				$("#mpassok").val('');
				return;
			} else {
				document.usermodify.action = "${root}/user/usermodify.cafe";
				document.usermodify.submit();
			}
		} else {
			return;
		}
	});	
});
</script>


<div class="card card-body" style="border-bottom: 1px solid #116411; margin-bottom: 10px;">
	<span style="color: #116411;"><font size="3px"><strong><b>내 정보 수정</b></strong></font></span>
</div>
<div align="center" style="border: 1px solid #116411; margin-top: 20px; height: 500px;">
	<div class="col-sm-12" style="padding-top: 50px;">
		<div class="col-sm-4"></div> 
		<div class="col-sm-4">
		<form id="usermodify" name="usermodify" method="post" action="">
		<input type="hidden" id="mno" name="mno" value="${userInfo.mno}">
			<div class="form-group" style="padding-bottom: 60px;" align="left">
				<div class="col-sm-12">
					<label>이름</label>
				</div>
				<div class="col-sm-12">
					<input type="text" id="mname" name="mname" class="form-control" maxlength="15" value="${userInfo.mname}" readonly="readonly">
				</div>
			</div>
			
			<div class="form-group" style="padding-bottom: 60px;" align="left">
				<div class="col-sm-12">
					<label>아이디</label>
				</div>
				<div class="col-sm-12">
					<input type="text" id="mid" name="mid" class="form-control" maxlength="16" value="${userInfo.mid}" readonly="readonly">
				</div>
			</div>

			<div class="form-group" style="padding-bottom: 60px;" align="left">
				<div class="col-sm-12">
					<label>변경할 비밀번호</label>
				</div>
				<div class="col-sm-12">
					<input type="password" id="mpass" name="mpass" class="form-control" maxlength="16" placeholder="비밀번호를 입력하세요">
				</div>
			</div>
			<div class="form-group" style="padding-bottom: 60px;" align="left">
				<div class="col-sm-12">
					<label>변경할 비밀번호 확인</label>
				</div>
				<div class="col-sm-12">
					<input type="password" id="mpassok" name="mpassok" class="form-control" maxlength="16" placeholder="한번 더 입력하세요">
				</div>
			</div>
		</form>
			<div class="col-sm-6" style="padding-bottom: 10px;" align="left">
				<button type="button" id="cancelBtn" class="btn btn-default btn-block" style="background-color: #116411; color: white;">취소</button>
			</div>
			<div class="col-sm-6" style="padding-bottom: 10px;" align="left">
				<button type="button" id="modifyBtn" class="btn btn-default btn-block" style="background-color: #116411; color: white;">수정</button>
			</div>	
		</div>
					
		<div class="col-sm-4"></div>
	</div>
</div>
<%@ include file="/member/mypage_footer.jsp"%>