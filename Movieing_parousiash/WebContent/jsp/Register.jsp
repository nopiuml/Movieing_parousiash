<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<html>
<title>Register!</title>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style type="text/css">
<%@include file="bootstrap.css" %>.
<%@include file="mystyle.css" %>.
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
     
     </div>
    </div><!-- /.navbar-collapse -->
    </nav>
	</h2>
  </div><!-- /.container-fluid -->

<br>
<p align="middle" style ="color:black ;font-size:20px;"><b>Register</b><p>
<form  align="middle" style="font-size:20px;" action="./RegisterServlet" method="Post">
Username :  <input type="text" name="username" style="margin:5px 35px 10px 0px;"><br><br>
Password : <input type="text" name="password" style="margin:5px 35px 10px 0px;"><br><br>
Retype Password : <input type="text" name="repass" style="margin:5px 99px 10px 0px;"><br><br>
<input align="middle" type="submit" value="OK" class="btn btn-default">
</form>

</body>
</html>