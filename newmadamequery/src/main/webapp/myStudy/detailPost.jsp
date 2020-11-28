<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="model.*, controller. *" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
<script>
	
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

td{
	border-right: 1px solid black;
	width: 100px;
}

#comments, #onePost {
	border: 1px solid black;
	width: 700px;
	height: auto;
	text-align: center;
}
#pTable, #cmtTable{
	margin-left: auto;
    margin-right: auto;
}
</style>
</head>
<body>
	<nav>
	<ul id="main-menu">
		<li><a href="#">HOME</a></li>
		<li><a href="#">MYSTUDY</a></li>
		<li><a href="#">STUDYGROUP</a>
			<ul id="sub-menu">
				<li><a href="#">스터디 등록</a></li>
				<li><a href="#">스터디 검색</a></li>
				<li><a href="#">스터디 그룹 보기</a></li>
			</ul>
		</li>
		<li><a href="#">MANAGE</a></li>
		<li><a href="#"> LOGIN & JOIN</a>
			<ul id="sub-menu">
				<li><a href="#">로그인</a></li>
				<li><a href="#">회원가입</a></li>
			</ul>
		</li>
		
	</ul>
</nav>
<br><br>

<div id="onePost">
<h3>게시글 상세보기</h3>
	<table id="pTable">
		<tr>
			<td>제목</td>
			<td>${post.title } </td>
			<td>작성자</td>
			<td>${post.userName }</td>
			<td>날짜</td>
			<td>${post.createdDate }</td>
		</tr>
		<tr>
			<td >내용</td>
			<td colspan="5">${post.content}</td>
		</tr>
		
	</table>

<!-- 내가 작성한 게시글일 때만 수정 버튼 뜸. -->

	<c:set var="myPost" value="${post.member_id}" />
	<c:if test="${myPost eq userId}">
		<a href=" <c:url value= '/post/update/form' >
			<c:param name='postId' value='${post.postId}' />
			<c:param name="memberId" value="${post.member_id}" />
			</c:url>" >게시글 수정</a>
		<a href="<c:url value='/post/delete'>
			<c:param name="postId" value="${post.postId}" />
			<c:param name="groupId" value="${post.group_id}" />
			<c:param name="memberId" value="${post.member_id}" />
		</c:url>">삭제하기</a>
	</c:if>
	
	<br><br>	
</div>
<br><br>

<div id="comments">
		
	<form name="form" method="POST" action="<c:url value='/comment/register' >
		<c:param name='groupId' value='${post.group_id}' />
		<c:param name='postId' value='${post.postId }' />
		</c:url> ">
		
		<input type="text" name="content" >
		<input type="submit" value="댓글 쓰기" />
	</form>
	<br>
	<table id="cmtTable">
		
		<c:forEach var="cm" items="${commList}" varStatus="status" >
			<tr>
				<td>${status.count}</td>
				<td>이름</td>
				<td>${cm.member_name}</td>
				<td>내용</td>
				<td>${cm.content}</td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;</td>
				<td style="text-align:right"><a href="<c:url value='/comment/delete'>
					<c:param name='comment_id' value='${cm.comment_id}'/>
					<c:param name='member_id' value='${cm.member_id}'/>
					<c:param name='postId' value='${post.postId }' />
					</c:url>">삭제</a></td>
				<td>&nbsp;</td>
				<td>${cm.createdDate}</td>
			</tr> 
		</c:forEach>
	</table>
</div>
</body>
</html>