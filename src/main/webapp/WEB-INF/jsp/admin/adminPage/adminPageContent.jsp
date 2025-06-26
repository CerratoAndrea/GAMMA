<!DOCTYPE html>
<html lang="it">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Pannello Admin Libri</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  
  <!--CSS-->>
  <style> 
    :root {
    --primary-color: #007bff;
    --danger-color: #dc3545;
    --success-color: #28a745;
    --text-color: #333;
    --bg-color: #f8f9fa;
    --card-bg-color: #fff;
    --border-color: #dee2e6;
    --shadow-light: rgba(0, 0, 0, 0.1);
}

body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    margin: 0;
    padding: 20px;
    background-color: var(--bg-color);
    color: var(--text-color);
    line-height: 1.6;
}

.container {
    max-width: 1200px; /* Increased max-width to accommodate two columns comfortably */
    margin: 20px auto;
    background-color: var(--card-bg-color);
    padding: 30px;
    border-radius: 8px;
    box-shadow: 0 4px 12px var(--shadow-light);
}

.text-center {
    text-align: center;
}

h1, h2 {
    color: var(--primary-color);
    margin-bottom: 20px;
    font-weight: 600;
}

h1 {
    font-size: 2.5em;
    border-bottom: 2px solid var(--primary-color);
    padding-bottom: 10px;
    display: inline-block;
}

h2 {
    font-size: 1.8em;
    margin-top: 30px;
    margin-bottom: 25px;
}

section {
    padding: 20px;
    background-color: #f0f4f8;
    border-radius: 6px;
    border: 1px solid var(--border-color);
    /* Removed margin-bottom from section to be controlled by gap in flexbox/grid */
}

/* --- Layout for two columns --- */
.main-content-wrapper {
    display: flex; /* Use Flexbox */
    flex-wrap: wrap; /* Allow wrapping to a single column on smaller screens */
    gap: 30px; /* Space between the two columns */
    margin-top: 30px; /* Space below the header */
}

.form-section {
    flex: 1; /* Allow the form section to grow and shrink */
    min-width: 350px; /* Minimum width for the form before wrapping */
}

.list-section {
    flex: 2; /* Make the list section take up more space */
    min-width: 450px; /* Minimum width for the list section before wrapping */
}

/* Ensure sections take full width on smaller screens */
@media (max-width: 850px) { /* Adjust breakpoint as needed */
    .main-content-wrapper {
        flex-direction: column; /* Stack columns vertically */
        gap: 20px; /* Adjust gap for vertical stacking */
    }
    .form-section,
    .list-section {
        flex: none; /* Remove flex sizing */
        width: 100%; /* Take full width */
        min-width: unset; /* Remove min-width constraints */
    }
}


/* Form Styling */
#bookForm {
    display: grid;
    gap: 15px;
    grid-template-columns: 1fr;
}

@media (min-width: 600px) { /* Form fields can become two columns within their section */
    #bookForm {
        grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    }
    .form-group:nth-child(4) { /* Description spans two columns */
        grid-column: 1 / -1;
    }
}

.form-group {
    margin-bottom: 0; /* Remove default margin as gap handles spacing */
    display: flex;
    flex-direction: column;
}

.form-group label {
    font-weight: bold;
    margin-bottom: 5px;
    color: var(--text-color);
}

.form-group input[type="text"],
.form-group input[type="number"],
.form-group textarea {
    width: calc(100% - 20px);
    padding: 10px;
    border: 1px solid var(--border-color);
    border-radius: 4px;
    font-size: 1em;
    box-sizing: border-box;
}

.form-group textarea {
    resize: vertical;
    min-height: 80px;
}

.form-group input:focus,
.form-group textarea:focus {
    border-color: var(--primary-color);
    outline: none;
    box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
}

.form-text {
    font-size: 0.85em;
    color: #6c757d;
    margin-top: 5px;
}

/* Buttons */
button[type="submit"] {
    background-color: var(--success-color);
    color: white;
    padding: 12px 25px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 1.1em;
    font-weight: bold;
    transition: background-color 0.3s ease, transform 0.2s ease;
    width: fit-content;
    margin-top: 10px;
    grid-column: 1 / -1;
    justify-self: center;
}

button[type="submit"]:hover {
    background-color: #218838;
    transform: translateY(-2px);
}

/* Book Cards List */
#booksContainer {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); /* Adjusted min-width for cards */
    gap: 20px; /* Reduced gap slightly */
    padding: 10px 0; /* Adjusted padding */
    margin-top: 10px; /* Reduced margin */
}

.book-card {
    background-color: var(--card-bg-color);
    border: 1px solid var(--border-color);
    border-radius: 8px;
    padding: 15px; /* Slightly reduced padding */
    box-shadow: 0 2px 8px var(--shadow-light);
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    transition: transform 0.2s ease, box-shadow 0.2s ease;
}

.book-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 6px 16px rgba(0, 0, 0, 0.15);
}

.book-card h3 {
    color: var(--primary-color);
    margin-top: 0;
    margin-bottom: 8px; /* Slightly reduced margin */
    font-size: 1.3em; /* Slightly reduced font size */
}

