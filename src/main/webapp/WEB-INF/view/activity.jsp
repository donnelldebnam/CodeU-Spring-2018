
<%@ page import="java.util.List" %>
<%@ page import="codeu.model.data.Activity" %>
<%@ page import="codeu.model.data.Conversation" %>
<%@ page import="codeu.model.data.Message" %>
<%@ page import="codeu.model.store.basic.UserStore" %>
<%@ page import="codeu.model.store.basic.ConversationStore" %>
<%@ page import="codeu.model.store.basic.MessageStore" %>
<%@ page import="java.time.Instant" %>
<%@ page import="java.time.ZoneOffset" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.util.UUID" %>

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
    <a id="navTitle" href="/">CodeByter's Chat App</a>
    <a href="/conversations">Conversations</a>
    <% if(request.getSession().getAttribute("user") != null) { %>
      <a>Hello <%= request.getSession().getAttribute("user") %>!</a>
      <a href="/users/<%= request.getSession().getAttribute("user")%>">My Profile</a>
      <a href="/logout.jsp">Logout</a>
    <% } else { %>
      <a href="/login">Login</a>
    <% } %>
    <a href="/activity">ActivityFeed</a>
    <a href="/about.jsp">About</a>
  </nav>
    <div id="container">
      <h2 style="color:blue" "text-aligned:left" "margin-bottom:25px"> ACTIVITY </h2>
      <h3> Here's everything that's happened on the site so far! </h3>
        <div id="activityfeed">
          <ul>
            <%
              for (Activity activity : activities) {
                String type = activity.getType();
                UUID id = activity.getId();
                UUID idOwnerId = activity.getOwnerId();
                String time = DateTimeFormatter.RFC_1123_DATE_TIME.withZone(ZoneOffset.UTC).format(activity.getCreationTime());
                String name = "";
                if(type.equals("RegisteringUser")){
                    name = UserStore.getInstance().getUser(id).getName();%>
                    <li><b><%= time %>:</b> <%= name %> joined CodeByters!</li>
                <% } %>
                <% if(type.equals("CreatingPublicConversation")) {
                     name = UserStore.getInstance().getUser(idOwnerId).getName();
                     Conversation conv = ConversationStore.getInstance().getConversationWithID(id);%>
                     <li><b><%= time %>:</b> <%= name %> created a new conversation: <a href="/chat/<%= conv.getTitle() %>"> <%= conv.getTitle() %></a>.</li>
                <% } %>
                <% if(type.equals("CreatingPublicMessage")) {
                     name = UserStore.getInstance().getUser(idOwnerId).getName();
                     Message mess = MessageStore.getInstance().getMessageWithID(id);
                     Conversation conv = ConversationStore.getInstance().getConversationWithID(mess.getConversationId());%>
                     <li><b><%= time %>:</b> <%= name %> sent a message in <a href="/chat/<%= conv.getTitle() %>"> <%= conv.getTitle() %> </a>: "<%= mess.getContent() %>".</li>
                <% } %>
            <% } %>
          </ul>
        </div>
    </div>
</body>
</html>