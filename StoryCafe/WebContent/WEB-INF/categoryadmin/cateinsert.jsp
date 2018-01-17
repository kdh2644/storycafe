<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/category/cateadmin-header.jsp" %>
<script type="text/javascript">
$(document).ready(function() {
	$("#cateinsBtn").click(function() {
		if ($("#cname").val() == "") {
			alert("카테고리 이름을 입력해주세요.");
			return;
		} else {
			if (confirm("카테고리 등록을 완료하시겠습니까?") == true) {
				document.cateinsertform.action = "${root}/boardadmin/cateinsert.cafe";
				document.cateinsertform.submit();
			} else {
				return;
			}
		}
	});
});
</script>
<div style="border: 1px solid #116411; margin-bottom: 100px;">
<div align="center" style="margin-top: 150px; margin-bottom:50px; height: 100%;">
	<font size="5px;" style="color: #116411;"><strong>카테고리 등록</strong></font>
</div>
<div align="center" style="margin-top: 20px; margin-bottom:350px; height: 100%;">
		<div class="col-sm-12">
			<div class="col-sm-4"></div>
			<div class="col-sm-4">
				<form id="cateinsertform" name="cateinsertform" method="post" action="">
				<div class="form-group">
					<label style="color: #116411;"><font size="4px">카테고리 이름</font></label>
					<input type="text" id="cname" name="cname" class="form-control">
				</div>
				</form>	
				<button id="cateinsBtn" name="cateinsBtn" class="btn btn-default btn-block" style="background-color: #116411; color: white;">등록</button>
			</div>
			<div class="col-sm-4"></div>
		</div>		
</div>
</div>
<%@ include file="/admin/category/cateadmin-footer.jsp" %>