.book-card p {
    margin-bottom: 6px; /* Slightly reduced margin */
    font-size: 0.9em; /* Slightly reduced font size */
}

.book-card strong {
    color: #555;
}

.book-actions {
    margin-top: 12px; /* Slightly reduced margin */
    display: flex;
    gap: 8px; /* Slightly reduced gap */
    justify-content: flex-end;
    flex-wrap: wrap;
}

.btn {
    padding: 7px 12px; /* Slightly reduced padding */
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 0.85em; /* Slightly reduced font size */
    font-weight: 500;
    transition: background-color 0.2s ease, transform 0.1s ease;
    white-space: nowrap;
}

.btn-primary {
    background-color: var(--primary-color);
    color: white;
}

.btn-primary:hover {
    background-color: #0056b3;
    transform: translateY(-1px);
}

.btn-danger {
    background-color: var(--danger-color);
    color: white;
}

.btn-danger:hover {
    background-color: #c82333;
    transform: translateY(-1px);
}

.no-books-message {
    text-align: center;
    grid-column: 1 / -1;
    color: #6c757d;
    font-style: italic;
    padding: 20px;
    border: 1px dashed var(--border-color);
    border-radius: 5px;
    background-color: #e9ecef;
}

/* Footer Styling (if you add a footer in HTML) */
footer {
    text-align: center;
    margin-top: 40px;
    padding-top: 20px;
    border-top: 1px solid var(--border-color);
    color: #6c757d;
    font-size: 0.9em;
}

/* Utility classes */
.section-divider {
    display: none; /* Hide the divider by default in a two-column layout */
}

@media (max-width: 850px) { /* Show divider when sections stack vertically */
    .section-divider {
        display: block;
    }
}
  </style>
</head>

