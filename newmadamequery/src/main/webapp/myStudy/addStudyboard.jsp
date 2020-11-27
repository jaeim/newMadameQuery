<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기 페이지 </title>
<script type="text/Javascript">

	function postCreate(){
		
		if(form.title.value =""){
			alert("제목을 입력하십시오.");
			form.title.focus();
			return false;
		}
		if(form.content.value=""){
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

#addform{
 		border: 1px solid black;
 		padding: 10px;
 		width: 450px;
 		height: auto;
 		tedxt-alingn: center;
 		margin: auto;
 		posigon: absolute;
 		
 }
 #title{
 		width:100%;
 		height: 20px;
 }
 #content{
 		margin-top: 10px;
 		width: 100%;
 		height: 200px;
 }
 #sm{
 		margin-top: 10px;
 		width: 30%;
 		height: 30px;
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

<div id="addform">
	this is group_id : ${post.group_id }
	<form name="form" method="POST" action="<c:url value='/post/create'/>">
		<input type="text" name="title" id="title" placeholder="제목" />
		<input type="text" name="content" id="content" placeholder="내용을 입력하세요." style="width: 300px; height: 300px;"/>
	
	
		<input type="submit" id="sm" value="게시글 작성 " onClick="postCreate()" />
	</form>
</div>

</body>
</html>