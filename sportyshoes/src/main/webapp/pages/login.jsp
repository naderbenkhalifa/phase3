<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>

<body>


 <form action="<%=request.getContextPath( )%>/controller/loginController.jsp?action=authentication" method="POST">  

	<div class="container my-container" style=" margin-top: 200px;
    max-width: 500px;">
		<div class="card justify-content-md-center">
			<div class="card-header text-center">
				<h3>Admin Login</h3>
			</div>

			<div class="card-body">
				<%
  if(session.getAttribute("login.error")!=null){
  %>
				<div class="alert alert-danger">
					<h3><%=(String)session.getAttribute("login.error") %></h3>
				</div>
				<%
  }
  %>
				<div class="container">
					<input type="hidden" name="command" value="LOGIN" />
					<div class="mb-3">
						<input type="text" placeholder="User Name" name="username"
							class="form-control" required>
					</div>
					<div class="mb-3">
						<input type="password" placeholder="Password" name="password"
							class="form-control" required>
					</div>
					<div >

						<button type="submit" class="btn btn-primary btn-lg btn-block">
							Login
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>

</form>

</body>

</html>