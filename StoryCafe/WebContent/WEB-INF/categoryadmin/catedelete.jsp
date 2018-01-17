<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/category/cateadmin-header.jsp" %>

<script type="text/javascript">
$(document).ready(function() {
	$("#catedelBtn").click(function() {
		if ($("#cname").val() == "") {
			alert("삭제하실 카테고리 이름을 입력해주세요.");
			return;
		} else {
			if (confirm("카테고리 삭제을 완료하시겠습니까?") == true) {
				document.catedeleteform.action = "${root}/boardadmin/catedelete.cafe";
				document.catedeleteform.submit();
			} else {
				return;
			}
		}		
	});
});
</script>

<div style="border: 1px solid #116411; margin-bottom: 100px;">
<div align="center" style="margin-top: 150px; margin-bottom:50px; height: 100%;">
	<font size="5px;" style="color: #116411;"><strong>카테고리 삭제</strong></font>
	
	<p><font size="1px;" style="color: #116411;">반드시, 카테고리에 속한 게시판 리스트를 삭제하신 이후 삭제해주시기 바랍니다.</font></p>
</div>
<div align="center" style="margin-top: 20px; margin-bottom:350px; height: 100%;">
	<form id="catedeleteform" name="catedeleteform" method="post" action="">
		<div class="col-sm-12">
			<div class="col-sm-4"></div>
			<div class="col-sm-4">
				<div class="form-group">
					<label style="color: #116411;"><font size="4px">카테고리 이름</font></label>
					<input type="text" id="cname" name="cname" class="form-control">
				</div>
				<button id="catedelBtn" name="catedelBtn" class="btn btn-default btn-block" style="background-color: #116411; color: white;">등록</button>
			</div>
			<div class="col-sm-4"></div>
		</div>		
	</form>
</div>
</div>
<%@ include file="/admin/category/cateadmin-footer.jsp" %>