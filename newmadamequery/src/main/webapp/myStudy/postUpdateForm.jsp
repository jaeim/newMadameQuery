<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="model.*, controller. *" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정 페이지</title>
<script>
	function postModify(){
		
		if(form.title.value == ""){
			alert("제목을 입력하십시오.");
			form.name.focus();
			return false;
		}
		if(form.content.value == ""){
			alert("내용을 입력하십시오.");
			form.contents.focus();
			return false;
		}
		form.submit();
	}
</script>
<style>
	body {
  margin: 0;
  padding: 0;
  font-family: Arial;
  display: flex;
  flex-flow: column nowrap;
  justify-content: center;
  align-items: center;
  overflow-x: hidden;  
}

h1 {
  margin: 2em 0 1.5em 0;
}

nav {
  width: 100%;
  display: flex;
  justify-content: center;
  position: relative;
  background:  #C0EDFF;
}

ul, li {
  margin: 0;
  padding: 0;
  list-style: none;
}

#main-menu > li {
  float: left;
  position: relative;
}

#main-menu > li > a {
  font-size: 0.85rem;
  color: black;
  text-align: center;
  text-decoration: none;
  letter-spacing: 0.05em;
  display: block;
  padding: 14px 36px;
  border-right: 1px solid rgba(0,0,0,0.15);
  text-shadow: 1px 1px 1px rgba(0,0,0,0.2);
}

#main-menu > li:nth-child(1) > a {
  border-left: 1px solid rgba(0,0,0,0.15);
}

#sub-menu {
  position: absolute;
  background: white;
  opacity: 0;
  visibility: hidden;
  transition: all 0.15s ease-in;
  font-family: Arial;
}

#sub-menu > li {
  padding: 16px 28px;
  border-bottom: 1px solid rgba(0,0,0,0.15);
  
}

#sub-menu > li >  a {
  color: black;
  text-decoration: none;
  font-family: Arial;
}

#main-menu > li:hover #sub-menu {
  opacity: 1;
  visibility: visible;
}

#sub-menu > li >  a:hover {
 text-decoration: underline;
}


#pTable{
	margin: auto;
	width: 400px;
	height: 200px;
	text-align: center;
}
#bc{
	background : #084B8A;
	color: white;
}
#pUpdateB{
	background : #084B8A;
	color: white;
	float: right;
}
</style>
</head>
<body>
<nav>
	<ul id="main-menu">
		<li><a href="<c:url value='/user/home' />">HOME</a></li>
		<li><a href="#">MYSTUDY</a>
				<ul id="sub-menu">
					<li><a href="<c:url value= '/studyGroup/myApplyList' />">나의 신청 현황</a></li>
					<li><a href="<c:url value='/studyGroup/myStudy' />">나의 스터디 보기</a></li>
				</ul>
		</li>
		<li><a href="#">STUDYGROUP</a>
			<ul id="sub-menu">
				<li><a href="<c:url value='/studyGroup/create/form' />">스터디 등록</a></li>
				<li><a href="<c:url value='/studyGroup/search/form' />">스터디 검색</a></li>
				<li><a href="<c:url value='/studyGroup/list' />">스터디 그룹 보기</a></li>
			</ul>
		</li>
		<li><a href="<c:url value='/studyGroup/manageStudyList' />">MANAGE</a>
		</li>
	</ul>
</nav>

<br><br>

<div id="onePost">
	<h3 style="text-align: center;">게시글 수정</h3>
	<form name="form" method="POST" action="<c:url value='/post/update'>
	<c:param name="postId" value="${post.postId}" />
	</c:url>">
	
	<table id="pTable">
		<tr>
			<td id="bc">작성자</td>
			<td>${post.userName }</td>
			<td id="bc">날짜</td>
			<td>${post.createdDate }</td>
		</tr>
		<tr>
			<td id="bc">제목</td>
			<td colspan="3"><input type="text" name="title" value="${post.title}" style="width: 300px;"></td>
		</tr>
		<tr>
			<td rowspan="2" id="bc">내용</td>
			<td rowspan= "2" colspan="3"><input type="text" value="${post.content}" name="content" style="width: 300px; height: 100px;"></td>
		</tr>
	</table>
	<br>
	<input type="button" value="수정 완료" onClick="postModify()" id="pUpdateB" />
</form>
</div>


</body>
</html>