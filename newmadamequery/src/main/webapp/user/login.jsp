<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>로그인</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<script>
function login() {
	if (form.email.value == "") {
		alert("사용자 ID를 입력하십시오.");
		form.userId.focus();
		return false;
	} 
	if (form.password.value == "") {
		alert("비밀번호를 입력하십시오.");
		form.password.focus();
		return false;
	}		
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
				<li><a href="<c:url value='/studyGroup/search/form' />">스터디 검색</a></li>
				<li><a href="<c:url value='/studyGroup/list' />">스터디 그룹 보기</a></li>
			</ul>
		</li>
		<li><a href="<c:url value='/studyGroup/manageStudyList' />">MANAGE</a>
		</li>
	</ul>
</nav>

<form name="form" method="POST" action="<c:url value='/user/login' />">
  <table>
	<tr>
	  <td ></td>
	  <td>
	    <table>
		  <tr>
			<td>&nbsp;&nbsp;<b>사용자 관리 - 로그인</b>&nbsp;&nbsp;</td>
		  </tr>
	    </table>  
        <c:if test="${loginFailed}">
	  	  <br><font color="red"><c:out value="${exception.getMessage()}" /></font><br>
	    </c:if>
	    <br>	  
	    <table >
	  	  <tr >
			<td >사용자 ID</td>
			<td>
				<input type="text" style="width:240" name="email">
			</td>
		  </tr>
	  	  <tr >
			<td >비밀번호</td>
			<td >
				<input type="password" style="width:240" name="password">
			</td>
		  </tr>
	    </table>
	    <br>	  
	<table>
		  <tr>
			<td>
			<input type="button" value="로그인" onClick="login()"> &nbsp;
			</td>						
		  </tr>
	    </table>
	  </td>	  
	</tr>

  </table>  
</form>
</body>
</html>