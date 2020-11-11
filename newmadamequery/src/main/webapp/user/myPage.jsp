<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>마이페이지 - 내 정보 받아와서 보여주기 </title>
<!-- [USERMAN1 - user_modify.jsp, user_view.jsp 참고할 것.] -->
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
 #title {
 		text-align: center;
 		font-size: 50px;
 		font-family: Arial;
 }
 #joinTable, #lectureTable{
 		text-align: center;
 		border: 1px solid black;
 		margin-left: auto;
 		margin-right: auto;
 		font-family: Arial;
 }
 #joinTable{
 		width: 550px;
 		height: 500px;
 }
 #lectureTable, #tags{
 		border: 1px solid black;
 		width: 350px;
 		height: 100px;
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

<div>
	<p id="title">My Page</p>
	<table id="joinTable">
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>ID</td>
			<td><h5>받아온 id 값 출력.</h5></td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>PASSWORD</td>
			<td><input type="text" name="userPass" value="비밀번호를 입력하세요."></td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>CHECK PASS</td>
			<td><input type="text" name="checkPass" value="비밀번호를 다시 입력해주세요."></td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>EMAIL</td>
			<td>
				<h5>받아온 email 값 출력</h5>
			</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>MAJOR</td>
			<td><h5>자신의 전공 출력</h5></td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>LECTURE</td>
			<td colspan="2" rowspan="2">
				<h5>내가 듣는 강의들 table로 출력.</h5>
			
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>TAGS</td>
			<td colspan="2" rowspan="3">
				<div id="tags">
					<h5>자신이 선택한 tag들 출력.</h5>
				</div>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			
		</tr>
		<tr>
			<td>&nbsp;</td>
			
		</tr>
		
	</table>

</div>
</body>
</html>