<!DOCTYPE html>
<html lang="it">
<head>
  <!-- Imposta la codifica dei caratteri -->
  <meta charset="UTF-8">

  <!-- Rende la pagina responsive su dispositivi mobili -->
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- Titolo della pagina -->
  <title>Book Admin Panel</title>

  <!-- Importa il CSS di Bootstrap da CDN -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

  <!-- Collegamento a un file CSS personalizzato (opzionale) 
  <link rel="stylesheet" href="styleAdminPage.css">
  -->

</head>
<body class="bg-light"> <!-- Sfondo grigio chiaro con classe Bootstrap -->

  <!-- Contenitore principale con padding verticale -->
  <div class="container py-5">

    <!-- Titolo centrato con margine inferiore -->
    <div class="text-center mb-4">
      <h1 class="display-5">Pannello Admin</h1>
    </div>

    <!-- Card Bootstrap con ombra e margine inferiore -->
    <div class="card shadow mb-5">

      <!-- Intestazione della card con sfondo blu e testo bianco -->
      <div class="card-header bg-primary text-white">
        <h2 class="h5 mb-0">Aggiungi / Modifica Libri</h2>
      </div>

      <!-- Corpo della card che contiene il modulo -->
      <div class="card-body">
        <form id="bookForm">
          <!-- Campo nascosto per l'ID del libro (usato per modifiche) -->
          <input type="hidden" id="bookId">

          <!-- Campo per il titolo del libro -->
          <div class="mb-3">
            <label for="title" class="form-label">Titolo</label>
            <input type="text" id="title" class="form-control" required>
          </div>

          <!-- Campo per l'autore -->
          <div class="mb-3">
            <label for="author" class="form-label">Autore</label>
            <input type="text" id="author" class="form-control" required>
          </div>

          <!-- Campo per la descrizione -->
          <div class="mb-3">
            <label for="description" class="form-label">Descrizione</label>
            <textarea id="description" class="form-control" rows="4" required></textarea>
          </div>

          <!-- Campo per il numero di pagine -->
          <div class="mb-3">
            <label for="page" class="form-label">Pagine</label>
            <input type="number" id="page" class="form-control" required>
          </div>

          <!-- Campo per l'anno di pubblicazione -->
          <div class="mb-3">
            <label for="pubblication" class="form-label">Anno Pubblicazione</label>
            <input type="number" id="pubblication" class="form-control" required>
          </div>

          <!-- Bottone per salvare il libro -->
          <button type="submit" class="btn btn-success">Salva</button>
        </form>
      </div>
    </div>

    <!-- Contenitore per la lista dei libri, organizzato in righe con spaziatura verticale -->
    <div id="booksContainer" class="row gy-4">
    <div id = "booksContainer" class="border p-3 rounded">
     <div>

        
      <!-- I libri verranno inseriti qui dinamicamente tramite JavaScript -->
    </div>
  </div>

  <!-- Importa il bundle JavaScript di Bootstrap (inclusi i plugin) -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

  <!-- Collegamento al file JS -->
  <script src="scriptAdminPage.js"></script>
</body>
</html>
