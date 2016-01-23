<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% String username = (String) request.getAttribute("username");
       String justRegistered = (String) request.getAttribute("RegisterServlet");
       String logged_in = (String) request.getAttribute("logged_in");
       String this_is_admin = (String) request.getAttribute("this_is_admin");
       String[] movies = (String[]) request.getAttribute("movies");
	   String[] uploaded_by= (String[]) request.getAttribute("uploaded_by");
      %>

<html>
<title>Movieing</title>
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
<body onload="refresh()">
<script language=" JavaScript" >
</script>
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
       <% if (username == null){ %>
	       <ul id="nav" class="drop">
	       
	      <li>Login<span class="caret"></span>
	    <ul>
	      <li><a href="LoginServlet">Login</a></li>
	      <li><a href="RegisterServlet">Register</a></li>
	     
	        
	        </ul>
	       </ul>
       <%} %>
       
          <%if (username != null && logged_in=="true"){ %>
       <ul id="nav" class="drop">
         <li><%=username %><span class="caret"></span>
        	<ul>
            <li><a href="RegisteredUserServlet?username_log=<%=username%>&userAccount_log=Your_Account">Your Account</a></li>
             <li class="divider"></li>
        	  <li><a href="EditYourUploadServlet?username=<%=username%>&userAccount_log=Your_Account">Edit your Uploads</a></li>
			 <li><a href="EditYourRatingsServlet?username=<%=username%>&userAccount_log=Your_Account">Edit your Ratings</a></li>
			  <li class="divider"></li>   
			 <li><a href="HomePageServlet?logout=true" >Log Out </a></li>
			           
          </ul>
          </li>
          </ul>

          <%} %>
          
          
         <%if (username != null && justRegistered=="true"){ %>
       <ul id="nav" class="drop">
         <li><%=username %><span class="caret"></span>
        	<ul>
            <li><a href="RegisteredUserServlet?username_reg=<%=username%>&userAccount_reg=Your_Account">Your Account</a></li>
             <li class="divider"></li>
        	  <li><a href="EditYourUploadServlet?username=<%=username%>&userAccount_reg=Your_Account">Edit your Uploads</a></li>
			 <li><a href="EditYourRatingsServlet?username=<%=username%>&userAccount_reg=Your_Account">Edit your Ratings</a></li>
			  <li class="divider"></li>   
			 <li><a href="HomePageServlet?logout=true" >Log Out </a></li>
			           
          </ul>
          </li>
          </ul>

          <%} %>
          
          <%if (username!=null && this_is_admin=="true"){ %>
      <ul id="nav" class="drop">
         <li><%=username %><span class="caret"></span>
        	<ul>
            <li><a href="AdminServlet?username=<%=username%>">Your Account</a></li>
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


	
<% if (username != null) {%>
<div class="p_dir"><p> Welcome to the Movieng <%=username%> </p></div>
<%} %>
<% if (username == null) { %>
<div class="p_dir"><p>Welcome to the Movieng </p></div>
<%}%>
<br>
<br>
<br>
<div class="p_dir"><p>Recent movies!</p></div>

<% if (username!= null && this_is_admin == "true") {%>
<div class="navbar1 navbar-inverse1">

 <table>
  <tr>
  <td>
<a href="AmericanHistoryXServlet?admin=yes&username=<%=username%>&image=http://www.kar.org.gr/wp-content/uploads/2013/06/american_history_x.jpg" target="_blank" style ="color:white;font-size:18px;padding-right: 25px;"><img width="250" height="373" src="http://www.kar.org.gr/wp-content/uploads/2013/06/american_history_x.jpg"></a></td>
<td><a href="GravityServlet?admin=yes&username=<%=username%>&image=http://upload.wikimedia.org/wikipedia/el/8/84/Gravity_film.jpg" target="_blank" style ="color:white;font-size:18px;padding-right: 25px;"><img width="250" height="373" src="http://upload.wikimedia.org/wikipedia/el/8/84/Gravity_film.jpg"></a></td>
<td><a href="TwelveYearsSlave?admin=yes&username=<%=username%>&image=http://www.trespassmag.com/wp-content/uploads/2014/01/12-Years-a-Slave-poster.jpg" target="_blank" style ="color:white;font-size:18px;padding-right: 25px;"><img width="250" height="373" src="http://www.trespassmag.com/wp-content/uploads/2014/01/12-Years-a-Slave-poster.jpg"></a></td>
</tr>
</table>
</div>
<%} %>
<% if (username != null && justRegistered =="true" ) {%>
<div class="navbar1 navbar-inverse1">

 <table>
  <tr>
  <td>
<a href="AmericanHistoryXServlet?reg=reg&username=<%=username%>&image=http://www.kar.org.gr/wp-content/uploads/2013/06/american_history_x.jpg" target="_blank" style ="color:white;font-size:18px;padding-right: 25px;"><img width="250" height="373" src="http://www.kar.org.gr/wp-content/uploads/2013/06/american_history_x.jpg"></a></td>
<td><a href="GravityServlet?reg=reg&username=<%=username%>&image=http://upload.wikimedia.org/wikipedia/el/8/84/Gravity_film.jpg" target="_blank" style ="color:white;font-size:18px;padding-right: 25px;"><img width="250" height="373" src="http://upload.wikimedia.org/wikipedia/el/8/84/Gravity_film.jpg"></a></td>
<td><a href="TwelveYearsSlave?reg=reg&username=<%=username%>&image=http://www.trespassmag.com/wp-content/uploads/2014/01/12-Years-a-Slave-poster.jpg" target="_blank" style ="color:white;font-size:18px;padding-right: 25px;"><img width="250" height="373" src="http://www.trespassmag.com/wp-content/uploads/2014/01/12-Years-a-Slave-poster.jpg"></a></td>
</tr>
</table>
</div>
<%} %>
<% if (username != null && logged_in =="true" ) {%>
<div class="navbar1 navbar-inverse1">

 <table>
  <tr>
  <td>
<a href="AmericanHistoryXServlet?log=log&username=<%=username%>&image=http://www.kar.org.gr/wp-content/uploads/2013/06/american_history_x.jpg" target="_blank" style ="color:white;font-size:18px;padding-right: 25px;"><img width="250" height="373" src="http://www.kar.org.gr/wp-content/uploads/2013/06/american_history_x.jpg"></a></td>
<td><a href="GravityServlet?log=log&username=<%=username%>&image=http://upload.wikimedia.org/wikipedia/el/8/84/Gravity_film.jpg" target="_blank" style ="color:white;font-size:18px;padding-right: 25px;"><img width="250" height="373" src="http://upload.wikimedia.org/wikipedia/el/8/84/Gravity_film.jpg"></a></td>
<td><a href="TwelveYearsSlave?log=log&username=<%=username%>&image=http://www.trespassmag.com/wp-content/uploads/2014/01/12-Years-a-Slave-poster.jpg" target="_blank" style ="color:white;font-size:18px;padding-right: 25px;"><img width="250" height="373" src="http://www.trespassmag.com/wp-content/uploads/2014/01/12-Years-a-Slave-poster.jpg"></a></td>
</tr>
</table>
</div>
<%} %>
<% if (username == null) {%>
<div class="navbar1 navbar-inverse1">

 <table>
  <tr>
  <td>
<a href="AmericanHistoryXServlet?image=http://www.kar.org.gr/wp-content/uploads/2013/06/american_history_x.jpg" target="_blank" style ="color:white;font-size:18px;padding-right: 25px;"><img width="250" height="373" src="http://www.kar.org.gr/wp-content/uploads/2013/06/american_history_x.jpg"></a></td>
<td><a href="GravityServlet?image=http://upload.wikimedia.org/wikipedia/el/8/84/Gravity_film.jpg" target="_blank" style ="color:white;font-size:18px;padding-right: 25px;"><img width="250" height="373" src="http://upload.wikimedia.org/wikipedia/el/8/84/Gravity_film.jpg"></a></td>
<td><a href="TwelveYearsSlave?image=http://www.trespassmag.com/wp-content/uploads/2014/01/12-Years-a-Slave-poster.jpg" target="_blank" style ="color:white;font-size:18px;padding-right: 25px;"><img width="250" height="373" src="http://www.trespassmag.com/wp-content/uploads/2014/01/12-Years-a-Slave-poster.jpg"></a></td>
</tr>
</table>
</div>
<%} %>


<br><br>
	<div class="p_dir"><p> Uploaded videos! </p></div>
	<div class="navbar1 navbar-inverse1">
	<table>
  <tr> 
		<% for(int i = 0; i < movies.length; i++){  %>
	 	<%	if (movies[i]!=""){ %>
	 <td><iframe width="420" height="345" src="<%=movies[i] %>"></iframe>
	 
	 <p style = "color:white">uploaded by <%=uploaded_by[i] %></p>
	</td>
<% }%>
<%} %>
</tr>
</table>
</div>
</body>
</html>