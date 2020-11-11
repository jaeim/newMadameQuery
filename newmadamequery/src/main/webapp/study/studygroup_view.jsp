<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>스터디그룹 info 보여주는 화면</title>
<!-- menu/ STUDYGROUP / 스터티 그룹 보기 -> 하나의 스터디그룹 선택 시 보여지는 화면. -->
<style>
	nav {
		text-align: center;
		list-style:none;
 		margin:0;
  		padding:0;
  		
	}
 	ul {
 		list-style-type: none;
 		maging:0;
 		padding: 0;
 	}
 	li {display: inline-block;
 	
 	}
 	#menuOption1,#menuOption2, #menuOption3, #menuOption4 {
 		display: block;
 		background-color: #C0EDFF;
 		padding: 8px;
 		font-size: 20px;
 		font-family: Arial;
 		width: 170px;
 		}
 		
 	#click1, #click2 {
 		font-size:15px;
 		font-family: Arial;
 		padding: 8px;
 		
 	}
 	#board{
 		background-color: blue;
 		width: 50%;
 		height: 100px;
 		float: left;
 		color: white;
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

</style>
</head>
<body>
	<nav>
	<ul>
		<li><a id="menuOption1">HOME</a></li>
		<li><a id="menuOption2">MYSTUDY</a></li>
		<li><a id="menuOption3">STUDYGROUP</a></li>
		<li><a id="menuOption4">MANAGE</a></li>
		<li>
			<div><a id=click1>LOGIN</a></div>
			<div><a id=click2>JOIN</a></div>
		</li>
	</ul>
</nav>

<div>
	
	<div id="board">
		<h2>Studygroup information</h2>
	</div>
	<div id="members">
		<h2>current members</h2>
	</div>
	<div id="addToMember">
		<h2>팀원 등록 신청</h2>
	</div>
</div>	
</body>
</html>