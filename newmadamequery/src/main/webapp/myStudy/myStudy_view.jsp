<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	//@SuppressWarnings("unchecked") 
	List<Post> postList = (List<Post>)request.getAttribute("postList");
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title> 스터디 게시판 ()</title>
<!-- 내가 속한 스터디- 게시판 (내가 속한 각각의 스터디 그룹 게시판) -->
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
 	
 	#name{
 		background-color: black;
 		width: 100%;
 		heght: 200px;
 		color: white;
 	}
 	#board{
 		background-color: #C0EDFF;
 		width: 400px;
 		height: 300px;
 		float: left;
 		text-align: center;
 		 	}
 	#boardT {
 		width: 400px;
 		height: auto;
 		text-align: center;
 		margin: auto;
 	}
 	#addboard{
 		background-color: aqua;
 		width: 50%;
 		height: 50px;
 		text-align: right;
 	}
 	tr, td{
 		border-bottom: 1px solid black;
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
		
	</ul>
</nav>
<br><br>
<div id="board">
	
	<table id="boardT">
		<caption>스터디 게시판 </caption>
		<tr>
			<td width="80">그룹 아이디</td>
			<td width="200">제목</td>
			<td width="100">글쓴이</td>
			<td width= "80">일시</td>
			
		</tr>
		<!--  모든 게시글 가져오기 / List<Post> getPostList () 이용해서  table 생성-->
		
		<c:forEach var="post" items="${postList}">
			<tr>
				<td>${post.group_id}</td>
				<td>
					<a href="<c:url value='/post/detail'>
						<c:param name='postId' value='${post.postId}' />
						</c:url>">${post.title}</a>
				</td>
				<td>${post.userName}</td>
				<td>${post.createdDate }</td>
			</tr>
		</c:forEach>
		</table>
	</div>
	
	<br><br>
	<div id= "addboard">
		 		<a href="<c:url value='/myStudy/addStudyboard.jsp'>
						   	<c:param name='groupId' value='${groupId}'/>
						 </c:url>">글쓰기 </a>
	</div>

</body>
</html>