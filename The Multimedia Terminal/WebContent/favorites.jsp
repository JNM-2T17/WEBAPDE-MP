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
				randomizeLogo();
				
				$("#favGenre").hide();
				$("#favAlphabetical").hide();
				$("#favRating").hide();
				$("#favDate").hide();
				
				var active = $("#favMedia");
				var filter = $("li#media");
				
				$("#homeLink").click(function() {
					setLoc("start");
				});
				
				$("span#searchBar img").click(function() {
					document.search.submit();
				});
				
				$("li#media").click(function() {
					setFilterCrit(filter, false);
					filter = setFilterCrit($(this),true);
					if( active.attr("id") != "favMedia" ) {
						active.hide();
						active = $("#favMedia").show();
					}
				});
				
				$("li#genre").click(function() {
					setFilterCrit(filter, false);
					filter = setFilterCrit($(this),true);
					if( active.attr("id") != "favGenre" ) {
						active.hide();
						active = $("#favGenre").show();
					}
				});
				
				$("li#alphabetical").click(function() {
					setFilterCrit(filter, false);
					filter = setFilterCrit($(this),true);
					if( active.attr("id") != "favAlphabetical" ) {
						active.hide();
						active = $("#favAlphabetical").show();
					}
				});
				
				$("li#rating").click(function() {
					setFilterCrit(filter, false);
					filter = setFilterCrit($(this),true);
					if( active.attr("id") != "favRating" ) {
						active.hide();
						active = $("#favRating").show();
					}
				});
				
				$("li#date").click(function() {
					setFilterCrit(filter, false);
					filter = setFilterCrit($(this),true);
					if( active.attr("id") != "favDate" ) {
						active.hide();
						active = $("#favDate").show();
					}
				});
			});
		</script>
	</head>
	<body>
	<jsp:include page="header.jsp" />
		<div id="mainContent">
			<h1 class="info">Favorites</h1>
			<ul id="filterMenu">
				<li id="filterLabel">Filter By: </li>
				<li id="media" class="filterCritActive">Media</li>
				<li id="genre" class="filterCritInactive">Genre</li>
				<li id="alphabetical" class="filterCritInactive">Alphabetical</li>
				<li id="rating" class="filterCritInactive">Rating</li>
				<li id="date" class="filterCritInactive">Date</li>
			</ul> <!--  end of filterMenu -->
			<div id="favMedia" class="favContent">
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
			</div> <!-- end of favMedia -->
			<div id="favGenre" class="favContent">
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
			</div> <!-- end of favGenre -->
			<div id="favAlphabetical" class="favContent">
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
			</div> <!-- end of favAlphabetical -->
			<div id="favRating" class="favContent">
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
			</div> <!-- end of favRating -->
			<div id="favDate" class="favContent">
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
			</div> <!-- end of favDate -->
		</div> <!-- end of mainContent -->
	</body>
</html>