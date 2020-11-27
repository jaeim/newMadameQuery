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
 		width: 50%;
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
 	#members{
 		background-color: #AAEBAA;
 		width: 400px;
 		height: auto;
 		float:right;
 	}
 	#groupinfo {
 		background-color: #FFDFDC;
 		width: 400px;
 		height: auto;
 		float:right;
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
		<li><a href="#"> LOGIN & JOIN</a>
			<ul id="sub-menu">
				<li><a href="#">로그인</a></li>
				<li><a href="#">회원가입</a></li>
			</ul>
		</li>
		
	</ul>
</nav>
<div>
	<div id="name">
		<h2>스터디 그룹 명</h2>
	</div>
	
	<div id="board">
	<table id="boardT">
		<tr>
			<td width="200">제목</td>
			<td width="100">글쓴이</td>
			<td width= "80">일시</td>
			
		</tr>
		<!--  모든 게시글 가져오기 / List<Post> getPostList () 이용해서  table 생성-->
		
		<c:forEach var="post" items="${postList}">
			<tr>
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
	
	<!-- DAO, controller 상의 후 추가 or 삭제 -->
	<div id="members">
		<h5 id="memberTitle">Group Members</h5>
		<table id="memberTable">
			<tr>
				<th>이름</th>
				<th>학과</th>
				<th>학년</th>
			</tr>
			
			<tr>
				<td>이현아</td>
				<td>컴퓨터학과</td>
				<td>3</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
		</table>
	</div>
	<div id="groupinfo">
	<h5 id="memberTitle">Group Info</h5>
		<table id="infoTable">
			<tr>
				<td>과목 명</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>모집 인원</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>기간</td>
				<td>&nbsp;</td>
			</tr>
		</table>
	</div>
	<br><br>
	<div id= "addboard">
		<a href="<c:url value='/post/create/form' />" >글쓰기 </a>
	</div>
</div>
</body>
</html>