<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>

<head>
  <title>BookHub</title>
  <meta charset="utf-8">  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" >
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" ></script>
  
  <script type="text/javascript" src="js/bookhub.js"></script>
  
</head>

<body>
	    <div class="container-fluid pb-3 rounded">
	    	<nav class="navbar navbar-expand-sm navbar-light bg-light border shadow-sm">
			  <div class="container-fluid mx-auto">
			    <img   src="img/Logo.png" alt="BookHub" width="60px" height="60px" border=1>			    
			    <div class="collapse navbar-collapse" id="mynavbar">
			      <ul class="navbar-nav me-auto p-1">			      
			        <li class="nav-item p-1 ms-4">
			          <a class="nav-link" href="homepage"><strong>Libreria</strong></a>
			        </li>
			        <li class="nav-item p-1 ms-4">
			          <a class="nav-link" href="challenge"><strong>Challenge</strong></a>
			        </li>
			      </ul>
		      	  <ul class="navbar-nav ml-auto p-1">
			        <li class="nav-item p-1">
			          <a class="nav-link" href="user-profile"><strong><%= session.getAttribute("username") %></strong></a>
			        </li>
			        <li class="nav-item p-1 ms-4 me-2">
			           <a class="nav-link" href="logout"><strong>Logout</strong></a>
			        </li>
			      </ul>
			    </div>
			  </div>
			</nav>
		</div>
	