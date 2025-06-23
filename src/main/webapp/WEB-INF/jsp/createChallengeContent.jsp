<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<style>
:root {
    --primary-color: #3498db;
    --secondary-color: #2c3e50;
    --accent-color: #e74c3c;
    --light-gray: #f8f9fa;
    --border-color: #dee2e6;
    --text-primary: #333;
    --text-secondary: #666;
    --shadow: 0 2px 10px rgba(0,0,0,0.1);
}
/* Layout */
.container-fluid {
    max-width: 1400px;
    margin: 0 auto;
    padding: 2rem;
}
/* Cards */
.card {
    background: white;
    border-radius: 12px;
    box-shadow: var(--shadow);
    transition: all 0.3s ease;
}
.card:hover {
    transform: translateY(-5px);
    box-shadow: 0 5px 15px rgba(0,0,0,0.2);
}
.card-header {
    background: var(--light-gray);
    border-radius: 12px 12px 0 0;
    padding: 1.5rem;
}
.card-header h4 {
    margin: 0;
    color: var(--secondary-color);
    font-weight: 600;
}
.card-body {
    padding: 1.5rem;
}
/* Book Grid */
.image-wrapper {
    position: relative;
    overflow: hidden;
    border-radius: 8px;
    aspect-ratio: 3/4;
}
.image-wrapper img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: transform 0.3s ease;
}
.image-wrapper:hover img {
    transform: scale(1.05);
}
/* Form Elements */
.form-control {
    border: 2px solid var(--border-color);
    border-radius: 8px;
    padding: 0.75rem;
    transition: all 0.3s ease;
}
.form-control:focus {
    border-color: var(--primary-color);
    box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
}
textarea.form-control {
    min-height: 150px;
    resize: vertical;
}
/* Buttons */
.btn {
    border-radius: 8px;
    padding: 0.75rem 1.5rem;
    font-weight: 600;
    transition: all 0.3s ease;
}
.btn-primary {
    background: var(--primary-color);
    border: none;
}
.btn-primary:hover {
    background: #2980b9;
    transform: translateY(-2px);
}
.btn-secondary {
    background: var(--secondary-color);
    border: none;
}
/* Modal */
.modal-content {
    border-radius: 12px;
    overflow: hidden;
}
.modal-header {
    background: var(--light-gray);
    border: none;
    padding: 1.5rem;
}
.modal-body {
    padding: 2rem;
}
.modal-footer {
    border: none;
    padding: 1.5rem;
}
/* Book Details */
#dettTitle {
    font-size: 1.5rem;
    color: var(--text-primary);
    font-weight: 600;
}
#dettAuthor, #dettYear, #dettPages {
    color: var(--text-secondary);
    margin: 0.5rem 0;
}
#dettSummary {
    line-height: 1.6;
    color: var(--text-secondary);
}
			$('#dettTitle').html($('#bookTitle'+bookId).val());
			$('#dettAuthor').html('<strong>Autore:</strong> '+$('#bookAuthor'+bookId).val());
			$('#dettYear').html('<strong>Anno:</strong> '+$('#bookYear'+bookId).val());			
			$('#dettPages').html('<strong>Pagine:</strong> '+$('#bookPages'+bookId).val());
			$('#dettSummary').html($('#bookSummary'+bookId).val());
			$('#dettImg').attr("src",'img/'+$('#bookImg'+bookId).val());
			 
			$('#dettaglioLibro').modal("show");
		};
		
		$('#dettaglioCloseButton').on('click', function (e) {	
			$('#dettaglioLibro').modal("hide");
		});

		
		$('#createChallengeButton').on('click', function (e) {
			// controlli
			
			$('#challengeForm').submit();
		});
	</script>
  	
</body>

</html>