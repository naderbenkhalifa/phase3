<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
    System.out.println("request.getContextPath(): "+request.getContextPath());
    boolean isAuthenticated=true;
    if(session.getAttribute("authenticated")==null) isAuthenticated=false;
    else if(((String)session.getAttribute("authenticated")).equals("false"))isAuthenticated=false;
    System.out.println("isAuthenticated:"+isAuthenticated);
    if(!isAuthenticated){
    %>
    <jsp:forward page="/pages/login.jsp"></jsp:forward>    
    <%
    }
    %>
<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>
<meta charset="utf-8" />
       <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
	<div id="menu">
		<jsp:include page="/pages/Menu.jsp" />
		</div>

<div class="container text-center">
<h3> Welcom to Sporty shoes admin console</h3>

</div>
	
   </body>
</html>