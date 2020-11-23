<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խ��ǿ��� �ϳ��� �� ���� �� - ���� ����/����/��� ������. �����ʿ� member�� groupinfo�� �״��.</title>
<!-- Ȯ�� ��, ���� ���� -->

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
#contents{
	margin-top: 50px;
}


 	#board{
 		background-color: #C0EDFF;
 		width: 50%;
 		height: auto;
 		float: left;
 		color: black;

 	}
 	#addP {
 		float: right;
 	}	
 	#boardContents2 {
 		border: 1px solid black;
 	}
 	#members{
 		background-color: green;
 		width: 300px;
 		height: auto;
 		float: right;
 	}
 	#groupinfo {
 		background-color: pink;
 		width: 300px;
 		height: auto;
 		float: right;
 		
 	}
 	#boardTitle, #memberTitle{
 		text-decoration: underline;
 		text-align: center;
 	}
 	#memberTable, #infoTable{
 		padding: auto;
 		text-align:center;
 		
 	}
 	<!-- height�� ���� �Խñ��� ��� ������ ���� �޶�������, auto�� ������.-->
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

<div id="contents">
	
	<div id="board">
		<h3 id="boardTitle">"����"</h3>
		<p>
			<h3 id="boardContents1">�Խñ� ����</h3>
			<h6 id="boardContents2"><pre>����,,,,,
			
			</pre><br></h6>
		</p>
		<input type="button" value="�Խñ� �ۼ�" id="addP"/>
		<a href="<c:url value='/myStudy/addStudyboard.jsp' />">�Խñ� �ۼ�</a>
			
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
</div>	
</body>
</html>