<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp" %>



<div class="container">
	<div class="card card-body" align="center" style="border-bottom: 1px solid #116411;margin-top:20px; margin-bottom: 20px;">
		<span style="color: #116411;"><font size="5px"><strong><b>회원관리 공간</b></strong></font></span>
	</div>
	<div class="card card-body" style="margin-bottom: 20px;">
		<div class="col-sm-12" style="margin-bottom: 20px;"	>
			<div class="col-sm-9"></div>
			<div class="col-sm-1">
				<button type="button" id="modBtn" name="modBtn" class="btn btn-default btn-block" style="background-color: #116411; color: white;">추가</button>
			</div>
			<div class="col-sm-1">
				<button type="button" id="modBtn" name="modBtn" class="btn btn-default btn-block" style="background-color: #116411; color: white;">삭제</button>
			</div>
			<div class="col-sm-1">
				<button type="button" id="modBtn" name="modBtn" class="btn btn-default btn-block" style="background-color: #116411; color: white;">수정</button>
			</div>
		</div>
	</div>
	<div class="card card-body" style="margin-bottom: 20px;">
		<div style="margin-bottom: 20px; margin-top: 20px; height: 100%;">
			<table class="table table-bordered" style="text-align: center;">
				<thead>
					<tr style="background-color: #116411; color: white;">					
						<td width="1%"><input type="checkbox" id="check" name="check"></td>					
						<td width="6%">번호</td>
						<td width="8%">이름</td>
						<td width="10%">아이디</td>
						<td width="20%">이메일</td>
						<td width="20%">전화번호</td>
						<td width="10%">가입일자</td>
						<td width="10%">탈퇴일자</td>
						<td width="10%">분류</td>
					</tr>
				</thead>
				<tbody id="memberlist"></tbody>
			</table>
		</div>						
	</div>
</div>
<%@ include file="/common/footer.jsp" %>