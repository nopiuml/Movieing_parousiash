<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%  String username = (String)request.getAttribute("username");
	%>


<html>
<head>
<title>Your Profile</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
<%@include file="bootstrap.css" %>.
<%@include file="mystyle.css" %>.
ul#nav {margin: -10px 20px -100px 200px;}
ul.drop{font-size:14px;font-family: sans-serif; position:fixed;}
ul.drop a { display:block; color: #fff; font-family: sans-serif; font-size: 12px; text-decoration: none; }
ul.drop li, ul.drop ul { list-style: none; margin: 0; padding: 0;  background: #202022  ; color: #fff; }
ul.drop { position: relative; z-index: 597; float: left; }
ul.drop li { float: left; line-height: 1.3em; vertical-align: middle; zoom: 1; padding: 5px 10px;}
ul.drop li.hover, ul.drop li:hover { position: relative; z-index: 599; cursor: default; background: #707070 ; }
ul.drop ul { visibility: hidden; position: absolute;  left: 0; z-index: 598; width: 195px; background: #555; border: 1px solid #fff; }
ul.drop ul li { float: none; }
ul.drop ul ul { top: -2px; left: 100%; }
ul.drop li:hover > ul { visibility: visible }

</style>
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
          
       </ul>
     </div>
    </div><!-- /.navbar-collapse -->
    </nav>
	</h2>
  </div><!-- /.container-fluid -->
			
<div class="user_titles"><p>Welcome to your Profile <%=username %>!</p></div>

<br>
<div style="text-align:right;">
<div class="quick_links"><p><b>Quick Links</b></p></div>
<div class="navbar1 navbar-inverse2">
<br>
<br>
<a href="MakeAnUploadServlet?username=<%=username%>" target="_blank" style ="color:white;font-size:18px;position: relative;top:-14px;right:27px;"><b>Upload a trailer</b></a>
<br>
<br>
<a href="EditYourRatingsServlet?username=<%=username%>" target="_blank" style ="color:white;font-size:18px;position: relative;top:-14px;right:17px;"><b>Edit Your Ratings</b></a>
<br>
<br>
<a href="EditYourUploadServlet?username=<%=username%>" target="_blank" style ="color:white;font-size:18px;position: relative;top:-14px;right:20px;"><b>Edit Your Upload</b></a>
<br>
<br>
<a href="EditUsersUploadServlet?username=<%=username%>" target="_blank" style ="color:white;font-size:18px;position: relative;top:-14px;right:15px;"><b>Edit Users Upload</b></a>
<br>
<br>
<a href="EditUsersServlet?username=<%=username%>" target="_blank" style ="color:white;font-size:18px;padding-right: 47px;position: relative;top:-15px;right:8px;"><b>Edit Users</b></a>
</div>
</div>

<div class="user_titles"><p>Your Uploads</p></div>
<div class="navbar1 navbar-inverse1">

 <table>
  <tr>
  
 
 <% String[] movie = (String[]) request.getAttribute("movie");
   	for(int i = 0; i < movie.length; i++){  %>  
 	<%	if (movie[i]!=""){ %>
		    <td>
			<object width="425" height="349"  data="<%=movie[i]%>">
		         <param name="movie" value="<%=movie[i]%>"/>
		    </object> 
		    </td>
	<% }%>
	<%}%>	    
<td>
</tr>
</table>

</div>
<br><br>

<div class="user_titles"><p>Your Ratings</p></div>
<div class="navbar1 navbar-inverse1">

 <table>
  <tr>
  
 
 <% String[] ratings = (String[]) request.getAttribute("ratings");
   	for(int i = 0; i < ratings.length; i++){  %>  
 	<%	if (ratings[i]!=""){ %>
		    <td>
			<img width="425" height="349" src="<%=ratings[i]%>">
		    </td>
	<% }%>
	<%}%>	    
<td>
</tr>
</table>

</div>
<br><br>


<div class="user_titles"><p>All Uploads of Movieing</p></div>
<div class="navbar1 navbar-inverse1">

 <table>
  <tr>
  
 
 <% String[] all_movies = (String[]) request.getAttribute("all_movies");
 for(int i = 0; i < all_movies.length; i++){  %>  
 	<%	if (all_movies[i]!=""){ %>
		    <td>
			<object width="425" height="349"  data="<%=all_movies[i]%>">
		         <param name="movie" value="<%=all_movies[i]%>"/>
		    </object> 
		    </td>
	<% }%>
	<%}%>	    
<td>
</tr>
</table>

</div>
 

<br><br>
<div class="user_titles"><p>Users of Movieing</p></div>
<div class="navbar1 navbar-inverse1">

<table>
  <tr>
 <% String[] users = (String[]) request.getAttribute("all_users");
 	for(int i = 0; i < users.length; i++){  %> 
 	<%	if (users[i]!=""){ %>
 			<tr>
		    <td>
		    <ul style="color:white;">
				<li><%=users[i]%></li><br>
			</ul>
		    </td>
		    </tr>
		    
    <% } %>
    <% } %>
  </table>
  </tr>
</div>
</body>
</html>