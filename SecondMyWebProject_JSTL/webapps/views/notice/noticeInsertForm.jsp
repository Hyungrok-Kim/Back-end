<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>
<style>
	.outer{
		width:800px;
		height:500px;
		background:black;
		color:white;
		margin-left:auto;
		margin-right:auto;
		margin-top:50px;
	}
	
	table {
		border:1px solid white;
	}

	.tableArea {
		width:450px;
		height:350px;
		margin-left:auto;
		margin-right:auto;
	}
</style>
</head>
<body>
    <c:set var="m" value="${sessionScope.member}" />
	<c:import url="../common/header.jsp" />
	<c:if test="${ !empty m and m.userId eq 'admin' }">
	
	<div class="outer">
		<br>
		<h2 align="center">공지 사항 작성</h2>
		<div class="tableArea">
			<form action="${pageContext.request.contextPath }/nInsert.no" method="post">
							<!-- 웹사이트 이름을 뭘로 하든지 찾을 수 있게 하는 것 이  getContextPath  -->
				<table>
					<tr>
						<td>제목 </td>
						<td colspan="3"><input type="text" size="50" name="title"></td>
					</tr>
					<tr>
						<td>작성자 </td>
						<td>
							<input type="text" value="${m.userName}" name="writer" readonly>
							<input type="hidden" value="${m.userId}" name="userId">
						</td>
						<td>작성일</td>
						<td><input type="date" name="date"></td>
					</tr>
					<tr>
						<td>내용 </td>
					</tr>
					<tr>
						<td colspan="4">
							<textarea name="content" cols="60" rows="15" style="resize:none;"></textarea>
						</td>
					</tr>
				</table>
				<br>
				<div align="center">
					<button type="reset">취소하기</button>
					<button type="submit">등록하기</button>
				</div>
				
			</form>
			
		</div>
	</div>
	</c:if><c:if test="${m.userId != 'admin' }">
		request.setAttribute("msg", "관계자 외에 접근이 불가능한 페이지입니다.");
		request.getRequestDispatcher("view/common/errorPage.jsp").forward(request, response);
	</c:if>
	<c:import url="../common/footer.jsp" />
</body>
</html>