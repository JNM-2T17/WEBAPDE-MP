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
				
				$("#searchGenre").hide();
				$("#searchAlphabetical").hide();
				$("#searchRating").hide();
				$("#searchDate").hide();
				
				var active = $("#searchMedia");
				var filter = $("li#media");
				
				$("#homeaddWork").click(function() {
					setLoc("#");
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
				
				$("div[class$=\"Work\"]").click(function() {
					var str = $(this).attr('class');
					str.substring(0,str.length - 4) == "add" ? 
					toggleRec( $(this), true ).text('Unrecommended') : 
					toggleRec( $(this), false ).text('Add');
				});
			});
		</script>
	</head>
	<body>
		<jsp:include page="header.jsp" />
		<div id="mainContent">
		<ul id="filterMenu">
				<li id="filterLabel">Filter By: </li>
				<li id="media" class="filterCritActive">Media</li>
				<li id="genre" class="filterCritInactive">Genre</li>
				<li id="alphabetical" class="filterCritInactive">Alphabetical</li>
				<li id="rating" class="filterCritInactive">Rating</li>
				<li id="date" class="filterCritInactive">Date</li>
			</ul> <!--  end of filterMenu -->
			<div class = "recoHead" align = "center">
				<h1>Unrecommend For: <%=request.getParameter("title")%></h1>
			</div><!-- end of recoHead -->
			<div id="searchMedia" class="searchContent">
				<div class="work">
					<div class="img"><img src="Website Assets/blank.png" /></div>
					<div class="addWork">
						<p>Add</p>
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
					<div class="addWork">
						<p>Add</p>
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
					<div class="addWork">
						<p>Add</p>
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
					<div class="addWork">
						<p>Add</p>
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
					<div class="addWork">
						<p>Add</p>
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
					<div class="addWork">
						<p>Add</p>
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
					<div class="addWork">
						<p>Add</p>
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
					<div class="addWork">
						<p>Add</p>
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
					<div class="addWork">
						<p>Add</p>
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
					<div class="addWork">
						<p>Add</p>
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
					<div class="addWork">
						<p>Add</p>
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
					<div class="addWork">
						<p>Add</p>
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
					<div class="addWork">
						<p>Add</p>
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
					<div class="addWork">
						<p>Add</p>
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
					<div class="addWork">
						<p>Add</p>
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
					<div class="addWork">
						<p>Add</p>
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
					<div class="addWork">
						<p>Add</p>
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
					<div class="addWork">
						<p>Add</p>
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
					<div class="addWork">
						<p>Add</p>
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
					<div class="addWork">
						<p>Add</p>
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