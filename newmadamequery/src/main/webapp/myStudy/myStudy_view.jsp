<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.util.*" %>
<%@page import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	@SuppressWarnings("unchecked") 
	List<Post> postList = (List<Post>)request.getAttribute("postList");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title> ���͵� �Խ��� ()</title>
<!-- ���� ���� ���͵�- �Խ��� (���� ���� ������ ���͵� �׷� �Խ���) -->
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
 	
 	#name{
 		background-color: black;
 		width: 100%;
 		heght: 200px;
 		color: white;
 	}
 	#board{
 		background-color: #C0EDFF;
 		width: 50%;
 		height: 300px;
 		float: left;
 	}
 	#members{
 		background-color: #AAEBAA;
 		width: 400px;
 		height: auto;
 		float:right;
 	}
 	#groupinfo {
 		background-color: #FFDFDC;
 		width: 400px;
 		height: auto;
 		float:right;
 	}
 	#addboard{
 		background-color: aqua;
 		width: 50%;
 		height: 50px;
 		text-align: right;
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
<div>
	<div id="name">
		<h2>this is studygroup board</h2>
	</div>
	<div id="board">
		<!--  ��� �Խñ� �������� / List<Post> getPostList () �̿��ؼ�  table ����-->
		<c:forEach var="post" items="${postList} ">
			<tr>
			</tr>
		</c:forEach>
	</div>
	<div id="members">
		<h5 id="memberTitle">Group Members</h5>
		<table id="memberTable">
			<tr>
				<th>�̸�</th>
				<th>�а�</th>
				<th>�г�</th>
			</tr>
			<tr>
				<td>������</td>
				<td>��ǻ���а�</td>
				<td>3</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
		</table>
	</div>
	<div id="groupinfo">
	<h5 id="memberTitle">Group Info</h5>
		<table id="infoTable">
			<tr>
				<td>���� ��</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>���� �ο�</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>�Ⱓ</td>
				<td>&nbsp;</td>
			</tr>
		</table>
	</div>
	<br><br>
	<div id= "addboard">
		<input type="button" value="�۾���" onClick="location.href='addStudyboard.jsp'"/>
	</div>
</div>
</body>
</html>