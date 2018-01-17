<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
$(document).ready(function() {
	$("#listdelBtn").click(function() {
	
		if ($(".ccode").val() == "ccodesel") {
			alert("삭제할 리스트의 카테고리를 선택해주세요.");
			return;
		} else if ($(".btype").val() == "btypesel") {
			alert("삭제할 리스트의 게시판 타입을 선택해주세요.");
			return;
		} else {
			if(confirm("카테고리 삭제를 완료하시겠습니까?") == true){
				document.listdeleteform.action = "${root}/boardadmin/listdelete.cafe";
				document.listdeleteform.submit();
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
			<h4 class="modal-title"><font style="color: white;">관리자-리스트 삭제</font></h4>
		</div>
	</div>
	<div class="modal-body" style="margin-top: 20px; margin-bottom: 150px;">
		<div class="col-sm-12">
			<div class="col-sm-3"></div>					
			<div class="col-sm-6">
			<form id="listdeleteform" name="listdeleteform" method="post" action="">
			
				<div class="form-group" style="padding-bottom: 60px;" align="left">
					<div class="col-sm-12">
						<label for="ccode">카테고리</label>
					</div>
					<div class="col-sm-12">
				
					<select name="ccode" class="ccode form-control">
						<option value="ccodesel" selected="selected">선택</option>
						<c:forEach var="caList" items="${caList}">
							<c:if test="${cname != caList.cname}">
							<c:set var="cname" value="${caList.cname}"/>						
							<option value="${caList.ccode}">${caList.cname}</option>
							</c:if>
						</c:forEach>							
					</select>								
					</div>						
				</div>
				<div class="form-group" style="padding-bottom: 60px;" align="left">
					<div class="col-sm-12">
						<label for="btype">게시판 형식</label>
					</div>
					<div class="col-sm-12">					
					<select name="btype" class="btype form-control">
						<option value="btypesel" selected="selected">선택</option>
						<c:forEach var="typeList" items="${typeList}">
							<c:if test="${btypeName != typeList.btypeName}">
							<c:set var="btype" value="${typeList.btypeName}"/>							
								<option value="${typeList.btype}">${typeList.btypeName}</option>
							</c:if>
						</c:forEach>						
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
			style="color:white; background-color: #116411; border-color: #116411;" id="listdelBtn" name="listdelBtn">삭제</button>
		</div>
	</div>
</div>