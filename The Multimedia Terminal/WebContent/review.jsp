<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>The Multimedia Terminal</title>
		<link rel="stylesheet" href="tmi.css" />
		<script src="jquery-2.1.1.js"></script>
		<script src="tmi.js"></script>
		<script>
			$(document).ready(function() {
				$("#homeLink").click(function() {
					setLoc("index.html");
				});
				
				$("span#searchBar img").click(function() {
					setLoc('search.html?s=' + $("#search").val());
				});
			});
		</script>
	</head>
	<body>
		<header>
			<h1>The Multimedia Terminal</h1>
			<div id="homeLink"><a href="index.html">Home</a></div>
			<div id="menubar">
				<form action="search.html">
					<ul id="menu">
						<li class="menuitem"><a href="login.html">Login</a></li>
						<li class="menuitem"><a href="favorites.html">Favorites</a></li>
						<li class="menuitem"><a href="admin.html">Admin</a></li>
						<li class="menuitem"><a href="propose.html">Propose Media</a></li>
					</ul> <!-- end of menu -->
					<span id="searchBar">
						<img src="Website Assets/search.png" />
						<input type="text" id="search" name="s" />
					</span> <!-- end of searchBar -->
				</form>
			</div> <!--  End of menubar -->
		</header>
		<div id="mainContent">
			<h1>Write a Review</h1>
			<div class="orangeLine"></div>
			<h1><%=request.getParameter("title")%></h1>
		</div><!-- end of mainContent -->
	</body>
</html>