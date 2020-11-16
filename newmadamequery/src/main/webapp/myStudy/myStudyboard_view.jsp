<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시판에서 하나의 글 선택 시 - 글의 제목/내용/댓글 보여줌. 오른쪽에 member와 groupinfo는 그대로.</title>
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
#contents{
	margin-top: 50px;
}
 	#board{
 		background-color: #C0EDFF;
 		width: 60%;
 		height: auto;
 		float: left;
 		color: black;
 		
 	}
 	
 	#boardContents2 {
 		border: 1px solid black;
 	}
 	#members{
 		background-color: green;
 		width: 300px;
 		height: 200px;
 		float: right;
 	}
 	#groupinfo {
 		background-color: pink;
 		width: 300px;
 		height: 200px;
 		float: right;
 		
 	}
 	#boardTitle, #memberTitle{
 		text-decoration: underline;
 		text-align: center;
 	}
 	#memberTable, #infoTable{
 		padding: auto;
 		text-align:center;
 		
 	}
 	#myComment {
 		width: 200px;
		height: 50px;
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

<div id="contents">
	
	<div id="board">
		<h3 id="boardTitle">"제목"</h3>
		<p>
			<h3 id="boardContents1">게시글 내용</h3>
			<h6 id="boardContents2"><pre>내용,,,,,
			
			</pre><br></h6>
		</p>
		<p>
			<h3 id="commentsTitle">댓글</h3>
			<div>
				<input type="text" value="댓글을 입력하세요." id="myComment" />
				<input type="button" value="추가" /> <!-- onClick 으로 댓글 추가 createComment()에서 text에 입력된 내용이 댓글 내용으로 -->
			</div>
			<br>
			<%@include file="comments.jsp" %>
		</p>
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
</div>	
</body>
</html>