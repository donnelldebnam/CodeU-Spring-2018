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
    .carousel-caption {
      top: 50%;
      transform: translateY(-50%);
    }
    .btn {
      font-size: 18px;
      color: #FFF;
      padding: 12px 22px;
      background: #46b9e2;
      border: 2px solid #FFF;
    }

    @media (max-width: 600px) {
      .carousel-caption {
        display: none;
      }
    }

    ul {
      list-style-type: none;
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
            <a>Home</a>
            <a>Conversations</a>
            <a>ActivityFeed</a>
            <a>Login</a>
            <a>Logout</a>
            <a>About Us</a>
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
      <img src="http://zeusmedina.com/images/codeu.JPG" style="width: 100%;">
      <div class="carousel-caption">
        <ul>
          <li>Go to the <a>My profile</a> page to view your profile.</li>
          <li><a>Login</a> to get started.</li>
          <li>Go to the <a>conversations</a> page to create or join a conversation.</li>
          <li>View the <a>about</a> page to learn more about the project.</li>
          <li>If you are an administrator, check out the <a>Admin Page</a>.</li>
        </ul>
        <br>
        <button type="button" class="btn btn-default">Get Started</button>
      </div>
      </div> <!-- End Active-->
      <div class="item">
        <img src="https://fthmb.tqn.com/K7c6vYrioSIVmGUnuHXF6sDybks=/960x0/filters:no_upscale():max_bytes(150000):strip_icc()/how-to-visit-the-googleplex-google-hq-mountain-view-57e2d4515f9b586c3529ba9c.jpg" style="width:100%;">
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

  <div class="container">

    <!-- Jaiyi Wang -->
    <div class"row">
      <div class="col-md-6">
        <strong><h3>Jaiyi Wang – Virginia Tech</h3></strong>
        <p>
          Jaiyi is a driven, third year, Computer Science student at Virginia Tech in Blacksburg, VA!
        </p>
      </div>
      <div class="col-md-6">
        <img src="https://www199.lunapic.com/do-not-link-here-use-hosting-instead/153065634829449892?5908631557" style="height:300px;" class="img-responsive">
      </div>
    </div>

    <!-- Donnell Debnam -->
    <div class"row">
      <div class="col-md-6">
        <strong><h3>Donnell Debnam Jr – Hampton University</h3></strong>
        <p>
          Donnell is a second year, Computer Science/Cybersecurity student currently attending Hampton University.
          He is a highly motivated and resilient student, experienced in both web and mobile development, and has a keen interest in Arduino Robotics, AI/NLP, and forensics.
        </p>
      </div>
      <div class="col-md-6">
        <img src="https://www199.lunapic.com/do-not-link-here-use-hosting-instead/153065634829449892?739118368" style="height:300px;" class="img-responsive">
      </div>
    </div>

    <!-- Saroj Bhatta-->
    <div class"row">
      <div class="col-md-6">
        <strong><h3>Saroj Bhatta – Claflin University</h3></strong>
        <p>
          Saroj is a bright, second year, Computer Science student at Claflin University in Orangeburg, SC.
        </p>
      </div>
      <div class="col-md-6">
        <img src="https://www199.lunapic.com/do-not-link-here-use-hosting-instead/153065634829449892?1253405516" style="height:300px;" class="img-responsive">
      </div>
    </div>

    <!-- Anthony Ngonma-->
    <div class"row">
      <div class="col-md-6">
        <strong><h3>Anthony Ngoma – Cornell University</h3></strong>
        <p>
          Anthony is a rising second year Computer Science student currently attending the illustrious Cornell University located in Ithica, NY.
        </p>
      </div>
      <div class="col-md-6">
        <img src="https://www199.lunapic.com/do-not-link-here-use-hosting-instead/153065634829449892?15354640" style="height:300px;" class="img-responsive">
      </div>
    </div>

  </div>
</body>
</html>
