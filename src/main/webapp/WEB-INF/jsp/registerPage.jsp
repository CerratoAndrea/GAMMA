<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
  <title>BookHub</title>
  <meta charset="utf-8">
  <link rel="icon" href="img/favicon.png">
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

</head>

<body>

  <div class="d-flex flex-column min-vh-100 min-vw-100">
    <div class="d-flex flex-grow-1 justify-content-center align-items-center">
      <form id="registerForm" action="registerUser" method="post">
        <div>
			<img src="img/Logo.png" width="100%" height="100%" >
		</div>		  	
		<div class="p-2">
          <label for="name"><b>Username</b></label>
          <input type="text" class="form-control" id="name" name="name">
        </div>
        <div class="p-2">
          <label for="email"><b>Email</b></label>
          <input type="email" class="form-control" id="email" name="email">
        </div>
        <div class="p-2">
          <label for="create-password"><b>Password</b></label>
          <input type="password" class="form-control" id="create-password" name="create-password">
        </div>
        <div class="p-2">
          <label for="control-password"><b>Ripeti password</b></label>
          <input type="password" class="form-control" id="control-password" name="control-password">
        </div>
        <div class="p-2">
          <font color="red" id="errorMsg">${errorMessage}</font>
        </div>
        <div class="p-2">
          <button class="btn btn-primary" id="registerButton" style="width:100%">Registrati</button>
        </div>
      </form>
    </div>
  </div>
  
  <script type="text/javascript">
		$('#registerButton').on('click', function (e) {	
		    e.preventDefault();
		    
		    $('#errorMsg').html("")
		
			var name = $('#name').val();
		    var email = $('#email').val();
			var createPassword = $('#create-password').val();
			var controlPassword = $('#control-password').val();
			
			if(!name){		
				$('#errorMsg').html("Inserire lo username");
				return false;
			}
			
			if(!email){
				$('#errorMsg').html("Inserire l'email")
				return false;
			}
				
			if(!createPassword){
				$('#errorMsg').html("Inserire la password")
				return false;
			}
			
			if(!controlPassword){
				$('#errorMsg').html("Ripetere la password")
				return false;
			}
			
			if(createPassword != controlPassword){
				$('#errorMsg').html("Le password non coincidono")
				return false;
			}
			
			$('#registerForm').submit();
			return true;
		});
    </script>

</body>

</html>