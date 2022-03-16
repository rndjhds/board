<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="board" class="board.BoardDataBean"/>
<jsp:setProperty property="*" name="board"/>

<%
	// 글을 작성한 사용자의 IP주소를 구해오는 메소드
	String ip = request.getRemoteAddr();
	board.setIp(ip);
	
	BoardDBBean dao = BoardDBBean.getInstance();
	int result = dao.insert(board);	// insert SQL문 실행
	
	if(result==1){
%>
	<script>
		alert("글작성 성공");
		location.href="list.jsp";
	</script>

<% }else{ %>
	<script>
		alert("글작성 실패");
		history.go(-1);
	</script>
<% } %>