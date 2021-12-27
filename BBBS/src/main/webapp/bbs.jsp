<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=divice=width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>에이치엘비</title>
<style type="text/css">
	a,a:hover{
		color : #000000;
		text-decoration:none;
	}

</style>
</head>
<body>
	<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	%>

	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">에이치엘비</a>
		</div>
		<div class="collapse navbar-collapse" id="#bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li class="active"><a href="CountAction.jsp">평균단가</a></li>	
				<li><a href="bbsfree.jsp">자유게시판</a></li>
				<li><a href="#">물타자</a></li>	
			</ul>
			<%
				if (userID == null) {
					
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul  class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul>
				</li>
			</ul>
			<%
				} else {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul  class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>

					</ul>
				</li>
			</ul>
			<%
				}
			%>
		</div>
	</nav>
	
	<script type="text/javascript" src="https://www.google.com/jsapi"></script>
	<script type="text/javascript"
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>

	<script type="text/javascript">
		<%
		
		UserDAO userDAO = new UserDAO();
		ArrayList list = userDAO.getCount();
		
		System.out.println(list);
		
		%>
		google.load("visualization", "1", {
			packages : [ "corechart" ]
		});
		google.setOnLoadCallback(drawChart);
		function drawChart() {
			var data = google.visualization.arrayToDataTable([
					[ "Employee", "Rating" ],
					["7만원 이상",	 <%=list.get(7)%>],
					[ "6만 ~ 7만원",<%=list.get(6)%>],
					[ "5만 ~ 6만원",<%=list.get(5)%>],
					[ "4만 ~ 5만원",<%=list.get(4)%>],
					[ "3만 ~ 4만원",<%=list.get(3)%>],
					[ "2만 ~ 3만원",<%=list.get(2)%>],
					[ "1만 ~ 2만원",<%=list.get(1)%>],
					[ "1만원 이하",<%=list.get(0)%>]
				]);
			var options = {
				title : "에이치엘비 평균단가 분포도"
			};
			var chart = new google.visualization.PieChart(document
					.getElementById("employee_piechart"));
			chart.draw(data, options);
		}
	</script>
	<div id="employee_piechart"
		style="position: absolute; left: 60%; transform: translateX(-50%); width: 1400px; height: 1100px;"></div>


	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>