<body>
  <div class="container mt-4">
    <header class="text-center mb-4">
      <h1>Pannello Admin</h1>
    </header>

    <main class="main-content-wrapper d-flex flex-wrap gap-4">
      <section class="form-section flex-fill" style="min-width: 350px;">
        <h2>Aggiungi / Modifica Libri</h2>
        <form id="bookForm">
          <input type="hidden" id="bookId" name="bookId" />

          <div class="form-group">
            <label for="title" class="small">Titolo</label>
            <input type="text" id="title" name="title" required class="form-control" placeholder="Inserisci il titolo del libro..." />
          </div>

          <div class="form-group">
            <label for="author" class="small">Autore</label>
            <input type="text" id="author" name="author" required class="form-control" placeholder="Inserisci il nome dell'autore..." />
          </div>

          <div class="form-group">
            <label for="description" class="small">Descrizione</label>
            <textarea id="description" name="description" rows="4" required class="form-control" placeholder="Fornisci una descrizione del libro..."></textarea>
          </div>

          <div class="form-group">
            <label for="pages" class="small">Pagine</label>
            <input type="number" id="pages" name="pages" min="1" required class="form-control" placeholder="Inserisci il numero di pagine..." />
          </div>

          <div class="form-group">
            <label for="publicationYear" class="small">Anno Pubblicazione</label>
            <input type="number" id="publicationYear" name="publicationYear" min="1000" max="2025" required class="form-control" placeholder="Inserisci l'anno di pubblicazione..." />
          </div>

          <button type="submit" class="btn btn-success">Salva Libro</button>
        </form>
      </section>

      <!-- Elenco libri esistenti-->
      <section class="list-section flex-fill">
        <h2>Elenco Libri Esistenti</h2>
        <div id="booksContainer" class="row">
          <template id="bookTemplate">
            <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
              <div class="book-card card h-100">
                <div class="card-body d-flex flex-column">
                  <h3 class="book-title card-title h5"></h3>
                  <p class="book-author card-text flex-grow-1"></p>
                  <div class="book-actions d-flex flex-wrap gap-2">
                    <button type="button" class="btn btn-primary btn-sm w-100 w-sm-auto" onclick="editBook(this)">
                      <span class="material-icons">edit</span> Modifica
                    </button>
                    <button type="button" class="btn btn-danger btn-sm w-100 w-sm-auto" onclick="deleteBook(this)"></button>
                      <span class="material-icons">delete</span> Elimina
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </template>
        </div>
      </section>
    </main>
  </div>

  <!--JS-->>
  <script> 
    class BookManager {
    constructor() {
        // Carica i libri dal localStorage o inizializza un array vuoto
        this.books = JSON.parse(localStorage.getItem('books')) || [];

        // Seleziona il form HTML per l'inserimento dei libri
        this.form = document.getElementById('bookForm');

        // Seleziona il contenitore dove verranno visualizzati i libri
        // Assicurati che questo ID corrisponda al contenitore previsto nel tuo HTML
        this.booksContainer = document.getElementById('booksContainer');

        // Configura i listener degli eventi per il form e le azioni sui libri
        this.setupEventListeners();

        // Visualizza i libri salvati al caricamento della pagina
        this.renderBooks();
    }

    setupEventListeners() {
        // Quando il form viene inviato, previeni il comportamento predefinito e salva il libro
        this.form.addEventListener('submit', (e) => {
            e.preventDefault(); // Previene l'invio predefinito del form (ricarica della pagina)
            this.saveBook();
        });

        // Usa la delegazione degli eventi per i pulsanti di modifica ed eliminazione nel booksContainer
        this.booksContainer.addEventListener('click', (e) => {
            // Controlla se l'elemento cliccato è un pulsante di modifica
            if (e.target.classList.contains('edit-btn')) {
                const bookId = e.target.dataset.id; // Ottieni l'ID del libro dall'attributo data-id
                this.fillFormForEdit(bookId);
            }
            // Controlla se l'elemento cliccato è un pulsante di eliminazione
            else if (e.target.classList.contains('delete-btn')) {
                const bookId = e.target.dataset.id; // Ottieni l'ID del libro dall'attributo data-id
                this.deleteBook(bookId);
            }
        });
    }

    saveBook() {
        // Ottieni i valori dai campi del form
        const bookId = document.getElementById('bookId').value;
        const book = {
            id: bookId || Date.now().toString(), // Usa l'ID esistente o genera un nuovo ID univoco
            title: document.getElementById('title').value,
            author: document.getElementById('author').value,
            description: document.getElementById('description').value,
            pages: parseInt(document.getElementById('pages').value), // Converti in numero
            publicationYear: parseInt(document.getElementById('publicationYear').value) // Converti in numero
        };

        // Se esiste un ID, aggiorna il libro esistente; altrimenti, aggiungi un nuovo libro
        if (bookId) {
            const index = this.books.findIndex(b => b.id === bookId);
            if (index !== -1) {
                this.books[index] = book;
            }
        } else {
            this.books.push(book);
        }

        // Salva i dati aggiornati nel localStorage e aggiorna la visualizzazione
        this.updateStorage();
        this.renderBooks();
        this.resetForm(); // Pulisci il form dopo il salvataggio
    }

    fillFormForEdit(id) {
        // Trova il libro da modificare e popola il form con i suoi dati
        const book = this.books.find(b => b.id === id);
        if (book) {
            document.getElementById('bookId').value = book.id;
            document.getElementById('title').value = book.title;
            document.getElementById('author').value = book.author;
            document.getElementById('description').value = book.description;
            document.getElementById('pages').value = book.pages;
            document.getElementById('publicationYear').value = book.publicationYear;
            // Opzionalmente, scorri fino al form dopo averlo riempito
            this.form.scrollIntoView({ behavior: 'smooth' });
        } else {
            console.error(`Libro con ID ${id} non trovato.`);
        }
    }

    deleteBook(id) {
        // Chiedi conferma all'utente prima di eliminare
        if (confirm('Sei sicuro di voler eliminare questo libro?')) {
            // Rimuovi il libro con l'ID corrispondente
            this.books = this.books.filter(book => book.id !== id);

            // Aggiorna il localStorage e aggiorna la visualizzazione
            this.updateStorage();
            this.renderBooks();
            alert('Libro eliminato con successo!');
        }
    }

    updateStorage() {
        // Salva l'array dei libri nel localStorage come stringa JSON
        localStorage.setItem('books', JSON.stringify(this.books));
    }

    resetForm() {
        // Pulisci tutti i campi del form e ripristina lo stato iniziale
        document.getElementById('bookId').value = ''; // Pulisci il campo ID nascosto
        this.form.reset(); // Reimposta tutti i campi del form
        document.getElementById('title').focus(); // Imposta il focus sul campo del titolo
    }

    renderBooks() {
        // Pulisci il contenuto attuale del contenitore dei libri
        this.booksContainer.innerHTML = '';

        // Se non ci sono libri, mostra un messaggio
        if (this.books.length === 0) {
            this.booksContainer.innerHTML = '<p class="no-books-message">Nessun libro presente. Aggiungi un nuovo libro utilizzando il modulo sopra.</p>';
            return;
        }

        // Genera l'HTML per ogni libro e inseriscilo nel contenitore
        const booksHtml = this.books.map(book => `
            <div class="book-card" data-id="${book.id}">
                <h3>${book.title}</h3>
                <p><strong>Autore:</strong> ${book.author}</p>
                <p><strong>Descrizione:</strong> ${book.description}</p>
                <p><strong>Pagine:</strong> ${book.pages}</p>
                <p><strong>Anno Pubblicazione:</strong> ${book.publicationYear}</p>
                <div class="book-actions">
                    <button class="btn btn-primary edit-btn" data-id="${book.id}">Modifica</button>
                    <button class="btn btn-danger delete-btn" data-id="${book.id}">Elimina</button>
                </div>
            </div>
        `).join(''); // Unisci tutte le stringhe HTML insieme

        this.booksContainer.innerHTML = booksHtml;
    }
}

// Crea un'istanza della classe BookManager per avviare l'applicazione
// Questo assicura che la classe venga eseguita non appena il DOM è caricato
document.addEventListener('DOMContentLoaded', () => {
    const bookManager = new BookManager();
});
  </script>
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
