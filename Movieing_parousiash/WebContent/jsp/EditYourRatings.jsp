<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%  String username = (String)request.getAttribute("username");
	String userAccount_reg = (String) request.getAttribute("userAccount_reg");
	String userAccount_log = (String) request.getAttribute("userAccount_log");%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit Your Ratings</title>
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
<div class="user_titles"><p>Edit your ratings here <%=username %>!</p></div>
<table>
   <% if  (userAccount_log != null){ %>
 
 <% String[] ratings = (String[]) request.getAttribute("ratings");
   	for(int i = 0; i < ratings.length; i++){  %>  
 	<%	if (ratings[i]!=""){ %>
 			<tr>
		    <td>
			<img width="425" height="349" src="<%=ratings[i]%>">
		    </td>
		    <form name = "delete_rating" action="./RegisteredUserServlet" method="post"> 
			<td><input type="hidden" name="delete_rating_log" value="<%=ratings[i]%>" /></td>
			<td><input align="middle" type="submit" value="Delete this rating" class="btn btn-default"></td> 
			</form>
			</tr>
		     
    <% } %>
    <% } %>
    <% }%>
</table>
<table>
  <% if (userAccount_reg != null){
	 String[] ratings = (String[]) request.getAttribute("ratings");
   	for(int i = 0; i < ratings.length; i++){  
    		if (ratings[i]!=""){ %>
    			<tr>
    			<td>
			<img width="425" height="349" src="<%=ratings[i]%>">
		    </td>
    		    <form name = "delete_rating" action="./RegisteredUserServlet" method="post"> 
				<td><input type="hidden" name="delete_rating_reg" value="<%=ratings[i]%>" /></td>
				<td><input align="middle" type="submit" value="Delete this rating" class="btn btn-default"></td> 
			 	</form> 
			 	</tr>
    <% } %>
    <% } %>
    <% } %>

</table>

<table>
  <% if (username.equals("admin")){
	 String[] ratings = (String[]) request.getAttribute("ratings");
   	for(int i = 0; i < ratings.length; i++){  
    		if (ratings[i]!=""){ %>
    			<tr>
    			<td>
			<img width="425" height="349" src="<%=ratings[i]%>">
		    </td>
    		    <form name = "delete_rating" action="./AdminServlet" method="post"> 
				<td><input type="hidden" name="delete_rating" value="<%=ratings[i]%>" /></td>
				<td><input align="middle" type="submit" value="Delete this rating" class="btn btn-default"></td> 
			 	</form> 
			 	</tr>
    <% } %>
    <% } %>
    <% } %>

</table>


</body>
</html>