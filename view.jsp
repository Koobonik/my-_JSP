<%@ page language="java" contentType = "text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="inflearn_JSP.inflearn_JSP"%>
<%@ page import="inflearn_JSP.inflearn_JSPDAO"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta name="viewport" content="width=device-width",initial-scale="1">
		<link rel="stylesheet" href="css/bootstrap.css">
		<link rel="stylesheet" href="css/custom.css">
			  <title>JSP 게시판 웹사이트</title>
	</head>
<body>
	<%
		String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
	int inflearn_JSPID = 0;
	if (request.getParameter("inflearn_JSPID") != null){
		inflearn_JSPID = Integet.parsInt(request.getParameter("inflearn_JSPID"));
	}
	if (inflearn_JSPID == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("location.href = 'inflearn_JSP.jsp'");
		script.println("</script>");
	inflearn_JSP Inflearn_JSP = new inflearn_JSPDAO().getinflearn_JSP(inflearn_JSPID);
		
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
			<li><a href="main.jsp">메인</a></li>
			<li class="active"><a href="inflearn_JSP.jsp">게시판</a></li>
			
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
		<!-- 오른쪽 상단 접속하기 반응 버튼 -->
		<ul class="nav navbar-nav navbar-right">
			<li class="dropdown">
			<a href="#" class="dropdown-toggle"
				data-toggle="dropdown" role="button" aria-haspopup="ture"
			   aria-expanded="false">회원관리<sapn class="caret"></sapn></a>
		<!-- 접속하기 누르면 dropdown-menu 실행 떨어지는 차트들 -->
				<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
				</ul></li>
		</ul>
		<%
			}
		%>
		
		</div>
	</nav>
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3" style="background-color: #eeeeee; text-align: center;">게시판 글보기</th>
					</tr>
				</thead>
			<tbody>
				<tr>
					<td style="width: 20%;">글 제목</td>
					<td colspan="2"<%=inflearn_JSP.inflearn_JSPTitle.()replaceAll(" ", "&nbsp;).replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>")%>></td>
				</tr>
				<tr>
					<td >작성자</td>
					<td colspan="2"<%=inflearn_JSP.UserID()%>></td>
				</tr>
				<tr>
					<td >작성일자</td>
					<td colspan="2"<%=inflearn_JSP.getinflearn_JSPDate().substring(0, 11) + inflearn_JSP.get(i).getinflearn_JSPDate.substring(11, 13) + "시" + inflearn_JSP.get(i).getinflearn_JSPDate(14, 16) + "분"%>></td>
				</tr>
				<tr>
					<td >내용</td>
					<td colspan="2" style="min-height:200px; text-align:left;"><%=inflearn_JSP.getinflearn_JSPContent().replaceAll(" ", "&nbsp;).replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>")%></td>
				</tr>
			</tbody>
		</table>
		<a href="inflearn_JSP.jsp" class="btn btn-primary">목록</a>
		<%
			if(userID != null && userID.equals(inflearn_JSP.getUserID())){
		%>
			<a href="update.jsp?inflearn_JSPID=<%=inflearn_JSPID%>" class="btn btn-primary">수정</a>
			<a href="deleteAction.jsp?inflearn_JSPID=<%=inflearn_JSPID%>" class="btn btn-primary">삭제</a>
		<%
			}
		%>
		<input type="submit" class="btn btn-primary pull-right" value="글쓰기">

	
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>	
</html>
