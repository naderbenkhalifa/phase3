<%@page import="com.sportyshoes.utils.Factory"%>
<%@page import="com.sportyshoes.dao.ProductDao"%>
<%@page import="com.sportyshoes.model.Product"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	Product selectedItem = null;
	ProductDao dao=Factory.getProductDao();
	if (request.getParameter("id") != null) {
		String idStr = request.getParameter("id");
		Integer id = Integer.parseInt(idStr.trim());
		selectedItem = dao.getItem(id);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Subject Form</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>
<body>
	<form
		action="<%=request.getContextPath()%>/controller/productController.jsp?action=update&id=<%=selectedItem.getId()%>"
		method="post">
		<div class="row m-3">
			<div class="col-md-2">
				<h4>ID</h4>
			</div>
			<div class="col-md-6">
				<input class="form-control" disabled="disabled" name="id"
					value="<%=selectedItem.getId()%>" />
			</div>
			<div class="col-md-4"></div>
		</div>
		<div class="row m-3">
			<div class="col-md-2">
				<h4>Name</h4>
			</div>
			<div class="col-md-6">
				<input class="form-control" name="name" value="<%=selectedItem.getName()%>" />
			</div>
			<div class="col-md-4"></div>
		</div>
		<div class="row m-3">
			<div class="col-md-2">
				<h4>Description</h4>
			</div>
			<div class="col-md-6">
				<input class="form-control" name="description" value="<%=selectedItem.getDescription()%>" />
			</div>
			<div class="col-md-4"></div>
		</div>
		<div class="row m-3">
			<div class="col-md-2">
				<h4>Price</h4>
			</div>
			<div class="col-md-6">
				<input class="form-control" type="number" step="any" name="price" value="<%=selectedItem.getPrice()%>" />
			</div>
			<div class="col-md-4"></div>
		</div>

		<div class="row m-3">
			<button type="submit" class="btn btn-success">Valide</button>
		</div>

	</form>

</body>
</html>