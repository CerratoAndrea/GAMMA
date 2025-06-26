<!DOCTYPE html>
<!-- Dichiarazione del tipo di documento HTML -->
<html lang="it">
<!-- Tag HTML principale con attributo lingua impostato su italiano -->
<head>
    <!-- Sezione head che contiene i metadati -->
    <meta charset="UTF-8">
    <!-- Definizione della codifica dei caratteri -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Meta tag per il responsive design -->
    <title>Scegli Tipo di Registrazione</title>
    <!-- Titolo della pagina che appare nella tab del browser -->
    <link rel="stylesheet" type="text/css" href="stylePre.css">
    <!-- Collegamento al file CSS esterno per lo stile -->

    <!--CSS-->
    <style>/* Layout principale e sfondo */
body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: linear-gradient(135deg, #f0f4f8 0%, #b8c6db 100%);
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
}

/* Stile del contenitore con ombra moderna e animazione */
.container {
    background-color: rgba(255, 255, 255, 0.97);
    padding: 40px;
    border-radius: 15px;
    box-shadow: 0 12px 24px rgba(0, 0, 0, 0.12);
    width: 400px;
    transform: translateY(0);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    text-align: center;
}

.container:hover {
    transform: translateY(-5px);
    box-shadow: 0 18px 35px rgba(0, 0, 0, 0.18);
}

/* Stili dell'intestazione */
h2 {
    text-align: center;
    color: #1a2639;
    margin-bottom: 30px;
    font-size: 28px;
    font-weight: 600;
    position: relative;
}

h2::after {
    content: '';
    display: block;
    width: 60px;
    height: 3px;
    background: #4a90e2;
    margin: 12px auto 0;
    border-radius: 2px;
}

/* Stile del gruppo form */
.form-group {
    margin-bottom: 22px;
    text-align: left;
}

.form-group label {
    display: block;
    margin-bottom: 8px;
    color: #2c3e50;
    font-weight: 500;
    font-size: 14px;
    text-align: center;
}

/* Stile dei campi di input */
.form-group input[type="text"],
.form-group input[type="email"],
.form-group input[type="password"] {
    width: 100%;
    padding: 12px;
    border: 2px solid #d1d9e6;
    border-radius: 8px;
    box-sizing: border-box;
    transition: all 0.3s ease;
    font-size: 14px;
    text-align: center;
}

.form-group input:focus {
    border-color: #4a90e2;
    box-shadow: 0 0 10px rgba(74, 144, 226, 0.25);
    outline: none;
}

/* Stile del pulsante di invio */
.form-group input[type="submit"] {
    background: linear-gradient(to right, #4a90e2, #357abd);
    color: white;
    padding: 14px 20px;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    font-size: 16px;
    width: 100%;
    font-weight: 600;
    transition: all 0.3s ease;
}

.form-group input[type="submit"]:hover {
    background: linear-gradient(to right, #357abd, #2d6da3);
    transform: translateY(-2px);
    box-shadow: 0 6px 18px rgba(74, 144, 226, 0.35);
}

/* Stile dei messaggi */
.message {
    text-align: center;
    margin-top: 20px;
    color: #2ecc71;
    font-weight: 500;
    padding: 12px;
    border-radius: 6px;
    background-color: rgba(46, 204, 113, 0.12);
}

/* Stile dei messaggi di errore */
.error {
    color: #e74c3c;
    font-weight: 500;
    padding: 12px;
    border-radius: 6px;
    background-color: rgba(231, 76, 60, 0.12);
    text-align: center;
}

/* Stile dei pulsanti nel gruppo */
.button-group {
    display: flex;
    flex-direction: column;
    align-items: center;
}

.button-group button {
    background: linear-gradient(to right, #4a90e2, #357abd);
    color: white;
    padding: 14px 20px;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    font-size: 16px;
    margin: 8px 0;
    width: 90%;
    font-weight: 600;
    transition: all 0.3s ease;
}

.button-group button:hover {
    background: linear-gradient(to right, #357abd, #2d6da3);
    transform: translateY(-2px);
    box-shadow: 0 6px 18px rgba(74, 144, 226, 0.35);
}

.button-group button.admin {
    background: linear-gradient(to right, #2ecc71, #27ae60);
}

.button-group button.admin:hover {
    background: linear-gradient(to right, #27ae60, #219a52);
    transform: translateY(-2px);
    box-shadow: 0 6px 18px rgba(46, 204, 113, 0.35);
}

 </style>
</head>

<body>
    <!-- Corpo della pagina -->
    <div class="container">
        <!-- Contenitore principale -->
        <h2>Scegli il Tipo di Account da Registrare</h2>
        <!-- Titolo principale della pagina -->
        <div class="button-group">
            <!-- Gruppo di pulsanti -->
            <button id="registerUserBtn">Registra Utente </button>
            <!-- Pulsante per la registrazione utente normale -->
            <button id="registerAdminBtn" class="admin">Registra Amministratore</button>
            <!-- Pulsante per la registrazione amministratore -->
        </div>
    </div>

    <!--JS-->
    <script>
         document.getElementById('registerUserBtn').addEventListener('click', function() {
            // Reindirizza alla pagina di registrazione utente normale
            window.location.href = 'registerUser.jsp'; // Sostituisci con il percorso corretto
        });

        document.getElementById('registerAdminBtn').addEventListener('click', function() {
            // Reindirizza alla pagina di registrazione amministratore
            window.location.href = 'registerAdmin.jsp'; // Sostituisci con il percorso corretto
        });
    </script>
    
</body>
</html>
