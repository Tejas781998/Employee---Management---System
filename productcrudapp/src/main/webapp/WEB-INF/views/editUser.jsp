
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<title>Edit ${emp.fullName}'s Details</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<meta charset="ISO-8859-1">

<style>
body {
	background-image:
		url('https://c4.wallpaperflare.com/wallpaper/170/854/419/anime-one-piece-wallpaper-preview.jpg');
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center;
	height: 100vh; /* Set the height of the body to fill the viewport */
	background-attachment: fixed;
}

.navbar {
	background-color: #eaeaea; /* Use a soothing color of your choice */
}

.container {
	max-width: 1000px;
	margin: 0 auto;
	padding: 20px;
}

.container label {
	color: white; /* Set the label color to white */
}

.navbar-brand {
	font-size: 24px; /* Adjust the font size as desired */
	font-family: Arial, sans-serif; /* Use a relevant font */
	color: #333333; /* Use a color that complements the background */
}

h1, h5 {
	color: white; /* Set the text color to white */
	margin: 0;
}

.table-center {
	margin: 0 auto;
	display: table;
}

.form-control {
	color: black !important; /* Set the text color to black */
}

.container h3, .container .text-success, .container .card-header h4,
	.form-control {
	color: white; /* Set the text color to white */
}
</style>
</head>
<body>
<% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
   if(session.getAttribute("address") == null) 
//	   System.out.println(updateuser);
 //   response.sendRedirect(request.getContextPath() + "/login");   
 

