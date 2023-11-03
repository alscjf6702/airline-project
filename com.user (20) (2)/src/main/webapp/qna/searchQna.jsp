<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../common/header.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700">
<!-- Google web font "Open Sans" -->
<link rel="stylesheet" href="/css/font-awesome.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- Bootstrap style -->
<link rel="stylesheet" type="text/css" href="css/datepicker.css" />
<link rel="stylesheet" type="text/css" href="slick/slick.css" />
<link rel="stylesheet" type="text/css" href="slick/slick-theme.css" />
<link rel="stylesheet" href="css/templatemo-style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="script/boardQna.js"></script>
<link rel="stylesheet" type="text/css" href="css/searchbar.css">
<title>게시판</title>

<style>
h2 {
	font-weight: border;
}

.hr1 {
	border: 0;
	height: 2px;
	background: #d3d3d3;
}

.grey {
	color: #727272;
}

#strong {
	font-weight: 900;
}

table {
	width: 100%;
	border:none;
	border-collapse: collapse;
}

th {
	background-color: #FFC107;
	border-top: 3px solid #727272;
}

th, td {
	border-bottom: 1px solid #d3d3d3;
	padding: 10px;
}

tr:hover { background-color: #F5F5F5; }
body {
	width: 70%;
	margin: 0 auto;
}

.greylist {
	width: 50px;
	height: 30px;
	font-weight: 900;
	color: white;
	text-align: center;
	background: grey;
	border: solid 2px white;
	border-radius: 5px;
}

.gradient {
	width: 80px;
	height: 30px;
	font-weight: 900;
	color: white;
	text-align: center;
	background: #FFC107;
	border: solid 2px white;
	border-radius: 5px;
}

.left {
	text-align: left;
}

.right {
	float: right;
}

.center {
	text-align: center;
}

a {
	color: black;
	text-decoration-line: none;
}
</style>
</head>

<body>
	<h2>고객센터 게시판</h2>

	<hr class="hr1" noshade>

	<form action="BoardServlet" method="post" name="frm">
		<input type="hidden" name="command" value="search_qna"> 
		<span class="right"> 
		<input type="text" name="searchbar"> <input type="submit" name="searchbar"
			class="gradient" value="검색">
		</span>
	</form><br>

	<br>
	<table>
		<tr>
				<th>글번호</th>
			<th>제목</th>
			<th>작성일자</th>
			<th>작성자</th>
			<th>조회수</th>
		</tr>
		<c:forEach var="item" items="${list}">
			<tr>
				<td>${item.boardnum}</td>
				<td class="needleft"><c:choose>
						<c:when test="${item.boardrelevel == 0}">
							<a class="text-dark"
								href="BoardServlet?command=select_qna&boardnum=${item.boardnum}"><b>Q.</b> ${item.boardsubject}</a>
						</c:when>
						<c:otherwise>
							<c:forEach var="i" begin="1" end="${item.boardrelevel}">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                    </c:forEach>
							<a class="text-secondary"
								href="BoardServlet?command=select_qna&boardnum=${item.boardnum}">${item.boardsubject}</a>
						</c:otherwise>
					</c:choose></td>
				<td>${item.regidate}</td>
				<td>${item.boardwriter}</td>
				<td>${item.readcount}</td>

			</tr>
		</c:forEach>
	</table>
	<br>

	<span class="right"> 
	<button type="button" class="greylist"
			onclick=" location.href='BoardServlet?command=qna_list'">목록</button>
		&nbsp;
		<!-- 관리자로 로그인때만 글쓰기 버튼 출력 -->
		<c:if test="${loginUser.admin==0||loginUser.admin==1 }">
			<input class="gradient" id="qnawritebtn" type="button"
				name="noticewrite" value="글쓰기"
				onclick="location.href='BoardServlet?command=qna_write_form'">
		</c:if>
	</span>

<br><br><br>

<%@include file="../common/footer.jsp"%>
</body>
</html>