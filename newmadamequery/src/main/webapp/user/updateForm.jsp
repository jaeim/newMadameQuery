<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원정보 수정 </title>

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
	<p id="title">UPDATE</p>
	<table id="joinTable">
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>ID</td>
			<td><input type="text" name="userId" value="아이디를 입력하세요."></td>
			<td><input type="button" name="doublecheck" value="중복확인"></td>
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
				<input type="email" name="userEmail" value="이메일을입력하세요.">
				<select name="emaillist">
					<option value="naver">naver.com</option>
					<option value="daum">hanmail.net</option>
					<option value="gmail">gmail.com</option>
				</select>
			</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>MAJOR</td>
			<td>
				<select name="majors">
					<option>국어국문학과</option>
					<option>국사학과</option>
					<option>문예창작과</option>
					<option>영어과</option>
					<option>일본어과</option>
					<option>프랑스어과</option>
					<option>독일어과</option>
					<option>중어중국학과</option>
					<option>경영학과</option>
					<option>경제학과</option>
					<option>국제경영학과</option>
					<option>아동학과</option>
					<option>사회복지학과</option>
					<option>문헌정보학과</option>
					<option>세무회계학과</option>
					<option>식품영양학과</option>
					<option>보건관리학과</option>
					<option>화학, 화장품학부</option>
					<option>체육학과</option>
					<option>토탈뷰티케어학과(야)</option>
					<option>컴퓨터학과</option>
					<option>정보통계학과</option>
					<option>회화과</option>
					<option>디지털공예과</option>
					<option>큐레이터학과</option>
					<option>피아노과</option>
					<option>관현악과</option>
					<option>성악과</option>
					<option>패션디자인학과</option>
					<option>시각&실내디자인학과</option>
					<option>미디어디자인학과</option>
					<option>약학과</option>
				</select>
			</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>LECTURE</td>
			<td colspan="2" rowspan="2">
			<table id="lectureTable">
				<tr>
					<td>1</td>
					<td>과목 이름</td>
					<td><input type="button" value="delete"></td>
				</tr>
				<tr>
					<td>2</td>
					<td>과목이름</td>
					<td><input type="button" value="delete"></td>
				</tr>
			</table>
			
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>TAGS</td>
			<td colspan="2" rowspan="3">
				<div id="tags">
				<input type="checkbox" name="tags" value="1" />철학
				<input type="checkbox" name="tags" value="2" />IT기술
				<input type="checkbox" name="tags" value="3" />언어
				<input type="checkbox" name="tags" value="4" />미술
				<input type="checkbox" name="tags" value="5" />영화
				<input type="checkbox" name="tags" value="6" />역사
				<input type="checkbox" name="tags" value="7" />인문
				<input type="checkbox" name="tags" value="8" />심리
				<input type="checkbox" name="tags" value="9" />여성학
				<input type="checkbox" name="tags" value="10" />문학
				<input type="checkbox" name="tags" value="11" />팀플
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
<br><input type="button" value="수정(완료)" onClick="location.href='myPage.jsp'"/>
</body>
</html>