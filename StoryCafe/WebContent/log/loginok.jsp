<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
$(document).ready(function() {
	$("#logoutBtn").click(function() {
		if (confirm("정말로 로그아웃 하시겠습니까?") == true) {
			document.location.href="${root}/user/logout.cafe"
		} else {
			return;
		}
	});
});    
</script>    
<c:if test="${userInfo != null}">
    <ul class="nav navbar-nav navbar-right">
	<c:if test="${userInfo.mname != '관리자'}">    
      <li><a href="${root}/user/mypage.cafe">
      	<span class="glyphicon glyphicon-user"></span>마이페이지</a>
      </li>
    </c:if>
	<c:if test="${userInfo.mname == '관리자'}">    
      <li><a href="${root}/user/mypage.cafe">
      	<span class="glyphicon glyphicon-user"></span>관리자페이지</a>
      </li>
    </c:if>      
      <li><a id="logoutBtn">
      	<span class="glyphicon glyphicon-log-out"></span>로그아웃</a>
      </li>
    </ul>
</c:if>