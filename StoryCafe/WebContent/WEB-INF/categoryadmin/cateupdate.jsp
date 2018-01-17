<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/category/cateadmin-header.jsp" %>
<div style="border: 1px solid #116411; margin-bottom: 100px;">
<div align="center" style="margin-top: 150px; margin-bottom:50px; height: 100%;">
	<font size="5px;" style="color: #116411;"><strong>카테고리 수정</strong></font>
</div>
<div align="center" style="margin-top: 20px; margin-bottom:350px; height: 100%;">
	<form id="cateupdateform" name="cateupdateform" method="post" action="">
		<div class="col-sm-12">
			<div class="col-sm-4"></div>
			<div class="col-sm-4">
				<div class="form-group">
					<label style="color: #116411;"><font size="4px">카테고리 이름</font></label>
					<input type="text" id="cname" name="cname" class="form-control">
				</div>
				<button id="cateupdBtn" name="cateupdBtn" class="btn btn-default btn-block" style="background-color: #116411; color: white;">수정</button>
			</div>
			<div class="col-sm-4"></div>
		</div>		
	</form>
</div>
</div>

<%@ include file="/admin/category/cateadmin-footer.jsp" %>