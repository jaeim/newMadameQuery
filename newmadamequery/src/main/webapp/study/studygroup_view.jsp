<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
 	#board{
 		background-color:  #C0EDFF;
 		width: 50%;
 		height: 300px;
 		float: left;
 		color: black;
 	}
 	#members{
 		background-color: green;
 		width: 50%;
 		height: 50px;
 		float: right;
 	}
 	#addToMember {
 		background-color: pink;
 		width: 50%;
 		height: 50px;
 		float: right;
 	}
 	h4{
 		display: inline;
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
	
	<div id="board">
		<h4>���͵��</h4>&nbsp;&nbsp;&nbsp;<h4>�ο�</h4>&nbsp;&nbsp;&nbsp;<h4>�Ⱓ</h4>
		<h3> �ð�</h3>
		<h3>����</h3>
	</div>
	<div id="members">
		<!-- ��� �� �����ͼ� �� ��ŭ table tr �����ؼ� �����ֱ� -->
		<h5>�׷� ��� ���� �����ֱ�</h5>
	</div>
	<div id="addToMember">
		<%@include file="registerStudy.jsp" %>
	</div>
</div>	
</body>
</html>