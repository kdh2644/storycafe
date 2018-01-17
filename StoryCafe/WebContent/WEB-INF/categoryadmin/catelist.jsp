<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/category/cateadmin-header.jsp" %>

<div style="margin-bottom: 20px; margin-top: 120px; height: 100%;">
	<table class="table table-bordered" style="text-align: center;">
		<thead>
			<tr style="background-color: #116411; color: white;">
				<td width="30%">카테고리 </td>
			</tr>
		</thead>
<c:forEach var="caList" items="${caList}">
	<c:if test="${cname != caList.cname}">
	<c:set var="cname" value="${caList.cname}"/>						
		<tbody>		
			<tr>
				<td>${caList.cname}</td>
			</tr>
		</tbody>
	</c:if>
</c:forEach>		
	</table>
	
	<table class="table table-bordered" style="text-align: center;">
		<thead>
			<tr style="background-color: #116411; color: white;">
				<td width="30%">게시판 타입</td>
			</tr>
		</thead>
<c:forEach var="typeList" items="${typeList}">
	<c:if test="${btypeName != typeList.btypeName}">
	<c:set var="btype" value="${typeList.btypeName}"/>								
		<tbody>
			<tr>
	<c:if test="${typeList.btype == 1}">				 
				<td>답변게시판</td>
	</c:if>
	<c:if test="${typeList.btype == 2}">				
				<td>자유게시판</td>
	</c:if>
	<c:if test="${typeList.btype == 3}">				
				<td>사진게시판</td>
	</c:if>
	<c:if test="${typeList.btype == 4}">				
				<td>자료실</td>
	</c:if>			
			</tr>
		</tbody>
	</c:if>	
</c:forEach>		
	</table>
	<table class="table table-bordered" style="text-align: center;">
		<thead>
			<tr style="background-color: #116411; color: white;">
				<td width="40%">게시판 리스트</td>
			</tr>
		</thead>
<c:forEach var="cateList" items="${cateList}">						
		<tbody>		
			<tr>		
				<td>${cateList.bname}</td>
			</tr>
		</tbody>
</c:forEach>		
	</table>		
</div>
<div class="col-sm-12">	
	<div class="col-sm-6"></div>	
	
	<div class="col-sm-2" align="right" style="margin-bottom: 20px; margin-top: 5px; height: 100%;">
		<button type="button" class="btn btn-default btn-block" id="insertclick" name="insertclick" data-toggle="modal" data-target="#insertModal"
			style="color:white; background-color: #116411; border-color: #116411;">리스트 등록</button>
 		<!-- Modal -->
  		<div class="modal fade" id="insertModal" role="dialog">
    		<div class="modal-dialog">
    			<%@ include file="/admin/category/listinsert.jsp"%>
    		</div>
  		</div>
	</div>

	<div class="col-sm-2" align="right" style="margin-bottom: 20px; margin-top: 5px; height: 100%;">
		<button type="button" id="updateclick" name="updateclick" class="btn btn-default btn-block" data-toggle="modal" data-target="#updateModal"
			style="color:white; background-color: #116411; border-color: #116411;">리스트 수정</button>
		<!-- Modal -->
  		<div class="modal fade" id="updateModal" role="dialog">
    		<div class="modal-dialog">
				<%@ include file="/admin/category/listupdate.jsp"%>
    		</div>
  		</div>			
	</div>
	
	<div class="col-sm-2" align="right" style="margin-bottom: 20px; margin-top: 5px; height: 100%;">
		<button type="button" id="deleteclick" name="deleteclick" class="btn btn-default btn-block" data-toggle="modal" data-target="#deleteModal"
			style="color:white; background-color: #116411; border-color: #116411;">리스트 삭제</button>
		<!-- Modal -->
  		<div class="modal fade" id="deleteModal" role="dialog">
    		<div class="modal-dialog">
    			<%@ include file="/admin/category/listdelete.jsp"%>
    		</div>
  		</div>
	</div>
</div>



<%@ include file="/admin/category/cateadmin-footer.jsp" %>
