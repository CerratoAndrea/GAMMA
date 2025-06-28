
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ page import="com.its.bookhub.model.User" %>
<%@include file="navbar.jsp" %>


<div class="container-fluid pb-1">

  <div class="row">
  	<div class="col-3 container-fluid">
		<div class="card shadow">
			<div class="card-header"><h4>Profilo utente</h4></div>
				<div class="card-body">
					<div class="container p-0">
				      <form id="profileForm" action="saveProfile" method="post">  	
						<div class="p-2">
				          <label for="name"><b>Username</b></label>
				          <input type="text" class="form-control" id="name" name="name" value ="<%= userName %>">
				        </div>
				        <div class="p-2">
				          <label for="email"><b>Email</b></label>
				          <input type="email" class="form-control" id="email" name="email" value ="<%= userEmail %>">
				        </div>
				        <div class="p-2">
				          <label for="create-password"><b>Password</b></label>
				          <input type="password" class="form-control" id="create-password" name="create-password" value ="<%= userPassword %>">
				        </div>
				        <div class="p-2">
				          <label for="control-password"><b>Ripeti password</b></label>
				          <input type="password" class="form-control" id="control-password" name="control-password" value ="<%= userPassword %>">
				        </div>
				        <div class="p-2">
				          <font color="red" id="errorMsg">${errorMessage}</font>
				        </div>
				        <div class="p-2">
				          <button class="btn btn-primary" id="profileButton" style="width:100%">Aggiorna</button>
				        </div>
				        <input type="hidden" id="userId" name="id" value="<%= userId %>"/>
				        <input type="hidden" id="userId" name="type" value="<%= userType %>"/>
				      </form>
    				</div>
  				</div>
  			</div>
  		</div>
  	</div>
 </div>

 
  <script type="text/javascript">
		$('#profileButton').on('click', function (e) {	
		    e.preventDefault();
		    
		    $('#errorMsg').html("");
		
			var name = $('#name').val();
		    var email = $('#email').val();
			var createPassword = $('#create-password').val();
			var controlPassword = $('#control-password').val();
			
			if(!name){		
				$('#errorMsg').html("Inserire lo username");
				return false;
			}
			
			if(!email){
				$('#errorMsg').html("Inserire l'email")
				return false;
			}
				
			if(!createPassword){
				$('#errorMsg').html("Inserire la password")
				return false;
			}
			
			if(!controlPassword){
				$('#errorMsg').html("Ripetere la password")
				return false;
			}
			
			if(createPassword != controlPassword){
				$('#errorMsg').html("Le password non coincidono")
				return false;
			}
			
			$('#profileForm').submit();
			return true;
		});
    </script>

</body>

</html>