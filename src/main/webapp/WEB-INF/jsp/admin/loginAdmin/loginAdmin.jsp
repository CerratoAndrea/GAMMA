<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Admin</title>
    <link rel="stylesheet" href="styleLoginAdmin.css">
</head>
<body>
    <!-- Contenitore principale per il form di login -->
    <div class="container">
        <!-- Intestazione del form di login -->
        <h2>Login Admin</h2>
        <!-- Form di login con ID per la gestione JavaScript -->
        <form id="loginForm">
            <!-- Gruppo input username -->
            <div class="form-group">
                <!-- Etichetta e campo di input per username -->
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>
            </div>
            <!-- Gruppo input password -->
            <div class="form-group">
                <!-- Etichetta e campo di input per password -->
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <!-- Gruppo pulsante di invio -->
            <div class="form-group">
                <input type="submit" value="Login">
            </div>
            <!-- Contenitore per i messaggi di feedback -->
            <div id="message" class="message"></div>
        </form>
    </div>

    <!-- Inclusione del file JavaScript per la funzionalità di login -->
    <script src="scriptLoginAdmin.js"></script>
</body>
</html>