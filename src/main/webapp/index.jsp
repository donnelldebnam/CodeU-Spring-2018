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
<!DOCTYPE html>
<html>
<head>
  <title>CodeByter's Chat App</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

  <style>
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
      border: 0;
    }
    .navbar-brand {
    float: left;
    min-height: 55px;
    padding: 0 15px 5px;
    }
    .navbar-inverse .navbar-nav .active a, .navbar-inverse .navbar-nav .active a:focus,
      .navbar-inverse .navbar-nav .active a:hover {
    color: #FFF;
    }
    .navbar-inverse .navbat-nav li a {
      color: #D5D5D5;
    }

    body {
      margin: 0;
      font-family: Futura;
      line-height: 1.6;
      font-size: 18px;
      line-height: 1.6;
      color: #444;
      background-color: #eeeeee;
    }
    nav a {
      color: white;
      display: inline-block;
      font-size: 24px;
      margin: 15px;
      text-decoration: none;
    }
    #navTitle {
      font-size: 36px;
    }
    #container {
      margin-left: auto;
      margin-right: auto;
      width: 800px;
    }
    h1 {
      color: #757575;
    }
    input {
      font-size: 18px;
    }
    button {
      font-size: 18px;
    }
  </style>

</head>
<body>

  <nav class="navbar navbar-inverse">

    <div class="container-fluid">

      <div class="navbar-header">

        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=#myNavbar>

          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>

        </button>

        <a class="navbar-brand"><img src="https://i.pinimg.com/originals/1e/00/78/1e0078f8266738d005b5fc7d00f9a66e.png" style="width: 10%;"></a>
      </div>
      <div class="collapse navbar-collapse" id="myNavbar">
        <ul class="nav navbar-nav navbar-right">
          <nav>
              <%@ include file = "/navigations.jsp" %>
          </nav>
        </ul>
      </div>
    </div>

  </nav>

  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
      <li data-target"#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target"#myCarousel" data-slide-to="1"></li>
    </ol>
    <div class="carousel-inner" role="listbox">
      <div class="item active">
      <img src="https://fthmb.tqn.com/K7c6vYrioSIVmGUnuHXF6sDybks=/960x0/filters:no_upscale():max_bytes(150000):strip_icc()/how-to-visit-the-googleplex-google-hq-mountain-view-57e2d4515f9b586c3529ba9c.jpg" style="width: 100%;">
      <div class="carousel-caption">
        <ul>
          <% if (request.getSession().getAttribute("user") != null) { %>
            <li>Go to the <a href="/users/<%= request.getSession().getAttribute("user") %>">
                My profile</a> page to view your profile.</li>
          <% } else { %>
            <li><a href="/login">Login</a> to get started.</li>
          <% } %>
          <li>Go to the <a href="/conversations">conversations</a> page to
              create or join a conversation.</li>
          <li>View the <a href="/about.jsp">about</a> page to learn more about the
              project.</li>
          <li>If you are an administrator, check out the <a href="/admin">Admin Page</a>.</li>
        </ul>
        <br>
        <button type="button" class="btn btn-default">Get Started</button>
      </div>
      </div> <!-- End Active-->
      <div class="item">
        <img src="http://zeusmedina.com/images/codeu.JPG" style="width:100%;">
      </div>
    </div>
    <!-- Start Slider Controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div> <!-- End Slider -->
</body>
</html>
