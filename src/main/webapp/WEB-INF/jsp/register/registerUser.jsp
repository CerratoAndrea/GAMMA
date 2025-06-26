<!DOCTYPE html>
<html>
<head>
  <title>Crea Nuovo Utente</title>
  <meta charset="utf-8">
  <link rel="icon" href="img/favicon.png">
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
  
  <!--CSS-->
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
      margin: 0;
      min-height: 100vh;
    }

    .form-container {
      background-color: rgba(255, 255, 255, 0.95);
      padding: 35px;
      border-radius: 15px;
      box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
      width: 400px;
      transform: translateY(0);
      transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .form-container:hover {
      transform: translateY(-5px);
      box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15);
    }

    .form-group {
      margin-bottom: 20px;
    }

    .form-group label {
      display: block;
      margin-bottom: 8px;
      color: #34495e;
      font-weight: 500;
      font-size: 14px;
    }

    .form-control {
      width: 100%;
      padding: 12px;
      border: 2px solid #e0e0e0;
      border-radius: 8px;
      transition: all 0.3s ease;
      font-size: 14px;
    }

    .form-control:focus {
      border-color: #3498db;
      box-shadow: 0 0 8px rgba(52, 152, 219, 0.2);
      outline: none;
    }

    .btn-register {
      background: linear-gradient(to right, #3498db, #2980b9);
      color: white;
      padding: 12px 20px;
      border: none;
      border-radius: 8px;
      cursor: pointer;
      font-size: 16px;
      width: 100%;
      font-weight: 600;
      transition: all 0.3s ease;
    }

    .btn-register:hover {
      background: linear-gradient(to right, #2980b9, #2573a7);
      transform: translateY(-2px);
      box-shadow: 0 5px 15px rgba(41, 128, 185, 0.3);
    }

    .error-message {
      color: #e74c3c;
      font-weight: 500;
      padding: 10px;
      border-radius: 6px;
      background-color: rgba(231, 76, 60, 0.1);
      text-align: center;
    }

    .title-underline {
      width: 50px;
      height: 3px;
      background: #3498db;
      margin: 0 auto 20px;
      border-radius: 1.5px;
    }
  </style>
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
            <input type="password" class="form-control" id="create-password" name="create-password">
          </div>

          <div class="form-group">
            <label for="control-password">Ripeti password</label>
            <input type="password" class="form-control" id="control-password" name="control-password">
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