<%@ page import="java.util.List" %>
<%@ page import="codeu.model.data.Activity" %>
<%@ page import="codeu.model.data.Conversation" %>
<%@ page import="codeu.model.data.Message" %>
<%@ page import="codeu.model.data.Action" %>
<%@ page import="codeu.model.data.StyleText" %>
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
<title>Activity Feed</title>
<%@ include file = "/header.jsp" %>

  <style>
    #activityfeed {
      background-color: white;
      height: 500px;
      overflow-y: scroll
    }
    html {
      zoom:80%;
    }
    .texts {
      font-size:20px;
    }
  </style>

</head>

<body>
  <%@ include file = "/navigations.jsp" %>

    <div class="container">
      <% if (request.getAttribute("admin") != null) { %>
          <h2 style="color:green"><%= request.getAttribute("admin") %></h2>
      <% } %>
      <%@ include file = "/activityList.jsp" %>
    </div>
</body>
</html>
