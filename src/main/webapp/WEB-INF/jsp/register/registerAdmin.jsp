<!DOCTYPE html>
<html lang="it">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Crea Nuovo Amministratore</title>
    <link rel="stylesheet" href="styleRegisterAdmin.css">

    <!--CSS-->
    <style>
        /* Layout principale e sfondo */
body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
}

/* Stile del contenitore con ombra moderna e animazione */
.container {
    background-color: rgba(255, 255, 255, 0.95);
    padding: 35px;
    border-radius: 15px;
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
    width: 400px;
    transform: translateY(0);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.container:hover {
    transform: translateY(-5px);
    box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15);
}

/* Stili dell'intestazione */
h2 {
    text-align: center;
    color: #2c3e50;
    margin-bottom: 25px;
    font-size: 28px;
    font-weight: 600;
    position: relative;
}

h2::after {
    content: '';
    display: block;
    width: 50px;
    height: 3px;
    background: #3498db;
    margin: 10px auto 0;
    border-radius: 2px;
}

/* Stile del gruppo form */
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

/* Stile dei campi di input */
.form-group input[type="text"],
.form-group input[type="email"],
.form-group input[type="password"] {
    width: 100%;
    padding: 12px;
    border: 2px solid #e0e0e0;
    border-radius: 8px;
    box-sizing: border-box;
    transition: all 0.3s ease;
    font-size: 14px;
}

.form-group input:focus {
    border-color: #3498db;
    box-shadow: 0 0 8px rgba(52, 152, 219, 0.2);
    outline: none;
}

/* Stile del pulsante di invio */
.form-group input[type="submit"] {
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

.form-group input[type="submit"]:hover {
    background: linear-gradient(to right, #2980b9, #2573a7);
    transform: translateY(-2px);
    box-shadow: 0 5px 15px rgba(41, 128, 185, 0.3);
}

/* Stile dei messaggi */
.message {
    text-align: center;
    margin-top: 20px;
    color: #27ae60;
    font-weight: 500;
    padding: 10px;
    border-radius: 6px;
    background-color: rgba(39, 174, 96, 0.1);
}


/* Stile dei messaggi di errore */
.error {
    color: #e74c3c;
    font-weight: 500;
    padding: 10px;
    border-radius: 6px;
    background-color: rgba(231, 76, 60, 0.1);
}

    </style>
</head>

<body>
    <div class="container">
        <div style="text-align: center;">
            <img src="/src/main/webapp/img/Logo.png" width="50%" height="50%">
        </div>
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

<!--JS-->
<script>
     document.getElementById('createAdminForm').addEventListener('submit', function(event) {
            event.preventDefault(); // Previene l'invio predefinito del form

            const username = document.getElementById('username').value;
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirmPassword').value;
            const messageDiv = document.getElementById('message');

            messageDiv.textContent = ''; // Pulisce i messaggi precedenti
            messageDiv.classList.remove('error');

            if (password !== confirmPassword) {
                messageDiv.textContent = 'Le password non corrispondono!';
                messageDiv.classList.add('error');
                return;
            }

            // Qui dovresti inviare i dati al tuo backend (es. tramite fetch API)
            console.log('Dati Amministratore da inviare:');
            console.log('Nome Utente:', username);
            console.log('Password:', password);

            // Simulazione di successo (da rimuovere in produzione)
            messageDiv.textContent = 'Amministratore creato con successo.';
            document.getElementById('createAdminForm').reset(); // Resetta il form
        });
</script>
</body>
</html>