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
<%@ page import="codeu.controller.AdminServlet" %>
<!DOCTYPE html>
<html>
<head>
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
    <div
      style="width:75%; margin-left:auto; margin-right:auto; margin-top: 50px;">

      <h1>Administration</h1>
      <p>
        This is the administration page of the CodeU Chat App. Only the administrators of the site can view stats. (Enjoy the authority!)
      </p>

      <h2><strong>Site Statistics</strong></h2>
      <ul>
        <li><strong>Total Users: </strong><%= request.getAttribute("totalUsers")%></li>
        <li><strong>Total Conversations: </strong><%= request.getAttribute("totalConversations")%></li>
        <li><strong>Total Messages: </strong><%= request.getAttribute("totalMessages")%></li>
        <li><strong>Most Active User:</strong><%= request.getAttribute("mostActive")%></li>
        <li><strong>Newest User:</strong><%= request.getAttribute("newestUser")%></li>
        <li><strong>Wordiest User:</strong><%= request.getAttribute("wordiestUser")%></li>
      </ul>

    </div>
  </div>
</body>
</html>
