<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ page import="com.its.bookhub.model.User" %>

<%@ page contentType="text/html; charset=UTF-8" %>

<html>

<head>
  <title>BookHub</title>
  <meta charset="utf-8">  
  <link rel="icon" href="img/favicon.png">
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" >
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" ></script>
  
</head>

<% User user = (User)session.getAttribute("user"); 
   String userName = user.getName();
   
   Boolean adminUser = false;
   if(user.getType().equals("admin"))
	   adminUser = true;
%>

<body>
	    <div class="container-fluid pb-3 rounded">
	    	<nav class="navbar navbar-expand-sm navbar-light bg-light border shadow-sm">
			  <div class="container-fluid mx-auto">
			    <img   src="img/Logo.png" alt="BookHub" width="60px" height="60px" border=1>			    
			    <div class="collapse navbar-collapse" id="mynavbar">
			      <ul class="navbar-nav me-auto p-1">			      
				    <% if(adminUser){ %>						    
					      <li class="nav-item p-1 ms-4">
					        <a class="nav-link" href="manageBook"><strong>Gestione libri</strong></a>
					      </li>
				    <% }
				       else { 	%>					    
						<li class="nav-item p-1 ms-4">
		          			<a class="nav-link" href="homepage"><strong>Libreria</strong></a>
		        		</li>
		        		<li class="nav-item dropdown p-1 ms-4">
		          			<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false"><strong>Challenge</strong></a>
	          				<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="challenge"><strong>Classifiche</strong></a></li>
	            				<li><a class="dropdown-item" href="createChallenge"><strong>Crea una challenge</strong></a></li>
	            			</ul>			          
		        		</li>
		        	<% } %>
			      </ul>
		      	  <ul class="navbar-nav ml-auto p-1">
			        <li class="nav-item p-1">
			          <a class="nav-link" href="user-profile"><strong><%= userName %></strong></a>
			        </li>
			        <li class="nav-item p-1 ms-4 me-2">
			           <a class="nav-link" href="javascript:logout()"><strong>Logout</strong></a>
			        </li>
			      </ul>
			    </div>
			  </div>
			</nav>
		</div>
		
		<div class="modal fade" id="logout" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title">Logout</h5>
		      </div>
		      <div class="modal-body">
		        <div class="row">
				      <p class="pt-3">Vuoi uscire dall'applicazione?</p>
				</div>
		      </div>
		      <div class="modal-footer">
		        <button id="logoutOkButton" type="button" class="btn btn-primary">Confermo</button>
		        <button id ="logoutCloseButton" type="button" class="btn btn-secondary" data-dismiss="modal">Annulla</button>		        
		      </div>		     
			 </div>
		    </div>
		  </div>
		  
		   <form id="logoutForm" action="logout" method="post">
		   </form>
		
		<script type="text/javascript">
		
			function logout(){
				$('#logout').modal("show");
			}
			
			$('#logoutCloseButton').on('click', function (e) {	
				$('#logout').modal("hide");
			});
			
			$('#logoutOkButton').on('click', function (e) {
				$('#logoutForm').submit();
			});
			
		</script>
	