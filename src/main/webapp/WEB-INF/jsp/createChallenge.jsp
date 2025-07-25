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
		    					
		<form id ="challengeForm" action="saveChallenge" method="post">
	      <div class="row">
	      <div class="col-3 container-fluid">
			 	<div class="card shadow" style="height: 100%;">
				  <div class="card-header"><h4>Nuova Challenge</h4></div>
				  	<div class="card-body">
				  		<div class="container p-0">	  						
	    					<div class="row">
	    						<div class="p-2">
							      <label for="name"><b>Nome</b></label>
							      <input type="text" class="form-control" id="name" name="name">
							    </div>
	  						</div>
	  						<div class="row">
	    						<div class="p-2">
							      <label for="endDate"><b>Termina il</b></label>
								  <input id="endDate" class="form-control" type="date" name="endDate"/>
							    </div>
	  						</div>
	  						<div class="row">
	    						<div class="p-2">
							      <label for="desc" class="form-label"><b>Descrizione</b></label>
  								  <textarea class="form-control" id="desc" rows="15" name="desc"></textarea>
							    </div>
	  						</div>
	  						<div class="p-2">
						    	<font color="red" id="errorMsg">${errorMessage}</font>
						    </div>
	  						<div class="row">
	  							<div class="p-2">
	    							<button class="btn btn-primary" id="createChallengeButton" style="width:100%" >Crea la Challenge</button>
	    						</div>
	  						</div>
	    				</div>
				  	</div>
				</div>
		    </div>
	        <div class="col-9 container-fluid">
			    <div class="card shadow" style="height: 100%;">
				  <div class="card-header"><h4>Libri disponibili</h4></div>
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
				  						<div class="form-check mx-auto">
										  <input class="form-check-input" type="checkbox" value="${book.id}" name = "book" >
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
		</form>
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

		
		$('#createChallengeButton').on('click', function (e) {
			e.preventDefault();
		    
		    $('#errorMsg').html("");
		    
			var name = $('#name').val();
		    var endDate = $('#endDate').val();
			var desc = $('#desc').val();
			
			if(!name){		
				$('#errorMsg').html("Inserire il nome della challenge");
				return false;
			}
			
			if(!endDate){		
				$('#errorMsg').html("Inserire la data di fine della challenge");
				return false;
			}
			
			if(!desc){		
				$('#errorMsg').html("Inserire la descrizione della challenge");
				return false;
			}
			
			var bookChecked = $("#challengeForm input:checked").length > 0;
			if(!bookChecked){		
				$('#errorMsg').html("Selezionare almeno un libro");
				return false;
			}
			
			$('#challengeForm').submit();
		});
	</script>
  	
</body>

</html>