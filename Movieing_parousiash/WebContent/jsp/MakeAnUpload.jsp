<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%  String username_reg = (String)request.getAttribute("username");
    String username_log = (String)request.getAttribute("username");
    String username = (String)request.getAttribute("username");
	String userAccount_reg = (String) request.getAttribute("userAccount_reg");
	String userAccount_log = (String) request.getAttribute("userAccount_log");%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<% if( username_log != null) { %>
<title>Make an upload <%=username_log %></title>
<%} 
 else if (username_reg != null) {%>
 <title>Make an upload <%=username_reg %></title>
<%}
 else if (username.equals("admin")) {%>
  <title>Make an upload <%=username%></title>
<%} %>
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
<body>
<div class="container">
<h2>
	<nav class="navbar navbar-inverse" >
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      
      <div class="navbar-brand" >Movieing</div>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
     
     
      <ul class="nav navbar-nav navbar-right">
       
       
       <%if (userAccount_log!=null){ %>
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
          
          
         <%if (userAccount_reg!=null){ %>
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
          
          <%if (username.equals("admin")){ %>
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
			 <li><a href="EditUsersServlet?username=<%=username%>">Edit Users</a></li>
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

<div style="text-align:left"> 


<% if( username_log != null) { %>
<div class="user_titles"><p>Make an upload <%=username_log %>!</p></div>
<%} 
 else if (username_reg != null) {%>
<div class="user_titles"><p>Make an upload <%=username_reg %>!</p></div>
<%} 
else if (username == "admin"){%>
<div class="user_titles"><p>Make an upload <%=username%>!</p></div>
<%} %>

<% if (userAccount_reg != null){ %>
<form  name="upload_video" align="middle" style="font-size:20px;" action = "./RegisteredUserServlet" method="post">
	<input type="hidden" name="upload_video_reg" value="upload_video" class="btn btn-default"/>
		
	Add Link : <input type="text" name="link" style="margin-right:65px"><br><br>
	<br>

	<input align="middle" type="submit" value="OK" class="btn btn-default">
	</form>
	<%} %>

<% if  (userAccount_log != null){ %>
	<form  name="upload_video" align="middle" style="font-size:20px;" action = "./RegisteredUserServlet" method="post">
	<input type="hidden" name="upload_video" value="upload_video" />
		
	Add Link : <input type="text" name="link" style="margin-right:65px"><br><br>
	<br>

	
	<input align="middle" type="submit" value="OK" class="btn btn-default"> 
	</form>	
<% }

	if  (username.equals("admin")){ %>
	<form  name="upload_video" align="middle" style="font-size:20px;" action = "./AdminServlet" method="post">
	<input type="hidden" name="upload_video" value="upload_video" />
		
	Add Link : <input type="text" name="link" style="margin-right:65px"><br><br>
	<br>

	
	
	<input align="middle" type="submit" value="OK" class="btn btn-default">
	</form>	

<%} %>
	
</div>
<br><br>

</body>
</html>