<%@ page language="java" contentType = "text/html; charset=utf-8" pageEncoding="utf-8"%>

<!-- 우리가 만든 클래스 불러오기-->
<%@ page import="user.UserDAO" %> 
<%@ page import="java.io.PrintWriter" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
			  <title>JSP 게시판 웹사이트</title>
	</head>
<body>
	<%
		session.invalidate();
	%>
	<script>
		location.href = 'main.jsp';
	</script>
</body>
</html>
