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