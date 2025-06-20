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

            // Esempio di invio dati con fetch (da adattare al tuo backend)
            /*
            fetch('/api/createAdmin', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    username: username,
                    email: email,
                    password: password
                }),
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    messageDiv.textContent = 'Amministratore creato con successo!';
                    messageDiv.getElementById('createAdminForm').reset(); // Resetta il form
                } else {
                    messageDiv.textContent = 'Errore: ' + (data.message || 'Impossibile creare amministratore.');
                    messageDiv.classList.add('error');
                }
            })
            .catch((error) => {
                console.error('Errore:', error);
                messageDiv.textContent = 'Si è verificato un errore di rete.';
                messageDiv.classList.add('error');
            });
            */

            // Simulazione di successo (da rimuovere in produzione)
            messageDiv.textContent = 'Amministratore creato con successo.';
            document.getElementById('createAdminForm').reset(); // Resetta il form
        });