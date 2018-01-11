<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/community/community-header.jsp" %>
<script>
control = "/board";

function searchArticle() {
	document.getElementById("searchForm").action = "${root}/board/list.cafe";
	document.getElementById("searchForm").submit();
}

function myArticle(myid) {
	$("#commonForm #bcode").val("${bcode}");
	$("#commonForm #pg").val("1");
	$("#commonForm #key").val("id");
	$("#commonForm #word").val(myid);
	
	document.getElementById("commonForm").action = "${root}/board/list.cafe";
	document.getElementById("commonForm").submit();
}

</script>
<div class="card card-body" style="border-bottom: 1px solid #116411;margin-top:120px; margin-bottom: 10px;">
	<span style="color: #116411;"><font size="3px"><strong><b>자유게시판</b></strong></font></span>
</div>
<div class="card card-body" style="border-bottom: 1px solid #116411;margin-bottom: 10px;">
	<p><span style="color: #116411;">자유롭게 서로의 일상을 이야기해보세요.</span></p>
</div>
<div class="col-sm-12" align="left">
새글 : ${navigator.newArticleCount} / 전체글 : ${navigator.totalArticleCount}
</div>
<div style="margin-bottom: 20px; margin-top: 20px; height: 100%;">
	<table class="table table-bordered" style="text-align: center;">
		<thead>
			<tr style="background-color: #116411; color: white;">
				<td width="10%">번호</td>
				<td width="40%">제목</td>
				<td width="10%">조회</td>
				<td width="20%">작성자</td>
				<td width="20%">날짜</td>
			</tr>
		</thead>
<c:forEach var="article" items="${articlelist}">		
		<tbody>
			<tr>
				<td>${article.seq}</td>
				<td align="left" style="overflow: hidden; text-overflow: ellipsis; padding: 0;">
				<a href="javascript:viewArticle('${bcode}', '${pg}', '${key}', '${word}', '${article.seq}');">${article.subject}</a></td>
				<td>${article.hit}</td>
				<td>${article.name}</td>
				<td>${article.logtime}</td>
			</tr>		
		</tbody>
</c:forEach>		
	</table>
</div>
<div class="col-sm-12" align="right">
${navigator.pageNo} / ${navigator.totalPageCount}
</div>
<div class="col-sm-12">
	${navigator.navigator}
</div>
<div class="col-sm-2"></div>
<form id="searchForm" name="searchForm" method="get" action="">
<input type="hidden" id="bcode" name="bcode" value="${bcode}">
<input type="hidden" id="pg" name="pg" value="1">
	<div class="col-sm-8">
		<div class="col-sm-4">
			<div class="form-group">	
	  			<select class="form-control" id="key" name="key">
					<option value="subject">제목</option>
					<option value="name">작성자</option>
					<option value="seq">번호</option>
				</select>
			</div>
		</div>
		<div class="col-sm-8">
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

<c:if test="${userInfo.mid != null}">
<div class="col-sm-2" align="right" style="margin-bottom: 20px; margin-top: 20px; height: 100%;">
	<button type="button" id="writeBtn" name="writeBtn" class="btn btn-default btn-block" 
		style="color:white; background-color: #116411; border-color: #116411;" onclick="javascript:moveWrite('${bcode}');">글쓰기</button>
</div>
</c:if>
<%@ include file="/community/community-footer.jsp" %>
