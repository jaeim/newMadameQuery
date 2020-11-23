<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.util.*" %>    
<%@page import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���͵�׷� info �����ִ� ȭ��</title>
<!-- menu/ STUDYGROUP / ����Ƽ �׷� ���� -> �ϳ��� ���͵�׷� ���� �� �������� ȭ��. -->

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
 	#groupInfo{
 		border: 1px solid black;
 		
 		background-color:  #C0EDFF;
 		width: 50%;
 		height: 300px;
 		float: left;
 		color: black;
 	}
 	td{
 		border: 1px solid black;
 		text-align: center;
 	}
 	#memberList{
 		text-align: center;
 		background-color: green;
 		width: 50%;
 		height: auto;
 		float: right;
 	}
 	#addToMember {
 		text-align: center;
 		background-color: #fffcde;
 		width: 50%;
 		height: auto;
 		float: right;
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
				<li><a href="#">���͵� ���</a></li>
				<li><a href="#">���͵� �˻�</a></li>
				<li><a href="#">���͵� �׷� ����</a></li>
			</ul>
		</li>
		<li><a href="#">MANAGE</a></li>
		<li><a href="#"> LOGIN & JOIN</a>
			<ul id="sub-menu">
				<li><a href="#">�α���</a></li>
				<li><a href="#">ȸ������</a></li>
			</ul>
		</li>
		
	</ul>
</nav>
<br><br>

<div>
	
	<div> <!--  StudyGroup �ϳ��� ��ü ��ȯ -->
		<table id="groupInfo">
			<tr>
				<td width="100" colspan="2">���͵��</td>
				<td width="100" colspan="2">${studyGroup.groupName}</td>
			</tr>
			<tr>
				<td width="100" colspan="2">�Ұ�</td>
				<td width="100"colspan="2">${studyGroup.description}</td>
			</tr>
			<tr>
				<td width="50">���͵� ���</td>
				<td>${studyGroup.meetingType }</td>
				<td width="50">����</td>
				<td>${studyGroup.genderType }</td>
			</tr>
			<tr>
				<td width="50">�г�</td>
				<td>${studyGroup.gradeType}</td>
				<td width="50">�Ⱓ</td>
				<td>${studyGroup.term }</td>
			</tr>
			
		</table>
	</div>
	
	<!-- StudyGroup -> groupUser�� �������� �� ��  -->
	
	<div > <!--  ����� ��, �̸�, �а�, �г� �����ֱ�  -->
	
		<!-- ��� �� �����ͼ� �� ��ŭ table tr �����ؼ� �����ֱ� -->
		
		<table id="memberList">
			<caption>GroupMembers</caption>
			<tr>
				<th>�̸�</th>
				<th>�а�</th>
				<th>�г�</th>
			</tr>
			<!-- user �� ��ŭ ��µ�. -->
			<c:forEach var="sgUsers" items="${studyGroup.groupUsers}">
				<tr>
					<td>&nbsp;${sgUsers.name}</td>
					<td>&nbsp;${sgUser.department }</td>
					<td>&nbsp;${sgUsers.grade }</td>
				</tr>
			</c:forEach>
		</table>
		
	</div>
	
	<div id="addToMember">
		<%@include file="registerStudy.jsp" %>
	</div>
</div>
<br><br>

<button onClick="location.href='studygroup_list.jsp'">GoBack</button> <!--  �ٽ� �ǵ��� ���� ��ư -->
</body>
</html>