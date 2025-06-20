<!DOCTYPE html>
<html lang="it">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Crea Nuovo Amministratore</title>
    <link rel="stylesheet" href="styleRegisterAdmin.css">
</head>

<body>
    <div class="container">
        <h2>Crea Nuovo Admin</h2>
        <form id="createAdminForm">
            <div class="form-group">
                <label for="username">Nome Utente:</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" 
                       id="email" 
                       name="email" 
                       pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"
                       title="Inserire un indirizzo email valido"
                       required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="form-group">
                <label for="confirmPassword">Conferma Password:</label>
                <input type="password" id="confirmPassword" name="confirmPassword" required>
            </div>
            <div class="form-group">
                <input type="submit" value="Crea Amministratore">
            </div>
            <div id="message" class="message"></div>
        </form>
    </div>


<script src="scriptRegisterAdmin.js"></script>
</body>
</html>