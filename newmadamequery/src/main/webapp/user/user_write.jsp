<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

<script>
	function userCreate(){
		if(form.userId.value == ""){
			
			alert("사용자의 id를 입력하십시오.");
			form.userId.focus();
			return false;
		}
		if(form.password.value == ""){
			
			alert("비밀번호를 입력하십시오.");
			form.password.focus();
			return false;
		}
		if(form.password.value != form.password2.value){
			alert("비밀번호가 일치하지 않습니다.");
			form.password2.focus();
			return false;
		}
		if (form.name.value == "") {
			alert("이름을 입력하십시오.");
			form.name.focus();
			return false;
		}
		if(form.email.value=""){
			
			alert("이메일을 입력하십시오.");
			form.email.focus();
			return false;
		}
		if(form.university.value ==""){
			
			alert("대학명을 입력하십시오.");
			form.univerisity.focus();
			return false;
		}
		if(form.department.value == ""){
			alert("소속 학과명을 선택하십시오.");
			form.department.focus();
			return false;
		}
		if(form.gender.value == ""){
			alert("성별을 선택하십시오.");
			form.gender.focus();
			return false;
		}
		var emailExp = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		if(emailExp.test(form.email.value)==false) {
			alert("이메일 형식이 올바르지 않습니다.");
			form.email.focus();
			return false;
		}
		var phoneExp = /^\d{2,3}-\d{3,4}-\d{4}$/;
		if(phoneExp.test(form.phone.value)==false) {
			alert("전화번호 형식이 올바르지 않습니다.");
			form.phone.focus();
			return false;
		}
		form.submit();
		
	}
</script>
<title>회원가입</title>
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
#joinDiv {
	border: 1px solid black;
	text-align: center;
	width: 450px;
	height: 500px;
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
				<li><a href="http://localhost:8080/newmadamequery/user/login.jsp">로그인</a></li>
				<li><a href="http://localhost:8080/newmadamequery/user/user_write.jsp">회원가입</a></li>
			</ul>
		</li>
		
	</ul>
</nav>
<br><br>

<div id="joinDiv">
	
	<h1>Join With Us!</h1>
	<form name="form" method="POST" action="<c:url value='/user/register' /> ">
	<table>
		<tr>
			<td>사용자 id: </td>
			<td><input type="text" name="userId"></td>
		</tr>
		<tr>
			<td>비밀번호: </td>
			<td><input type="password" name="password"></td>
		</tr>
		<tr>
			<td>비밀번호 확인: </td>
			<td><input type="password" name="password2"></td>
		</tr>
		<tr>
			<td>이름: </td>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<td>휴대폰 번호 (ex.010-1234-5678)</td>
			<td><input type="text" name="phone"></td>
		</tr>
		<tr>
			<td>이메일 주소: </td>
			<td><input type="text" name="email"></td>
		</tr>
		<tr>
			<td>소속 학교 명: </td>
			<td><input type="text" name="university"></td>
		</tr>
		<tr>
			<td>소속 학과명: </td>
			<td>
				<select name="department">
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
		</tr>
		<tr>
			<td>학년</td>
			<td><select name="grade">
				<option>1학년</option>
				<option>2학년</option>
				<option>3학년</option>
				<option>4학년</option>
				<option>5학년 이상</option>
			</select></td>
		</tr>
		<tr>
			<td>성별</td>
			<td><select name="gender">
				<option>남자</option>
				<option>여자</option>
			</select></td>
		</tr>
	</table>
	<br>
	<table style="width: 100%">
		  <tr>
			<td align="left">
			<input type="button" value="회원 가입" onClick="userCreate()"> &nbsp;
			</td>
		  </tr>
	    </table>
	 <br>
	</form>
</div>
</body>
</html>