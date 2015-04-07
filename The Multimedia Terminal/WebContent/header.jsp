<header>
			<div id ="userinfo" > <%
			 	if (session.getAttribute("username") != null) {
			 %>			
				Welcome, <%if((Boolean)session.getAttribute("isAdmin")){%>
				Administrator
				<%}%>
				<%=session.getAttribute("username")%>!<br />
			<a href="logout"> Logout</a> <%
			 	}else{
			 %>
						<a href="login" >Login</a>
			 	 <%}%>
			</div> 
			
			<img id="logo" /><br />
			<div id="homeLink"><a href="/The_Multimedia_Terminal">Home</a></div>
			<div id="menubar">
				<form name="search" action="search">
					<ul id="menu">
						
						<li class="menuitem"><a href="favorites.jsp">Favorites</a></li>
						<li class="menuitem"><a href="propose">Propose Media</a></li>
	
						<%if(session.getAttribute("username")!=null){%>				
							<%if((Boolean)session.getAttribute("isAdmin")){%>
								<li class="menuitem"><a href="admin">Admin</a></li>
							<%}}%>
							
						
					</ul> <!-- end of menu -->
					<span id="searchBar">
						<img src="Website Assets/search.png" />
						<input type="text" id="search" placeholder="Search..." name="s" />
					</span> <!-- end of searchBar -->
				</form>
			</div> <!--  End of menubar -->
		</header>