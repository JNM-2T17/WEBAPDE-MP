<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>The MultiType Terminal</title>
		<link rel="stylesheet" href="tmi.css" />
		<script src="jquery-2.1.1.js"></script>
		<script src="tmi.js"></script>
		<script>
			$(document).ready(function() {
				randomizeLogo();
				
				$("#approveAlphabetical").hide();
				$("#approveDate").hide();
				
				var active = $("#approveType");
				var filter = $("li#type");
				
				$("#homeLink").click(function() {
					setLoc("start");
				});
				
				$("span#searchBar img").click(function() {
					document.search.submit();
				});
				
				$("li#type").click(function() {
					setFilterCrit(filter, false);
					filter = setFilterCrit($(this),true);
					if( active.attr("id") != "approveType" ) {
						active.hide();
						active = $("#approveType").show();
					}
				});
				
				$("li#alphabetical").click(function() {
					setFilterCrit(filter, false);
					filter = setFilterCrit($(this),true);
					if( active.attr("id") != "approveAlphabetical" ) {
						active.hide();
						active = $("#approveAlphabetical").show();
					}
				});
				
				$("li#date").click(function() {
					setFilterCrit(filter, false);
					filter = setFilterCrit($(this),true);
					if( active.attr("id") != "approveDate" ) {
						active.hide();
						active = $("#approveDate").show();
					}
				});
				
				$("button[id^='work']").click(function() {
					var id = $(this).attr("id");
					var start = active.attr("id")[7];
					var id2 = "reject" + start + $(this).attr("id").substring(5);
					console.log(id2);
					if( $(this).val() != 'Approved' ) {
						$.ajax({
							url : 'approvedWork',
							method : 'POST',
							data : {
								'approve' : true,
								'title' : $("form#" + id + " input#title").val(),
								'class' : $("form#" + id + " input#titleclass").val()
							},
							success : function(a) {
								switchClass( $('div[data-discriminator="' + $("form#" + id + " input#title").val() + $("form#" + id + " input#titleclass").val()+ '"] button[id^="work"]' ), 'greyBox', 'orangeBox' ).text('Approved')
								$('div[data-discriminator="' + $("form#" + id + " input#title").val() + $("form#" + id + " input#titleclass").val()+ '"] button[id^="reject"]').remove();
							}
						});
					}
				});
				
				$("button[id^='reject']").click(function() {
					var id = "work" + active.attr("id").substring(7) + $(this).attr("id").substring(10 + active.attr("id").substring(7).length);
					console.log(id);
					$.ajax({
						url : 'approvedWork',
						method : 'POST',
						data : {
							'approve' : false,
							'title' : $("form#" + id + " input#title").val(),
							'class' : $("form#" + id + " input#titleclass").val()
						},
						success : function(a) {
							$('div[data-discriminator="' + $("form#" + id + " input#title").val() + $("form#" + id + " input#titleclass").val()+ '"]' ).remove();
							var html = active.html();
							var empty = true;
							var i = 0;
							while( i < html.length && empty ) {
								if( Number(html[i]) != 0 ) {
									empty = false;
								}
								i++;
							}
							if( empty ) {
								$(".approveContent").html("No work proposals<br/><br/>")
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
			<h1 class="info">Work Proposals</h1>
			<c:choose>
				<c:when test="${fn:length(sessionScope.proposal0) == 0 }">
					No work proposals
				</c:when>
				<c:otherwise>
					<ul id="filterMenu">
						<li id="filterLabel">Filter By: </li>
						<li id="type" class="filterCritActive">Type</li>
						<li id="alphabetical" class="filterCritInactive">Alphabetical</li>
						<li id="date" class="filterCritInactive">Date</li>
					</ul> <!--  end of filterMenu -->
					<div id="approveType" class="approveContent">
						<c:forEach var="w" items="${sessionScope.proposal0}" varStatus="i">
							<div class="apprWork" id="type${i.index}" data-discriminator="${w.title}${w.classification}">	
								<div class="img">
									<c:choose>
										<c:when test="${empty w.cover}">
											<img src="Website Assets/blank.png" />
										</c:when>
										<c:otherwise>
											<img src="${w.cover}" />
										</c:otherwise>
									</c:choose>
								</div>
								<span class="info">${w.classification} Proposal</span>
								<div class="apprDesc">
									<p>${w.title} (${w.releaseYear})</p>
									<p class="desc">
										<c:if test="${not empty w.description}">
											${w.description}
										</c:if>
									</p>
								</div> <!-- end of description -->
								<div class="plainLink" id="workType${i.index}">
									<form action="approvedWork" method="post" id="workType${i.index}" onSubmit="return false;">
										<button class="orangeBox" id="workType${i.index}">Approve</button>
										<button class="greyBox" id="rejectWorkType${i.index}">Reject</button>
										<input type="hidden" id="title" value="${w.title}" />
										<input type="hidden" id="titleclass" value="${w.classification}" />
									</form>
								</div> <!-- end of link -->
							</div>
						</c:forEach>
					</div> <!-- end of approveType -->
					<div id="approveAlphabetical" class="approveContent">
						<c:forEach var="w" items="${sessionScope.proposal1}" varStatus="i">
							<div class="apprWork" id="alpha${i.index}" data-discriminator="${w.title}${w.classification}">
								<div class="img">
									<c:choose>
										<c:when test="${empty w.cover}">
											<img src="Website Assets/blank.png" />
										</c:when>
										<c:otherwise>
											<img src="${w.cover}" />
										</c:otherwise>
									</c:choose>
								</div>
								<span class="info">${w.classification} Proposal</span>
								<div class="apprDesc">
									<p>${w.title} (${w.releaseYear})</p>
									<p class="desc">
										<c:if test="${not empty w.description}">
											${w.description}
										</c:if>
									</p>
								</div> <!-- end of description -->
								<div class="plainLink" id="workAlpha${i.index}">
									<form action="approvedWork" method="post" id="workAlpha${i.index}" onSubmit="return false;">
										<button class="orangeBox" id="workAlpha${i.index}">Approve</button>
										<button class="greyBox" id="rejectWorkAlpha${i.index}">Reject</button>
										<input type="hidden" id="title" value="${w.title}" />
										<input type="hidden" id="titleclass" value="${w.classification}" />
									</form>
								</div> <!-- end of link -->
							</div>
						</c:forEach>
					</div> <!-- end of approveAlphabetical -->
					<div id="approveDate" class="approveContent">
						<c:forEach var="w" items="${sessionScope.proposal2}" varStatus="i">
							<div class="apprWork" id="workDate${i.index}" data-discriminator="${w.title}${w.classification}">
								<div class="img">
									<c:choose>
										<c:when test="${empty w.cover}">
											<img src="Website Assets/blank.png" />
										</c:when>
										<c:otherwise>
											<img src="${w.cover}" />
										</c:otherwise>
									</c:choose>
								</div>
								<span class="info">${w.classification} Proposal</span>
								<div class="apprDesc">
									<p>${w.title} (${w.releaseYear})</p>
									<p class="desc">
										<c:if test="${not empty w.description}">
											${w.description}
										</c:if>
									</p>
								</div> <!-- end of description -->
								<div class="plainLink" id="workDate${i.index}">
									<form action="approvedWork" method="post" id="workType${i.index}" onSubmit="return false;">
										<button class="orangeBox" id="workDate${i.index}">Approve</button>
										<button class="greyBox" id="rejectDateType${i.index}">Reject</button>
										<input type="hidden" id="title" value="${w.title}" />
										<input type="hidden" id="titleclass" value="${w.classification}" />
									</form>
								</div> <!-- end of link -->
							</div>
						</c:forEach>
					</div> <!-- end of approveDate -->
				</c:otherwise>
			</c:choose>
		</div> <!-- end of mainContent -->
	</body>
</html>