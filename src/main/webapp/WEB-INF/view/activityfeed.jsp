
<%@ page import="java.util.List" %>
<%@ page import="codeu.model.data.Activity" %>
<%@ page import="codeu.model.data.Conversation" %>
<%@ page import="codeu.model.data.Message" %>
<%@ page import="codeu.model.store.basic.ConversationStore" %>
<%
List<Activity> activities = (List<Activity>) request.getAttribute("activities");
%>

<!DOCTYPE html>
<html>
<head>
  <title>ActivityFeed</title>
  <link rel="stylesheet" href="/css/main.css">

  <style>
    #activityfeed {
      background-color: white;
      height: 500px;
      overflow-y: scroll
    }
  </style>

  <script>
    // scroll the activityfeed div to the bottom
    function scrollChat() {
      var chatDiv = document.getElementById('chat');
      chatDiv.scrollTop = chatDiv.scrollHeight;
    };
  </script>

</head>
<body onload="scrollChat()">
  <nav>
    <a id="navTitle" href="/">CodeU Chat App</a>
    <a href="/conversations">Conversations</a>
    <% if(request.getSession().getAttribute("user") != null) { %>
      <a>Hello <%= request.getSession().getAttribute("user") %>!</a>
      <a href="/users/<%=request.getSession().getAttribute("user")%>">My Profile</a>
      <a href="/logout.jsp">Logout</a>
    <% } else { %>
      <a href="/login">Login</a>
    <% } %>
    <a href="/activityfeed">ActivityFeed</a>
    <a href="/about.jsp">About</a>
  </nav>
    <div id="container">
      <h2 style="color:blue"> WELCOME TO THE <strong> ACTIVITY FEED PAGE </strong> (in progress) </h2>
        <div id="activityfeed">
          <ul>
            <%
              for (Activity activity : activities) {
                String thumbnail = activity.getThumbnail();
            %>
                  <li><%= thumbnail %> </li>
            <% } %>
          </ul>
        </div>
    </div>
</body>
</html>