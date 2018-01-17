<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/category/cateadmin-header.jsp" %>
<script type="text/javascript">
$(document).ready(function() {
	$("#cateupdBtn").click(function() {
		if ($("#ccode").val() == "ccodesel") {
			alert("수정하실 카테고리를 입력해주세요.");
			return;			
		} else if ($("#cname").val() == "") {
			alert("수정하실 카테고리 이름을 입력해주세요.");
			return;
		} else {
			if (confirm("카테고리 수정을 완료하시겠습니까?") == true) {
				document.cateupdateform.action = "${root}/boardadmin/cateupdate.cafe";
				document.cateupdateform.submit();
			} else {
				return;
			}
		}
	});
});
</script>
<div style="border: 1px solid #116411; margin-top:120px; margin-bottom: 100px;">
<div align="center" style="margin-top: 150px; margin-bottom:50px; height: 100%;">
	<font size="5px;" style="color: #116411;"><strong>카테고리 수정</strong></font>
</div>
<div align="center" style="margin-top: 20px; margin-bottom:350px; height: 100%;">
	<form id="cateupdateform" name="cateupdateform" method="post" action="">
		<div class="col-sm-12">
			<div class="col-sm-4"></div>
			<div class="col-sm-4">
				<div style="margin-bottom: 10px;">
				<select id="ccode" name="ccode" class="form-control">
					<option value="ccodesel" selected="selected">선택</option>
					<c:forEach var="caList" items="${caList}">
						<c:if test="${cname != caList.cname}">
						<c:set var="cname" value="${caList.cname}"/>						
						<option value="${caList.ccode}">${caList.cname}</option>
						</c:if>
					</c:forEach>							
				</select>
				</div>				
				<div class="form-group">
					<input type="text" id="cname" name="cname" class="form-control" placeholder="수정할 카테고리 이름 입력">
				</div>
				<button id="cateupdBtn" name="cateupdBtn" class="btn btn-default btn-block" style="background-color: #116411; color: white;">수정</button>
			</div>
			<div class="col-sm-4"></div>
		</div>		
	</form>
</div>
</div>

<%@ include file="/admin/category/cateadmin-footer.jsp" %>