<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="conn.DbConnectionUtil"%>
<%

	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String reg_id = request.getParameter("reg_id");
	
	out.println("subject : " + subject);
	out.println("content : " + content);
	out.println("reg_id : " + reg_id);
	Connection conn = DbConnectionUtil.getInstance().getConnection("mysql");
	
	PreparedStatement pstmt = null;
	int result = 0;
	try{
		StringBuffer sql = new StringBuffer();
		StringBuffer sql2 = new StringBuffer();
		sql2.append("(SELECT ifnull(max(idx), 0) + 1 cnt FROM BOARD)");
		pstmt = conn.prepareStatement(sql2.toString());
		ResultSet rs = pstmt.executeQuery();
		int cnt = 0 ;
		if(rs.next()){
			cnt = rs.getInt("cnt");
		}

		
		rs.close();
		sql.append("INSERT INTO BOARD ");
		sql.append("(IDX,SUBJECT , CONTENT, REG_ID , REG_DATE, UPT_DATE) ");
		sql.append("VALUES ");
		sql.append("(?,?, ? ,? ,SYSDATE() , SYSDATE())");
		System.out.println(sql.toString());
		pstmt = conn.prepareStatement(sql.toString());
		pstmt.setInt(1, cnt);
		pstmt.setString(2, subject);
		pstmt.setString(3, content);
		pstmt.setString(4, reg_id);
		result = pstmt.executeUpdate();
		System.out.println("result >> " + result);

	} catch(Exception e){
		e.printStackTrace();
	} finally{
		pstmt.close();
		conn.close();
	}
	
		if(result > 0){
		   response.sendRedirect("/board/boardList.jsp");
		}else{
%>
<script type="text/javascript">
alert("오ㅓ류!");
	location.back();
</script>
<%
		}
%>