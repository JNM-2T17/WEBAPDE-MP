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
					if( $(this).text() != 'Approved' ) {
						var id = $(this).attr('id');
						var id2 = "rejectK" + $(this).attr("id").substring(1);
						var title = $("form#" + id + " .title").val();
						var classif = $("form#" + id + " .class").val();
						var key = $("form#" + id + " .key").val();
						$.ajax({
							url : "approveKey",
							method : "POST",
							data : {
								'approve' : true,
								'title' : title,
								'classif' : classif,
								'key' : key
							},
							success : function() {
								switchClass( $("button#" + id), 'greyBox', 'orangeBox' );
								$("button#" + id).text("Approved");
								$("button#" + id2 ).remove();
							}
						});
					}
				});
				
				$("button[id^='rejectKey']").click(function() {
					var id = "key" + $(this).attr('id').substring(9);
					var title = $("form#" + id + " .title").val();
					var classif = $("form#" + id + " .class").val();
					var key = $("form#" + id + " .key").val();
					$.ajax({
						url : "approveKey",
						method : "POST",
						data : {
							'approve' : false,
							'title' : title,
							'classif' : classif,
							'key' : key
						},
						success : function() {
							$("div#" + id).remove();
							var html = $("#approveKey").html();
							var empty = true;
							var i = 0;
							while( i < html.length && empty ) {
								console.log( 'ASCII:' + Number(html[i]) + " Char:" + html[i]);
								if( Number(html[i]) != 0 ) {
									empty = false;
								}
								i++;
							}
							if( empty ) {
								$("#approveKey").html("No keyword proposals<br/><br/>")
							}
						}
					});
				});
				
				$("button[id^='genre']").click(function() {
					if( $(this).text() != 'Approved' ) {
						var id = $(this).attr('id');
						var id2 = "rejectG" + $(this).attr("id").substring(1);
						var title = $("form#" + id + " .title").val();
						var classif = $("form#" + id + " .class").val();
						var genre = $("form#" + id + " .genre").val();
						$.ajax({
							url : "approveGenre",
							method : "POST",
							data : {
								'approve' : true,
								'title' : title,
								'classif' : classif,
								'genre' : genre
							},
							success : function() {
								switchClass( $("button#" + id), 'greyBox', 'orangeBox' );
								$("button#" + id).text("Approved");
								$("button#" + id2 ).remove();
							}
						});
					}
				});
				
				$("button[id^='rejectGenre']").click(function() {
					var id = "genre" + $(this).attr('id').substring(11);
					console.log( id );
					var title = $("form#" + id + " .title").val();
					var classif = $("form#" + id + " .class").val();
					var genre = $("form#" + id + " .genre").val();
					$.ajax({
						url : "approveGenre",
						method : "POST",
						data : {
							'approve' : false,
							'title' : title,
							'classif' : classif,
							'genre' : genre
						},
						success : function() {
							$("div#" + id).remove();
							var html = $("#approveGenre").html();
							var empty = true;
							var i = 0;
							while( i < html.length && empty ) {
								if( Number(html[i]) != 0 ) {
									empty = false;
								}
								i++;
							}
							if( empty ) {
								$("#approveGenre").html("No genre proposals<br/><br/>")
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
			<h1 class="info">Keyword / Genre Proposals</h1>
			<c:set var="ctr" value="0" />
			<h2>Keyword</h2>
			<div id="approveKey" class="approveContent">
				<c:forEach var="k" items="${sessionScope.proposal4}" varStatus="i">
					<c:if test="${!k.verified}">
						<div class="apprWork" id="key${i.index}">
							<span class="info">${k.keyword}</span>
							<div class="apprDesc">
								<span>${k.title} (${k.titleclass})</span>
							</div> <!-- end of description -->
							<div class="plainLink" id="key${i.index}">
								<form method = "post" id="key${i.index}" onSubmit="return false;">
									<button class="orangeBox" id="key${i.index}">Approve</button>
									<button class="greyBox" id="rejectKey${i.index}">Reject</button>
									<input type="hidden" value = "${k.title}" name="title" class="title" />
									<input type="hidden" value = "${k.titleclass}" name="class" class="class" />
									<input type="hidden" value = "${k.keyword}" name="key" class="key" />
								</form>
							</div>
						</div>
						<c:set var="ctr" value="${ctr + 1}" />
					</c:if>
				</c:forEach>
				<c:if test="${ctr==0}">
					No Keyword Proposals<br /><br />
				</c:if>
			</div>
			<c:set var="ctr" value="0" />
			<div class="orangeLine"></div>
			<h2>Genre</h2>
			<div id="approveGenre" class="approveContent">
				<c:forEach var="g" items="${sessionScope.proposal3}" varStatus="i">
					<c:if test="${!g.verified}">
						<div class="apprWork" id="genre${i.index}">
							<span class="info">${g.genre}</span>
							<div class="apprDesc">
								<span>${g.title} (${g.titleclass})</span>
							</div> <!-- end of description -->
							<div class="plainLink" id="genre${i.index}">
								<form method = "post" id="genre${i.index}" onSubmit="return false;">
									<button class="orangeBox" id="genre${i.index}">Approve</button>
									<button class="greyBox" id="rejectGenre${i.index}">Reject</button>
									<input type="hidden" value = "${g.title}" name="title" class="title"/>
									<input type="hidden" value = "${g.titleclass}" name="class" class="class" />
									<input type="hidden" value = "${g.genre}" name="genre" class="genre"/>
								</form>
							</div>
						</div>
						<c:set var="ctr" value="${ctr + 1}" />
					</c:if>
				</c:forEach>
				<c:if test="${ctr == 0}">
					No Genre Proposals<br /><br />
				</c:if>
			</div>
		</div>
	</body>
</html>