class BookManager {
    constructor() {
        // Carica i libri dal localStorage o inizializza un array vuoto
        this.books = JSON.parse(localStorage.getItem('books')) || [];

        // Seleziona il modulo HTML per l'inserimento dei libri
        this.form = document.getElementById('bookForm');

        // Seleziona il contenitore dove verranno mostrati i libri
        this.booksContainer = document.getElementById('booksContainer');

        // Imposta gli event listener per il modulo
        this.setupEventListeners();

        // Mostra i libri salvati nella pagina
        this.renderBooks();

        this.editBook();

        this.deleteBook();
    }

    setupEventListeners() {
        // Quando il modulo viene inviato, impedisce il comportamento predefinito e salva il libro
        this.form.addEventListener('submit', (e) => {
            e.preventDefault();
            this.saveBook();
        });
    }

    saveBook() {
        // Ottiene i valori dal modulo
        const bookId = document.getElementById('bookId').value;
        const book = {
            id: bookId || Date.now().toString(), // Usa un ID esistente o ne genera uno nuovo
            title: document.getElementById('title').value,
            author: document.getElementById('author').value,
            description: document.getElementById('description').value,
            page: document.getElementById('page').value,
            pubblication: document.getElementById('pubblication').value
        };

        // Se l'ID esiste, aggiorna il libro esistente, altrimenti aggiunge un nuovo libro
        if (bookId) {
            const index = this.books.findIndex(b => b.id === bookId);
            this.books[index] = book;
        } else {
            this.books.push(book);
        }

        // Salva i dati aggiornati e aggiorna la visualizzazione
        this.updateStorage();
        this.renderBooks();
        this.resetForm();
    }

    editBook(id) {
        // Trova il libro da modificare e riempie il modulo con i suoi dati
        const book = this.books.find(b => b.id === id);
        document.getElementById('bookId').value = book.id;
        document.getElementById('title').value = book.title;
        document.getElementById('author').value = book.author;
        document.getElementById('description').value = book.description;
        document.getElementById('page').value = book.page;
        document.getElementById('pubblication').value = book.pubblication;

        // Mostra un messaggio di conferma
        alert('Libro modificato con successo');
    }

    deleteBook(id) {
        // Chiede conferma all'utente prima di eliminare il libro
        if (confirm('Sei sicuro di voler eliminare questo libro?')) {
            // Rimuove il libro con l'ID corrispondente
            this.books = this.books.filter(book => book.id !== id);

            // Aggiorna il localStorage e la visualizzazione
            this.updateStorage();
            this.renderBooks();

            // Mostra un messaggio di conferma
            alert('Libro eliminato con successo');
        }
    }

    updateStorage() {
        // Salva l'array dei libri nel localStorage come stringa JSON
        localStorage.setItem('books', JSON.stringify(this.books));
    }

    resetForm() {
        // Svuota tutti i campi del modulo e reimposta lo stato iniziale
        document.getElementById('bookId').value = '';
        document.getElementById('title').value = '';
        document.getElementById('author').value = '';
        document.getElementById('description').value = '';
        document.getElementById('page').value = '';
        document.getElementById('pubblication').value = '';
        this.form.reset();
        document.getElementById('title').focus();
    }

    renderBooks() {
        // Genera l'HTML per ogni libro e lo inserisce nel contenitore
        this.booksContainer.innerHTML = this.books.map(book => `
            <div class="book-card">
                <h3>${book.title}</h3>
                <p><strong>Autore:</strong> ${book.author}</p>
                <p><strong>Descrizione:</strong> ${book.description}</p>
                <p><strong>Pagine:</strong> ${book.page}</p>
                <p><strong>Anno Pubblicazione:</strong> ${book.pubblication}</p>
                <button onclick="bookManager.editBook('${book.id}')" class="btn btn-primary">Edit</button>
                <button onclick="bookManager.deleteBook('${book.id}')" class="btn btn-danger">Delete</button>
            </div>
        `).join('');
    }
}

// Crea un'istanza della classe BookManager per avviare l'app
const bookManager = new BookManager();
