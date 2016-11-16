<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
	<form action="/board/writeAction.jsp" method="post" id="writeForm">
		<table>
			<tbody>
				<tr>
					<th>제목</th>
					<td><input type="text" name="subject"></td>
				</tr>
				<tr>
					<th>본문</th>
					<td height="100px"><textarea rows="5" cols="50" name="content"></textarea></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input type="text" name="reg_id"></td>
				</tr>
			</tbody>
		</table>
	</form>
	<a href="javascript:return false;" id="writeButton"> 저장 </a>
<script type="text/javascript">
$(document).ready(function (){
	$("#writeButton").click(function (){
		if($("input[name=subject]").val() == "" ){
			alert("마 제목 입력해라.");
			return false;
		}
		if($("textarea[name=content]").val() == "" ){
			alert("마  본문 입력해라.");
			return false;
		}
		if($("input[name=reg_id]").val() == "" ){
			alert("마 작성자 입력해라.");
			return false;
		}
		$("#writeForm").submit();
	});
	
});
</script>
</body>
</html>