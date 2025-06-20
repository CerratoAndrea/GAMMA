<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Scegli Tipo di Login</title>
    <link rel="stylesheet" type="text/css" href="stylePre.css">


    <!-- CSS -->
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: center;
        }
        h2 {
            color: #333;
            margin-bottom: 30px;
        }
        .button-group button {
            background-color: #007bff;
            color: white;
            padding: 15px 25px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 18px;
            margin: 10px;
            width: 80%;
            transition: background-color 0.3s ease;
        }
        .button-group button:hover {
            background-color: #0056b3;
        }
        .button-group button.admin {
            background-color: #28a745;
        }
        .button-group button.admin:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Scegli il Tipo di Account per il Login</h2>
        <div class="button-group">
            <button id="loginUserBtn">Login Utente </button>
            <button id="loginAdminBtn" class="admin">Login Admin</button>
        </div>
    </div>

    <!-- JS -->
    <script>
        document.getElementById('loginUserBtn').addEventListener('click', function() {
            // Reindirizza alla pagina di login utente normale
            window.location.href = 'loginUser.jsp'; // Sostituisci con il percorso corretto
        });

        document.getElementById('loginAdminBtn').addEventListener('click', function() {
            // Reindirizza alla pagina di login amministratore
            window.location.href = 'loginAdmin.jsp'; // Sostituisci con il percorso corretto
        });
    </script>
</body>
</html>