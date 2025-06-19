<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.model.SuperUser" %>

<!-- 1. jsp:useBean: Cerca un bean con id="superUser" e scope="session".
     Se non lo trova, ne crea uno nuovo usando la classe specificata.
     Questo bean sarà il nostro oggetto SuperUser.
-->
<jsp:useBean id="superUser" class="com.example.model.SuperUser" scope="session" />

<!--
  2. jsp:setProperty: Popola le proprietà del bean "superUser".
     property="*": Associa automaticamente i parametri della richiesta HTTP (dal form)
     con i setter del bean che hanno lo stesso nome (es. parametro "username" -> setUsername("...")).
-->
<jsp:setProperty name="superUser" property="*" />

<html>
<head>
    <title>Creazione SuperUser</title>
    <style>
        body { font-family: sans-serif; margin: 2em; }
        .container { border: 1px solid #ccc; padding: 20px; border-radius: 8px; max-width: 500px; }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; }
        input[type="text"], input[type="password"] { width: 100%; padding: 8px; box-sizing: border-box; }
        input[type="submit"] { background-color: #007bff; color: white; padding: 10px 15px; border: none; border-radius: 4px; cursor: pointer; }
        .result { background-color: #e7f3fe; border-left: 6px solid #2196F3; padding: 15px; margin-top: 20px; }
    </style>
</head>
<body>

    <div class="container">
        <h1>Crea un nuovo SuperUser</h1>
        <p>Un SuperUser eredita le proprietà di un Admin.</p>
        
        <form action="creaSuperUser.jsp" method="post">
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username">
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password">
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="text" id="email" name="email">
            </div>
            <div class="form-group">
                <label for="livelloAccesso">Livello di Accesso (proprietà da Admin):</label>
                <input type="text" id="livelloAccesso" name="livelloAccesso" value="network-global">
            </div>
             <div class="form-group">
                <label for="puoCancellareTutto">Permesso di Cancellazione Globale (proprietà da SuperUser):</label>
                <select id="puoCancellareTutto" name="puoCancellareTutto">
                    <option value="true" selected>Sì</option>
                    <option value="false">No</option>
                </select>
            </div>
            <input type="submit" name="submitButton" value="Crea SuperUser">
        </form>
    </div>

    <!-- 
      3. Logica di visualizzazione:
         Questo blocco di codice Java (scriptlet) viene eseguito solo se il form è stato inviato.
         Controlliamo se il parametro "submitButton" esiste nella richiesta.
    -->
    <%
        if (request.getParameter("submitButton") != null) {
    %>
        <div class="container result">
            <h2>SuperUser Creato con Successo!</h2>
            <p>I dati inseriti sono stati salvati nell'oggetto in sessione.</p>
            <ul>
                <li><strong>Username (da Utente):</strong> <%= superUser.getUsername() %></li>
                <li><strong>Email (da Utente):</strong> <%= superUser.getEmail() %></li>
                <li><strong>Livello Accesso (da Admin):</strong> <%= superUser.getLivelloAccesso() %></li>
                <li><strong>Può Cancellare Tutto (da SuperUser):</strong> <%= superUser.isPuoCancellareTutto() %></li>
            </ul>
        </div>
    <%
        }
    %>

</body>
</html>