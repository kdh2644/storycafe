<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
$(document).ready(function() {
	$("#deleteBtn").click(function() {
		if ($("#mno").val() == "") {
			alert("삭제하실 회원정보의 번호를 입력해주세요.");
			return;
		} else {
			if (confirm("해당되는 회원정보를 삭제시키시겠습니까?") == true) {
				document.memberdeleteform.action = "${root}/memberadmin/memberdelete.cafe";
				document.memberdeleteform.submit();
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
			<h4 class="modal-title"><font style="color: white;">관리자-회원삭제</font></h4>
		</div>
	</div>
	<div class="modal-body" style="margin-top: 20px; margin-bottom: 100px;">
		<div class="col-sm-12">
			<div class="col-sm-2"></div>					
			<div class="col-sm-8">
			<form id="memberdeleteform" name="memberdeleteform" method="post" action="">
				<div class="form-group" style="padding-bottom: 60px;" align="left">
					<div class="col-sm-12">
						<label>삭제할 회원번호</label>
					</div>
					<div class="col-sm-12">
						<input type="text" id="mno" name="mno" class="form-control" maxlength="16">
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
			<button type="button" class="btn btn-default" data-dismiss="modal" id="deleteBtn" name="deleteBtn"
			style="color:white; background-color: #116411; border-color: #116411;">완료</button>
		</div>
	</div>
</div>