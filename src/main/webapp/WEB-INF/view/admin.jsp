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
    <title>Admin Page</title>
    <%@ include file = "/header.jsp" %>
    <style>
      #activityfeed {
        background-color: white;
        height: 380px;
        overflow-y: scroll;
      }
      #backContainer {
        background-color: white;
        height: 500px;
      }
      html {
        zoom:80%;
      }
      .texts {
        font-size:20px;
      }
      #left{
        float:left; 
        margin-right:auto; 
        margin-left:auto;
        border-right-style: double;
        border-right-width: 10px;
        border-right-color: #1a718c;
        padding-right: 150px;"
      }
    </style>

  </head>
<body>
  <%@ include file = "/navigations.jsp" %>
  <div class="container-fluid">
    <div style= "text-align: center; color: #1b708b;">
      <h1>Administration</h1>
      <p>
        This is the administration page of the CodeU Chat App. Only the administrators
        of the site can view stats. (Enjoy the authority!)
      </p>
    </div>
    <div style="display:flex" id="backContainer">
      <div id ="left">
        <h1>Site Stats</h1>
        <h3> This is the statistics of all the activities! </h3>
        <ul>
          <li class="texts"><b>Total Users: </b><%= request.getAttribute("totalUsers")%></li>
          <li class="texts"><b>Total Conversations: </b><%= request.getAttribute("totalConversations")%></li>
          <li class="texts"><b>Total Messages: </b><%= request.getAttribute("totalMessages")%></li>
          <li class="texts"><b>Most Active User: </b><%= request.getAttribute("mostActive")%></li>
          <li class="texts"><b>Newest User: </b><%= request.getAttribute("newestUser")%></li>
          <li class="texts"><b>Wordiest User: </b><%= request.getAttribute("wordiestUser")%></li>
        </ul>
      </div>
      <div style="float:right; margin-left:10px;margin-right:auto;">
        <%@ include file = "/activityList.jsp" %>
      </div>
    </div>
  </div>
</body>
</html>
