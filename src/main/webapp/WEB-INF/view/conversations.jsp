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
<%@ page import="codeu.model.data.Conversation" %>
<%
List<Conversation> conversations = (List<Conversation>) request.getAttribute("conversations");
%>

<!DOCTYPE html>
<html>
<head>
  <title>Conversations</title>
  <title>CodeByter's Chat App</title>
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
    html {
      zoom:80%;
    }
  </style>
  
  <%@ include file = "/navigations.jsp" %>

  <div id="container">

    <% if (request.getAttribute("error") != null) { %>
      <h2 style="color:red"><%= request.getAttribute("error") %></h2>
    <% } %>

    <% if (request.getSession().getAttribute("user") != null) { %>
      <h1>New Conversation</h1>
      <form action="/conversations" method="POST">
        <div class="form-group">
          <label class="form-control-label">Title:</label>
          <input type="text" name="conversationTitle">
        </div>

        <button type="submit" class="btn">Create</button>
      </form>

      <hr/>
    <% } %>

    <h1>Conversations</h1>

    <% if (conversations == null || conversations.isEmpty()) { %>
      <p>Create a conversation to get started.</p>
    <% } else { %>
      <ul class="mdl-list">
        <% for (Conversation conversation : conversations) { %>
          <li><a href="/chat/<%= conversation.getTitle() %>">
              <%= conversation.getTitle() %></a></li>
        <% } %>
      </ul>
    <% } %>
    <hr/>

    <h1>Hashtag Conversations</h1>
    <% if (conversations == null || conversations.isEmpty()) { %>
      <p>Create a Hashtag conversation to get started.</p>
    <% } else { %>
      <ul class="mdl-list">
        <% for (Conversation conversation : conversations) { %>
        <% if (conversation.getTitle().toLowerCase().contains("hashtag")){ %>
        	<li><a href="/chat/<%= conversation.getTitle() %>">
              <%= conversation.getTitle() %></a></li>
        <% } %>

        <% } %>
      </ul>
    <% } %>


  </div>
</body>
</html>
