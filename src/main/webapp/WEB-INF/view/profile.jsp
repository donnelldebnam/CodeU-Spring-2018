<%--
  Copyright 2017 Google Inc.

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
--%>
<%@ page import="java.util.List" %>
<%@ page import="java.time.Instant" %>
<%@ page import="codeu.model.data.User" %>
<%@ page import="codeu.model.data.Message" %>
<%@ page import="codeu.model.data.Conversation" %>
<%@ page import="codeu.model.store.basic.UserStore" %>
<%@ page import="codeu.model.store.basic.MessageStore" %>
<%@ page import="codeu.model.data.StyleText" %>
<%@ page import="codeu.model.util.Util" %>

<%
User activeUser = (User) request.getAttribute("user");
String profileOwner = (String) request.getAttribute("profileOwner");
List<Message> messagesByUser = (List<Message>) request.getAttribute("messagesByUser");
List<User> users = (List<User>) request.getAttribute("users");
%>

<!DOCTYPE html>
<html>
<head>
  <title>My Profile</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="shortcut icon" type="image/png" href="http://i1067.photobucket.com/albums/u437/donnedebnam1/240_F_109566504_1MfKH89SEmbr4V5bO0H604S0UL08g7uY_zpsa1bnyvyl.png"/>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="/css/main.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
  <style>
    #chat {
      background-color: white;
      height: 500px;
      width: 750px;
      overflow-y: scroll
    }
  </style>

  <script>
    // scroll the chat div to the bottom
    function scrollChat() {
      var chatDiv = document.getElementById('chat');
      chatDiv.scrollTop = chatDiv.scrollHeight;
    };
  </script>

  <%@ include file = "/navigations.jsp" %>

  <div id="container">
    <% if (request.getAttribute("error") != null) { %>
      <h2 style="color:red"><%= request.getAttribute("error") %></h2>
    <% } %>

    <% if (request.getSession().getAttribute("user") != null) { %>

      <h1><%=profileOwner%>'s Profile Page</h1>
      <hr/>
      <strong>About <%=profileOwner%></strong><br>
      <p><%=StyleText.style(activeUser.getAboutMe())%></p>

      <!--
          Only show the editable fields if the logged in user is the
          owner of this profile.
      -->
      <% if (request.getSession().getAttribute("user").equals(profileOwner)) { %>
        <form action="/users/<%=request.getSession().getAttribute("user") %>" method="POST">
          <div class="form-group">
            <label class="form-control-label">Edit Your About Me (Only you can see this):</label>
            <textarea rows="5" cols="75" name="About Me" placeholder="I'm currently a student at..."></textarea>
          </div>
          <button type="submit" class="btn">submit</button>
        </form>
        <hr/>
      <% } %>

      <h1><%=profileOwner%>'s Sent Messages</h1>
      <div id="chat">
        <ul>
          <% for (Message message : messagesByUser) {
            Instant time = message.getCreationTime();
            String creation = Util.FormatDateTime(time);
          %>
            <li><strong><%= creation %>:</strong> <%= StyleText.style(message.getContent()) %></li>
          <% } %>
        </ul>
      </div>
      <hr/>
    <% } %>

    <h1>Profile pages with "hashtag"</h1>
    <ul>
      <% for (User user: users) { %>
        <% if (user.getAboutMe().toLowerCase().contains("hashtag")) { %>
            <li><a href="/users/<%= user.getName() %>">
            <%= user.getName() %>: <%= user.getAboutMe()%></a></li>
        <% } %>
      <% } %>
    </ul>
  </div>
</body>
</html>
