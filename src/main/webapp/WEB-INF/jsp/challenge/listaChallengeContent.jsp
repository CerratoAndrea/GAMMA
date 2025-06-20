<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	    
	    <link href="css/styleChallengePage.css" rel="stylesheet">
	    
	    <div class="container-fluid pb-1">
		    					
	      <div class="row">
	        <div class="col-7 container-fluid">
	        <div class="card shadow">
				  <div class="card-header"><h4>Challenge</h4></div>
				  <div class="card-body">
					  <div class="book-card mb-4" style="width:100%">
		                <div class="card-header row gray" style="height:60px">
		                	<div class="col-6" >
		                		<a href="visChallenge" class="badge red" style="height:40px"><h5>I classici del 900</h5></a>
		                	</div>			 
		                	<div class="col-6" >
		                	   <div>		                		
			                    <button onClick="javascript:classifica(1);" class="btn btn-light border float-end" ><strong>Classifica</strong></button>
			                   </div>
			                   <div>	
			                    <button onClick="javascript:partecipa(1);" class="me-4 btn btn-light border float-end pr-4" ><strong>Partecipa</strong></button>
			                   </div>
		                	</div>
		                </div>
		                <div class="card-body fst-italic">La challenge sfida i partecipanti alla lettura di alcuni dei classici del 900 ....</div>
		                <div class="card-body row">
		                	<div class="col-6" ><strong>5 Partecipanti</strong></div>
		                    <div class="col-6 text-end"><strong>Termina il 31/12/2025</strong></div>
		                </div>                
		              </div>
		
		              <div class="book-card mb-4" style="width:100%">
		                <div class="card-header row gray" style="height:60px">
		                	<div class="col-6" >
		                		<a href="visChallenge" class="badge red" style="height:40px"><h5>Stephen King challenge</h5></a>
		                	</div>			 
		                	<div class="col-6" >
		                	   <div>		                		
			                    <button onClick="javascript:classifica(2);" class="btn btn-light border float-end" ><strong>Classifica</strong></button>
			                   </div>
			                   <div>	
			                    <button onClick="javascript:abbandona(2);" class="me-4 btn btn-light border float-end pr-4" ><strong>Abbandona</strong></button>
			                   </div>
		                	</div>
		                </div>
		                <div class="card-body fst-italic">La challenge propone la lettura di tutti i libri della enorme produzione di Stephen King ....</div>
		                <div class="card-body row">
		                	<div class="col-6" ><strong>12 Partecipanti</strong></div>
		                    <div class="col-6 text-end"><strong>Termina il 15/08/2025</strong></div>
		                </div>                
		              </div>
		              
		              <div href="visChallenge" class="book-card mb-4" style="width:100%">
		                <div class="card-header row gray" style="height:60px">
		                	<div class="col-6" >
		                		<a href="visChallenge" class="badge red" style="height:40px"><h5>Horror</h5></a>
		                	</div>			 
		                	<div class="col-6" >
		                	   <div>		                		
			                    <button onClick="javascript:classifica(3);" class="btn btn-light border float-end" ><strong>Classifica</strong></button>
			                   </div>
			                   <div>	
			                    <button onClick="javascript:partecipa(3);" class="me-4 btn btn-light border float-end pr-4" ><strong>Partecipa</strong></button>
			                   </div>
		                	</div>
		                </div>
		                <div class="card-body fst-italic">In questa challenge sono stati selezionati alcuni dei più famosi libri horror della letteratura moderna ....</div>
		                <div class="card-body row">
		                	<div class="col-6" ><strong>7 Partecipanti</strong></div>
		                    <div class="col-6 text-end"><strong>Termina il 31/01/2026</strong></div>
		                </div>                
		              </div>
		            </div>
		          </div>
			</div>
			<div class="col-5 container-fluid">
			 <div class="card shadow">
				  <div class="card-header"><h4>Classifica "I classici del 900"</h4></div>
				  <div class="card-body">
					 <ul class="leaderboard-list">
		                <li class="leaderboard-item">
		                    <div class="leaderboard-rank gold">1</div>
		                    <div class="leaderboard-info">
		                        <div class="leaderboard-name">Marco Rossi</div>
		                        <div class="leaderboard-details">15 libri completati</div>
		                    </div>
		                    <div class="leaderboard-score">850 pt</div>
		                </li>
		                <li class="leaderboard-item">
		                    <div class="leaderboard-rank silver">2</div>
		                    <div class="leaderboard-info">
		                        <div class="leaderboard-name">Laura Bianchi</div>
		                        <div class="leaderboard-details">12 libri completati</div>
		                    </div>
		                    <div class="leaderboard-score">720 pt</div>
		                </li>
		                <li class="leaderboard-item">
		                    <div class="leaderboard-rank bronze">3</div>
		                    <div class="leaderboard-info">
		                        <div class="leaderboard-name">Giuseppe Verdi</div>
		                        <div class="leaderboard-details">10 libri completati</div>
		                    </div>
		                    <div class="leaderboard-score">650 pt</div>
		                </li>
		                <li class="leaderboard-item">
		                    <div class="leaderboard-rank default">4</div>
		                    <div class="leaderboard-info">
		                        <div class="leaderboard-name">Anna Neri</div>
		                        <div class="leaderboard-details">8 libri completati</div>
		                    </div>
		                    <div class="leaderboard-score">520 pt</div>
		                </li>
		                <li class="leaderboard-item">
		                    <div class="leaderboard-rank default">5</div>
		                    <div class="leaderboard-info">
		                        <div class="leaderboard-name">Federico Russo</div>
		                        <div class="leaderboard-details">7 libri completati</div>
		                    </div>
		                    <div class="leaderboard-score">480 pt</div>
		                </li>
		            </ul>
		    	</div>
		    </div>
		  </div>
		</div>
	</div>
	
	<script type="text/javascript">
	
		function classifica(idChallenge){
			alert("classifica button "+idChallenge);
		}
		
		function partecipa(idChallenge){
			alert("partecipa button "+idChallenge);
		}
		
		function abbandona(idChallenge){
			alert("abbandona button "+idChallenge);
		}
		
	</script>
  	
</body>

</html>