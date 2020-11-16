<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title></title>
<!-- myStudy_view.jsp에서 글쓰기 버튼을 눌렀을 때 이동 (게시판에 글 쓰기) -->
<style>
	

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
 		width: 50%;
 		height: auto;
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
 		background-color: #DCEBFF;
 		width: 40%;
 		height: auto;
 		float: right;
 }
 #groupinfo {
 		background-color: #FFEBF0;
 		width: 40%;
 		height: auto;
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
<br><br>

<div id="addform">
	
	<input type="text" name="title" id="title" placeholder="제목" />
	<textarea name="contents" cols="30" rows="7" id="contents" placeholder="내용을 입력하세요"></textarea>
	<input type="button" name="submitB" id="submit" value="등록">
	
</div>

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
</body>
</html>