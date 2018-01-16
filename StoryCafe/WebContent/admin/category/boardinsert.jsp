<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
$(document).ready(function() {
	$("#insBtn").click(function() {
	
		if ($("#cname").val() == "") {
			alert("카테고리 이름을 입력해주세요.");
			return;
		} else if ($("#bname").val() == "") {
			alert("게시판 이름을 입력해주세요.");
			return;
		} else if ($("#btype").val() == "btypesel") {
			alert("게시판 타입을 선택해주세요.");
			return;
		} else {
			if(confirm("카테고리 등록을 완료하시겠습니까?") == true){
				document.boardinsertform.action = "${root}/boardadmin/boardinsert.cafe";
				document.boardinsertform.submit();
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
			<h4 class="modal-title"><font style="color: white;">관리자-카테고리 등록</font></h4>
		</div>
	</div>
	<div class="modal-body" style="margin-top: 20px; margin-bottom: 250px;">
		<div class="col-sm-12">
			<div class="col-sm-3"></div>					
			<div class="col-sm-6">
			<form id="boardinsertform" name="boardinsertform" method="post" action="">
				<div class="form-group" style="padding-bottom: 60px;" align="left">
					<div class="col-sm-12">
						<label>카테고리 이름</label>
					</div>
					<div class="col-sm-12">
						<input type="text" id="cname" name="cname" class="form-control" maxlength="20">
					</div>
				</div>
				<div class="form-group" style="padding-bottom: 60px;" align="left">
					<div class="col-sm-12">
						<label>게시판 이름</label>
					</div>
					<div class="col-sm-12">
						<input type="text" id="bname" name="bname" class="form-control" maxlength="20">
					</div>
				</div>

				<div class="form-group" style="padding-bottom: 60px;" align="left">
					<div class="col-sm-12">
						<label for="btype">게시판 형식</label>
					</div>
					<div class="col-sm-12">
					<select id="btype" name="btype" class="form-control">
						<option value="btypesel" selected="selected">선택</option>
						<option value="1">답변게시판</option>
						<option value="2">자유게시판</option>
						<option value="3">사진게시판</option>
						<option value="4">자료실</option>
					</select>				
					</div>						
				</div>
																							
			</form>
			</div>
			<div class="col-sm-3"></div>		
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