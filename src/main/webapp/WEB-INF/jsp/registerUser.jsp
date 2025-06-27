<!DOCTYPE html>
<html>
<head>
  <title>Crea Nuovo Utente</title>
  <meta charset="utf-8">
  <link rel="icon" href="img/favicon.png">
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
 
</head>

<body>
  <div class="d-flex flex-column min-vh-100">
    <div class="d-flex flex-grow-1 justify-content-center align-items-center">
      <div class="form-container">
        <h2 class="text-center mb-2">Crea Nuovo Utente</h2>
        <div class="title-underline"></div>
        <form id="registerForm" action="/src/main/webapp/WEB-INF/jsp/register/registerUser.jsp" method="post">

          <div class="form-group">
            <label for="name">Username</label>
            <input type="text" class="form-control" id="name" name="name">
          </div>

          <div class="form-group">
            <label for="email">Email</label>
            <input type="email" class="form-control" id="email" name="email">
          </div>

          <div class="form-group">
            <label for="create-password">Password</label>
            <input type="password" class="form-control" id="password" name="password">
          </div>

          <div class="form-group">
            <label for="control-password">Ripeti password</label>
            <input type="password" class="form-control" id="control_password" name="control_password">
          </div>

          <div class="form-group">
            <div class="error-message" id="errorMsg">${errorMessage}</div>
          </div>

          <div class="form-group">
            <button type="submit" class="btn-register" id="registerButton">Crea Utente</button>
          </div>
        </form>
      </div>
    </div>
  </div>

  <!--JS-->>
  <script type="text/javascript">
    $('#registerButton').on('click', function (e) {	
      e.preventDefault();
      
      $('#errorMsg').html("");
      
      var name = $('#name').val();
      var createPassword = $('#create-password').val();
      var controlPassword = $('#control-password').val();
      
      if(!name) {		
        $('#errorMsg').html("Inserire lo username");
        return false;
      }
      
      if(!createPassword) {
        $('#errorMsg').html("Inserire la password");
        return false;
      }
      
      if(createPassword !== controlPassword) {
        $('#errorMsg').html("Le password non coincidono");
        return false;
      }
      
      $('#registerForm').submit();
      return true;
    });
  </script>
</body>
</html>