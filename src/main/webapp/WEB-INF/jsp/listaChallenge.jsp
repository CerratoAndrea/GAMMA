<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link href="css/styleChallengePage.css" rel="stylesheet">
<%@include file="navbar.jsp" %>
	    
	    
	    
	    <div class="container-fluid pb-1">		
	      <div class="row">
	        <div class="col-7 container-fluid">
	        <div class="card shadow">
				  <div class="card-header"><h4>Challenge</h4></div>
				  <div class="card-body">
				     <form id ="searchForm" action="challenge" method="get">
					    <div class="row form-row pb-0 align-items-center" style="height:100px;">					      
   							<div class="col-4">
							      <label for="type"><b>Challenge</b></label>
								  <select class="form-select" name="type" id="type">
									  <option value="tutte">Tutte le challenge</option>
									  <option value="mie">Le mie challenge</option>
									  <option value="aperte">Le challenge in corso</option>
									  <option value="chiuse">Le challenge terminate</option>
								   </select>
							</div>
						    <div class="col-5"></div>
						    <div class="col-3 pt-4">
						    	<button class="btn btn-light border" id="searchButton" style="width:100%">Filtra</button>	
						    </div>		
   						</div>
   					  </form>	    				    					
					  <hr class="hr hr-blurry" />
				  	<c:forEach var="ch" items="${Challenges}">
					  <div class="book-card mb-4" style="width:100%">
		                <div class="card-header row gray" style="height:60px">
		                	<div class="col-6" >
		                		<a href="visChallenge" class="badge red" style="height:40px"><h5>${ch.title}</h5></a>
		                	</div>			 
		                	<div class="col-6" >
		                	   <div>		                		
			                    <button onClick="javascript:classifica(${ch.id});" class="btn btn-light border float-end" ><strong>Classifica</strong></button>
			                   </div>
			    					<c:if test= "${ch.chPartecipation == true}">
			        					<div>	
					                      <button onClick="javascript:abbandona(${ch.id});" class="me-4 btn btn-light border float-end pr-4" ><strong>Abbandona</strong></button>
					                    </div>
			    					</c:if>			    					
									<c:if test= "${ch.chPartecipation == false}">
										<div>	
					                      <button onClick="javascript:partecipa(${ch.id});" class="me-4 btn btn-light border float-end pr-4" ><strong>Partecipa</strong></button>
					                    </div>
									</c:if>
			                   
		                	</div>
		                </div>
		                <div class="card-body fst-italic">${ch.description}</div>
		                <div class="card-body row">
		                	<div class="col-6" ><strong>${ch.numUsers} Partecipanti</strong></div>
		                    <div class="col-6 text-end"><strong>Termina il ${ch.endDate}</strong></div>
		                 </div>               
		              </div>
		              </c:forEach>
		            </div>
		          </div>
			</div>
			<div class="col-5 container-fluid">
			 <div class="card shadow">
				  <div class="card-header"><h4>Classifica "${ChallengeName}"</h4></div>
				  <div class="card-body">
					 <ul class="leaderboard-list">
					 <c:forEach var="us" items="${Users}" varStatus="loop">
		                <li class="leaderboard-item">
		                
		                  <c:choose>
	    					<c:when test= "${loop.count == 1}">
	        					<div class="leaderboard-rank gold">1</div>
	    					</c:when>
	    					<c:when test= "${loop.count == 2}">
	        					<div class="leaderboard-rank silver">2</div>
	    					</c:when>
	    					<c:when test= "${loop.count == 3}">
	        					<div class="leaderboard-rank bronze">3</div>
	    					</c:when>
							<c:otherwise>
								<div class="leaderboard-rank default">${loop.count}</div>
							</c:otherwise>
  						  </c:choose>
		                    <div class="leaderboard-info">
		                        <div class="leaderboard-name">  ${us.username} </div>
		                        <div class="leaderboard-details"> ${us.booksRead} libri completati</div>
		                    </div>
		                    <div class="leaderboard-score">${us.points} pt</div>
		                </li>
		              </c:forEach>
		            </ul>
		    	</div>
		    </div>
		  </div>
		</div>
	</div>
	
	<form id ="challengeForm" action="" method="get">
		<input type="hidden" id="challengeId"  name="ch_id" value=""/>
	</form>
	
	<script type="text/javascript">
	
		function classifica(idChallenge){
			$('#challengeId').val(idChallenge);
			$('#challengeForm').attr("action",'challenge');
			$('#challengeForm').attr("method",'get');
			$('#challengeForm').submit();
		}
		
		function partecipa(idChallenge){
			$('#challengeId').val(idChallenge);
			$('#challengeForm').attr("action",'joinChallenge');
			$('#challengeForm').attr("method",'post');
			$('#challengeForm').submit();
		}
		
		function abbandona(idChallenge){
			$('#challengeId').val(idChallenge);
			$('#challengeForm').attr("action",'leaveChallenge');
			$('#challengeForm').attr("method",'post');
			$('#challengeForm').submit();
		}
		
	</script>
  	
</body>

</html>