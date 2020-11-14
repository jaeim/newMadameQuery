<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���͵� �׷� ���� </title>
<!-- (����Ʈ���� ����ؼ� ���� �� ���͵� �׷쿡 ���� ���� �����ֱ�), ���� �� ���� �� ���⼭  -->
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
 		
 	#main{
 		text-align: center;
 		font-family: Arial;
 		border: 1px solid black;
 		margin-top: 50px;
 		width: 700px;
 		height: 30px;
 		 }
 	#list{
 		text-align: center;
 		font-family: Arial;
 		border: 1px solid black;
 		margin-bottom: 50px;
 		width: 700px;
 		height: 30px;
 		
 	}
 	tr{
 	
 	margin: 50px;}
 	
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

<table id="main">
		<tr>
			<td>�����</td>
			<td><!-- Ŭ���� ���͵�׷��� ����� �޾ƿ��� -->"�����ͺ��̽� ���α׷���"</td>
			<td>�ο�</td>
			<td><!-- Ŭ���� ���͵�׷��� �ο� �޾ƿ��� -->4</td>
			<td>�Ⱓ</td>
			<td><!-- Ŭ���� ���͵�׷��� Ȱ���Ⱓ �޾ƿ��� -->6���� </td>
		</tr>
</table>
<br>

<table id= "list">
	<tr>
		<td>�̸�</td>
		<td>���� ����</td>
		<td>����/���</td>
	</tr>
	
	<%  //if()...�� ���͵�׷��� ���� �����ͼ� ���� �� ��ŭ <tr> �����ؼ� list ���. %>
	<tr>
		<td>������ �̸�</td>
		<td><input type="button" value="����" /><input type="button" value="����" /></td>
		<td></td>
	</tr>
</table>
<div id="update">
<form >
	<input type="submit" value="�����ϱ�" onClick="location.href='manage_update.jsp'"> <!-- ��ư ��ġ �����ϱ� -->
</form></div>
</body>
</html>