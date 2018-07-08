<nav>
<a id="navTitle" href="/">CodeByter's Chat App</a>
<a href="/conversations">Conversations</a>
<% if (request.getSession().getAttribute("user") != null) { %>
  <a>Hello <%= request.getSession().getAttribute("user") %>!</a>
  <a href="/users/<%= request.getSession().getAttribute("user")%>">My Profile</a>
  <a href="/logout.jsp">Logout</a>
<% } else { %>
  <a href="/login">Login</a>
<% } %>
<a href="/activity">ActivityFeed</a>
<a href="/about.jsp">About</a>

<form action="/hashtag_search.jsp" method="post">
  <input type="text" name="fname" required>
  <input type="submit" value="Search">
</form>

</nav>