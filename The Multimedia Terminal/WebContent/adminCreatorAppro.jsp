<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>The Multimedia Terminal</title>
		<link rel="stylesheet" href="tmi.css" />
		<script src="jquery-2.1.1.js"></script>
		<script src="tmi.js"></script>
		<script>
			$(document).ready(function() {
				randomizeLogo();
				
				$("#homeLink").click(function() {
					setLoc("start");
				});
				
				$("span#searchBar img").click(function() {
					document.search.submit();
				});
				
				$("button[id^='key']").click(function() {
					
				});
			});
		</script>
	</head>
	<body>
		<jsp:include page="header.jsp" />
		<div id="mainContent">
			<h1 class="info">Creator Proposals</h1>
			<c:if test="${fn:length(sessionscope.proposal5) > 0}">
				<div id="approveType" class="approveContent">
					<c:forEach var="c" items="${sessionScope.proposal5}" varStatus="i">
						<c:if test="${!c.verified}">
							<div class="apprWork">
								<span class="info">${c.name}</span>
								<div class="apprDesc">
									<span>${c.bio}</span>
								</div> <!-- end of description -->
								<div class="wideLink">
									<form action = "approveCreator" method = "post" id="key${i.index}">
										<button class="orangeBox" id="key${i.index}">Approve</button>
										<input type="hidden" value = "${c.name}" name="name" class="name" />
										<input type="hidden" value = "${c.bio}" name="bio" class="bio" />
										<input type="hidden" value = "${c.trivia}" name="trivia" class="trivia" />
									</form>
								</div>
							</div> <!-- end of apprWork -->
						</c:if>
					</c:forEach>
				</div>
			</c:if>
		</div>
	</body>
</html>