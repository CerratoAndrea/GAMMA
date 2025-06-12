<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	    
	    <div class="container-fluid pb-1">
	      <div class="row">
	        <div class="col-6 container-fluid">
			    <div class="card shadow">
				  <div class="card-header"><h4>Libreria BookHub</h4></div>
				  <div class="card-body">
					  <div class="container p-0">
					  <form id ="searchForm" action="homepage" method="post">
					    <div class="row form-row pb-0 align-items-center" style="height:100px;">					      
   							<div class="col-4">
						      <label for="titolo">Titolo</label>
						      <input type="text" class="form-control" id="titolo" name="titolo">
						    </div>  
						    <div class="col-4">
						      <label for="autore">Autore</label>
						      <input type="text" class="form-control" id="autore" name="autore">
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
				  						<div class="card-body">
				    						<h6 class="card-title">${book.title}</h6>
				    						<p class="card-text">${book.author}</p>
				  						</div>
									</div>
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
					  						<div class="card-body">
					    						<h6 class="card-title">${book.title}</h6>
					    						<p class="card-text">${book.author}</p>
					  						</div>
										</div>
		    						</div>	 
		    					</c:forEach>
	  						</div>
	    				</div>
				  	</div>
				</div>
		    </div>
		</div>
	</div>
  	
</body>

</html>