<%@page import="java.util.stream.Collectors"%>
<%@page import="com.sportyshoes.model.User"%>
<%@page import="com.sportyshoes.utils.Factory"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
    List<User> users=Factory.getUserService().getUsers();
    String search="";
    if(request.getParameter("action")!=null){
    	String action=(String)request.getParameter("action");
    	System.out.println("action -> "+action);
    	if(action.equals("search"))
        {
        	String searchText=request.getParameter("search");
        	System.out.println("searchText -> "+searchText);
        	if((searchText!=null) && (!searchText.trim().isBlank()))
        	{
        	users=users.stream()
        			.filter(u -> {
        			return	u.getUserName().contains(searchText) ||
        					u.getFirstName().contains(searchText) ||        					
        					u.getLastName().contains(searchText)        					
        					;
        			}
        			)
        			.collect(Collectors.toList());
        	search=searchText;
        	}
        			
        	
        }
    }
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List of users</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<div id="page">
		<jsp:include page="/pages/Menu.jsp" />

<br/>
		<div id="wrapper">

			<div id="header" class="m-3">
				<h3>List of users</h3>
			</div>
			<form action="<%=request.getContextPath( )%>/pages/users.jsp?action=search" method="POST">  
			<div class="row m-3">
			<div class="col-md-8">
			<input name="search" class="form-control" maxlength="50" placeholder="search" value="<%=search%>">
			
			</div>
			<div class="col-md-4 text-left">
			<button type="submit" class="btn"> Search</button>
			
			</div>		
			
			</div>
			</form>
		</div>


		<div id="container">

			<div id="content">

				<table class="table table-hover m-3">
               
					<tr>

						<th scope="col">user Name</th>
						<th scope="col">First Name</th>
						<th scope="col">Last Name</th>

					</tr>
<tbody>
					<%
for(User item :users){
%>
<tr>
<td> <%=item.getUserName() %></td>
<td> <%=item.getFirstName() %> </td>
<td> <%=item.getLastName() %> </td>

</tr>
<%
}
%>
</tbody>
				</table>
			</div>
		</div>
	</div>

</body>
</html>