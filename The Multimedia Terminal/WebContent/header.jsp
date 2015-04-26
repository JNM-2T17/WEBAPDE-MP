<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<header>
			<c:set var="user" value="${sessionScope.username}" />
			<c:set var="admin" value="${sessionScope.isAdmin}" />
			<div id ="userinfo" >
				<c:choose>
					<c:when test="${not empty user}">
						Welcome, <c:if test="${admin}">Administrator</c:if> ${user}!<br />
						<a href="logout"> Logout</a>
			 		</c:when>
			 		<c:otherwise>
			 			<div id="loginLink"><a href="login" >Login</a></div>
			 		</c:otherwise>
			 	</c:choose>
			</div> 
			<img id="logo" /><br />
			<div id="homeLink"><a href="/The_Multimedia_Terminal">Home</a></div>
			<div id="menubar">
				<form id="searchForm" name="search" action="search">
					<ul id="menu">
						<c:if test="${not empty user}">
							<li class="menuitem"><a href="favorite">Favorites</a></li>
							<li class="menuitem"><a href="propose">Propose</a></li>
						</c:if>
						<c:if test="${not empty user && admin}">
							<li class="menuitem"><a href="admin">Admin</a></li>
						</c:if>
					</ul> <!-- end of menu -->
					<span id="searchBar">
						<img src="Website Assets/search.png" />
						<input type="text" id="search" placeholder="Search..." name="s" />
					</span> <!-- end of searchBar -->
				</form>
			</div> <!--  End of menubar -->
		</header>