%> 

	<nav class="navbar navbar-expand-lg navbar-dark"
		style="background-color: rgba(0, 0, 0, 0.5);">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page"
						href="${pageContext.request.contextPath}/myProfile">Home</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page"
						href="${pageContext.request.contextPath}/logout">Logout</a></li>

				</ul>
			</div>
		</div>
	</nav>


	<div class="container">
		<div class="card mt-5" style="background-color: rgba(0, 0, 0, 0.5);">
			<div class="card-header">
				<h2 style="color: white;">Edit ${emp.fullName}'s Details</h2>
			</div>
			<div>

			</div>
			<div class="card-body">
				<form action="${pageContext.request.contextPath}/updateUser"
					method="post">
					<input type="hidden" name="id" value="${emp.id}">

					<div class="md-3">
						<label>Enter Full Name</label> <input type="text" name="fullName"
							class="form-control" value="${emp.fullName}">
					</div>
					<div class="md-3">
						<label>Enter Email</label> <input type="text" name="email"
							class="form-control" value="${emp.email}" readonly>
					</div>
					<div class="md-3">
						<label>Enter Password</label> <input type="password"
							name="password" class="form-control" value="${emp.password}"
							readonly>
					</div>
					<div class="md-3">
						<label>Enter Designation</label> <input type="text"
							name="designation" class="form-control"
							value="${emp.designation}">
					</div>
					<div class="md-3">
						<label>Enter Salary</label> <input type="number" name="salary"
							class="form-control" value="${emp.salary}">
					</div>
					<div class="md-3">
						<label>User Type</label> <select name="userType"
							class="form-control">
							<option value="admin"
								${emp.userType == 'admin' ? 'selected' : ''}>admin</option>
							<option value="user" ${emp.userType == 'user' ? 'selected' : ''}>user</option>
						</select>
					</div>

					<!-- Address fields -->

					<h4 style="color: white;">Address Details</h4>
					<c:set var="previousIndex" value="${fn:length(emp.address) - 1}" />

					<c:forEach items="${emp.address}" var="address" varStatus="loop"
						begin="0">

						<h5>Address ${loop.index + 1}</h5>
						<input type="hidden" name="id" value="${address.addressId}">
						<div class="md-3">
							<input type="hidden" name="address[${loop.index}].addressId"
								class="form-control" value="${address.addressId}">
						</div>

						<div class="md-3">
							<label>Enter Permanent Address</label> <input type="text"
								name="address[${loop.index}].permanenetAddress"
								class="form-control" value="${address.permanenetAddress}">
						</div>
						<div class="md-3">
							<label>Enter Temporary Address</label> <input type="text"
								name="address[${loop.index}].temporaryAddress"
								class="form-control" value="${address.temporaryAddress}">
						</div>
						<div class="md-3">
							<label>Enter Street Address</label> <input type="text"
								name="address[${loop.index}].streetAddress" class="form-control"
								value="${address.streetAddress}">
						</div>
						<div class="md-3">
							<label>Enter City</label> <input type="text"
								name="address[${loop.index}].city" class="form-control"
								value="${address.city}">
						</div>
						<div class="md-3">
							<label>Enter State/Province</label> <input type="text"
								name="address[${loop.index}].stateProvince" class="form-control"
								value="${address.stateProvince}">
						</div>
						<div class="md-3">
							<label>Enter Country</label> <input type="text"
								name="address[${loop.index}].country" class="form-control"
								value="${address.country}">
						</div>
						<br>
						<div class="md-3">
							<button class="btn btn-danger"
								name="address[${loop.index}].addressId" type="button"
								onclick="deleteAddress('${address.addressId}')">Delete</button>

						</div>
						<br>
					</c:forEach>




					<div id="address-container"></div>

					<!-- <div class="md-3">
						<button type="button" class="btn btn-danger remove-address">Remove
							Address</button>
					</div> -->

					<div id="addressContainer">
						<%-- <div class="md-3">
							<h5>New Address</h5>
							<h5>${previousIndex == -1 ? 0 : previousIndex + 1 }</h5>
							<label>Enter Permanent Address</label> <input type="text"
								name="address[${previousIndex == -1 ? 0 : previousIndex + 1}].permanenetAddress"
								required="required" class="form-control"
								placeholder="Permanent Address"> <br> <label>Enter
								Temporary Address</label> <input type="text"
								name="address[${previousIndex == -1 ? 0 : previousIndex + 1}].temporaryAddress"
								required="required" class="form-control"
								placeholder="Temporary Address"> <br> <label>Enter
								Street</label> <input type="text"
								name="address[${previousIndex == -1 ? 0 : previousIndex + 1}].streetAddress"
								required="required" class="form-control"
								placeholder="Street Address"> <br> <label>Enter
								City</label> <input type="text"
								name="address[${previousIndex == -1 ? 0 : previousIndex + 1}].city"
								required="required" class="form-control" placeholder="City">
							<br> <label>Enter State/Province</label> <input type="text"
								name="address[${previousIndex == -1 ? 0 : previousIndex + 1}].stateProvince"
								required="required" class="form-control"
								placeholder="State/Province"> <br> <label>Enter
								Country</label> <input type="text"
								name="address[${previousIndex == -1 ? 0 : previousIndex + 1}].country"
								required="required" class="form-control" placeholder="Country">

						</div> --%>
					</div>



					<div class="md-3">
						<button onclick="addAddress()" type="button"
							class="btn btn-primary">Add Address</button>
						<button id="removeAddress" type="button" class="btn btn-danger"
							href="deleteEmp/${emp.id}">Remove Address</button>
					</div>
					<button type="submit" class="btn btn-success">Update</button>
				</form>
			</div>
		</div>
	</div>

	<script>
		function addAddress() {
			// Get all the address elements with name attribute starting with 'address'
			var addressElements = document
					.querySelectorAll('[name^="address"]');

			// Calculate the previousIndex using the logic
			console.log("addressElements.length: " + addressElements.length);
			var previousIndex = addressElements.length > 0 ? parseInt(addressElements[addressElements.length - 1].name
					.match(/\[(\d+)\]/)[1])
					: -1;
			console.log(previousIndex);
			// Increment the previousIndex for the new address
			var newIndex = previousIndex + 1;
			console.log(newIndex);
			// Generate the HTML code for the new address div
			var addressDiv = '<div class="md-3">'
					+ '<h5>Address '
					+ (newIndex + 1)
					+ '</h5>'
					+ '<label>Enter Permanent Address</label>'
					+ '<input type="text" name="address[' +newIndex+ '].permanenetAddress" required="required" class="form-control" placeholder="Permanent Address"><br>'
					+ '<label>Enter Temporary Address</label>'
					+ '<input type="text" name="address[' +newIndex+ '].temporaryAddress" required="required" class="form-control" placeholder="Temporary Address"><br>'
					+ '<label>Enter Street</label>'
					+ '<input type="text" name="address[' +newIndex+ '].streetAddress" required="required" class="form-control" placeholder="Street"><br>'
					+ '<label>Enter City</label>'
					+ '<input type="text" name="address[' +newIndex+ '].city" required="required" class="form-control" placeholder="City"><br>'
					+ '<label>Enter State/Province</label>'
					+ '<input type="text" name="address[' +newIndex+ '].stateProvince" required="required" class="form-control" placeholder="State/Province"><br>'
					+ '<label>Enter Country</label>'
					+ '<input type="text" name="address[' +newIndex+ '].country" required="required" class="form-control" placeholder="Country">'
					+ '</div>';

			// Append the new address div to the container
			document.getElementById('addressContainer').insertAdjacentHTML(
					'beforeend', addressDiv);

			previousIndex++;
		}

		document
				.getElementById("removeAddress")
				.addEventListener(
						"click",
						function() {
							var addressContainer = document
									.getElementById("addressContainer");
							var addressSections = addressContainer
									.getElementsByTagName("div");
							if (addressSections.length >= 1) {
								addressContainer
										.removeChild(addressSections[addressSections.length - 1]);
							}
						});

		function deleteAddress(addressId) {

			/* alert("hello") */

			var id = $("#address_" + addressId).val();

			if (confirm("Are you sure you want to delete this address?")) {

				$
						.ajax({

							url : "${pageContext.request.contextPath}/deleteAddress/"

									+ addressId,

							type : "DELETE",

							success : function(response) {

								alert(response)
								//location.reload();
								window.location.href = "${pageContext.request.contextPath}/editUser";

							},

							error : function(xhr, status, error) {

								// Handle the error response

							}

						});
			}
		}
	</script>

</body>
</html>