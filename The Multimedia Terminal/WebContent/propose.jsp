<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>The Multimedia Terminal</title>
		<link rel="stylesheet" href="tmi.css" />
		<script src="jquery-2.1.1.js"></script>
		<script src="tmi.js"></script>
		<%! boolean success = true;%>
		<% success = (Boolean)request.getSession().getAttribute("proposalSuccess"); %>
		<script>
			$(document).ready(function() {
				<% if( !(Boolean)request.getSession().getAttribute("noProposal") ) {
					%>
				<%=success ? "alert('Adding \"" + request.getSession().getAttribute("title") + "\" successful!')" : 
						"alert('" + request.getSession().getAttribute("proposalError") + "');"%>  
				<%}%>
				randomizeLogo();
				
				$("#homeLink").click(function() {
					setLoc("index.html");
				});
				
				$("span#searchBar img").click(function() {
					document.search.submit();
				});
			});
			
			function checkDesc() {
				var desc = $("#descBox").value();
				if( desc.length > 255 ) {
					alert("Description is too long. Please keep it below 255 characters.");
					return false;
				} 
				
				return true;
			}
		</script>
	</head>
	<body>
		<header>
			<img id="logo" /><br />
			<div id="homeLink"><a href="index.html">Home</a></div>
			<div id="menubar">
				<form name="search" action="search">
					<ul id="menu">
						<li class="menuitem"><a href="login.html">Login</a></li>
						<li class="menuitem"><a href="favorites.html">Favorites</a></li>
						<li class="menuitem"><a href="admin.html">Admin</a></li>
						<li class="menuitem"><a href="propose">Propose Media</a></li>
					</ul> <!-- end of menu -->
					<span id="searchBar">
						<img src="Website Assets/search.png" />
						<input type="text" id="search" placeholder="Search..." name="s" />
					</span> <!-- end of searchBar -->
				</form>
			</div> <!--  End of menubar -->
		</header>
		
		<div id="mainContent">
			<form action='propose' method='post' onSubmit="return checkDesk();">
				<h1>Work Proposal</h1>
				<div class="orangeLine"></div><br /><br />
				<div class="proposeTop">
					<span class="info">Title:&nbsp;</span>
					<input class="formField" type="text" name="title"
							value="<%=success ? "" : request.getSession().getAttribute("title") %>" 
							required />
					<br /><br />
					<div><img src="Website Assets/Upload Photo.png" /></div>
				</div>	
				<div class="proposeDesc">
					<div class="info">Description: <br />
						<textarea id="descBox" class="formField" name="description"><%=success ? "" : request.getSession().getAttribute("description") %></textarea>
					</div>
					<table id="proposeForm">
						<tr>
							<td class="info">Release Year:</td>
							<td><input class="formField" type="text" name="releaseYear" 
										value="<%if(!success)%> ${sessionScope.releaseYear}" 
										required /></td>
						</tr>
						<tr>
							<td class="info">Media Type:</td>
							<td>
								<select name="classification">
									<option value="movie" <%=success ? "" : ("movie".equals(request.getSession().getAttribute("class"))?"selected":"") %>>Movie</option>
									<option value="book" <%=success ? "" : ("book".equals(request.getSession().getAttribute("class"))?"selected":"") %>>Book</option>
									<option value="album" <%=success ? "" : ("album".equals(request.getSession().getAttribute("class"))?"selected":"") %>>Album</option>
									<option value="music" <%=success ? "" : ("music".equals(request.getSession().getAttribute("class"))?"selected":"") %>>Song</option>
									<option value="television" <%=success ? "" : ("television".equals(request.getSession().getAttribute("class"))?"selected":"") %>>Television</option>
									<option value="animation" <%=success ? "" : ("animation".equals(request.getSession().getAttribute("class"))?"selected":"") %>>Animated Television</option>
									<option value="webcontent" <%=success ? "" : ("webcontent".equals(request.getSession().getAttribute("class"))?"selected":"") %>>Web Content</option>
									<option value="theater" <%=success ? "" : ("theater".equals(request.getSession().getAttribute("class"))?"selected":"") %>>Theater</option>
									<option value="graphic novel" <%=success ? "" : ("graphic novel".equals(request.getSession().getAttribute("class"))?"selected":"") %>>Graphic Novel</option>
									<option value="comic" <%=success ? "" : ("comic".equals(request.getSession().getAttribute("class"))?"selected":"") %>>Comic</option>
									<option value="manga" <%=success ? "" : ("manga".equals(request.getSession().getAttribute("class"))?"selected":"") %>>Manga</option>
									<option value="video game" <%=success ? "" : ("video game".equals(request.getSession().getAttribute("class"))?"selected":"") %>>Video Game</option>
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