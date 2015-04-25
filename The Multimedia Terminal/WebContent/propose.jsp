<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>The Multimedia Terminal</title>
		<link rel="stylesheet" href="tmi.css" />
		<script src="jquery-2.1.1.js"></script>
		<script src="tmi.js"></script>
		<c:set var="success" value="${sessionScope.proposalSuccess}" />
		<c:set var="np" value="${sessionScope.noProposal}" />
		<script>
			$(document).ready(function() {
				<c:if test="${!np}">
					<c:choose>
						<c:when test="${success}">
							alert('Adding "${sessionScope.title}" successful!');
						</c:when>
						<c:otherwise>
							alert('${sessionScope.proposalError}');  
						</c:otherwise>
					</c:choose>
				</c:if>
				var success = ${success};
				<c:if test="${!success}">
					$("#title").val('${sessionScope.title}');
					$("#releaseYear").val('${sessionScope.releaseYear}');
					$("#class option[value='${sessionScope.classification}']").attr('selected','selected');
				</c:if>
					
				randomizeLogo();
				
				$("#homeLink").click(function() {
					setLoc("start");
				});
				
				$("span#searchBar img").click(function() {
					document.search.submit();
				});
			});
			
			function checkDesc() {
				var desc = document.getElementById("descBox").value;
				console.log(desc);
				if( desc.length > 255 ) {
					alert("Description is too long. Please keep it below 255 characters.");
					return false;
				} 
				
				return true;
			}
		</script>
	</head>
	<body>
		<jsp:include page="header.jsp" />
		<div id="mainContent">
			<form action='propose' method='post' onSubmit="return checkDesc()">
				<h1>Work Proposal</h1>
				<div class="orangeLine"></div><br /><br />
				<div class="proposeTop">
					<span class="info">Title:&nbsp;</span>
					<input class="formField" type="text" name="title" id="title" required />
					<br /><br />
					<div><img src="Website Assets/Upload Photo.png" /></div>
				</div>	
				<div class="proposeDesc">
					<div class="info">Description: <br />
						<textarea id="descBox" class="formField" name="description">${sessionScope.description}</textarea>
					</div>
					<table id="proposeForm">
						<tr>
							<td class="info">Release Year:</td>
							<td><input class="formField" type="text" name="releaseYear" 
										id="releaseYear" 
										required /></td>
						</tr>
						<tr>
							<td class="info">Media Type:</td>
							<td>
								<select name="classification" id="class">
									<option value="movie">Movie</option>
									<option value="book">Book</option>
									<option value="album">Album</option>
									<option value="music">Song</option>
									<option value="television">Television</option>
									<option value="animation">Animated Television</option>
									<option value="web content">Web Content</option>
									<option value="theater">Theater</option>
									<option value="graphic novel">Graphic Novel</option>
									<option value="comic">Comic</option>
									<option value="manga">Manga</option>
									<option value="video game">Video Game</option>
								</select>
							</td>
						</tr>
					</table>
					<div id="formButtons">
						<input type="submit" class="orangeBox" />
						<button class="orangeBox">Cancel</button>
					</div>	
				</div>
			</form>
		</div><!-- end of mainContent -->
	</body>
</html>