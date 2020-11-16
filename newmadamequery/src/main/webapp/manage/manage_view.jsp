<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>스터디 그룹 관리 </title>
<!-- (리스트에서 출력해서 들어가면 그 스터디 그룹에 대한 정보 보여주기), 삭제 및 수락 은 여기서  -->
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
 		
 	#main{
 		text-align: center;
 		font-family: Arial;
 		border: 1px solid black;
 		margin-top: 50px;
 		width: 700px;
 		height: 30px;
 		 }
 	#list{
 		text-align: center;
 		font-family: Arial;
 		border: 1px solid black;
 		margin-bottom: 50px;
 		width: 700px;
 		height: 30px;
 		
 	}
 	tr{
 	
 	margin: 50px;}
 	
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

<table id="main">
		<tr>
			<td>과목명</td>
			<td><!-- 클릭한 스터디그룹의 과목명 받아오기 -->"데이터베이스 프로그래밍"</td>
			<td>인원</td>
			<td><!-- 클릭한 스터디그룹의 인원 받아오기 -->4</td>
			<td>기간</td>
			<td><!-- 클릭한 스터디그룹의 활동기간 받아오기 -->6개월 </td>
		</tr>
</table>
<br>

<table id= "list">
	<tr>
		<td>이름</td>
		<td>팀원 관리</td>
		<td>팀장/멤버</td>
	</tr>
	
	<%  //if()...그 스터디그룹의 팀원 가져와서 팀원 수 만큼 <tr> 생성해서 list 출력. %>
	<tr>
		<td>구성원 이름</td>
		<td><input type="button" value="삭제" /><input type="button" value="수락" /></td>
		<td></td>
	</tr>
</table>
<div id="update">
<form >
	<input type="submit" value="수정하기" onClick="location.href='manage_update.jsp'"> <!-- 버튼 위치 수정하기 -->
</form></div>
</body>
</html>