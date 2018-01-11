<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/community/community-header.jsp" %>
<script>
control = "/album";
function moveModify() {
	document.getElementById("bcode").value = "${bcode}";
	document.getElementById("pg").value = "1";
	document.getElementById("key").value = "";
	document.getElementById("word").value = "";
	document.getElementById("seq").value = "${article.seq}";
	
	document.getElementById("commonForm").action = root + control + "/modify.cafe";
	document.getElementById("commonForm").submit();
}

function deleteArticle(){
	document.getElementById("bcode").value = "${bcode}";
	document.getElementById("pg").value = "1";
	document.getElementById("key").value = "";
	document.getElementById("word").value = "";
	document.getElementById("seq").value = "${article.seq}";
	
	if (confirm("정말로 게시글을 삭제하시겠습니까?") == true) {
		document.getElementById("commonForm").action = root + control + "/delete.cafe";
		document.getElementById("commonForm").submit();			
	} else {
		return;
	}

}

function moveReply() {
	document.getElementById("bcode").value = "${bcode}";
	document.getElementById("pg").value = "1";
	document.getElementById("key").value = "";
	document.getElementById("word").value = "";
	document.getElementById("seq").value = "${article.seq}";
	
	document.getElementById("commonForm").action = root + control + "/reply.cafe";
	document.getElementById("commonForm").submit();
}

$(document).ready(function() {
	$.ajax({
		type: "POST",
		url: "${root}/memo/list.cafe",
		dataType: "json",
		data: {seq: "${article.seq}"},
		success: function(data) {
			makelist(data);
		}
	});
	
	$("#memoBtn").click(function() {
		var mcontent = $("#mcontent").val();
		alert(mcontent);
		
		if (mcontent.length != 0) {
			$.ajax({
				type: "POST",
				url: "${root}/memo/write.cafe",
				dataType: "json",
				data: {seq: "${article.seq}", mcontent: mcontent},
				success: function(data) {
					makelist(data);
				}
				
			});
		}
		
	});
	
	$(document).on('click','#memolist>div #delBtn', 
			function(event){ 				
				alert("글삭제" + $(this).parent().attr("data-seq"));
				$.ajax({
					type: "POST",
					url: "${root}/memo/delete.cafe",
					dataType: "json",
					data: {seq: "${article.seq}", mseq: $(this).parent().attr("data-seq")},
					success: function(data) {
						makelist(data);
					}
				});
		});	
	
});

function makelist(data) {
	$("#memolist").empty();
	
	var len = data.memolist.length;
	var output='';
	for(var i=0;i<len;i++){
		var memo = data.memolist[i];
		
		output += '<div class="col-sm-12" style="border-top: 1px solid #116411;">';
		output += '	<div class="col-sm-6" align="left">';
		output += decodeURIComponent(memo.name);
		output += '	</div>';
		output += '	<div class="col-sm-6" align="right">';
		output += memo.mtime;
		output += '	</div>';
		output += '</div>';
		output += '<div class="col-sm-12">';		
		output += '	<div class="col-sm-6" align="left">';
		output += decodeURIComponent(memo.mcontent);
		output += '	</div>';		
		output += '	<div class="col-sm-6" align="right" data-seq="' + memo.mseq + '">';
		if('${userInfo.mid}' == memo.id){
			output += '	<i id="delBtn" class="fa fa-times-circle" aria-hidden="true"></i>';
		}
		output += '	</div>';
		output += '</div>';		
	}
	
	$("#memolist").html(output);	
}
</script>
<div class="card card-body" style="border-bottom: 1px solid #116411;margin-top:120px; margin-bottom: 10px;">
	<span style="color: #116411;"><font size="3px"><strong><b>사진게시판</b></strong></font></span>
</div>

<div class="card card-body" style="border-bottom: 1px solid #116411;margin-bottom: 10px;">
	<p><span style="color: #116411;">자신의 자랑스러운 사진을 서로 자랑해보세요.</span></p>
</div>

