<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="conn.DbConnectionUtil"%>
<%

	Connection conn = DbConnectionUtil.getInstance().getConnection("mysql");
	
	PreparedStatement pstmt = null;
	int result = 0;
	ResultSet rs = null;
	List<Map<String,String>> list = new ArrayList<Map<String,String>>();
	try{
		StringBuffer sql2 = new StringBuffer();
		sql2.append("(SELECT *  FROM BOARD)");
		pstmt = conn.prepareStatement(sql2.toString());
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			Map<String,String> map = new HashMap<String,String>();
			map.put("idx", rs.getString("idx"));
			map.put("subject", rs.getString("subject"));
			map.put("content", rs.getString("content"));
			map.put("reg_id", rs.getString("reg_id"));
			list.add(map);	
		}
	}catch(Exception e){
	
	}finally{
		rs.close();
		conn.close();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>제목</th>
				<th>본문</th>
				<th>작성자</th>
			</tr>
		</thead>
		<tbody>
		<%
			for(Map<String,String> innerMap : list){
				
		%>
			<tr>
				<td><%=innerMap.get("subject") %></td>
				<td><%=innerMap.get("content") %></td>
				<td><%=innerMap.get("reg_id") %></td>
			</tr>
		<%
			}
		%>
		</tbody>
	</table>
</body>
</html>