<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String username = (String)request.getAttribute("username");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Error</title>
<script language="javascript" type="text/javascript">
        function popitup() {
            alert("Your username and password don't match. Please try again! ");
            history.back();
        }
	</script>
</head>
<body onload="popitup()">
</body>
</html>