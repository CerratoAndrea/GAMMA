<html>
<head>
    <title>BookHub</title>
    <meta charset="utf-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="js/bookhub.js"></script>
	<!--CSS-->>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .login-container {
            background-color: rgba(255, 255, 255, 0.95);
            padding: 35px;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            width: 400px;
            transform: translateY(0);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .login-container:hover {
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

        #loginButton {
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

        #loginButton:hover {
            background: linear-gradient(to right, #2980b9, #2573a7);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(41, 128, 185, 0.3);
        }

        #errorMsg {
            color: #e74c3c;
            font-weight: 500;
            padding: 10px;
            border-radius: 6px;
            background-color: rgba(231, 76, 60, 0.1);
            display: block;
            text-align: center;
        }

        .register-link {
            text-align: center;
            margin-top: 25px;
            color: #2c3e50;
            text-decoration: none;
            font-size: 15px;
            font-weight: 500;
            padding: 12px;
            border-radius: 8px;
            background: rgba(52, 152, 219, 0.1);
            transition: all 0.3s ease;
        }

        .register-link:hover {
            background: rgba(52, 152, 219, 0.2);
            color: #3498db;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(41, 128, 185, 0.2);
        }
    </style>
</head>

<body>
    <div class="login-container">
        <form id="loginForm" action="login" method="post">
            <div class="text-center mb-4">
                <img src="/src/main/webapp/img/Logo.png" class="img-fluid" alt="BookHub Logo">
            </div>
            <div class="form-group">
                <label for="name">Username</label>
                <input type="text" class="form-control" id="name" placeholder="Enter username" name="name">
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" placeholder="Enter password" name="password">
            </div>
            <div class="form-group">
                <span id="errorMsg">${errorMessage}</span>
            </div>
            <div class="form-group">
                <button type="submit" id="loginButton">Login</button>
            </div>
            <div class="register-link">
                <p>Non hai un account? <a href="/src/main/webapp/WEB-INF/jsp/register/preRegister.jsp">Registrati</a></p>
            </div>
        </form>
    </div>

    <script type="text/javascript">
        $('#loginButton').on('click', function (e) {
            e.preventDefault();
            $('#errorMsg').html("");

            var name = $('#name').val();
            var password = $('#password').val();

            if (!name) {
                $('#errorMsg').html("Inserire lo username");
                return false;
            }

            if (!password) {
                $('#errorMsg').html("Inserire la password")
                return false;
            }

            $('#loginForm').submit();
            return true;
        });
    </script>
</body>
</html>
