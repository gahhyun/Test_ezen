<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="loginId" value="${sessionScope.id }" />
<c:set var="loginout" value="${sessionScope.id==null ? 'Login' : 'Logout' }" /> 
<c:set var="loginoutlink" value="${sessionScope.id==null ? '/login/login' : '/login/logout' }" />


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
    <link rel="stylesheet" href="<c:url value='/resources/css/menu.css' />" />
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script> 
    <title>게시글 조회</title>
    
    <style type="text/css">
    	*{
    		font-family: 'Noto Sans KR', sans-serif;
    	}
    	
    	.container{
    		width: 50%;
    		margin: auto;
    		
    	}
    	
    	
    </style>
    
    
    
</head>
<body>

    <div id="menu">
    	<ul>
    		<li id="logo">earth</li>
    		<li><a href="<c:url value='/' />">Home</a></li>
    		<li><a href="<c:url value='/board/list' />">Board</a></li>
    		<li><a href="<c:url value='${loginoutlink}' />">${loginout}</a></li>
    		<li><a href="<c:url value='/register/add' />">SignUp</a></li>
    		<li><a href=""><i class="fas fa-search small"></i></a></li>
    	</ul>
    </div>  
    
    
   
   <script type="text/javascript">
   		$(document).ready(function() {
			
		})
   </script>
    
    <div class="container">
    	<h2>게시판 ${mode=="new" ? "글쓰기" : "읽기"} </h2>
    	<form action="" id="form" class="frm" method="post">
    		<input type="hidden" name="bno" value="${boardDTO.bno }" >
    		<input type="text" name="title" value="${boardDTO.title }" ${mode=="new" ? "" : "readonly='readonly'" }/><br>
    		<textarea rows="20" name="content" ${mode=="new" ? "" : "readonly='readonly'" }>${boardDTO.content }</textarea><br>
    		
    		<c:if test="${mode eq 'new' }">
    			<button type="button" id="writeBtn" class="btn btn-write"><i class="fa-sharp fa-solid fa-pencil"/>등록</button>
    		</c:if>
    		<c:if test="${mode eq 'new' }">
    			<button type="button" id="writeNewBtn" class="btn btn-write"><i class="fa-sharp fa-solid fa-pencil"/>글쓰기</button>
    		</c:if>
    		<c:if test="${boardDTO.writer eq loginId }">
    			<button type="button" id="modifyBtn" class="btn btn-write"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>수정</button>
    			<button type="button" id="removeBtn"  class="btn btn-write"><i class="fa fa-trash" aria-hidden="true"></i>삭제</button>
    		</c:if>
    		
    		<button type="button" id="listBtn" class="btn btn-list"><i class="fa fa-list" aria-hidden="true"></i>목록</button>
    	</form>
    	
    	<button type="button" id="sendBtn" >SEND</button>
    	<button type="button" id="modBtn" >수정하기</button>
    </div>
    
</body>
</html>































