<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% String username = (String)request.getAttribute("username");
    String userAccount_reg = (String) request.getAttribute("userAccount_reg");
	String userAccount_log = (String) request.getAttribute("userAccount_log");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Upload</title>
</head>
<body>
<script language="javascript" type="text/javascript">

		function popitup() {
			
			//window.location = 'RegisteredUserServlet?username=' + username+"&userAccount_log"+Your_Acount;
		//}
		
        //function popitup() {
            alert("Your video is uploaded");
            window.location.href = document.referrer;
//             window.location.href = document.referrer; 
				//window.location.href = document.referrer;
			//goBack();
		}
        
</script>
</head>
<body onload="popitup()">
</body>
</html>