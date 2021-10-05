

<%@page import="com.sportyshoes.model.Category"%>
<%@page import="com.sportyshoes.utils.Constants"%>
<%@page import="com.sportyshoes.model.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
    List<Product> products=null;
    List<Category> categoryList=null;
    
    if(session.getAttribute(Constants.PRODUCT_LIST)!=null){
    	products=(List<Product>)session.getAttribute(Constants.PRODUCT_LIST);
    }
    
    if(session.getAttribute(Constants.CATEGORY_LIST)!=null){
    	categoryList=(List<Category>)session.getAttribute(Constants.CATEGORY_LIST);
    }
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>products</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>

<body style="background-image: url('css/background.jpg');">
	<div id="page">
		<jsp:include page="Menu.jsp" />

<br/>
		<div id="wrapper">

			<div id="header" class="m-3">
				<h2>List of products</h2>
			</div>
		</div>
<br/>

		<div id="container">
           <form class="form" action="<%=request.getContextPath()%>/controller/productController.jsp?action=add"
				method="POST">
	<div class="row m-3">
         
  <div class="col-md-3 ">
    <input type="text" class="form-control" name="name" placeholder="Name" required>
	</div>
	
	 <div class="col-md-4">
    <input type="text" class="form-control" name="description" placeholder="Description" required>
	 </div>
	 
	 <div class="col-md-3 ">
    <input type="number" step="any" class="form-control" name="price" placeholder="Price" required>
	 </div>
	  <div class="col-md-2 ">
    
	 </div>
 </div>
 
 <div class="row m-3">
   <div class="col-md-3 ">
 	<select class="custom-select" name="category" required>
 	<%
for(Category item :categoryList){
%>
 	<option value="<%= item.getId()%>"> <%=item.getName() %></option>
 	<%
}
%>
 	
 	
 	</select>
 
 
  </div>
  <div class="col-md-4 text-left">
 <button class="btn btn-success" type="submit" value="Add">Add</button>
  </div>
  <div class="col-md-3"></div>
  <div class="col-md-2"></div>
   </div>
</form>
<br/>
			<div id="content">

				<table class="table table-hover m-3">
               
					<tr>

						<th scope="col">Id</th>
						<th scope="col">Name</th>
						<th scope="col">Description</th>
						<th scope="col">Price</th>
						<th scope="col">Update</th>
						<th scope="col">Delete</th>

					</tr>
<tbody>
					<%
for(Product item :products){
%>
<tr>
<td> <%=item.getId() %></td>
<td> <%=item.getName() %> </td>
<td> <%=item.getDescription() %> </td>
<td> <%=item.getPrice() %> </td>
<td><a href="<%=request.getContextPath()%>/pages/productForm.jsp?id=<%=item.getId()%>">Update</a></td>
<td><a	href="<%=request.getContextPath()%>/controller/productController.jsp?action=delete&id=<%=item.getId()%>">Delete</a></td>

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






</body>
</html>