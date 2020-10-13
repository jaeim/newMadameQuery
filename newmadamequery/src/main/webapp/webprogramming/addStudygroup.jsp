<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>스터디 그룹 등록</title>

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
 		
		#intro{
			font-family: Arial;
			font-size: 15px;
		}
		#add, table{
			text-align:center;
			margin: auto;
			
		}
		table{
			border: 2px solid black;
			width: 700px;
			height: 200px;
			font-family: Arial;

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


<div id="intro">
	<pre>
	StudyGroup
	스터디 등록 후, 마음에 드는 팀원을 찾아보세요.
	스터디 등록을 위한 조건을 입력 및 선택해주세요.
	</pre>		
</div>
	
<div id="add" style="clear:both">
	<h2>스터디 등록</h2>
	<table>
		<tr>
			<td>과목</td>
			<td><input type="text" value="과목명/주제를 입력해주세요." size=50></td>
		</tr>
		
		<tr>
			<td>인원</td>
			<td>
				<select name="numOfMembers">
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
					<option>6</option>
					<option>7</option>
					<option>8</option>
					<option>9</option>
					<option>10명 이상</option>
				</select>
			</td>
		</tr>
		
		<tr>
			<td>기간</td>
			<td>
				<select name="term">
					<option>1개월</option>
					<option>3개월</option>
					<option>6개월</option>
					<option>6개월 이상</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<form><td colspan="2"><input type="submit" value="등록하기"></td></form>
		</tr>
	</table>
	
</div>
</body>
</html>