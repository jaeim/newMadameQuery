<<<<<<< HEAD
<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.util.*, model.*, controller.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import ="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head> 
<meta charset="EUC-KR">
<title>mainPage</title>

<script language="Javascript" >
	
function toLogin(targetUri){
	form.action = targetUri;
	form.submit();
}

function userCreate(targetUri) {
	form.action = targetUri;
	form.submit();
}
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


 #first{
 	border: 1px solid black;
 	text-align: center;
 }


 
</style>
</head>
<body>


<nav>
	<ul id="main-menu">
		<li><a href="<c:url value='/'/>">HOME</a></li>
		<li><a href="<c:url value='/studyGroup/myStudy'>
			<c:param name='userId' value="${member_id }" />
			</c:url> ">MYSTUDY</a></li>
		<li><a href="#">STUDYGROUP</a>
			<ul id="sub-menu">
				<li><a href="<c:url value='/studyGroup/create/form' />">스터디 등록</a></li>
				<li><a href="<c:url value='/studyGroup/search' /> ">스터디 검색</a></li>
				<li><a href="<c:url value='/studyGroup/list' /> ">스터디 목록 보기</a></li>
			</ul>
		</li>
		<li><a href="<c:url value='/studyGroup/manageStudyList'>
			<c:param name='userId' />
			</c:url> ">MANAGE</a>
		</li>
	</ul>
</nav>

<br><br>

<div>
	<a href="<c:url value= '/user/login' />" style="text-decoration:none;">로그인</a>
</div>
<div>
	<a href="<c:url value= '/user/register/form'/>" style="text-decoration:none;">회원가입</a>
</div>

<%
	//System.out.println(request.getAttribute("member_id"));
	String userId = String.valueOf(request.getAttribute("member_id"));
%>


 <c:if test= "${member_id ne null }" >
 	member_id :<c:out value="${member_id}" />
	<a href="<c:url value='/user/view' >
		<c:param name="userId" value="String.valueOf(${member_id})" />
		</c:url> ">마이페이지로 이동</a>
</c:if>


<h6>test용 (id: 20181003@dongduk.ac.kr / pw: 2424)</h6>
</body>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>mainPage</title>
<!-- ���� ȭ��  (���� ó�� �ߴ� ȭ�� & �α��� �� �ߴ� ȭ��.) -->
<script language="Javascript" >
	
function toLogin(targetUri){
	form.action = targetUri;
	form.submit();
}

function userCreate(targetUri) {
	form.action = targetUri;
	form.submit();
}
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
		<li><a href="<c:url value='/studyGroup/myStudy'>
			<c:param name='userId' />
			</c:url>">MYSTUDY</a></li>
		
	
		<li><a href="#">STUDYGROUP</a>
			<ul id="sub-menu">
				<li><a href="<c:url value='/studyGroup/create/form' />">���͵� ���</a></li>
				<li><a href="#">���͵� �˻�</a></li>
				<li><a href="<c:url value='/studyGroup/list' />">���͵� �׷� ����</a></li>
			</ul>
		</li>
		<li><a href="<c:url value='/studyGroup/manageStudyList'>
			<c:param name='userId' />
			</c:url> ">MANAGE</a></li>
		 <!--  	<li>LOGIN & JOIN</a>
			<ul id="sub-menu">
				<li> <a href="<c:url value='/user/login/form' />">�α���</a></li>
				<li> <a href = "http://localhost:8080/newmadamequery/user/user_write.jsp">ȸ������</a></li>
			</ul>
		</li>-->
		
	</ul>
</nav>



	 ����� �̸�: ${user.name }<br>
<br><br>
<div id="fisrt">
	
<!-- <input type="button" value="�α���" onClick = "toLogin(<c:url value='/user/login/form'/>))" > <br><br>
	 <input type="button" value="ȸ������" onClick ="userCreate('<c:url value='/user/register/form'/>) ')"> <br> -->

${user.member_id }
<a href="<c:url value='/user/view' />">����������</a>
</div>

</body>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>mainPage</title>
<!-- ���� ȭ��  (���� ó�� �ߴ� ȭ�� & �α��� �� �ߴ� ȭ��.) -->
<script language="Javascript" >
	
function toLogin(targetUri){
	form.action = targetUri;
	form.submit();
}

function userCreate(targetUri) {
	form.action = targetUri;
	form.submit();
}
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
		<li><a href="<c:url value='/studyGroup/myStudy'>
			<c:param name='userId' />
			</c:url>">MYSTUDY</a></li>
		
	
		<li><a href="#">STUDYGROUP</a>
			<ul id="sub-menu">
				<li><a href="<c:url value='/studyGroup/create/form' />">���͵� ���</a></li>
				<li><a href="#">���͵� �˻�</a></li>
				<li><a href="<c:url value='/studyGroup/list' />">���͵� �׷� ����</a></li>
			</ul>
		</li>
		<li><a href="<c:url value='/studyGroup/manageStudyList'>
			</c:url> ">MANAGE</a></li>
		 <!--  	<li>LOGIN & JOIN</a>
			<ul id="sub-menu">
				<li> <a href="<c:url value='/user/login/form' />">�α���</a></li>
				<li> <a href = "http://localhost:8080/newmadamequery/user/user_write.jsp">ȸ������</a></li>
			</ul>
		</li>-->
		
	</ul>
</nav>



	 ����� �̸�: ${user.name }<br>
<br><br>
<div id="fisrt">
	
<!-- <input type="button" value="�α���" onClick = "toLogin(<c:url value='/user/login/form'/>))" > <br><br>
	 <input type="button" value="ȸ������" onClick ="userCreate('<c:url value='/user/register/form'/>) ')"> <br> -->

${user.member_id }
<a href="<c:url value='/user/view' />">����������</a>
</div>

</body>
</html>