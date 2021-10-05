<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>update password</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
	<%
	String userName=(String)session.getAttribute("username");
	%>
</head>

<body>
<div id="menu">
		<jsp:include page="/pages/Menu.jsp" />
		</div>


 <form action="<%=request.getContextPath( )%>/controller/loginController.jsp?action=updatePwd" method="POST">  

	<div class="container my-container" style=" margin-top: 200px;
    max-width: 500px;">
		<div class="card justify-content-md-center">
			<div class="card-header text-center">
				<h3>Update Admin password</h3>
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
					
					<div class="mb-3">
						<input disabled="disabled" type="text" placeholder="<%=userName %>" name="username"
							class="form-control" >
					</div>
					<div class="mb-3">
						<input type="password" placeholder=" old Password" name="oldPassword"
							class="form-control" required>
					</div>
					<div class="mb-3">
						<input type="password" placeholder=" new Password" name="newPassword"
							class="form-control" required>
					</div>
					<div class="mb-3">
						<input type="password" placeholder=" confirme Password" name="confirmePassword"
							class="form-control" required>
					</div>
					<div >

						<button type="submit" class="btn btn-primary btn-lg btn-block">
							Update password
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>

</form>

</body>

</html>