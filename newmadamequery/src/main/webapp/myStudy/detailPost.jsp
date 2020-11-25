<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.util.*" %>
<%@page import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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
<p></p>

<div id="onePost">
<h3></h3>
	<table id="pTable">
		<tr>
			<td>제목</td>
			<td>게시글 제목 </td>
			<td>작성자</td>
			<td>작성자이름</td>
			<td>날짜</td>
			<td>2020-11-23</td>
		</tr>
		<tr>
			<td >내용</td>
			<td colspan="5"> </td>
			<!--  <td></td>
			<td></td>
			<td></td>
			<td></td> -->
		</tr>
		
	</table>
	<%
		//내가 게시한 글일 때만 수정하기 버튼 뜨게 하기
		
	%>
	<input type="button" value="수정하기" onClick="<c:url value='/post/update/form' >
		<c:param name="postId" value='${post._id}' />
		</c:url>"/>
	<input type="button" value="삭제하기" onClick="<c:url value='/post/delete' >
		<c:param name='' value=''/>
		</c:url>
	"/>
</div>
<br><br>
<div id="comments">
	<h3 style="display: inline;">Comments</h3>
	<div id="newCommt">
		<h6>${member.userId }</h6>
		<textarea name="cmtContents" cols="30" rows="1"></textarea>
		<input type="button" value="댓글쓰기" onClick= "<c:url value='/comment/register' >"  />
			
				<c:param name='username' value = '${user.name }' />
				<c:param name='date' value= '${comment.createdDate }' />
				<c:param name= 'commentText' value='${comment.content }' />
			</c:url>
		<br><br>
		
		<!-- 댓글 개수 만큼 댓글 보여주기 -->
		<c:forEach var="commentList" items="" > <!-- comment  -->
			
		</c:forEach>
		
		<table id="cmtTable">
			<tr>
				<td>이름</td>
				<td>이현아</td>
				<td>날짜</td>
				<td>2020-11-23</td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="3">좋은 것 같아요~</td>
			</tr>
		</table>
	</div>
</div>
</body>
</html>