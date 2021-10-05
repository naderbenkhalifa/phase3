<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
String contextPath=request.getContextPath();
System.out.println("MenuController:contextPath: "+contextPath);
String url="";
if(request.getParameter("action")==null){
	url=String.format("/index.jsp");
}
else{
String action=request.getParameter("action");
System.out.println("Action -> "+action);
//url=String.format("%s/pages/%s.jsp",contextPath, action);
switch(action){
case "Update-password":
	url=String.format("/pages/updatePassword.jsp");
	
	break;
case "Users":
	url=String.format("/pages/%s.jsp", "users");
	
	break;
case "Categories":
	url=String.format("/pages/%s.jsp", "categories");
	
	break;
case "Products":
	url=String.format("/controller/%s.jsp?action=load", "productController");
	
	break;
case "Purchase":
url=String.format("/pages/%s.jsp", "purchase");
	
	break;
	
}

}
System.out.println("MenuController: url: "+url);


%>
<jsp:forward page="<%=url %>"></jsp:forward>

