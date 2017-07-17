<%@ page language="java" contentType = "text/html; charset=utf-8" pageEncoding="utf-8"%>

<!-- 우리가 만든 클래스 불러오기-->
<%@ page import="user.UserDAO" %> 
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8");%> 
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
			  <title>JSP 게시판 웹사이트</title>
	</head>
<body>
	<!-- login.jsp 의 아이디와 비밀번호 넣어주기-->
	<%
	//이미 로그인 된사람은 접속 못하게
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
	if(userID != null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert ('이미 로그인이 되어있습니다.')");
		script.println("location.href = 'main.jsp'");
		script.println("</script>");
	}
	UserDAO userDAO = new UserDAO();
	int result = userDAO.login(user.getUserID(), user.getUserPassword());
	if(result==1){
		session.setAttribute("userID", user.getUserID());
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'main.jsp'");
		script.println("</script>");
	}
	else if(result == 0){
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 틀립니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	else if(result == -1){
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('존재하지 않는 아이디입니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	else if(result == -2){
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('데이터베이스 오류가 발생했습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	%>
</body>	
</html>
