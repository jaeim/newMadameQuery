<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title></title>
<!-- myStudy_view.jsp에서 글쓰기 버튼을 눌렀을 때 이동 (게시판에 글 쓰기) -->
<style>
	
#addform{
 		border: 1px solid black;
 		padding: 10px;
 		width: 40%;
 		height: 170px;
 		float: left;
 		
 }
 #title{
 		width:100%;
 		height: 20px;
 }
 #contents{
 		margin-top: 10px;
 		width: 100%;
 		height: 80px;
 }
 #submit{
 		margin-top: 10px;
 		width: 30%;
 		height: 30px;
 }
 #members{
 		background-color: green;
 		width: 40%;
 		height: 170px;
 		float: right;
 }
 #groupinfo {
 		background-color: pink;
 		width: 40%;
 		height: 100px;
 		float: right;
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

<div id="addform">
	
	<input type="text" name="title" id="title">
	<textarea name="contents" cols="40" rows="5" id="contents"></textarea>
	<input type="button" name="submitB" id="submit" value="등록">
</div>

<div id="members">
	<h4>group members list</h4>
</div>

<div id="groupinfo">
	<h4>group info(과목명/인원/기간)</h4>
</div>
</body>
</html>