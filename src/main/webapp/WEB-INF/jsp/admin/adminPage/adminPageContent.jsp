<!DOCTYPE html>
<html lang="it">
<head>
  <!-- Imposta la codifica dei caratteri -->
  <meta charset="UTF-8">

  <!-- Rende la pagina responsive su dispositivi mobili -->
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- Titolo della pagina -->
  <title>Book Admin Panel</title>

  <!-- Collegamento a un file CSS -->
  <link rel="stylesheet" href="styleLoginAdmin.css">
</head>

<body>
  <div>
    <div>
      <h1>Pannello Admin</h1>
    </div>

    <div>
      <div>
        <h2>Aggiungi / Modifica Libri</h2>
      </div>

      <div>
        <form id="bookForm">
          <!-- Campo nascosto per l'ID del libro (usato per modifiche) -->
          <input type="hidden" id="bookId">

          <!-- Campo per il titolo del libro -->
          <div>
            <label for="title">Titolo</label>
            <input type="text" id="title" required>
          </div>

          <!-- Campo per l'autore -->
          <div>
            <label for="author">Autore</label>
            <input type="text" id="author" required>
          </div>

          <!-- Campo per la descrizione -->
          <div>
            <label for="description">Descrizione</label>
            <textarea id="description" rows="4" required></textarea>
          </div>

          <!-- Campo per il numero di pagine -->
          <div>
            <label for="page">Pagine</label>
            <input type="number" id="page" required>
          </div>

          <!-- Campo per l'anno di pubblicazione -->
          <div>
            <label for="pubblication">Anno Pubblicazione</label>
            <input type="number" id="pubblication" required>
          </div>

          <!-- Bottone per salvare il libro -->
          <button type="submit">Salva</button>
        </form>
      </div>
    </div>

    <!-- Contenitore per la lista dei libri -->
    <div id="booksContainer">
      <div id="booksContainer">
        <div>
          <!-- I libri verranno inseriti qui dinamicamente tramite JavaScript -->
        </div>
      </div>
    </div>

  <!-- Collegamento al file JS -->
  <script src="scriptAdminPage.js"></script>
</body>
</html>
