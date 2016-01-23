
<html>
<title>Log In!</title>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
<%@include file="bootstrap.css" %>.
<%@include file="mystyle.css" %>.
</style>
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
     
     </div>
    </div><!-- /.navbar-collapse -->
    </nav>
	</h2>
  </div><!-- /.container-fluid -->
<br>
<p align="center" style ="color:black;font-size:20px;"><b>Log in</b><p>

<form  align="middle" style="font-size:20px;" action="./LoginServlet" method="Post">
Username : <input type="text" name="user_name" style="margin:5px 3px 10px 0px;">
 
<br>
Password : <input type="text" name="pass_word">

<br><br><br>
<input align="middle" type="submit" class="btn btn-default" value="OK">
<br><br>
</form>
</body>
</html>