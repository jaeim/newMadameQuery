<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
 		background-color: blue;
 		width: 50%;
 		height: 100px;
 		float: left;
 	}
 	#members{
 		background-color: green;
 		width: 50%;
 		height: 50px;
 		float:right;
 	}
 	#groupinfo {
 		background-color: pink;
 		width: 50%;
 		height: 50px;
 		float:right;
 	}
 	#addboard{
 		background-color: aqua;
 		width: 50%;
 		height: 50px;
 		text-align: right;
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
		<h2>this is studygroup board</h2>
	</div>
	<div id="board">
	
	</div>
	<div id="members">
	
	</div>
	<div id="groupinfo">
	
	</div>
	<div id= "addboard">
		<button>글쓰기</button>
	</div>
</div>
</body>
</html>