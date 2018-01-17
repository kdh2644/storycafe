<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
$(document).ready(function() {
	$("#listupdateBtn").click(function() {
	
		if ($("#lccode").val() == "ccodesel") {
			alert("수정하실 리스트의 카테고리를 선택해주세요.");
			return;
		} else if ($("#lbname").val() == "") {
			alert("수정하실 게시판 리스트 이름을 입력해주세요.");
			return;
		} else if ($("#lbtype").val() == "btypesel") {
			alert("수정하실 리스트의 게시판 타입을 선택해주세요.");
			return;
		} else {
			if(confirm("카테고리 수정을 완료하시겠습니까?") == true){
				document.listupdateform.action = "${root}/boardadmin/listupdate.cafe";
				document.listupdateform.submit();
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
			<h4 class="modal-title"><font style="color: white;">관리자-리스트 수정</font></h4>
		</div>
	</div>
	<div class="modal-body" style="margin-top: 20px; margin-bottom: 250px;">
		<div class="col-sm-12">
			<div class="col-sm-3"></div>					
			<div class="col-sm-6">
			<form id="listupdateform" name="listupdateform" method="post" action="">
				<div class="form-group" style="padding-bottom: 60px;" align="left">
					<div class="col-sm-12">
						<label for="ccode">카테고리</label>
					</div>
					<div class="col-sm-12">
				
					<select id="lccode" name="lccode" class="form-control">
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
						<label>게시판 이름</label>
					</div>
					<div class="col-sm-12">
						<input type="text" id="lbname" name="lbname" class="form-control" maxlength="20">
					</div>
				</div>

				<div class="form-group" style="padding-bottom: 60px;" align="left">
					<div class="col-sm-12">
						<label for="btype">게시판 형식</label>
					</div>
					<div class="col-sm-12">
					<select id="lbtype" name="lbtype" class="form-control">
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
			style="color:white; background-color: #116411; border-color: #116411;" id="listupdateBtn" name="listupdateBtn">수정</button>
		</div>
	</div>
</div>