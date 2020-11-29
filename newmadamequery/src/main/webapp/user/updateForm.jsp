<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정 </title>
<script>
	function userModify(){
		
		var emailExp = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		if(emailExp.test(form.email.value)==false) {
			alert("이메일 형식이 올바르지 않습니다.");
			form.email.focus();
			return false;
		}
		if (form.password.value == "") {
			alert("비밀번호를 입력하십시오.");
			form.password.focus();
			return false;
		}
		if (form.password.value != form.password2.value) {
			alert("비밀번호가 일치하지 않습니다.");
			form.name.focus();
			return false;
		}
		if (form.name.value == "") {
			alert("이름을 입력하십시오.");
			form.name.focus();
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
 	#div1{
 	text-align: center;
 	border: 1px solid grey;
 	margin-bottom:  50px;
 	margin: 50px;
 	padding-top: 10px;
	padding-bottom: 50px;
	padding-left: 30px;
	padding-right:30px;
	width: 400px;
	
 	}
 	#table1{
 		margin: auto;
 	}
</style>
</head>
<body>
	<nav>
	<ul id="main-menu">
		<li><a href="<c:url value='/user/home' />">HOME</a></li>
		<li><a href="#">MYSTUDY</a>
				<ul id="sub-menu">
					<li><a href="<c:url value= '/studyGroup/myApplyList'>
						<c:param name='userId' value='${user.member_id}' />
						</c:url>">나의 신청 현황</a>
					</li>
					<li><a href="<c:url value='/studyGroup/myStudy'>
						<c:param name='userId' value='${user.member_id}' />
						</c:url>">나의 스터디 보기</a>
					</li>
				</ul>
		</li>
		
	
		<li><a href="#">STUDYGROUP</a>
			<ul id="sub-menu">
				<li><a href="<c:url value='/studyGroup/create/form' />">스터디 등록</a></li>
				<li><a href=<c:url value='/studyGroup/search/form' />>스터디 검색</a></li>
				<li><a href="<c:url value='/studyGroup/list' />">스터디 그룹 보기</a></li>
			</ul>
		</li>
		<li><a href="<c:url value='/studyGroup/manageStudyList' />">MANAGE</a>
		</li>
	</ul>
</nav>

<div id="div1"  style=" font-family: 'Arial;' ">
	<h4 id="title">UPDATE</h4>
	<form name="form" method="POST" action="<c:url value='/user/update' />">
	<table id="table1">
		<tr>
			<td>이름 </td>
			<td><input type="text" name="name" value="${user.name }"></td>
		</tr>
		<tr>
			<td>이메일 주소(ID) </td>
			<td><input type="text" name="email" value="${user.email }" ></td>
		</tr>
		<tr>
			<td>비밀번호 </td>
			<td><input type="password" name="password" value="${user.password}"></td>
		</tr>
		<tr>
			<td>비밀번호 확인 </td>
			<td><input type="password" name="password2" value="${user.password}"></td>
		</tr>
		
		<tr>
			<td>휴대폰 번호</td>
			<td><input type="text" name="phone" value="${user.phone }" ></td>
		</tr>
		<tr>
			<td>소속 학교 명 </td>
			<td><input type="text" name="university" value="${user.university }" ></td>
		</tr>
		<tr>
			<td>소속 학과명 </td>
			<td><input type="text" name="department" value="${user.department }" ></td>
		</tr>
		<tr>
			<td>학년</td>
			<td><input type="text" name="grade" value="${user.grade }" ></td>
		</tr>
		<tr>
			<td>성별</td>
			<td><input type="text" name="gender" value="${user.gender }" ></td>
		</tr>
	</table>
	<br><br>
	<input type="button" value="수정(완료)" onClick="userModify()" />
</form>
</div>
<br>
</body>
</html>