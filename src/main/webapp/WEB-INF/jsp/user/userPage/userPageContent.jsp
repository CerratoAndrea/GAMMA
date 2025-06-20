<!DOCTYPE html>
<lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BookHub - Profilo Utente</title>
    <link rel="stylesheet" href="style.css">
</head>
<style>

/* Stili Generali */
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f4f4f4; /* Sfondo generale */
    color: #333; /* Colore testo predefinito */
    line-height: 1.6;
}

/* Header */
header {
    background-color: #2c3e50; /* Colore scuro dell'header */
    color: white;
    padding: 15px 20px;
    display: flex;
    align-items: center;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.logo {
    display: flex;
    align-items: center;
}

.logo img {
    height: 50px;
    margin-right: 20px;
}

.logo h1 {
    font-size: 1.8em;
    margin: 0;
    color: white;
}

/* Contenitore Principale (simula il .container di Bootstrap) */
.main-content-wrapper {
    max-width: 1200px; /* Larghezza massima simile a quella usata con Bootstrap */
    margin: 40px auto; /* Centra il contenitore e aggiunge margine verticale */
    padding: 0 20px; /* Padding sui lati per evitare che il contenuto tocchi i bordi */
}

/* Titolo della Pagina */
.page-title {
    text-align: center;
    color: #3498db; /* Blu per il titolo */
    font-size: 2.2em;
    margin-bottom: 40px;
    padding-bottom: 10px;
    border-bottom: 2px solid #3498db; /* Bordo blu sotto il titolo */
    display: inline-block; /* Per far sì che il bordo sia solo sotto il testo */
    width: auto; /* Adatta la larghezza al testo */
}

/* Layout a due colonne per il profilo */
.profile-grid-container {
    display: flex; /* Utilizza flexbox per le due colonne */
    gap: 30px; /* Spazio tra le colonne */
    flex-wrap: wrap; /* Permette alle colonne di andare a capo su schermi più piccoli */
}

.profile-column {
    flex: 1; /* Permette alle colonne di occupare spazio equamente */
    min-width: 300px; /* Larghezza minima prima di andare a capo */
    margin-bottom: 20px; /* Margine inferiore per quando le colonne si impilano */
}

/* Stile comune per le "card" (sezioni individuali con sfondo bianco e ombra) */
.user-info-card,
.user-library,
.user-challenges {
    background-color: white;
    border-radius: 8px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1); /* Ombra più pronunciata come nel mockup admin */
    padding: 25px;
    height: 100%; /* Fa sì che le card abbiano la stessa altezza nella riga */
    box-sizing: border-box; /* Include padding e bordo nell'altezza */
}

.user-library, .user-challenges {
    margin-bottom: 30px; /* Spazio tra le sezioni della colonna destra */
}

/* Titoli delle sezioni all'interno delle colonne */
.user-info-card h2,
.user-library h2,
.user-challenges h2 {
    color: #3498db; /* Blu per i sottotitoli */
    font-size: 1.6em;
    margin-bottom: 25px;
    padding-bottom: 10px;
    border-bottom: 1px solid #ddd; /* Bordo sottile sotto i sottotitoli */
}

/* Stili per le informazioni utente (colonna sinistra) */
.user-info-card p {
    margin-bottom: 10px;
    color: #555;
    text-align: left; /* Allinea il testo a sinistra */
}

.user-info-card p strong {
    color: #2c3e50; /* Colore più scuro per le etichette */
}

.bio-section {
    margin-top: 20px;
    margin-bottom: 30px;
}

.bio-section .bio-label {
    text-align: left;
    font-weight: bold;
    margin-bottom: 8px;
    color: #2c3e50;
}

.bio-section textarea {
    width: 100%;
    padding: 12px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 1em;
    box-sizing: border-box;
    resize: vertical; /* Permette solo ridimensionamento verticale */
    min-height: 100px;
    background-color: #f9f9f9; /* Sfondo leggermente grigio per la textarea readonly */
    color: #444;
}

/* Stili per le statistiche utente */
.user-stats {
    display: flex;
    flex-wrap: wrap; /* Le statistiche vanno a capo se non c'è spazio */
    justify-content: center; /* Centra le statistiche */
    gap: 15px; /* Spazio tra gli elementi statistica */
    margin-top: 30px;
}

.stat-item {
    background-color: #ecf0f1; /* Grigio chiaro */
    padding: 15px 25px;
    border-radius: 8px;
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1); /* Ombra leggera */
    min-width: 160px; /* Larghezza minima per coerenza */
    text-align: center; /* Centra il testo all'interno dell'item */
    flex: 1; /* Permette agli item di crescere ma con min-width */
    max-width: calc(33.33% - 10px); /* Per 3 colonne su schermi larghi */
    box-sizing: border-box;
}

.stat-item h3 {
    color: #3498db; /* Blu per i titoli delle statistiche */
    margin: 0 0 8px;
    font-size: 1.1em;
}

.stat-item p {
    font-size: 1.8em;
    font-weight: bold;
    color: #2c3e50;
    margin: 0;
}

/* Stili per la griglia dei libri */
.books-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(150px, 1fr)); /* Griglia responsive */
    gap: 20px; /* Spazio tra i libri */
    text-align: center; /* Centra il messaggio di caricamento */
}

.books-grid .empty-message {
    grid-column: 1 / -1; /* Occupa tutta la larghezza della griglia */
    margin: 30px 0;
    color: #777;
    font-style: italic;
    font-size: 1.1em;
    text-align: center;
}

