<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@include file="navbar.jsp" %>    

	    <div class="container-fluid pb-1">
	    
		
		<div class="modal fade" id="dettaglioLibro" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="dettTitle"></h5>
		      </div>
		      <div class="modal-body">
		        <div class="container-fluid">
				    <div class="row">
				      <div class="col-6"><img id="dettImg" src="" width="100%" height="100%" border="1"  ></div>
				      <div class="coL-6">
					      <div class="row pb-4">
					      	<div id="dettAuthor"></div>
					      </div>
					      <div class="row pb-4">
					      	<div id="dettYear"></div>
					      </div>
					      <div class="row pb-4">
					      	<div id="dettPages"></div>
					      </div>
					      <div class="row">
					      	<div id="dettType"></div>
					      </div>
					      
					      <form id="dettaglioForm" action="" method="post">
					      	<input type="hidden" id="dettId" name="bookId" value=""/>
					      </form>
				      </div>
				    </div>
				    <div class="row">
				      <p class="pt-3" id="dettSummary" ></p>
				    </div>
				</div>
		      </div>
		      <div class="modal-footer">
		        <button id ="dettaglioCloseButton" type="button" class="btn btn-secondary" data-dismiss="modal">Chiudi</button>		        
		      </div>
		    </div>
		  </div>
		</div>
		    					
		<form id ="bookForm" action="addBook" method="post">
	      <div class="row">
	      <div class="col-3 container-fluid">
			 	<div class="card shadow" style="height: 100%;">
				  <div class="card-header"><h4>Nuovo Libro</h4></div>
				  	<div class="card-body">
				  		<div class="container p-0">	  						
	    					<div class="row">
	    						<div class="p-2">
							      <label for="title"><b>Titolo</b></label>
							      <input type="text" class="form-control" id="title" name="title">
							    </div>
	  						</div>
	  						<div class="row">
	    						<div class="p-2">
							      <label for="author"><b>Autore</b></label>
								  <input id="author" class="form-control" type="text" name="author" />
							    </div>
	  						</div>
	  						<div class="row">
	  						<div class="p-2">
							      <label for="year"><b>Anno di Publicazione</b></label>
								  <input id="year" class="form-control" type="text" name="year" />
							    </div>
	  						</div>
	  						<div class="row">
	    						<div class="p-2">
							      <label for="pages"><b>Pagine</b></label>
								  <input id="pages" class="form-control" type="number" name="pages" />
							    </div>
	  						</div>
	  						<div class="row">
	    						<div class="p-2">
							      <label for="image"><b>URL copertina</b></label>
								  <input id="image" class="form-control" type="text" name="image" />
							    </div>
	  						</div>
	  						<div class="row">
	    						<div class="p-2">
							      <label for="type"><b>Genere</b></label>
								  <select class="form-select" name="type" id="type">
									  <option value="Narrativa">Narrativa</option>
									  <option value="Poesia">Poesia</option>
									  <option value="Saggio">Saggio</option>
									  <option value="Horror">Horror</option>
									  <option value="Saggio">Thriller</option>
									  <option value="Horror">Giallo</option>
								   </select>
							    </div>
	  						</div>
	  						<div class="row">
	    						<div class="p-2">
							      <label for="summary" class="form-label"><b>Trama</b></label>
  								  <textarea class="form-control" id="summary" rows="7" name="summary"></textarea>
							    </div>
	  						</div>
	  						<div class="p-2">
						    	<font color="red" id="errorMsg">${errorMessage}</font>
						    </div>
	  						<div class="row">
	  							<div class="p-2">
	    							<button class="btn btn-primary" id="createBookButton" style="width:100%" >Salva</button>
	    						</div>
	  						</div>
	    				</div>
				  	</div>
				</div>
		    </div>
		    <input type="hidden" id="bookId" name= "id" value=""/>
		  </form>
	        <div class="col-9 container-fluid">
			    <div class="card shadow" style="height: 100%;">
				  <div class="card-header"><h4>Libreria</h4></div>
				  <div class="card-body">					  
	  					<div class="row">
	    					<c:forEach var="book" items="${libBooks}">
		    					<div class="col m-0"  >
		      						<div class="card mx-auto mb-4" style="width:200px;">
				  						<div class="card-body image-wrapper">
											<img src="${book.image}" alt="${book.title}" width="100%" height="100%" border="1"  >
										</div>
				  						<div class="card-body pt-0">
				    						<a href="javascript:apriDettaglioLibro(${book.id})" ><h6 class="card-title">${book.title}</h6></a>
				    						<p class="card-text">${book.author}</p>
				  						</div>
				  						<div class="form-check mx-auto pb-2 ps-0">
				  						
					  						<c:choose>
												    <c:when test= "${book.deletable}">
												        <button class="btn btn-primary btn-sm" onClick="javascript:elimina(${book.id});" >Elimina</button>
												    </c:when>
													<c:otherwise>
														<button class="btn btn-secondary btn-sm" disabled>Elimina</button>
													</c:otherwise>
											  </c:choose>
										  
										</div>
									</div>
									<input type="hidden" id="bookId${book.id}" value="${book.id}"/>
									<input type="hidden" id="bookTitle${book.id}" value="${book.title}"/>
									<input type="hidden" id="bookAuthor${book.id}" value="${book.author}"/>
									<input type="hidden" id="bookYear${book.id}" value="${book.year}"/>
									<input type="hidden" id="bookSummary${book.id}" value="${book.summary}"/>
									<input type="hidden" id="bookPages${book.id}" value="${book.pages}"/>
									<input type="hidden" id="bookImg${book.id}" value="${book.image}"/>
									<input type="hidden" id="bookRead${book.id}" value="${book.read}"/>
									<input type="hidden" id="bookType${book.id}" value="${book.type}"/>
		    					</div>	 
		    				</c:forEach>
	  					</div>
					</div>
				</div>  
			  </div>			
		  </div>
		
		
	  </div>
	</div>
	
	<script type="text/javascript">
	
		function apriDettaglioLibro(bookId){
					
			$('#dettId').val($('#bookId'+bookId).val());
			$('#dettTitle').html($('#bookTitle'+bookId).val());
			$('#dettAuthor').html('<strong>Autore:</strong> '+$('#bookAuthor'+bookId).val());
			$('#dettYear').html('<strong>Anno:</strong> '+$('#bookYear'+bookId).val());			
			$('#dettPages').html('<strong>Pagine:</strong> '+$('#bookPages'+bookId).val());
			$('#dettSummary').html($('#bookSummary'+bookId).val());
			$('#dettImg').attr("src",$('#bookImg'+bookId).val());
			$('#dettType').html('<strong>Genere:</strong> '+$('#bookType'+bookId).val());
			
			 
			$('#dettaglioLibro').modal("show");
		};
		
		$('#dettaglioCloseButton').on('click', function (e) {	
			$('#dettaglioLibro').modal("hide");
		});

		
		$('#createBookButton').on('click', function (e) {
			e.preventDefault();
		    
		    $('#errorMsg').html("");
		
			var title = $('#title').val();
			var author = $('#author').val();
			var year = $('#year').val();
			var pages = $('#pages').val();
			var image = $('#image').val();
			var type = $('#type').val();
			var summary = $('#summary').val();
			
			if(!title){		
				$('#errorMsg').html("Inserire il titolo");
				return false;
			}
				
			if(!author){
				$('#errorMsg').html("Inserire l'autore")
				return false;
			}
			
			if(!pages){
				$('#errorMsg').html("Inserire il numero di pagine")
				return false;
			}
			
			if(!image){
				$('#errorMsg').html("Inserire l'URL della copertina del libro")
				return false;
			}
			
			if(!type){
				$('#errorMsg').html("Inserire il genere")
				return false;
			}
			
			if(!summary){
				$('#errorMsg').html("Inserire la trama")
				return false;
			}
			
			$('#bookForm').submit();
			return true;
		});
		
		function elimina(idBook){	
			
			$('#bookForm').attr("action",'deleteBook');
			$('#bookId').val(idBook);
			$('#bookForm').submit();
		}
	</script>
  	
</body>

</html>