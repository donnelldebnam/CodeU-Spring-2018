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
<title>CodeByters' Chat App</title>
<%@ include file = "/header.jsp" %>
<body>
<style>
  html {
    zoom:80%;
  }
</style>

  <%@ include file = "/navigations.jsp" %>

  <!-- Slider Begins -->
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
      <li data-target"#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target"#myCarousel" data-slide-to="1"></li>
    </ol>
    <div class="carousel-inner" role="listbox">
      <div class="item active">
      <img src="https://s8.postimg.cc/smm1v5ow5/imageedit_15_5939279351.jpg" style="width: 100%;">
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
        <% if (request.getSession().getAttribute("user") == null) { %>
          <br>
          <form>
            <button type="button" class="btn btn-default"><a href="/login">Get Started</a></button>
          </form>
        <% } %>
      </div>
      </div> <!-- End Active-->
      <div class="item">
        <img src="https://u.imageresize.org/v2/e5a1c204-c371-4bdf-ac5c-8b30a1c9dbce.jpeg" style="width:100%;">
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

  <div class="mid-home" align="center">
    <h2 style="font-size:4vw;" >We offer next-level <b>instant messaging,<b></h2>
    <h3 style="font-size:2vw;" >making connecting with the world, 10x easier.</h3>
  </div>

  <!-- Footer begins here-->
  <footer class="container-fluid text-center">
    <div class="row">
      <div class="footer"align="center">
        <a href="https://github.com/donnelldebnam/CodeU-Spring-2018-29" class="fa fa-github" style="scale:100px;"></a>
        <p>CodeByters &bull; Google CodeU 2018</p>
      </div>

    </div>
    </div>
  </footer>

</body>
</html>
