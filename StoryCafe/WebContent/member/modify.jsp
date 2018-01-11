<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/member/mypage_header.jsp"%>

<script type="text/javascript">
$(document).ready(function() {
	$("#checkBtn").click(function() {
		if ($("#mpass").val() == "") {
			alert("비밀번호를 입력하세요!");
			return;	
		} else {
			document.modifyform.action = "${root}/user/modify.cafe";
			document.modifyform.submit();
		}
	});	
});
</script>

<div class="card card-body" style="border-bottom: 1px solid #116411; margin-bottom: 10px;">
	<span style="color: #116411;"><font size="3px"><strong><b>내 정보 수정</b></strong></font></span>
</div>
<div align="center" style="border: 1px solid #116411; margin-top: 20px; height: 500px;">
	<div class="col-sm-12">	
		<div class="col-sm-2"></div>
		<div class="col-sm-8" style="padding-top: 150px;">
			<div class="card card-body" style="border-top:1px solid #116411; border-bottom:1px solid #116411;">
				<font size="2px">회원님의 개인정보 보호를 위해</font><br>
				<font size="2px">비밀번호를 한번 더 입력해주세요.</font>
			</div>	
		</div>
		<div class="col-sm-2"></div>
	</div>

<form id="modifyform" name="modifyform" method="post" action="">
	<div class="col-sm-12" style="margin-top: 50px">	
		<div class="col-sm-4"></div>
		<div class="col-sm-4">
	  		<div class="input-group">
	    		<input type="password" id="mpass" name="mpass" class="form-control" placeholder="비밀번호를 입력하세요">
	    		<div class="input-group-btn">
	      			<button type="button" id="checkBtn" class="btn btn-default btn-block" style="color: white; background-color: #116411;">
	        			확인
	      			</button>
	    		</div>
	  		</div>			
		</div>	
		<div class="col-sm-4"></div>
	</div>
</form>

</div>
<%@ include file="/member/mypage_footer.jsp"%>