<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/community/community-header.jsp" %>
<script>
control = "/album";

function searchArticle() {
	document.getElementById("searchForm").action = "${root}/album/list.cafe";
	document.getElementById("searchForm").submit();
}

function myArticle(myid) {
	$("#commonForm #bcode").val("${bcode}");
	$("#commonForm #pg").val("1");
	$("#commonForm #key").val("id");
	$("#commonForm #word").val(myid);
	document.getElementById("commonForm").action = "${root}/album/list.cafe";
	document.getElementById("commonForm").submit();
}
</script>

<div class="card card-body" style="border-bottom: 1px solid #116411;margin-top:120px; margin-bottom: 10px;">
	<span style="color: #116411;"><font size="3px"><strong><b>사진게시판</b></strong></font></span>
</div>
<div class="card card-body" style="border-bottom: 1px solid #116411;margin-bottom: 10px;">
	<p><span style="color: #116411;">자신의 자랑스러운 사진을 서로 자랑해보세요.</span></p>
</div>

<div class="col-sm-12" align="left">
새글 : ${navigator.newArticleCount} / 전체글 : ${navigator.totalArticleCount}
</div>
<div style="margin-bottom: 20px; margin-top: 20px; height: 100%;">
<c:forEach varStatus="i" var="article" items="${articlelist}">
	<div class="col-sm-3" align="left" style="padding-top: 50px;">
		<div class="col-sm-12">
			${article.subject} (${article.hit})		
		</div>
		<div class="col-sm-12">
		<a href="javascript:viewArticle('${bcode}', '${pg}', '${key}', '${word}', '${article.seq}');">
			<img src="${root}/upload/${article.saveFolder}/${article.savePicture}" width="150" height="200px"></a>
		</div>
		<div class="col-sm-6" align="left">
			${article.name}
		</div>		
		<div class="col-sm-6" align="right">
			${article.logtime}
		</div>
	</div>
</c:forEach>		
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
