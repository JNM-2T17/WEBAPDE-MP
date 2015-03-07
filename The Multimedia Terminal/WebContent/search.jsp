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
		<script>
			$(document).ready(function() {
				randomizeLogo();
				
				$("#searchGenre").hide();
				$("#searchAlphabetical").hide();
				$("#searchRating").hide();
				$("#searchDate").hide();
				
				var active = $("#searchMedia");
				var filter = $("li#media");
				
				$("#homeLink").click(function() {
					setLoc("index.html");
				});
				
				$("span#searchBar img").click(function() {
					document.search.submit();
				});
				
				$("li#media").click(function() {
					setFilterCrit(filter, false);
					filter = setFilterCrit($(this),true);
					if( active.attr("id") != "searchMedia" ) {
						active.hide();
						active = $("#searchMedia").show();
					}
				});
				
				$("li#genre").click(function() {
					setFilterCrit(filter, false);
					filter = setFilterCrit($(this),true);
					if( active.attr("id") != "searchGenre" ) {
						active.hide();
						active = $("#searchGenre").show();
					}
				});
				
				$("li#alphabetical").click(function() {
					setFilterCrit(filter, false);
					filter = setFilterCrit($(this),true);
					if( active.attr("id") != "searchAlphabetical" ) {
						active.hide();
						active = $("#searchAlphabetical").show();
					}
				});
				
				$("li#rating").click(function() {
					setFilterCrit(filter, false);
					filter = setFilterCrit($(this),true);
					if( active.attr("id") != "searchRating" ) {
						active.hide();
						active = $("#searchRating").show();
					}
				});
				
				$("li#date").click(function() {
					setFilterCrit(filter, false);
					filter = setFilterCrit($(this),true);
					if( active.attr("id") != "searchDate" ) {
						active.hide();
						active = $("#searchDate").show();
					}
				});
			});
		</script>
	</head>
	<body>
		<header>
			<img id="logo" src="Website Assets/logo2.png" /><br />
			<div id="homeLink"><a href="index.html">Home</a></div>
			<div id="menubar">
				<form name="search" action="search">
					<ul id="menu">
						<li class="menuitem"><a href="login.html">Login</a></li>
						<li class="menuitem"><a href="favorites.html">Favorites</a></li>
						<li class="menuitem"><a href="admin.html">Admin</a></li>
						<li class="menuitem"><a href="propose.html">Propose Media</a></li>
					</ul> <!-- end of menu -->
					<span id="searchBar">
						<img src="Website Assets/search.png" />
						<input type="text" id="search" placeholder="Search..." name="s" />
					</span> <!-- end of searchBar -->
				</form>
			</div> <!--  end of menubar -->
		</header>
		<div id="mainContent">
			<h1>Search</h1>
			<ul id="filterMenu">
				<li id="filterLabel">Filter By: </li>
				<li id="media" class="filterCritActive">Media</li>
				<li id="genre" class="filterCritInactive">Genre</li>
				<li id="alphabetical" class="filterCritInactive">Alphabetical</li>
				<li id="rating" class="filterCritInactive">Rating</li>
				<li id="date" class="filterCritInactive">Date</li>
			</ul> <!--  end of filterMenu -->
			<div id="searchMedia" class="searchContent">
				<div class="work">
					<div class="img"><img src="Website Assets/blank.png" /></div>
					<div class="link">
						<a href="movie.html">Tell Me More</a>
					</div> <!-- end of link -->
					<span>Tomato Movie</span>
					<div class="rating">
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Empty Star.png" class="star" />
					</div> <!-- end of rating -->
					<div class="description">
						<p>It is the story of a tomato.</p>
						<p>Written by: A Potato</p>
					</div> <!-- end of description -->
				</div> <!-- end of work -->
				<div class = "orangeLine"></div><br />
				<div class="work">
					<div class="img"><img src="Website Assets/blank.png" /></div>
					<div class="link">
						<a href="game.html">Tell Me More</a>
					</div> <!-- end of link -->
					<span>Tomato Game X2</span>
					<div class="rating">
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Empty Star.png" class="star" />
						<img src="Website Assets/Empty Star.png" class="star" />
					</div> <!-- end of rating -->
					<div class="description">
						<p>An anthropomorphic fruit and vegetable fighting game.</p>
						<p>Developed by: PotatoSoft</p>
					</div> <!-- end of description -->
				</div> <!-- end of work -->
				<div class = "orangeLine"></div><br />
				<div class="work">
					<div class="img"><img src="Website Assets/blank.png" /></div>
					<div class="link">
						<a href="anime.html">Tell Me More</a>
					</div> <!-- end of link -->
					<span>Shingeki no Potato</span>
					<div class="rating">
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Empty Star.png" class="star" />
						<img src="Website Assets/Empty Star.png" class="star" />
					</div> <!-- end of rating -->
					<div class="description">
						<p>Humans defend themselves from giant attacking Potatoes.</p>
						<p>Created by: Potato Urobutchi</p>
					</div> <!-- end of description -->
				</div> <!-- end of work -->
				<div class = "orangeLine"></div><br />
				<div class="work">
					<div class="img"><img src="Website Assets/blank.png" /></div>
					<div class="link">
						<a href="book.html">Tell Me More</a>
					</div> <!-- end of link -->
					<span>A Tale of Two Potatoes</span>
					<div class="rating">
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Filled Star.png" class="star" />
					</div> <!-- end of rating -->
					<div class="description">
						<p>It was the best of potatoes; it was the worst of potatoes.</p>
						<p>Created by: Charles Potato</p>
					</div> <!-- end of description -->
				</div> <!-- end of work -->
			</div> <!-- end of searchMedia -->
			<div id="searchGenre" class="searchContent">
				<div class="work">
					<div class="img"><img src="Website Assets/blank.png" /></div>
					<div class="link">
						<a href="movie.html">Tell Me More</a>
					</div> <!-- end of link -->
					<span>Tomato Movie</span>
					<div class="rating">
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Empty Star.png" class="star" />
					</div> <!-- end of rating -->
					<div class="description">
						<p>It is the story of a tomato.</p>
						<p>Written by: A Potato</p>
					</div> <!-- end of description -->
				</div> <!-- end of work -->
				<div class = "orangeLine"></div><br />
				<div class="work">
					<div class="img"><img src="Website Assets/blank.png" /></div>
					<div class="link">
						<a href="game.html">Tell Me More</a>
					</div> <!-- end of link -->
					<span>Tomato Game X2</span>
					<div class="rating">
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Empty Star.png" class="star" />
						<img src="Website Assets/Empty Star.png" class="star" />
					</div> <!-- end of rating -->
					<div class="description">
						<p>An anthropomorphic fruit and vegetable fighting game.</p>
						<p>Developed by: PotatoSoft</p>
					</div> <!-- end of description -->
				</div> <!-- end of work -->
								<div class="work">
					<div class="img"><img src="Website Assets/blank.png" /></div>
					<div class="link">
						<a href="book.html">Tell Me More</a>
					</div> <!-- end of link -->
					<span>A Tale of Two Potatoes</span>
					<div class="rating">
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Filled Star.png" class="star" />
					</div> <!-- end of rating -->
					<div class="description">
						<p>It was the best of potatoes; it was the worst of potatoes.</p>
						<p>Created by: Charles Potato</p>
					</div> <!-- end of description -->
				</div> <!-- end of work -->
				<div class = "orangeLine"></div><br />
				<div class="work">
					<div class="img"><img src="Website Assets/blank.png" /></div>
					<div class="link">
						<a href="anime.html">Tell Me More</a>
					</div> <!-- end of link -->
					<span>Shingeki no Potato</span>
					<div class="rating">
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Empty Star.png" class="star" />
						<img src="Website Assets/Empty Star.png" class="star" />
					</div> <!-- end of rating -->
					<div class="description">
						<p>Humans defend themselves from giant attacking Potatoes.</p>
						<p>Created by: Potato Urobutchi</p>
					</div> <!-- end of description -->
				</div> <!-- end of work -->
			</div> <!-- end of searchGenre -->
			<div id="searchAlphabetical" class="searchContent">
				<div class="work">
					<div class="img"><img src="Website Assets/blank.png" /></div>
					<div class="link">
						<a href="book.html">Tell Me More</a>
					</div> <!-- end of link -->
					<span>A Tale of Two Potatoes</span>
					<div class="rating">
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Filled Star.png" class="star" />
					</div> <!-- end of rating -->
					<div class="description">
						<p>It was the best of potatoes; it was the worst of potatoes.</p>
						<p>Created by: Charles Potato</p>
					</div> <!-- end of description -->
				</div> <!-- end of work -->
				<div class="work">
					<div class="img"><img src="Website Assets/blank.png" /></div>
					<div class="link">
						<a href="anime.html">Tell Me More</a>
					</div> <!-- end of link -->
					<span>Shingeki no Potato</span>
					<div class="rating">
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Empty Star.png" class="star" />
						<img src="Website Assets/Empty Star.png" class="star" />
					</div> <!-- end of rating -->
					<div class="description">
						<p>Humans defend themselves from giant attacking Potatoes.</p>
						<p>Created by: Potato Urobutchi</p>
					</div> <!-- end of description -->
				</div> <!-- end of work -->
				<div class="work">
					<div class="img"><img src="Website Assets/blank.png" /></div>
					<div class="link">
						<a href="game.html">Tell Me More</a>
					</div> <!-- end of link -->
					<span>Tomato Game X2</span>
					<div class="rating">
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Empty Star.png" class="star" />
						<img src="Website Assets/Empty Star.png" class="star" />
					</div> <!-- end of rating -->
					<div class="description">
						<p>An anthropomorphic fruit and vegetable fighting game.</p>
						<p>Developed by: PotatoSoft</p>
					</div> <!-- end of description -->
				</div> <!-- end of work -->
				<div class="work">
					<div class="img"><img src="Website Assets/blank.png" /></div>
					<div class="link">
						<a href="movie.html">Tell Me More</a>
					</div> <!-- end of link -->
					<span>Tomato Movie</span>
					<div class="rating">
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Empty Star.png" class="star" />
					</div> <!-- end of rating -->
					<div class="description">
						<p>It is the story of a tomato.</p>
						<p>Written by: A Potato</p>
					</div> <!-- end of description -->
				</div> <!-- end of work -->
			</div> <!-- end of searchAlphabetical -->
			<div id="searchRating" class="searchContent">
				<div class="work">
					<div class="img"><img src="Website Assets/blank.png" /></div>
					<div class="link">
						<a href="book.html">Tell Me More</a>
					</div> <!-- end of link -->
					<span>A Tale of Two Potatoes</span>
					<div class="rating">
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Filled Star.png" class="star" />
					</div> <!-- end of rating -->
					<div class="description">
						<p>It was the best of potatoes; it was the worst of potatoes.</p>
						<p>Created by: Charles Potato</p>
					</div> <!-- end of description -->
				</div> <!-- end of work -->
				<div class="work">
					<div class="img"><img src="Website Assets/blank.png" /></div>
					<div class="link">
						<a href="movie.html">Tell Me More</a>
					</div> <!-- end of link -->
					<span>Tomato Movie</span>
					<div class="rating">
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Empty Star.png" class="star" />
					</div> <!-- end of rating -->
					<div class="description">
						<p>It is the story of a tomato.</p>
						<p>Written by: A Potato</p>
					</div> <!-- end of description -->
				</div> <!-- end of work -->
				<div class="work">
					<div class="img"><img src="Website Assets/blank.png" /></div>
					<div class="link">
						<a href="anime.html">Tell Me More</a>
					</div> <!-- end of link -->
					<span>Shingeki no Potato</span>
					<div class="rating">
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Empty Star.png" class="star" />
						<img src="Website Assets/Empty Star.png" class="star" />
					</div> <!-- end of rating -->
					<div class="description">
						<p>Humans defend themselves from giant attacking Potatoes.</p>
						<p>Created by: Potato Urobutchi</p>
					</div> <!-- end of description -->
				</div> <!-- end of work -->
				<div class="work">
					<div class="img"><img src="Website Assets/blank.png" /></div>
					<div class="link">
						<a href="game.html">Tell Me More</a>
					</div> <!-- end of link -->
					<span>Tomato Game X2</span>
					<div class="rating">
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Empty Star.png" class="star" />
						<img src="Website Assets/Empty Star.png" class="star" />
					</div> <!-- end of rating -->
					<div class="description">
						<p>An anthropomorphic fruit and vegetable fighting game.</p>
						<p>Developed by: PotatoSoft</p>
					</div> <!-- end of description -->
				</div> <!-- end of work -->
			</div> <!-- end of searchRating -->
			<div id="searchDate" class="searchContent">
			<div class="work">
					<div class="img"><img src="Website Assets/blank.png" /></div>
					<div class="link">
						<a href="game.html">Tell Me More</a>
					</div> <!-- end of link -->
					<span>Tomato Game X2</span>
					<div class="rating">
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Empty Star.png" class="star" />
						<img src="Website Assets/Empty Star.png" class="star" />
					</div> <!-- end of rating -->
					<div class="description">
						<p>An anthropomorphic fruit and vegetable fighting game.</p>
						<p>Developed by: PotatoSoft</p>
					</div> <!-- end of description -->
				</div> <!-- end of work -->
				<div class="work">
					<div class="img"><img src="Website Assets/blank.png" /></div>
					<div class="link">
						<a href="book.html">Tell Me More</a>
					</div> <!-- end of link -->
					<span>A Tale of Two Potatoes</span>
					<div class="rating">
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Filled Star.png" class="star" />
					</div> <!-- end of rating -->
					<div class="description">
						<p>It was the best of potatoes; it was the worst of potatoes.</p>
						<p>Created by: Charles Potato</p>
					</div> <!-- end of description -->
				</div> <!-- end of work -->
				<div class="work">
					<div class="img"><img src="Website Assets/blank.png" /></div>
					<div class="link">
						<a href="movie.html">Tell Me More</a>
					</div> <!-- end of link -->
					<span>Tomato Movie</span>
					<div class="rating">
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Empty Star.png" class="star" />
					</div> <!-- end of rating -->
					<div class="description">
						<p>It is the story of a tomato.</p>
						<p>Written by: A Potato</p>
					</div> <!-- end of description -->
				</div> <!-- end of work -->
				<div class="work">
					<div class="img"><img src="Website Assets/blank.png" /></div>
					<div class="link">
						<a href="anime.html">Tell Me More</a>
					</div> <!-- end of link -->
					<span>Shingeki no Potato</span>
					<div class="rating">
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Filled Star.png" class="star" />
						<img src="Website Assets/Empty Star.png" class="star" />
						<img src="Website Assets/Empty Star.png" class="star" />
					</div> <!-- end of rating -->
					<div class="description">
						<p>Humans defend themselves from giant attacking Potatoes.</p>
						<p>Created by: Potato Urobutchi</p>
					</div> <!-- end of description -->
				</div> <!-- end of work -->
			</div> <!-- end of searchDate -->
		</div> <!-- end of mainContent -->
	</body>
</html>