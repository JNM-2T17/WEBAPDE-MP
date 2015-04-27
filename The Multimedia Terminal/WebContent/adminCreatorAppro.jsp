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
				
				$("button[id^='crea']").click(function() {
					if( $(this).text() == 'Approve' ) {
						var id = $(this).attr("id");
						var id2 = 'rejectC' + id.substring(1);
						$.ajax({
							url : 'approveCreator',
							method : 'POST',
							data : { 
								'approve' : true,
								'name' : $("form#" + id)
							},
							success : function(a) {
								switchClass($("button#" + id),'greyBox','orangeBox').text("Approved");
								$("button#" + id2).remove();
							}
						});
					}
				});
				
				$("button[id^='reject']").click(function() {
					var id = 'c' + $(this).attr("id").substring(7);
					$.ajax({
						url : 'approveCreator',
						method : 'POST',
						data : {
							'approve' : false,
							'name' : $("form#" + id)
						},
						success : function(a) {
							$("div#" + id).remove();
							var html = $("#approveType").html();
							var empty = true;
							var i = 0;
							while( i < html.length && empty ) {
								if( Number(html[i]) != 0 ) {
									empty = false;
								}
								i++;
							}
							if( empty ) {
								$("#approveType").html("No creator proposals<br/><br/>")
							}
						}
					});
				});
			});
		</script>
	</head>
	<body>
		<jsp:include page="header.jsp" />
		<div id="mainContent">
			<h1 class="info">Creator Proposals</h1>
			<c:set var="ctr" value="0" /> 
			<div id="approveType" class="approveContent">
				<c:forEach var="c" items="${sessionScope.proposal5}" varStatus="i">
					<c:if test="${!c.verified}">
						<div class="apprWork" id="crea${i.index}">
							<span class="info">${c.name}</span>
							<div class="apprDesc">
								<span>${c.bio}</span>
							</div> <!-- end of description -->
							<div class="plainLink">
								<form action = "approveCreator" method = "post" id="crea${i.index}">
									<button class="orangeBox" id="crea${i.index}">Approve</button>
									<button class="greyBox" id="rejectCrea${i.index}">Reject</button>
									<input type="hidden" value = "${c.name}" name="name" class="name" />
									<input type="hidden" value = "${c.bio}" name="bio" class="bio" />
									<input type="hidden" value = "${c.trivia}" name="trivia" class="trivia" />
								</form>
							</div>
						</div> <!-- end of apprWork -->
						<c:set var="ctr" value="${ctr + 1}" />
					</c:if>
				</c:forEach>
				<c:if test="${ctr == 0}">
					No Creator Proposals
				</c:if>
			</div>
		</div>
	</body>
</html>