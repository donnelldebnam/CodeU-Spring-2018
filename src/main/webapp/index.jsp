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
  <link rel="stylesheet" href="/css/main.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

  <%@ include file = "/navigations.jsp" %>

  <!-- Slider Begins -->
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
      <li data-target"#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target"#myCarousel" data-slide-to="1"></li>
    </ol>
    <div class="carousel-inner" role="listbox">
      <div class="item active">
      <img src="http://zeusmedina.com/images/codeu.JPG" style="width: 100%;">
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
        <form>
          <button type="button" class="btn btn-default"><a href="/login">Get Started</a></button>
        </form>
      </div>
      </div> <!-- End Active-->
      <div class="item">
        <img src="https://swimcreative.com/wp-content/uploads/2016/09/20160825_100619-1.jpg" style="width:100%;">
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
  </div>
  <!-- Ends Slider -->

  <div class="container text-center">
    <h1>Meet the CodeByters!</h1>
  </div>
  <div class="container">
    <!-- Jaiyi Wang -->
    <div class"row">
      <div class="col-md-6">
        <br>
        <br>
        <strong><h3>Jaiyi Wang - Virginia Tech</h3></strong>
        <p>
          Jaiyi is a driven, third year, Computer Science student at Virginia Tech in Blacksburg, VA!
        </p>
      </div>
      <div class="col-md-6">
        <br>
        <img src="http://i1067.photobucket.com/albums/u437/donnedebnam1/imageedit_12_8988254368_zpssfyxzbsx.gif" style="height:300px;" class="img-responsive">
          <br>
      </div>
    </div>

    <!-- Donnell Debnam -->
    <div class"row">
      <div class="col-md-6">
        <br>
        <strong><h3>Donnell Debnam Jr - Hampton University</h3></strong>
        <p>
          Donnell is a second year, Computer Science/Cybersecurity student currently attending Hampton University.
          He is a highly motivated and resilient student, experienced in both web and mobile development, and has a keen interest in Arduino Robotics, AI/NLP, and forensics.
        </p>
      </div>
      <div class="col-md-6">

        <img src="http://i1067.photobucket.com/albums/u437/donnedebnam1/mypic1_zps8po8o6ss.gif" style="height:300px;" class="img-responsive">
        <br>
      </div>
    </div>

    <!-- Saroj Bhatta-->
    <div class"row">
      <div class="col-md-6">
        <br>
        <strong><h3>Saroj Bhatta - Claflin University</h3></strong>
        <p>
          Saroj is a bright, second year, Computer Science student at Claflin University in Orangeburg, SC.
        </p>
      </div>
      <div class="col-md-6">
        <img src="http://i1067.photobucket.com/albums/u437/donnedebnam1/imageedit_7_2530905731_zpshmm3ddnp.gif" style="height:300px;" class="img-responsive">
        <br>
      </div>
    </div>

    <!-- Anthony Ngonma-->
    <div class"row">
      <div class="col-md-6">
        <br>
        <strong><h3>Anthony Ngoma - Cornell University</h3></strong>
        <p>
          Anthony is a second year Computer Science student currently attending the illustrious Cornell University located in Ithica, NY.
        </p>
      </div>
      <div class="col-md-6">
        <img src="http://i1067.photobucket.com/albums/u437/donnedebnam1/imageedit_5_4636194873_zpshlrdd0aj.gif" style="height:300px;" class="img-responsive">
        <br>
      </div>
    </div>

  </div>
</body>
</html>
