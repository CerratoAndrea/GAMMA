<html>

<head>
  <title>Read Challenge</title>
  <meta charset="utf-8">  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" >
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" ></script>
  
  <script type="text/javascript" src="js/read-challenge.js"></script>
 
</head>

<body>
	
	<div class="d-flex flex-column min-vh-100 min-vw-100">	  
	  <div class="d-flex flex-grow-1 justify-content-center align-items-center">		  
		  <form id ="loginForm" action="login" method="post">
			<div>
				<h2>Read Challenge</h2>
			</div>		  	
		    <div >
		      <label for="name"><b>Username:</b></label>
		      <input type="text" class="form-control" id="name" placeholder="Enter username" name="name">
		    </div>
		    <div >
		      <label for="password"><b>Password:</b></label>
		      <input type="password" class="form-control" id="password" placeholder="Enter password" name="password">
		    </div>
		    <div>
		    	<font color="red" id="errorMsg">${errorMessage}</font>
		    </div>
		    <div style="padding-top:15px;">
		    	<button class="btn btn-primary" id="loginButton" >Login</button>
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

