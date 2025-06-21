<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	    
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
					      <div class="row">
					      	<div id="dettPages"></div>
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
					
		        <button id="dettaglioAggiungiButton" type="button" class="btn btn-primary">Aggiungi alla tua libreria</button>
		        <button id="dettaglioEliminaButton" type="button" class="btn btn-primary">Togli dalla tua libreria</button>
		        <button id="dettaglioLettoButton" type="button" class="btn btn-primary">Letto</button>
		        <button id ="dettaglioCloseButton" type="button" class="btn btn-secondary" data-dismiss="modal">Chiudi</button>		        
		      </div>
		    </div>
		  </div>
		</div>
		    					
	      <div class="row">
	        <div class="col-6 container-fluid">
			    <div class="card shadow">
				  <div class="card-header"><h4>Libreria BookHub</h4></div>
				  <div class="card-body">
					  <div class="container p-0">
					  <form id ="searchForm" action="homepage" method="get">
					    <div class="row form-row pb-0 align-items-center" style="height:100px;">					      
   							<div class="col-4">
						      <label for="titolo">Titolo</label>
						      <input type="text" class="form-control" id="titolo" name="title">
						    </div>  
						    <div class="col-4">
						      <label for="autore">Autore</label>
						      <input type="text" class="form-control" id="autore" name="author">
						    </div>		
						    <div class="col-1"></div>
						    <div class="col-3 pt-4">
						    	<button class="btn btn-light border" id="searchButton" style="width:100%">Cerca</button>	
						    </div>		
   						</div>
   					  </form>
	    				    					
						<hr class="hr hr-blurry" />
						
	  					<div class="row">
	    					<c:forEach var="book" items="${libBooks}">
		    					<div class="col m-0"  >
		      						<div class="card mx-auto mb-4" style="width:200px;">
				  						<div class="card-body image-wrapper">
											<img src="img/${book.image}" alt="${book.title}" width="100%" height="100%" border="1"  >
										</div>
				  						<div class="card-body pt-0">
				    						<a href="javascript:apriDettaglioLibro(${book.id})" ><h6 class="card-title">${book.title}</h6></a>
				    						<p class="card-text">${book.author}</p>
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
		    					</div>	 
		    				</c:forEach>
	  					</div>
					</div>
				</div>  
			  </div>
			</div>
			<div class="col-6 container-fluid">
			 	<div class="card shadow">
				  <div class="card-header"><h4>I miei libri</h4></div>
				  	<div class="card-body">
				  		<div class="container p-0">
	  						<div class="row pb-0 mx-auto " style="height:100px;">
	  							<div class="col-1"></div>
	    						<div class="col-4 bg-light border rounded">
	    							<p><h3 class="text-center">${bookRead}</h3></p>
	    							<p><h6 class="text-center">LIBRI LETTI</h6></p>
	    						</div>
	    						<div class="col-2"></div>
	    						<div class="col-4 bg-light border rounded">
	    							<p><h3 class="text-center">${bookReading}</h3></p>
	    							<p><h6 class="text-center">IN LETTURA</h6></p>
	    						</div>
	    						<div class="col-1"></div>
	    					</div>
	    					
						    <hr class="hr hr-blurry" />
						    
	    					<div class="row">
	    						<c:forEach var="book" items="${myBooks}">
			    					<div class="col m-0"  >
			      						<div class="card mx-auto mb-4" style="width:200px;">
					  						<div class="card-body image-wrapper">
												<img src="img/${book.image}" alt="${book.title}" width="100%" height="100%" border="1"  >
											</div>
					  						<div class="card-body pt-0">
					    						<a href="javascript:apriDettaglioLibro('My'+${book.id})" ><h6 class="card-title">${book.title}</h6></a>
					    						<p class="card-text mb-0">${book.author}</p>
					    						<c:choose>
												    <c:when test="${book.read=='true'}">
												       <p class="text-end fw-light fst-italic mb-0">Letto</p>
												    </c:when>    
												    <c:otherwise>
												        <p class="text-end fw-light fst-italic mb-0">In lettura</p>
												    </c:otherwise>
												</c:choose>
					  						</div>
										</div>
										<input type="hidden" id="bookIdMy${book.id}" value="${book.id}"/>
										<input type="hidden" id="bookTitleMy${book.id}" value="${book.title}"/>
										<input type="hidden" id="bookAuthorMy${book.id}" value="${book.author}"/>
										<input type="hidden" id="bookYearMy${book.id}" value="${book.year}"/>
										<input type="hidden" id="bookSummaryMy${book.id}" value="${book.summary}"/>
										<input type="hidden" id="bookPagesMy${book.id}" value="${book.pages}"/>
										<input type="hidden" id="bookImgMy${book.id}" value="${book.image}"/>
										<input type="hidden" id="bookReadMy${book.id}" value="${book.read}"/>
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
			$('#dettImg').attr("src",'img/'+$('#bookImg'+bookId).val());
			
			var read = $('#bookRead'+bookId).val();
			console.log('read=#'+read+'#');
			if(read == null || read == ''){
				$("#dettaglioAggiungiButton").show();
				$("#dettaglioEliminaButton").hide();
				$("#dettaglioInLetturaButton").hide();
				$("#dettaglioLettoButton").hide();
			}
			else if(read == 'true'){
				$("#dettaglioAggiungiButton").hide();
				$("#dettaglioEliminaButton").show();
				$("#dettaglioInLetturaButton").hide();
				$("#dettaglioLettoButton").hide();
			}
			else{
				$("#dettaglioAggiungiButton").hide();
				$("#dettaglioEliminaButton").show();
				$("#dettaglioInLetturaButton").hide();
				$("#dettaglioLettoButton").show();
			}
			 
			$('#dettaglioLibro').modal("show");
		};
		
		$('#dettaglioCloseButton').on('click', function (e) {	
			$('#dettaglioLibro').modal("hide");
		});
		
		
		
		$('#dettaglioAggiungiButton').on('click', function (e) {	
			$('#dettaglioForm').attr("action",'add_book');
			$('#dettaglioForm').submit();
		});
		
		$('#dettaglioEliminaButton').on('click', function (e) {	
			$('#dettaglioForm').attr("action",'remove_book');
			$('#dettaglioForm').submit();
		});
		
		$('#dettaglioLettoButton').on('click', function (e) {	
			$('#dettaglioForm').attr("action",'read_book');
			$('#dettaglioForm').submit();
		});
	</script>
  	
</body>

</html>