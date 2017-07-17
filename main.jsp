<%@ page language="java" contentType = "text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.io.PrintWriter"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta name="viewport" content="width=device-width",initial-scale="1">
		<link rel="stylesheet" href="css/bootstrap.css">
			  <title>JSP 게시판 웹사이트</title>
	</head>
<body>
	<%
		String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
	%>
	<nav class="navbar navbar-defalut">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapsels -" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			
		</button>
		<a class="navbar-brand" href="main.jsp">JSP 게시판 웹 사이트</a>
		</div>
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<ul class="nav navbar-nav">
			<li class="active"><a href="main.jsp">메인</a></li>
			<li><a href="inflearn_JSP.jsp">게시판</a></li>
			
		</ul>
		<%
			if(userID == null){
				
		%>
		<!-- 오른쪽 상단 접속하기 반응 버튼-->
		<ul class="nav navbar-nav navbar-right">
			<li class="dropdown">
			<a href="#" class="dropdown-toggle"
			   data-toggle=dropdown role="button" aria-haspopup="ture"
			   aria-expanded="false">접속하기<sapn class="caret"></sapn></a>
		<!-- 접속하기 누르면 dropdown-menu 실행 떨어지는 차트들-->
				<ul class="dropdown-menu">
					<!-- active 명령어가 있으면 바탕이 파란색임-->
				<li><a href="login.jsp">로그인</a></li>
				<li><a href="join.jsp">회원가입</a></li>
				</ul></li>
		</ul>
		<%
		} else{
			%>
		//오른쪽 상단 접속하기 반응 버튼
		<ul class="nav navbar-nav navbar-right">
			<li class="dropdown">
			<a href="#" class="dropdown-toggle"
				data-toggle="dropdown" role="button" aria-haspopup="ture"
			   aria-expanded="false">회원관리<sapn class="caret"></sapn></a>
		// 접속하기 누르면 dropdown-menu 실행 떨어지는 차트들-->
				<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
				</ul></li>
		</ul>
		<%
			}
		%>
		
		</div>
	</nav>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>	
</html>
