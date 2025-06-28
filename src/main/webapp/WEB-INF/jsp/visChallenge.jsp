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
		        <button id ="dettaglioCloseButton" type="button" class="btn btn-secondary" data-dismiss="modal">Chiudi</button>		        
		      </div>
		    </div>
		  </div>
		</div>
		    					
		<form id ="challengeForm" action="updateChallenge" method="post">
		  <input type="hidden" id="challengeId" name="id" value="${challenge.id}"/>
	      <div class="row">
	      <div class="col-2 container-fluid">
			 	<div class="card shadow" style="height: 100%;">
				  <div class="card-header"><h4>Challenge</h4></div>
				  	<div class="card-body">
				  		<div class="container p-0">	  						
	    					<div class="row">
	    						<div class="p-2">
							      <label for="name"><b>Nome</b></label>
							      <p id="name">${challenge.title}</p>							      
							    </div>
	  						</div>
	  						<div class="row">
	    						<div class="p-2">
							      <label for="endDate"><b>Iniziata il</b></label>
								  <p id="endDate">${challenge.startDate}</p>
							    </div>
	  						</div>
	  						<div class="row">
	    						<div class="p-2">
							      <label for="endDate"><b>Termina il</b></label>
								  <p id="endDate">${challenge.endDate}</p>
							    </div>
	  						</div>
	  						<div class="row">
	    						<div class="p-2">
							      <label for="desc" class="form-label"><b>Descrizione</b></label>
							      <p id="desc">${challenge.description}</p>
							    </div>
	  						</div>
	  						<div class="p-2">
						    	<font color="red" id="errorMsg">${errorMessage}</font>
						    </div>
						    <c:if test="${!readOnly}">
		  						<div class="row">
		  							<div class="p-2">
		    							<button class="btn btn-primary" id="aggChallengeButton" style="width:100%" >Aggiorna la Challenge</button>
		    						</div>
		  						</div>
	  						</c:if>	 
	  						<c:if test="${readOnly}">
		  						<div class="row">
		  							<div class="p-2">
		    							<a href="challenge" class="btn btn-primary" role="button" style="width:100%">Torna alla lista</a>
		    						</div>
		  						</div>
	  						</c:if>	 						
	  						
	    				</div>
				  	</div>
				</div>
		    </div>
	        <div class="col-10 container-fluid">
			    <div class="card shadow" style="height: 100%;">
				  <div class="card-header"><h4>Libri della Challenge</h4></div>
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
				  						  <c:if test="${!readOnly}"> 
				  							<c:choose>
												    <c:when test= "${book.read}">
												        <input class="form-check-input" type="checkbox" value="${book.id}" name = "book" checked>
												    </c:when>
													<c:otherwise>
														<input class="form-check-input" type="checkbox" value="${book.id}" name = "book" >
													</c:otherwise>
											  </c:choose>
										  </c:if>
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
			 
			$('#dettaglioLibro').modal("show");
		};
		
		$('#dettaglioCloseButton').on('click', function (e) {	
			$('#dettaglioLibro').modal("hide");
		});

		
		$('#aggChallengeButton').on('click', function (e) {
		
			
			$('#challengeForm').submit();
		});
	</script>
  	
</body>

</html>