<div class="col-sm-12">
	<div class="col-sm-12" align="left" style="margin-bottom: 20px;">
		<span><font size="3px" style="color: #108f50;">글번호 : </font></span>
		<span><font size="3px" style="color: #108f50;">${article.seq}</font></span>
	</div>
	<div class="col-sm-4" align="left" style="margin-bottom: 20px;">
		<span><font size="3px" style="color: #108f50;">작성자 : </font></span>
		<span><font size="3px" style="color: #108f50;">${article.name}</font></span>
	</div>
	<div class="col-sm-4" align="left" style="margin-bottom: 20px;">
		<span><font size="3px" style="color: #108f50;">조회 : </font></span>
		<span><font size="3px" style="color: #108f50;">${article.hit}</font></span>
	</div>	
	<div class="col-sm-4" align="right" style="margin-bottom: 20px;">
		<span><font size="3px" style="color: #108f50;">작성일자 : </font></span>
		<span><font size="3px" style="color: #108f50;">${article.logtime}</font></span>
	</div>
	<div class="col-sm-12">	
		<div class="input-group">
			<div align="left"><font size="3px" style="color: #108f50;">제목</font></div>
			<input type="text" class="form-control" id="subject" name="subject" maxlength="150" readonly="readonly" value="${article.subject}">
			<br><br>
			<div align="left"><font size="3px" style="color: #108f50;">내용</font></div>
			<div class="col-sm-12" style="margin-top: 20px;">
				<div class="col-sm-6">
					<img src="${root}/upload/${article.saveFolder}/${article.savePicture}" width="350px" height="480px">
				</div>
				<div class="col-sm-6">
					<textarea id="content" name="content" class="form-control" rows="25" cols="100" readonly="readonly">${article.content}</textarea>
				</div>
			</div>
		</div>
	</div>
</div>
<c:if test="${article.id == userInfo.mid}">
<div class="col-sm-12">	
	<div class="col-sm-6"></div>
	<div class="col-sm-2" align="right" style="margin-bottom: 20px; margin-top: 20px; height: 100%;">
		<button type="button" id="writeBtn" name="writeBtn" class="btn btn-default btn-block" 
			style="color:#108f50; background-color: #85cb97; border-color: #108f50;" onclick="javascript:listArticle('${bcode}', '1', '', '');">목록</button>
	</div>

	<div class="col-sm-2" align="right" style="margin-bottom: 20px; margin-top: 20px; height: 100%;">
		<button type="button" id="writeBtn" name="writeBtn" class="btn btn-default btn-block" 
			style="color:#108f50; background-color: #85cb97; border-color: #108f50;" onclick="javascript:moveModify();">수정</button>
	</div>
	
	<div class="col-sm-2" align="right" style="margin-bottom: 20px; margin-top: 20px; height: 100%;">
		<button type="button" id="writeBtn" name="writeBtn" class="btn btn-default btn-block" 
			style="color:#108f50; background-color: #85cb97; border-color: #108f50;" onclick="javascript:deleteArticle();">삭제</button>
	</div>
</div>
</c:if>
<c:if test="${article.id != userInfo.mid}">
<div class="col-sm-12">
	<div class="col-sm-10"></div>	
	<div class="col-sm-2" align="right" style="margin-bottom: 20px; margin-top: 20px; height: 100%;">
		<button type="button" id="writeBtn" name="writeBtn" class="btn btn-default btn-block" 
			style="color:white; background-color: #116411; border-color: #116411;" onclick="javascript:listArticle('${bcode}','1','','');">목록</button>
	</div>		

</div>	
</c:if>
<div class="col-sm-12">
	<div class="card card-body" align="left"
		style="border-top: 1px solid #116411; border-bottom: 1px solid #116411; padding-top: 10px; padding-bottom: 10px; margin-top:10px; margin-bottom: 10px;">
		<span style="color: #116411;"><font size="3px"><strong><b>작성자 : ${userInfo.mname} (${userInfo.mid})</b></strong></font></span>
		<textarea id="mcontent" name="mcontent" class="form-control" rows="4" cols="100" placeholder="내용을 작성해주세요"></textarea>
		<button type="button" id="memoBtn" name="memoBtn" class="btn btn-default btn-block" 
			style="color:white; background-color: #116411; border-color: #116411;">확인</button>	
	</div>
</div>

<div id="memolist"></div>
<%@ include file="/community/community-footer.jsp" %>