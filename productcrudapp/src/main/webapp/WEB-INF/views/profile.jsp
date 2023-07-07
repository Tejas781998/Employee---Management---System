<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Welcome!! ${loginuser.fullName}</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-image:
		url('https://c4.wallpaperflare.com/wallpaper/170/854/419/anime-one-piece-wallpaper-preview.jpg');
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center;
	height: 120vh; /* Set the height of the body to fill the viewport */
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

.container {
	max-width: 1000px;
	margin: 0 auto;
	padding: 20px;
	background-color: white;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	display: flex;
	align-items: center;
	justify-content: space-between;
	text-align: center;
	color: white; /* Set the text color to white */
}

h1 {
	color: white; /* Set the text color to white */
	margin: 0;
}

.table thead th, .table tbody td, .container h1, .container .card-header h4
	{
	color: white; /* Set the text color to white */
}

.table-center {
	margin: 0 auto;
	display: table;
}

/* Adjust modal width based on table width */
.modal-dialog {
	max-width: 100%;
	width: auto;
	margin: 1.75rem auto;
}

.modal-content {
	background-color: #000000;
}

@media ( min-width : 576px) {
	.modal-dialog {
		max-width: 500px;
		width: auto;
	}
}

@media ( min-width : 768px) {
	.modal-dialog {
		max-width: 700px;
		width: auto;
	}
}

@media ( min-width : 992px) {
	.modal-dialog {
		max-width: 900px;
		width: auto;
	}
}

@media ( min-width : 1200px) {
	.modal-dialog {
		max-width: 1100px;
		width: auto;
	}
}
</style>
</head>
<body>

 <% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    if(session.getAttribute("loginuser") == null)
    response.sendRedirect(request.getContextPath() + "/login");   
 

%> 


	<div class="container" style="background-color: rgba(0, 0, 0, 0);">
		<div>
			<h1>Hello, ${loginuser.fullName}</h1>
		</div>
		<div>
			<a href="logout" class="btn btn-sm btn-primary">Logout</a>
		</div>
	</div>

	<br>

	<div class="container p-5" style="background-color: rgba(0, 0, 0, 0);">
		<div class="row">
			<div class="col-md-12">
				<div class="card" style="background-color: rgba(0, 0, 0, 0);">
					<div class="card-header text-center">
						<h4>${loginuser.fullName}'sDetails</h4>
						<c:if test="${not empty msg}">
							<h5 class="text-success">${msg}</h5>
							<c:remove var="msg" />
						</c:if>
					</div>
					<div class="card-body">
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Id</th>
									<th scope="col">Full Name</th>
									<th scope="col">Email</th>
									<th scope="col">Password</th>
									<th scope="col">Designation</th>
									<th scope="col">Salary</th>
									<th scope="col">userType</th>
									<th scope="col">Address</th>
									<th scope="col">Action</th>

								</tr>
							</thead>
							<tbody>
								<c:forEach items="${empList}" var="emp">
									<tr>
										<th scope="row" style="color: white;">${emp.id}</th>
										<td>${emp.fullName}</td>

										<td>${emp.email}</td>
										<td>${emp.password}</td>
										<td>${emp.designation}</td>
										<td>${emp.salary}</td>



										<td>${emp.userType}</td>
										<td>
											<button type="button" class="btn btn-primary btn-sm"
												data-bs-toggle="modal"
												data-bs-target="#addressModal${emp.id}">Address</button> <!-- Address Modal -->
											<div class="modal fade" id="addressModal${emp.id}"
												tabindex="-1" aria-labelledby="addressModalLabel${emp.id}"
												aria-hidden="true">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<h5 class="modal-title" id="addressModalLabel${emp.id}">Address
																Details</h5>
															<button type="button" class="btn-close"
																data-bs-dismiss="modal" aria-label="Close"></button>
														</div>
														<div class="modal-body">
															<table class="table table-bordered">
																<thead>
																	<tr>
																		<th>Permanent Address</th>
																		<th>Temporary Address</th>
																		<th>Street</th>
																		<th>City</th>
																		<th>State/Province</th>
																		<th>Country</th>
																		<th>Delete</th>

																	</tr>
																</thead>
																<tbody>
																	<c:forEach items="${emp.address}" var="address">
																		<tr>
																			<td>${address.permanenetAddress}</td>
																			<td>${address.temporaryAddress}</td>
																			<td>${address.streetAddress}</td>
																			<td>${address.city}</td>
																			<td>${address.stateProvince}</td>
																			<td>${address.country}</td>
																			<td><button class="btn btn-danger"
																					name="address[${loop.index}].addressId"
																					type="button"
																					onclick="deleteAddress('${address.addressId}')">Delete</button>
																				<!-- Delete button for each address --></td>
																		</tr>
																	</c:forEach>
																</tbody>
															</table>
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-secondary"
																data-bs-dismiss="modal">Close</button>
														</div>
													</div>
												</div>
											</div>
										</td>
										<td><a href="editUser/${emp.id}"
											class="btn btn-sm btn-primary">Edit</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.2/js/bootstrap.bundle.min.js"></script>
		<script>
		function deleteAddress(addressId) {

			/* alert("hello") */

			var id = $("#address_" + addressId).val();

			if (confirm("Are you sure you want to delete this address?")) {

				$.ajax({

					url : "${pageContext.request.contextPath}/deleteAddress/"

					+ addressId,

					type : "DELETE",
					location.reload();

					success : function(response) {

						alert(response)
						location.reload();

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
