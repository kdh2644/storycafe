<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/community/community-header.jsp" %>
<script>
control = "/reboard";

function writeArticle() {
	if($("#subject").val() == "") {
		alert("게시판 제목을 입력해주세요.");
		return;
	} else if($("#content").val() == "") {
		alert("게시판 내용을 입력해주세요.");
		return;
	} else {
		if(confirm("게시글 수정을 완료하시겠습니까?") == true){
			document.writeForm.action = root + control + "/modify.cafe";
			document.writeForm.submit();
		} else{
			return;
		}
	}
}

$(document).ready(function() {
	$("#cancelBtn").click(function() {
		if (confirm("게시글 작성을 취소하시겠습니까?") == true) {
			document.writeForm.action = root + control + "/list.cafe";
			document.writeForm.submit();
		} else {
			return;
		}
	});
});
</script>

<div class="card card-body" style="border-bottom: 1px solid #116411;margin-top:120px; margin-bottom: 10px;">
	<span style="color: #116411;"><font size="3px"><strong><b>답변게시판</b></strong></font></span>
</div>

<div class="card card-body" style="border-bottom: 1px solid #116411;margin-bottom: 10px;">
	<p><span style="color: #116411;">서로의 게시글에 다양한 답변을 달아주세요.</span></p>
</div>

<form id="writeForm" name="writeForm" method="post" action="">
	<input type="hidden" name="bcode" value="${bcode}">
	<input type="hidden" name="pg" value="1">
	<input type="hidden" name="key" value="">
	<input type="hidden" name="word" value="">
	<input type="hidden" id="seq" name="seq" value="${article.seq}">

	
	<div class="col-sm-12">
		<div style="color: #108f50;" align="left">
			<span>작성자 : </span>
			<span>${userInfo.mname} (&nbsp;&nbsp;${userInfo.mid}&nbsp;&nbsp;)</span>	
		</div>
	</div>
	<div class="col-sm-12" style="margin-top: 10px;">
		<div class="input-group">
			<input type="text" class="form-control" id="subject" name="subject" maxlength="40" value="${article.subject}">
			<textarea id="content" name="content" class="form-control" rows="25" cols="100">${article.content}</textarea>
		</div>
	</div>
	<div class="col-sm-12" style="margin-top: 30px; margin-bottom: 30px;">
		<button type="button" id="cancelBtn" name="writeBtn" class="btn btn-default btn-block" 
			style="color:white; background-color: #116411; border-color: #116411;" id="cancelBtn" name="cancelBtn">취소</button>
		<button type="button" id="writeBtn" name="writeBtn" class="btn btn-default btn-block" 
			style="color:white; background-color: #116411; border-color: #116411;" onclick="javascript:writeArticle();">등록</button>	
	</div>
</form>


<%@ include file="/community/community-footer.jsp" %>

