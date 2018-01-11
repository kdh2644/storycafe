<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>     
<c:if test="${boardmenu != null}">  
    <ul class="nav navbar-nav">     	
		<c:set var="ccode" value="0"/>
	  	<c:forEach var="board" items="${boardmenu}">       	
			<c:if test="${ccode != board.ccode}">
			<c:set var="ccode" value="${board.ccode}"/>
				<div class="card card-body" style="border-bottom: 1px solid #116411; margin-bottom: 10px;">
					<span style="color: #116411;"><font size="3px"><strong><b>${board.cname}</b></strong></font></span>
				</div>			      	      	
      		</c:if>
			<ul class="nav nav-pills nav-stacked" style="border:1px solid white; background-color: #116411;">				
      		    <li><a href="${root}/${board.controller}/list.cafe?bcode=${board.bcode}&pg=1&key=&word=">
      		    <font color="white">${board.bname}</font>      		    
      		    </a></li>
			</ul>      		
    	</c:forEach>
    </ul>
</c:if>
<c:if test="${boardmenu == null}">
	<c:redirect url="/boardadmin/boardmenu.cafe"/>
</c:if>

