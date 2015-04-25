<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			});
			
			function approve(title,classif,id) {
				if( $('#'+ id + ' input[type="submit"]').val() != 'Approved' ) {
					$.ajax({
						url : 'approvedWork',
						method : 'POST',
						data : {
							'title' : title,
							'class' : classif
						},
						success : function(a) {
							switchClass( $('#'+ id ), 'approvedLink', 'wideLink' );
							switchClass( $('#'+ id + ' input[type="submit"]' ), 'greyBox', 'orangeBox' );
							$('#' + id + ' input[type="submit"]').val('Approved');
							console.log(a);
						}
					});
				}
				
				return false;
			}
		</script>
	</head>
	<body>
		<jsp:include page="header.jsp" />
		<div id="mainContent">
			<h1 class="info">Work Proposals</h1>
			<ul id="filterMenu">
				<li id="filterLabel">Filter By: </li>
				<li id="type" class="filterCritActive">Type</li>
				<li id="alphabetical" class="filterCritInactive">Alphabetical</li>
				<li id="date" class="filterCritInactive">Date</li>
			</ul> <!--  end of filterMenu -->
			<div id="approveType" class="approveContent">
				<c:forEach var="w" items="${sessionScope.proposal0}" varStatus="i">
					<div class="apprWork">	
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
						<div class="wideLink" id="type${i.index}">
							<form action="approvedWork" method="post" id="type${i.index}" onSubmit="return approve('${w.title}','${w.classification}','type${i.index}');">
								<input type="submit" class="orangeBox" value="Approve" />
							</form>
						</div> <!-- end of link -->
					</div> <!-- end of work -->
				</c:forEach>
			</div> <!-- end of approveType -->
			<div id="approveAlphabetical" class="approveContent">
				<c:forEach var="w" items="${sessionScope.proposal1}" varStatus="i">
					<div class="apprWork">
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
						<div class="wideLink" id="alpha${i.index}">
							<form action="approvedWork" method="post" id="alpha${i.index}" onSubmit="return approve('${w.title}','${w.classification}','alpha${i.index}');">
								<input type="submit" class="orangeBox" value="Approve" />
							</form>
						</div> <!-- end of link -->
					</div> <!-- end of work -->
				</c:forEach>
			</div> <!-- end of approveAlphabetical -->
			<div id="approveDate" class="approveContent">
				<c:forEach var="w" items="${sessionScope.proposal2}" varStatus="i">
					<div class="apprWork">
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
						<div class="wideLink" id="date${i.index}">
							<form action="approvedWork" method="post" id="date${i.index}" onSubmit="return approve('${w.title}','${w.classification}','date${i.index}');">
								<input type="submit" class="orangeBox" value="Approve" />
							</form>
						</div> <!-- end of link -->
					</div> <!-- end of work -->
				</c:forEach>
			</div> <!-- end of approveDate -->
		</div> <!-- end of mainContent -->
	</body>
</html>