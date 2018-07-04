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
<%@ page import="codeu.model.data.StyleText" %>
<%@ page import="codeu.model.data.Message" %>
<%@ page import="codeu.model.store.basic.UserStore" %>
<%
Conversation conversation = (Conversation) request.getAttribute("conversation");
List<Message> messages = (List<Message>) request.getAttribute("messages");
%>

<!DOCTYPE html>
<html>
<head>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <title><%= conversation.getTitle() %></title>
  <title>CodeByter's Chat App</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="/css/main.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

  <style>
    #chat {
      background-color: white;
      height: 500px;
      overflow-y: scroll
    }
  </style>

  <script>
    // scroll the chat div to the bottom
    function scrollChat() {
      var chatDiv = document.getElementById('chat');
      chatDiv.scrollTop = chatDiv.scrollHeight;
    };

    <% if (request.getSession().getAttribute("user") != null) { %>
       var authorLogin = "<%= request.getSession().getAttribute("user")%>";
            $(document).ready(function(){
              $("li.texts").on({
                mouseenter: function(){
                  var author = $(this).find('a').text();
                  if(author == authorLogin) {
                    $(this).css("color", "red");
                    $(this).css("text-decoration", "line-through");
                  }
                },
                mouseleave: function(){
                  var author = $(this).find('a').text();
                  if (author == authorLogin) {
                    $(this).css("color", "#444");
                    $(this).css("text-decoration", "none");
                  }
                },
                click: function(){
                  var author = $(this).find('a').text();
                  if (author == authorLogin) {
                    if(confirm("Are you sure you want to delete this message")){
                      $(this).fadeOut("slow");
                      $.post("", {
                            deletedMessageId: ($(this).attr("value"))
                      });
                    }
                  }
                }
              });
            });
    <% } %>
  </script>
</head>
<body onload="scrollChat()">
  <%@ include file = "/navigations.jsp" %>

  <div id="container">

    <h1><%= conversation.getTitle() %>
        <a href="" style="float: right">&#8635;</a></h1>

    <hr/>

    <div id="chat">
      <ul>
        <% for (Message message : messages) {
          String author = UserStore.getInstance()
              .getUser(message.getAuthorId()).getName(); %>
            <li class="texts" value="<%=message.getId()%>"><strong><a id="author"><%= author %></a>:</strong> <%= StyleText.style(message.getContent()) %></li>
        <% } %>
      </ul>
    </div>

    <hr/>

    <% if (request.getSession().getAttribute("user") != null) { %>
      <form action="/chat/<%= conversation.getTitle() %>" method="POST">
        <input type="text" name="message">
        <br/>
        <br>
        <button type="submit" class="btn">Send</button>
      </form>
    <% } else { %>
      <p><a href="/login">Login</a> to send a message.</p>
    <% } %>

    <hr/>

  </div>

</body>
</html>
