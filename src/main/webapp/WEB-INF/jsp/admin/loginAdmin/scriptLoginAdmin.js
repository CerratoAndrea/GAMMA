document.getElementById('loginForm').addEventListener('submit', function(event) {
            event.preventDefault(); // Previene l'invio predefinito del form

            const username = document.getElementById('username').value;
            const password = document.getElementById('password').value;
            const isAdmin = document.getElementById('isAdmin').checked;
            const messageDiv = document.getElementById('message');

            messageDiv.textContent = ''; // Pulisce i messaggi precedenti
            messageDiv.classList.remove('error');

            if (username.trim() === '' || password.trim() === '') {
                messageDiv.textContent = 'Per favore, inserisci username e password.';
                messageDiv.classList.add('error');
                return;
            }

            // Qui dovresti inviare i dati al tuo backend per la verifica
            console.log('Dati di Login da inviare:');
            console.log('Username:', username);
            console.log('Password:', password);
            
            // Esempio di invio dati con fetch (da adattare al tuo backend)
            /*
            fetch('/api/login', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    username: username,
                    password: password,
                    isAdmin: isAdmin
                }),
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    messageDiv.textContent = 'Login effettuato con successo!';
                    // Reindirizza l'utente o aggiorna l'interfaccia
                    // window.location.href = '/dashboard';
                } else {
                    messageDiv.textContent = 'Errore di login: ' + (data.message || 'Credenziali non valide.');
                    messageDiv.classList.add('error');
                }
            })
            .catch((error) => {
                console.error('Errore:', error);
                messageDiv.textContent = 'Si è verificato un errore di rete.';
                messageDiv.classList.add('error');
            });
            */

            // Per questo esempio, mostriamo solo un messaggio di successo simulato
            messageDiv.textContent = 'Login simulato con successo!';
            // In un'applicazione reale, qui reindirizzeresti l'utente
        });