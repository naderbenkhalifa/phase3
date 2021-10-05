<%@page import="com.sportyshoes.model.Category"%>
<%@page import="com.sportyshoes.model.User"%>
<%@page import="com.sportyshoes.utils.Factory"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
    List<Category> categoryList=Factory.getCategoryDao().getAll();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List of category</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<div id="page">
		<jsp:include page="/pages/Menu.jsp" />

<br/>
		<div id="wrapper">

			<div id="header" class="m-3">
				<h3>List of category</h3>
			</div>
		</div>


		<div id="container">

			<div id="content">

				<table class="table table-hover m-3">
               
					<tr>

						<th scope="col">Id</th>
						<th scope="col">Name</th>
						<th scope="col">Description</th>

					</tr>
<tbody>
					<%
for(Category item :categoryList){
%>
<tr>
<td> <%=item.getId() %></td>
<td> <%=item.getName() %> </td>
<td> <%=item.getDescription()%> </td>

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