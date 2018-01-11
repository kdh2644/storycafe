<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/member/mypage_header.jsp"%>
<script type="text/javascript">
$(document).ready(function() {
	$("#outBtn").click(function() {
		if (confirm("정말로 탈퇴하시겠습니까?") == true) {
			document.outform.action = "${root}/user/outOfUser.cafe";
			document.outform.submit();
		} else {
			return;
		}
	});
});
</script>
<div class="card card-body" style="border-bottom: 1px solid #116411; margin-bottom: 10px;">
	<span style="color: #116411;"><font size="3px"><strong><b>회원탈퇴</b></strong></font></span>
</div>
<div align="center" style="border: 1px solid #116411; margin-top: 20px; height: 500px;">
	<div class="col-sm-12">
		<div class="col-sm-2" style="margin-top: 50px;"></div>
		<div class="col-sm-8" align="left" style="margin-top: 50px;">
			<font><b>* 탈퇴 후에는 같은 아이디로 재가입 및 복구가 불가능하니 신중히 결정하세요.</b></font><br><br>
			<font><b>* 탈퇴 시 삭제 정보</b></font>
			<p>
			&nbsp;&nbsp;&nbsp;1. 게시판에 올려둔 게시물 정보<br>
			&nbsp;&nbsp;&nbsp;2. 사진게시판에 올려둔 사진정보<br>
			&nbsp;&nbsp;&nbsp;3. 자료실에 올려둔 자료정보<br>
			&nbsp;&nbsp;&nbsp;한 번 삭제된 정보는 복구되지 않습니다.<br>
			
			</p>
		</div>
		<div class="col-sm-2" style="margin-top: 50px;"></div>
	</div>
	<div class="col-sm-12" style="margin-top: 8px;">
		<div class="col-sm-2" style="margin-top: 8px;"></div>
		<div class="col-sm-2" style="border: 1px solid #116411; border-color: white; background-color:#116411; color:white; padding-top: 8px; height: 40px;">
			게시물 확인
		</div>
		
		<div class="col-sm-6" style="border: 1px solid #116411; border-color: white; background-color:#116411; color:white; padding-top: 8px; height: 40px;">
			게시물이 아직 남아 있습니다.
		</div>
		
		<div class="col-sm-2" style="margin-top: 8px;"></div>
	</div>
<form id="outform" name="outform" method="post" action="">
	<input type="hidden" id="mno" name="mno" value="${userInfo.mno}">
	<div class="col-sm-12" style="margin-top: 50px;">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
		<div class="input-group">
	    <input type="password" id="mpass" name="mpass" class="form-control" placeholder="비밀번호를 입력하세요">
	    	<div class="input-group-btn">
	      		<button type="button" id="outBtn" name="outBtn" class="btn btn-default btn-block" style="color: white; background-color: #116411;">
	        		탈퇴
	      		</button>
	    	</div>
	  	</div>
	  	</div>
	  	<div class="col-sm-3"></div>
	</div>
</form>
</div>
<%@ include file="/member/mypage_footer.jsp"%>	