.book-item {
    background-color: #f9f9f9; /* Sfondo leggero per il libro */
    border: 1px solid #ddd;
    border-radius: 8px;
    padding: 15px;
    text-align: center;
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05); /* Ombra leggera */
    transition: transform 0.2s ease;
}

.book-item:hover {
    transform: translateY(-5px); /* Effetto hover leggero */
}

.book-item img {
    max-width: 100%;
    height: auto;
    border-radius: 4px;
    margin-bottom: 10px;
    display: block; /* Rimuove lo spazio extra sotto l'immagine */
    margin-left: auto;
    margin-right: auto;
}

.book-item h4 {
    margin: 0 0 5px;
    color: #333;
    font-size: 1em;
}

.book-item p {
    margin: 0;
    color: #666;
    font-size: 0.9em;
}

/* Stili per la lista delle challenge */
.challenges-list {
    /* Nessun display grid/flex qui, gli elementi sono gestiti individualmente */
    text-align: center; /* Centra il messaggio di caricamento */
}

.challenges-list .empty-message {
    margin: 30px 0;
    color: #777;
    font-style: italic;
    font-size: 1.1em;
    text-align: center;
}

.challenges-list .challenge-item {
    background-color: #f9f9f9;
    border: 1px solid #ddd;
    border-radius: 8px;
    padding: 15px;
    margin-bottom: 15px; /* Spazio tra le challenge */
    display: flex; /* Per allineare titolo e stato */
    justify-content: space-between; /* Spazia titolo/stato */
    align-items: center; /* Centra verticalmente gli elementi */
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
    transition: transform 0.2s ease;
}

.challenges-list .challenge-item:hover {
    transform: translateY(-3px); /* Effetto hover leggero */
}

.challenges-list .challenge-item h3 {
    margin: 0;
    color: #3498db;
    font-size: 1.1em;
}

.challenges-list .challenge-item p {
    margin: 0;
    color: #666;
    font-size: 0.9em;
}

</style>
<body>
   
    <header>
        <div class="logo">
            <img src="/src/main/webapp/img/Logo.png" alt="BookHub Logo"> 
            <h1>BookHub</h1>
        </div>
    </header>

    <main class="container my-4">
        <div class="user-profile-layout mx-auto row"> <div class="col-md-4 mb-4"> <section class="user-info-card h-100 p-4"> <h2 class="mb-3">Profilo Utente</h2>
                    <p class="text-start">Nome: <span id="userName">Nome Utente</span></p> <p class="text-start"></p>
                    <p class="text-start">Username: <span id="username">username_bookhub</span></p>
                    <p class="text-start">Email: <span id="userEmail">utente@example.com</span></p>
                    <div class="text-start mb-3"> <p class="fw-bold mb-1">Bio:</p>
                        <textarea id="userBioText" rows="6" class="form-control" readonly>
                            testo
                        </textarea>
                    </div>

                    <div class="user-stats d-flex flex-wrap justify-content-center mt-4">
                         <div class="stat-item p-3 m-2 text-center">
                             <h3>Libri Letti</h3>
                             <p id="booksRead" class="fs-4 fw-bold">25</p>
                         </div>
                         <div class="stat-item p-3 m-2 text-center">
                             <h3>Nella Mia Libreria</h3>
                             <p id="myLibraryBooks" class="fs-4 fw-bold">78</p>
                         </div>
                         <div class="stat-item p-3 m-2 text-center">
                             <h3>Challenge Partecipate</h3>
                             <p id="challengesParticipated" class="fs-4 fw-bold">5</p>
                         </div>
                    </div>
                </section>
            </div>

            <div class="col-md-8"> 
                <section class="user-library mb-4"> <h2 class="mb-3 pb-2 border-bottom">I Miei Libri</h2>
                    <div id="myBooksList" class="books-grid text-center">
                        <div class="book-item">
                            <img src="https://via.placeholder.com/100x150?text=Copertina" alt="Copertina Libro 1">
                            <h4>Titolo Libro 1</h4>
                            <p>Autore 1</p>
                        </div>
                        <div class="book-item">
                            <img src="https://via.placeholder.com/100x150?text=Copertina" alt="Copertina Libro 2">
                            <h4>Titolo Libro 2</h4>
                            <p>Autore 2</p>
                        </div>
                        <div class="book-item">
                            <img src="https://via.placeholder.com/100x150?text=Copertina" alt="Copertina Libro 3">
                            <h4>Titolo Libro 3</h4>
                            <p>Autore 3</p>
                        </div>
                        <div class="book-item">
                            <img src="https://via.placeholder.com/100x150?text=Copertina" alt="Copertina Libro 4">
                            <h4>Titolo Libro 4</h4>
                            <p>Autore 4</p>
                        </div>
                    </div>
                </section>

                <section class="user-challenges">
                    <h2 class="mb-3 pb-2 border-bottom">Challenge a cui sto partecipando</h2>
                    <div id="participatingChallengesList" class="challenges-list text-center">
                        <div class="challenge-item border p-3 rounded mb-2">
                            <h3>Challenge del Mese</h3>
                            <p>Stato: In corso</p>
                        </div>
                        <div class="challenge-item border p-3 rounded mb-2">
                            <h3>100 Libri in un Anno</h3>
                            <p>Progresso: 50/100</p>
                        </div>
                        <div class="challenge-item border p-3 rounded mb-2">
                            <h3>Fantasy Reading Challenge</h3>
                            <p>Stato: Completata</p>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </main>
</body>
</html>