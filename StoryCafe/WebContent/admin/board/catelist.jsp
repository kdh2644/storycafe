<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp" %>

<script type="text/javascript">
$(document).ready(function() {

	var bcode = $("#bcode").val();
	
	$.ajax({
		type: "POST",
		url: "${root}/boardadmin/catelist.cafe",
		dataType: "json",
		data: {bcode: bcode},
		success: function(data) {
			makelist(data);
		}			
	});
	
});

function makelist(data) {
	
	$("#catelist").empty();
	
	var len = data.catelist.length;
	var output='';
	
	for (var i=0; i<len; i++) {
		var cate = data.catelist[i];
		
		output += '<tr style="background-color: #116411; color: white;">';
		output += '	<td><input type="checkbox" id="checkone" name="checkone"></td>';
		output += '	<td>' + cate.cname + '</td>';
		output += '	<td>' + cate.bname + '</td>';
		output += '</tr>';
	}
	
	$("#catelist").html(output);
}

</script>

<div class="container">
	<div class="card card-body" align="center" style="border-bottom: 1px solid #116411;margin-top:20px; margin-bottom: 20px;">
		<span style="color: #116411;"><font size="5px"><strong><b>카테고리 관리 공간</b></strong></font></span>
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
						<td width="2%"><input type="checkbox" id="checkall" name="checkall"></td>
						<td width="49%">카테고리 이름</td>
						<td width="49%">리스트 이름</td>
					</tr>
				</thead>
				<tbody id="catelist"></tbody>
			</table>
		</div>						
	</div>
</div>

<%@ include file="/common/footer.jsp" %>