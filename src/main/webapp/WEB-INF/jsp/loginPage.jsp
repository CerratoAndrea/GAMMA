<html>

<head>
  <title>BookHub</title>
  <meta charset="utf-8">  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" >
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" ></script>
  
  <script type="text/javascript" src="js/bookhub.js"></script>
 
</head>

<body>
	
	<div class="d-flex flex-column min-vh-100 min-vw-100">	  
	  <div class="d-flex flex-grow-1 justify-content-center align-items-center p-2">		  
		  <form id ="loginForm" action="login" method="post">
			<div>
				<img src="img/Logo.png" width="100%" height="100%" >
			</div>		  	
		    <div class="p-2">
		      <label for="name"><b>Username</b></label>
		      <input type="text" class="form-control" id="name" placeholder="Enter username" name="name">
		    </div>
		    <div class="p-2">
		      <label for="password"><b>Password</b></label>
		      <input type="password" class="form-control" id="password" placeholder="Enter password" name="password">
		    </div>
		    <div class="p-2">
		    	<font color="red" id="errorMsg">${errorMessage}</font>
		    </div>
		    <div class="p-2">
		    	<button class="btn btn-primary" id="loginButton" style="width:100%">Login</button>
		    </div>
		    <div class="p-2">
		    	<p><small>Non hai un account?&nbsp;&nbsp;</small><a href="registerUser"><small>Registrati</small></a></p> 
		    </div>
		  </form>
	  </div>
	</div>
	
	<script type="text/javascript">
		$('#loginButton').on('click', function (e) {	
		    e.preventDefault();
		    
		    $('#errorMsg').html("")
		
			var name = $('#name').val();
			var password = $('#password').val();
			
			if(!name){		
				$('#errorMsg').html("Inserire lo username");
				return false;
			}
				
			if(!password){
				$('#errorMsg').html("Inserire la password")
				return false;
			}
			
			$('#loginForm').submit();
			return true;
		});
    </script>

</body>
</html>

