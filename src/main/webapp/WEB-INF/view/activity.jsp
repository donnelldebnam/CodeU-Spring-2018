<%@ page import="java.util.List" %>
<%@ page import="codeu.model.data.Activity" %>
<%@ page import="codeu.model.data.Conversation" %>
<%@ page import="codeu.model.data.Message" %>
<%@ page import="codeu.model.data.Action" %>
<%@ page import="codeu.model.store.basic.UserStore" %>
<%@ page import="codeu.model.store.basic.ConversationStore" %>
<%@ page import="codeu.model.store.basic.MessageStore" %>
<%@ page import="codeu.model.util.Util" %>
<%@ page import="java.util.UUID" %>

<%
List<Activity> activities = (List<Activity>) request.getAttribute("activities");
%>

<!DOCTYPE html>
<html>
<head>
  <title>ActivityFeed</title>
  <title>CodeByter's Chat App</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="shortcut icon" type="image/png" href="http://i1067.photobucket.com/albums/u437/donnedebnam1/240_F_109566504_1MfKH89SEmbr4V5bO0H604S0UL08g7uY_zpsa1bnyvyl.png"/>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="/css/main.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

  <style>
    #activityfeed {
      background-color: white;
      height: 500px;
      overflow-y: scroll
    }
    html {
      zoom:80%;
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
  <%@ include file = "/navigations.jsp" %>

    <div id="container">
      <h2 style="color:blue; text-aligned:left; margin-bottom:25px"> ACTIVITY </h2>
      <h3> Here's everything that's happened on the site so far! </h3>
        <div id="activityfeed">
          <ul>
            <%
              for (int i = activities.size() -1; i>-1; i--) {
                Activity activity = activities.get(i);
                if(activity.isPublic()) {
                  Action action = activity.getAction();
                  UUID id = activity.getId();
                  UUID idOwnerId = activity.getOwnerId();
                  String time = Util.FormatDateTime(activity.getCreationTime());
                  String name = "";
                  switch(action) {

                  case REGISTER_USER:
                    name = UserStore.getInstance().getUser(id).getName();%>
                    <li><b><%= time %>:</b> <%= name %> joined CodeByters!</li>
                    <% break;

                  case CREATE_CONV:
                     name = UserStore.getInstance().getUser(idOwnerId).getName();
                     Conversation conv1 = ConversationStore.getInstance().getConversationById(id);%>
                     <li><b><%= time %>:</b> <%= name %> created a new conversation:
                     <a href="/chat/<%= conv1.getTitle() %>"> <%= conv1.getTitle() %></a>.</li>
                     <% break;

                  case SEND_MESSAGE:
                     name = UserStore.getInstance().getUser(idOwnerId).getName();
                     Message mess = MessageStore.getInstance().getMessageById(id);
                     Conversation conv2 = ConversationStore.getInstance().getConversationById(mess.getConversationId());%>
                     <li><b><%= time %>:</b> <%= name %> sent a message in
                     <a href="/chat/<%= conv2.getTitle() %>"> <%= conv2.getTitle() %> </a>: "<%= mess.getContent() %>".</li>

                  <% } %>
                <% } %>
              <% } %>
          </ul>
        </div>
    </div>
</body>
</html>
