<%@page import="com.sportyshoes.utils.Factory"%>
<%@page import="com.sportyshoes.services.UserService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  
<%
UserService service=Factory.getUserService();

String errorMessage="Authenication failed : incorrect username or password";
if(request.getParameter("action")==null){
	%>
	<jsp:forward page="/index.jsp"></jsp:forward>  
	<%
	}
String action=(String)request.getParameter("action");
System.out.println("Action -> "+action);

if(action.equals("authentication"))
{
	boolean isAuthenticated=false;
session.setAttribute("authenticated","false"); 
String userName=request.getParameter("username");
String password=request.getParameter("password");
try{
	isAuthenticated=service.isAuthenticated(userName, password);
}
catch(Exception e){
	errorMessage="An unexpected error has occurred, please check with your administrator";
	
}

if(isAuthenticated){
	out.println("You r successfully logged in");  
	session.setAttribute("authenticated","true"); 
	session.setAttribute("login.error", null);
	session.setAttribute("username",userName); 

%>
<jsp:forward page="/index.jsp"></jsp:forward>  
<%
}
else  
{  
	session.setAttribute("login.error", errorMessage);  
%>  
<jsp:forward page="/pages/login.jsp"></jsp:forward> 
<%  
} 
}
if(action.equals("updatePwd"))
{
	boolean isError=false;
	String userName=(String)session.getAttribute("username");
	String oldPassword=request.getParameter("oldPassword");
	String newPassword=request.getParameter("newPassword");
	String confirmePassword=request.getParameter("confirmePassword");
	
	if(!service.isAuthenticated(userName, oldPassword) ){
		isError=true;
		
	}
	else if(!newPassword.equals(confirmePassword)){
		errorMessage="Password and confirme password must be egal";
		isError=true;
		session.setAttribute("login.error", errorMessage);  
	}
	if(isError){
		session.setAttribute("login.error", errorMessage);  
		%>  
		<jsp:forward page="/pages/updatePassword.jsp"></jsp:forward> 
		<%  
	}
	session.setAttribute("login.error", null);
	service.updatePassword(userName, newPassword);
	%>
	<jsp:forward page="/index.jsp"></jsp:forward>  
	<%
}


%>  