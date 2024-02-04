<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- Compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">


<!-- Compiled and minified JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>


<title>Insert title here</title>
</head>
<body
	style="background: url('image/bg.avif'); background-size: cover; background-attachment: fixed;">
	<div class="container">
		<div class="row">
			<div class="col m6 offset-m3">
				<div class="card">
					<div class="card-content">


						<h6 style="margin-top: 10px" class="center-align">Sign-up
							Here</h6>

						<h6 id="msg" class="center-align"></h6>

						<div class="form">

							<form action="register" method="post" class="center-align"
								id="myform" enctype='multipart/form-data'>
								<div class="row">
									<div class="input-field col s12">
										<input id="name" type="text" class="validate" name="user_name">
										<label for="name">Name</label>
									</div>
								</div>

								<div class="row">
									<div class="input-field col s12">
										<input id="email" type="email" class="validate"
											name="user_email"> <label for="email">Email</label>
									</div>
								</div>



								<div class="row">
									<div class="input-field col s12">
										<input id="password" type="password" class="validate"
											name="user_password"> <label for="password">Password</label>
									</div>
								</div>
								
								<div class="file-field input-field">
									<div class="btn">
										<span>Upload Photo</span> 
										<input type="file" name="image">
										
									</div>
									<div class="file-path-wrapper">
										<input class="file-path validate" type='text'>
									</div>
								</div>

								<button class="btn waves-effect waves-light red" type="submit"
									name="action">Submit</button>

								
							</form>




						</div>


						<div class=" loader center-align"
							style="margin-top: 10px; display: none;">

							<div class="preloader-wrapper small active ">
								<div class="spinner-layer spinner-blue-only ">
									<div class="circle-clipper left">
										<div class="circle"></div>
									</div>
									<div class="gap-patch">
										<div class="circle"></div>
									</div>
									<div class="circle-clipper right">
										<div class="circle"></div>
									</div>
								</div>
							</div>
							<h6>Please wait</h6>
						</div>


					</div>

				</div>

			</div>
		</div>


		<script src="https://code.jquery.com/jquery-3.7.1.min.js"
			integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
			crossorigin="anonymous"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				M.updateTextFields();

				$("#myform").on('submit', function(event) {

					event.preventDefault();
					//var f = $(this).serialize();

					let f= new FormData(this);
					console.log(f);

					$(".loader").show();
					$(".form").hide();
					$.ajax({

						url : "register",
						data : f,
						method : 'POST',
	
						success : function(data, textStatus, jqXHR) {

							$(".loader").hide();
							$(".form").show();
							if (data.trim() === "done") {
								$('#msg').html("Successfully registered");
								$('#msg').addClass("green-text");
							} else {
								$('#msg').html("Somethig went wrong");
								$('#msg').addClass("red-text");
							}

						},
						error : function(jqXHR, textStatus, errorThrown) {
							$(".loader").hide();
							$(".form").show();
							$('#msg').html("Somethig went wrong");
							$('#msg').addClass("red-text");
						},
						
						processData: false,
						contentType: false
						
						

					})

				})

			});
		</script>
</body>
</html>