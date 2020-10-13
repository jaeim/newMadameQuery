<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인</title>

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
 	#logintable{
 		border: 1px solid #C0EDFF;
 		text-align: center;
 		margin: auto;
 		padding: 0;
 		font-size: 20px;
 		font-family: Arial;
 		width: 600px;
 		height: 300px;
 		table-layout: fixed;
 	}
 	#title{
 		text-align: center;
 		font-size: 50px;
 		font-family: Arial;
 	}
	.button{
		background-color: #C0EDFF;
		width:200px;
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
	<p id="title">LOGIN</p>
	<form>
		<table id= "logintable">
		<tr>
			<td></td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td>ID</td>
			<td colspan="2"><input type="text" value="아이디를 입력하세요."></td>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td>PASSWORD</td>
			<td colspan="2"><input type="text" value="비밀번호를 입력하세요."></td>
		</tr>
		<tr>
			<td></td>
			<td><input type="submit" name="login" class="button" value="LOGIN"></td>
			<td></td>
		</tr>
		
		<tr>
			<td></td>
			<td>
				<input type="button" value="JOIN(회원가입)" onClick="location.href='user_write.jsp'">
			</td>
			<td></td>
		</tr>
		</table>
	
	
	</form>

</div>
	
</body>
</html>