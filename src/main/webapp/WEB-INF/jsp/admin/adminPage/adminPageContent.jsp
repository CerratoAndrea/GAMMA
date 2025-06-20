<!DOCTYPE html>
<html lang="it">
<head>
  <meta charset="UTF-8">

  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <title>Book Admin Panel</title>

  <link rel="stylesheet" href="styleAdminPage.css">
</head>

<body>
  <div class="container">
    <header class="text-center">
      <h1>Pannello Admin</h1>
    </header>

    <main class="main-content-wrapper">
      <section class="form-section">
        <h2>Aggiungi / Modifica Libri</h2>
        <form id="bookForm">
          <input type="hidden" id="bookId" name="bookId" />

          <div class="form-group">
            <label for="title">Titolo</label>
            <input type="text" id="title" name="title" required aria-describedby="titleHelp" />
            <small id="titleHelp" class="form-text text-muted">Inserisci il titolo del libro.</small>
          </div>

          <div class="form-group">
            <label for="author">Autore</label>
            <input type="text" id="author" name="author" required aria-describedby="authorHelp" />
            <small id="authorHelp" class="form-text text-muted">Inserisci l'autore del libro.</small>
          </div>

          <div class="form-group">
            <label for="description">Descrizione</label>
            <textarea id="description" name="description" rows="4" required aria-describedby="descriptionHelp"></textarea>
            <small id="descriptionHelp" class="form-text text-muted">Fornisci una breve descrizione del libro.</small>
          </div>

          <div class="form-group">
            <label for="pages">Pagine</label>
            <input
              type="number"
              id="pages"
              name="pages"
              min="1"
              required
              aria-describedby="pagesHelp"
            />
            <small id="pagesHelp" class="form-text text-muted">Inserisci il numero di pagine.</small>
          </div>

          <div class="form-group">
            <label for="publicationYear">Anno Pubblicazione</label>
            <input
              type="number"
              id="publicationYear"
              name="publicationYear"
              min="1000"
              max="2025"
              required
              aria-describedby="publicationYearHelp"
            />
            <small id="publicationYearHelp" class="form-text text-muted">Inserisci l'anno di pubblicazione (es. 2023).</small>
          </div>

          <button type="submit">Salva Libro</button>
        </form>
      </section>

      <section class="list-section">
        <h2>Elenco Libri Esistenti</h2>
        <div id="booksContainer">
          </div>
      </section>
    </main>
  </div>

  <script src="scriptAdminPage.js"></script>
</body>
</html>