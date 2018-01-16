<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp" %>

<script type="text/javascript">
var idflag = false;

$(document).ready(function() {
	$("#cancelBtn").click(function() {
		if (confirm("회원가입을 취소하시겠습니까?") == true) {
			document.location.href = "${root}/index.jsp"
		} else {
			return;
		}
	});
	
	$("#registerBtn").click(function() {
		if($("#mname").val() == "") {
			alert("이름을 입력하세요!");
			return;
		} else if(!idflag) {
			alert("아이디를 입력하세요!");
			return;
		} else if($("#mpass").val() == "") {
			alert("비밀번호를 입력하세요!");
			return;
		} else if($("#mpass").val() != $("#mpassok").val()) {
			alert("비밀번호를 확인하세요!");
			return;
		} else if($("#phone1").val() == "msel"){
			alert("휴대폰번호를 확인하세요!");
			return;
		} else if($("#phone2").val() == "msel"){
			alert("휴대폰번호를 입력하세요!");
			return;
		} else if($("#phone3").val() == "msel"){
			alert("휴대폰번호를 입력하세요!");
			return;
		} else if($("#email1").val() == ""){
			alert("이메일을 입력하세요!");
			return;			
		} else if($("#email2").val() == "msel"){
			alert("이메일을 확인하세요!");
			return;
		} else if($("#mgender").val() == "gsel"){
			alert("성별을 선택하세요!");
			return;
		} else {		
			if(confirm("회원가입을 완료하시겠습니까?") == true){
				document.memberform.action = "${root}/user/join.cafe";
				document.memberform.submit();
			} else {
				return;
			}
		}		
	});
});

var idckresult;

function idcheck(){
	var output = '아이디는 6자이상 16자이하입니다.';
	var sid = $("#mid").val();
	
	if (sid.length >= 6 && sid.length <= 16) {
		$.ajax({
			type: 'GET',
			dataType: 'json',
			url: '${root}/user/idcheck.cafe',
			data: {'sid':sid},
			success: function(data) {
				if (data.idcount == '0') {
					idflag = true;
					output = '<font color="blue"><b>' + data.sid + '</b>는 사용가능합니다.</font>';
				} else {
					idflag = false;
					output = '<font color="red"><b>' + data.sid + '</b>는 이미 존재하는 아이디입니다.</font>';
				}
				$("#idckresult").empty();
				$("#idckresult").append(output);
			},
			error: function(e) {
				alert("에러발생 : " + e);
			}
			
		});
	} else {
		idflag = false;
		$("#idckresult").empty();
		$("#idckresult").append(output);		
	}
	
}

</script>
<form name="memberform" method="post" action="">
<div class="container" align="center">
	<h3><font color="#116411"><strong>회원가입</strong></font></h3>
	<div class="card" style="margin-top: 50px; margin-bottom: 50px;">
  		<div class="col-sm-12 card-body" style="border: 5px solid #116411; height: 100%">
  			<div class="col-sm-4" style="margin-top: 100px; margin-bottom: 100px;"></div>
  			<div class="col-sm-4" style="margin-top: 100px; margin-bottom: 100px;">
				<div class="form-group" style="padding-bottom: 60px;" align="left">
					<div class="col-sm-12">
						<label>이름</label>
					</div>
					<div class="col-sm-12">
						<input type="text" id="mname" name="mname" class="form-control" maxlength="15">
					</div>
				</div>
				  			
				<div class="form-group" style="padding-bottom: 60px;" align="left">
					<div class="col-sm-12">
						<label>아이디</label>
					</div>
					<div class="col-sm-12">
						<input type="text" id="mid" name="mid" class="form-control" maxlength="16" onkeyup="javascript:idcheck();">
					</div>
					<div class="col-sm-12" id="idckresult"></div>
				</div>
				<div class="form-group" style="padding-bottom: 60px;" align="left">
					<div class="col-sm-12">
						<label>비밀번호</label>
					</div>
					<div class="col-sm-12">
						<input type="password" id="mpass" name="mpass" class="form-control" maxlength="16" placeholder="">
					</div>
				</div>
				<div class="form-group" style="padding-bottom: 60px;" align="left">
					<div class="col-sm-12">
						<label>비밀번호 확인</label>
					</div>
					<div class="col-sm-12">
						<input type="password" id="mpassok" name="mpassok" class="form-control" maxlength="16" placeholder="">
					</div>
				</div>
				<div class="form-group" style="padding-bottom: 60px;" align="left">
					<div class="col-sm-12">
						<label for="gender">성별</label>
					</div>
					<div class="col-sm-12">
					<select id="mgender" name="mgender" class="form-control">
						<option value="gsel" selected="selected">선택</option>
						<option value="1">남</option>
						<option value="2">여</option>
					</select>				
					</div>						
				</div>				
				<div class="form-group" style="padding-bottom: 60px;" align="left">
					<div class="col-sm-12">
						<label for="phone">휴대폰번호</label>
					</div>
					<div class="col-sm-4">
					<select id="phone1" name="phone1" class="form-control">
						<option value="psel" selected="selected">선택</option>
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="019">019</option>
					</select>
					</div>
					<div class="col-sm-4">
						<input type="text" id="phone2" name="phone2" class="form-control" max="4" maxlength="4" placeholder="">
					</div>
					
					<div class="col-sm-4">
						<input type="text" id="phone3" name="phone3" class="form-control" max="4" maxlength="4" placeholder="">					
					</div>				
				</div>
				<div class="form-group" style="padding-bottom: 60px;" align="left">
					<div class="col-sm-12">
						<label for="mail">이메일</label>
					</div>					
					<div class="col-sm-6">
						<input type="text" id="email1" name="email1" class="form-control" max="20" maxlength="20" placeholder="">
					</div>
					<div class="col-sm-6">
					<select id="email2" name="email2" class="form-control">
						<option value="msel" selected="selected">선택</option>
						<option value="@naver.com">네이버</option>
						<option value="@nate.com">네이트</option>
						<option value="@daum.net">다음</option>
						<option value="@gmail.com">구글</option>
					</select>
					</div>									
				</div>	
				<div class="col-sm-12" style="padding-bottom: 10px;" align="left">
					<button type="button" id="cancelBtn" class="btn btn-default btn-block" style="background-color: #116411; color: white;">취소</button>
				</div>
				<div class="col-sm-12" style="padding-bottom: 10px;" align="left">
					<button type="button" id="registerBtn" class="btn btn-default btn-block" style="background-color: #116411; color: white;">가입완료</button>
				</div>									
  			</div>
  			<div class="col-sm-4" style="margin-top: 100px; margin-bottom: 100px;"></div>
  		</div> 
	</div>
</div>
</form>
<%@ include file="/common/footer.jsp" %>