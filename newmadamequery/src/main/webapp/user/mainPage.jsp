<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>mainPage</title>
<!-- 메인 화면  (가장 처음 뜨는 화면 & 로그인 후 뜨는 화면.) -->
<script language="Javascript" >
	
function toLogin(targetUri){
	form.action = targetUri;
	form.submit();
}

function userCreate(targetUri) {
	form.action = targetUri;
	form.submit();
</script>
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

 #first{
 	border: 1px solid black;
 	text-align: center;
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
		<li><a href="<c:url value='/studyGroup/myStudy'>
			<c:param name='userId' />
			</c:url> ">MANAGE</a></li>
		<li><a href="#"> LOGIN & JOIN</a>
			<ul id="sub-menu">
				<li> <a href="http://localhost:8080/newmadamequery/user/login.jsp">로그인</a></li>
				<li> <a href = "http://localhost:8080/newmadamequery/user/user_write.jsp">회원가입</a></li>
			</ul>
		</li>
		
	</ul>
</nav>



	<!-- 사용자 아이디: <input type="text" style="width:150" name="userId"> <br>
	비밀번호 : <input type="password" style="width: 150" name="password" ><br> -->
<br><br>
<div id="fisrt">

	<input type="button" value="로그인" onClick = "toLogin(<c:url value='/user/login/form'/>))" > <br><br>
	<input type="button" value="회원가입" onClick ="userCreate('<c:url value='/user/register/form'/>) ')"> <br>
</div>

</body>
</html>