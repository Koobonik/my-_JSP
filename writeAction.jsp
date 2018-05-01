<%@ page language="java" contentType = "text/html; charset=utf-8" pageEncoding="utf-8"%>

<!-- 우리가 만든 클래스 불러오기-->
<%@ page import="inflearn_JSP.inflearn_JSPDAO" %> 
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8");%> 
<jsp:useBean id="inflearn_JSP" class="inflearn_JSP.inflearn_JSP" scope="page" />
<jsp:setProperty name="inflearn_JSP" property="inflearn_JSPTitle"/>
<jsp:setProperty name="inflearn_JSP" property="inflearn_JSPContent"/>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
			  <title>JSP 게시판 웹사이트</title>
	</head>
<body>
	<%
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
	if(userID == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert ('로그인을 하세요.')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
	}else{
	if(inflearn_JSP.getinflearn_JSPTitle() == null || inflearn_JSP.getinflearn_JSPContent() == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
	} else {
		inflearn_JSPDAO Inflearn_JSPDAO = new inflearn_JSPDAO();
		int result = Inflearn_JSPDAO.write(inflearn_JSP.getinflearn_JSPTitle(), userID, inflearn_JSP.getinflearn_JSPContent());
		if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글쓰기에 실패했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>"); 
			script.println("location.href = 'inflearn_JSP.jsp'");
			script.println("</script>");
			}
		}
	}
	
	
	%>
</body>	
</html>
