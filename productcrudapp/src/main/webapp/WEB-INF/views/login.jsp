<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>




<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<style>
body {
	background-image: url('https://wallpaperaccess.com/full/305994.jpg');
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center;
	height: 100vh; /* Set the height of the body to fill the viewport */
	background-attachment: fixed;
}

.navbar {
	background-color: #eaeaea; /* Use a soothing color of your choice */
}

.navbar-brand {
	font-size: 24px; /* Adjust the font size as desired */
	font-family: Arial, sans-serif; /* Use a relevant font */
	color: #333333; /* Use a color that complements the background */
}
</style>

</head>
<body>



	<nav class="navbar navbar-expand-lg navbar-dark"
		style="background-color: rgba(0, 0, 0, 0.5);">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Welcome to Employee Management
				System Portal</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link" href="register">Register</a></li>
					<li class="nav-item"><a class="nav-link" href="login">Login</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container p-3">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-header text-center">
						<h3>Login Page</h3>
						<c:if test="${not empty msg }">
							<h5 class="text-success">${msg }</h5>
							<c:remove var="msg" />
						</c:if>
					</div>
					<div class="card-body">
						<form action="userlogin" method="post">

							<div class="md-3">
								<label>Enter Email</label> <input type="email" name="email"
									class="form-control" required="required">
							</div>

							<div class="md-3">
								<label>Enter Password</label> <input type="password"
									name="password" class="form-control" required="required">
							</div>

							<div class="md-3">
								<label>Enter userType</label> <select name="userType"
									class="form-control">
									<option value="user">user</option>
									<option value="admin">admin</option>
								</select>
							</div>

							<br>
							<button class="btn btn-primary col-md-12">Login</button>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>


</body>
</html>