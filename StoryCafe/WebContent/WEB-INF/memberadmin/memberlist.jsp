<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/member/memadmin-header.jsp" %>

<form id="searchForm" name="searchForm" method="get" action="">
<input type="hidden" id="pg" name="pg" value="1">
	<div class="col-sm-12">
		<div class="col-sm-6"></div>
		<div class="col-sm-2">
			<div class="form-group">	
	  			<select class="form-control" id="key" name="key">
					<option value="mcode">분류</option>
					<option value="mname">이름</option>
					<option value="mno">번호</option>
				</select>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="input-group">
				<input type="text" class="form-control" id="word" name="word">
				<div class="input-group-btn">
					<button class="btn btn-default" type="submit">
	       				<i class="glyphicon glyphicon-search"></i>
	      			</button>
	      		</div>	
			</div>
		</div>
	</div>
</form>

<div style="margin-bottom: 20px; margin-top: 20px; height: 100%;">
	<table class="table table-bordered" style="text-align: center;">
		<thead>
			<tr style="background-color: #116411; color: white;">
				<td width="7%">번호</td>
				<td width="8%">이름</td>
				<td width="10%">아이디</td>
				<td width="16%">이메일</td>
				<td width="15%">전화번호</td>
				<td width="7%">성별</td>
				<td width="9%">가입일자</td>
				<td width="9%">탈퇴일자</td>
				<td width="7%">분류</td>
			</tr>
		</thead>
<c:forEach var="memlist" items="${memberList}">				
		<tbody>		
			<tr>
				<td>${memlist.mno}</td>
				<td>${memlist.mname}</td>
				<td>${memlist.mid}</td>
				<td>${memlist.email1}${memlist.email2}</td>
				<td>0${memlist.phone1}-${memlist.phone2}-${memlist.phone3}</td>
	<c:if test="${memlist.mgender == 1}">			
				<td>남</td>
	</c:if>
	<c:if test="${memlist.mgender == 2}">			
				<td>여</td>
	</c:if>			
				<td>${memlist.mjoindate}</td>
				<td>${memlist.moutdate}</td>
				<td>${memlist.mcode}</td>
			</tr>		
		</tbody>
</c:forEach>		
	</table>
</div>
<div class="col-sm-12">	
	<div class="col-sm-6"></div>
	<div class="col-sm-2" align="right" style="margin-bottom: 20px; margin-top: 5px; height: 100%;">
		<button type="button" class="btn btn-default btn-block" id="insertclick" name="insertclick" data-toggle="modal" data-target="#insertModal"
			style="color:white; background-color: #116411; border-color: #116411;">회원등록</button>
 		<!-- Modal -->
  		<div class="modal fade" id="insertModal" role="dialog">
    		<div class="modal-dialog">
    			<%@ include file="/admin/member/memberinsert.jsp"%>
    		</div>
  		</div>
	</div>

	<div class="col-sm-2" align="right" style="margin-bottom: 20px; margin-top: 5px; height: 100%;">
		<button type="button" id="updateclick" name="updateclick" class="btn btn-default btn-block" data-toggle="modal" data-target="#updateModal"
			style="color:white; background-color: #116411; border-color: #116411;">분류수정</button>
		<!-- Modal -->
  		<div class="modal fade" id="updateModal" role="dialog">
    		<div class="modal-dialog">
				<%@ include file="/admin/member/memberupdate.jsp"%>
    		</div>
  		</div>			
	</div>
	
	<div class="col-sm-2" align="right" style="margin-bottom: 20px; margin-top: 5px; height: 100%;">
		<button type="button" id="deleteclick" name="deleteclick" class="btn btn-default btn-block" data-toggle="modal" data-target="#deleteModal"
			style="color:white; background-color: #116411; border-color: #116411;">회원삭제</button>
		<!-- Modal -->
  		<div class="modal fade" id="deleteModal" role="dialog">
    		<div class="modal-dialog">
    			<%@ include file="/admin/member/memberdelete.jsp"%>
    		</div>
  		</div>
	</div>
</div>


<%@ include file="/admin/member/memadmin-footer.jsp" %>
