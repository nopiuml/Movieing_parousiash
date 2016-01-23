<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% String username = (String)request.getAttribute("username");
    String image = (String)request.getAttribute("image");
    String avrg_rating = (String)request.getAttribute("avrg_rating");
    String count = (String)request.getAttribute("count");
    String log = (String)request.getAttribute("log");
    String reg = (String)request.getAttribute("reg");

    %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" href="mystyle.css">
<title>American History X</title>
<style type="text/css">
<%@include file="bootstrap.css" %>.
<%@include file="mystyle.css" %>.
ul#nav {margin: -10px 20px -100px 200px;}
ul.drop{font-size:14px;font-family: sans-serif;}
ul.drop a { display:block; color: #fff; font-family: sans-serif; font-size: 12px; text-decoration: none;}
ul.drop li, ul.drop ul { list-style: none; margin: 0; padding: 0;  background: #202022  ; color: #fff;}
ul.drop { position: relative; z-index: 597; float: left; }
ul.drop li { float: left; line-height: 1.3em; vertical-align: middle; zoom: 1; padding: 5px 10px; }
ul.drop li.hover, ul.drop li:hover { position: relative; z-index: 599; cursor: default; background: #707070 ; }
ul.drop ul { visibility: hidden; position: absolute;  left: 0; z-index: 598; width: 195px; background: #555; border: 1px solid #fff; }
ul.drop ul li { float: none; }
ul.drop ul ul { top: -2px; left: 100%; }
ul.drop li:hover > ul { visibility: visible }
</style>
</head>
<title>American History X</title>
</head>
<body>
<div class="container">
<h2>
	<nav class="navbar navbar-inverse" >
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      
      <a class="navbar-brand">Movieing</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
     
      
      <ul class="nav navbar-nav navbar-right">
       
       
          <% if (username==null){ %>
	       <ul id="nav" class="drop">
	       
	      <li>Login<span class="caret"></span>
	    <ul>
	      <li><a href="LoginServlet">Login</a></li>
	      <li><a href="RegisterServlet">Register</a></li>
	     
	        
	        </ul>
	        </li>
	       </ul>
       <%} %>
       
       
        <%if (username != null && log!=null){ %>
        <ul id="nav" class="drop">
         <li><%=username %><span class="caret"></span>
        	<ul>
            <li><a href="RegisteredUserServlet?username_log=<%=username%>&userAccount_log=Your_Account">Your Account</a></li>
            <li class="divider"></li>
            <li><a href="/Movieing/HomePageServlet?username=<%=username%>">Home</a></li>
             <li class="divider"></li>
        	  <li><a href="EditYourUploadServlet?username=<%=username%>&userAccount_log=Your_Account">Edit your Uploads</a></li>
			 <li><a href="EditYourRatingsServlet?username=<%=username%>&userAccount_log=Your_Account">Edit your Ratings</a></li>
			  <li class="divider"></li>   
			 <li><a href="HomePageServlet?logout=true" >Log Out </a></li>
			           
          </ul>
          </li>
          </ul>

          <%} %>
          
          <%if (username != null && reg!=null){ %>
        <ul id="nav" class="drop">
         <li><%=username %><span class="caret"></span>
        	<ul>
            <li><a href="RegisteredUserServlet?username_reg=<%=username%>&userAccount_reg=Your_Account">Your Account</a></li>
            <li class="divider"></li>
            <li><a href="/Movieing/HomePageServlet?username=<%=username%>">Home</a></li>
             <li class="divider"></li>
        	  <li><a href="EditYourUploadServlet?username=<%=username%>&userAccount_reg=Your_Account">Edit your Uploads</a></li>
			 <li><a href="EditYourRatingsServlet?username=<%=username%>&userAccount_reg=Your_Account">Edit your Ratings</a></li>
			  <li class="divider"></li>   
			 <li><a href="HomePageServlet?logout=true" >Log Out </a></li>
			       
          </ul>
          </li>
          </ul>
          <%} %>
          
          <%if (username != null && reg==null && log==null){ %>
          <ul id="nav" class="drop">
       <li><%=username %><span class="caret"></span>
        	<ul>
            <li><a href="AdminServlet?username=<%=username%>">Your Account</a></li>
            <li class="divider"></li>
            <li><a href="/Movieing/HomePageServlet?username=<%=username%>">Home</a></li>
             <li class="divider"></li>
        	<li><a href="EditYourUploadServlet?username=<%=username%>">Edit your Uploads</a></li>
			 <li><a href="EditYourRatingsServlet?username=<%=username%>">Edit your Ratings</a></li>
			 <li><a href="EditUsersUploadServlet?username=<%=username%>">Edit all Uploads</a></li>
			 <li><a href="EditUsersServlet?username=<%=username%>&userAccount_log=Your_Account">Edit Users</a></li>
			  <li class="divider"></li>   
			 <li><a href="HomePageServlet?logout=true" >Log Out </a></li>
			       
          </ul>
          </li>
          </ul>
          <%} %>
          </ul>
          
     </div>
    </div><!-- /.navbar-collapse -->
    </nav>
	</h2>
  </div><!-- /.container-fluid -->
	
<p><div class="movie_titles">American History X<!--<tmpl_var name=Title>--></div></p>
	
<iframe width="520" height="345" src="https://www.youtube.com/embed/UV0VEstvjMM"><!--templates here also-->>Trailer!
</iframe>
<p><div class="p_descr">A former neo-nazi skinhead tries to prevent his younger brother from going down the same wrong path that he did. </div></p>
<p><div class="p_dir">Director: Tony Kaye <!--<tmpl_var name=Director>--></div></p>
<p><div class="p_dir">Year: 1998<!--<tmpl_var name=Year>--> </div></p>
<p><div class="p_dir">Starring: Edward Norton, Edward Furlong, Beverly D'Angelo <!--<TMPL_LOOP NAME=Actors><a href="<TMPL_VAR NAME=URL>"><TMPL_VAR NAME=LINK></a></tmpl_loop>--></div></p>
<p><div class="p_dir">Average rating: <%=avrg_rating %>/5 by <%=count %> users</div></p>

<% if (username!=null && log!=null) {%>
<form name="rate_videos" action="./RegisteredUserServlet" method="Post">
<td><input type="hidden" name="image" value="<%=image%>" /></td>
<p><div class="p_dir">Rating: <input type="radio" name="rate_log" value="1">1
							  <input type="radio" name="rate_log" value="2">2
							  <input type="radio" name="rate_log" value="3">3
							  <input type="radio" name="rate_log" value="4">4
							  <input type="radio" name="rate_log" value="5">5
							  <input type="submit" value="Submit" class="btn btn-default">
	
</form>						  
</div></p>
<%} %>

<% if (username!=null && reg!=null) {%>
<form name="rate_videos" action="./RegisteredUserServlet" method="Post">
<td><input type="hidden" name="image" value="<%=image%>" /></td>
<p><div class="p_dir">Rating: <input type="radio" name="rate_reg" value="1">1
							  <input type="radio" name="rate_reg" value="2">2
							  <input type="radio" name="rate_reg" value="3">3
							  <input type="radio" name="rate_reg" value="4">4
							  <input type="radio" name="rate_reg" value="5">5
							  <input type="submit" value="Submit"class="btn btn-default">
	
</form>						  
</div></p>

<%} %>

<% if (username!=null && reg==null && log==null) {%>
<form name="rate_videos" action="./AdminServlet" method="Post">
<td><input type="hidden" name="image" value="<%=image%>" /></td>
<p><div class="p_dir">Rating: <input type="radio" name="rate" value="1">1
							  <input type="radio" name="rate" value="2">2
							  <input type="radio" name="rate" value="3">3
							  <input type="radio" name="rate" value="4">4
							  <input type="radio" name="rate" value="5">5
							  <input type="submit" value="Submit"class="btn btn-default">
	
</form>						  
</div></p>

<%} %>
<% if (username == null) {%>
<p><div class="p_dir"> Log in or register in order to rate this video! </p></div>
<%} %>
</body>
</html>