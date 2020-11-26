<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시글 수정 페이지</title>
<script>
	function postModify(){
		
		if(form.pTitle.value = ""){
			alert("제목을 입력하십시오.");
			form.name.focus();
			return false;
		}
		if(form.pContents.value=""){
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
td{
	border-right: 1px solid black;
	width: 100px;
}
#onePost {
	border: 1px solid black;
	width: 700px;
	height: auto;
	text-align: center;
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
				<li><a href="#">���͵� ���</a></li>
				<li><a href="#">���͵� �˻�</a></li>
				<li><a href="#">���͵� �׷� ����</a></li>
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
<% //�׽�Ʈ�� ���� ����- failed>
	//Post firstPost= new Post();
	//firstPost.set_id(411);
	//System.out.println(firstPost.getContent());
<% //테스트를 위한 설정- failed

	Post firstPost= new Post();
	firstPost.setPostId(411);
	System.out.println(firstPost.getContent());
%>
<div id="onePost">
<h3></h3>
	<table id="pTable">
		<tr>
			<td>제목</td>
			<td><input type="text" name="pTitle" value="${post.title}"/></td>
			<td>작성자</td>
			<td>작성자이름</td>
			<td>날짜</td>
			<td>2020-11-23</td>
		</tr>
		<tr>
			<td >����</td>
			<td colspan="5"> <textarea name="pContents" cols="90" rows="5">${post.content}</textarea></td>
			<!--  <td></td>
			<td></td>
			<td></td>
			<td></td> -->
		</tr>
		
	</table>
	<input type="button" value="수정 완료" onClick="postModify()" />
</div>
</body>
</html>