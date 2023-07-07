<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login / Sign up</title>

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


</body>
</html>
