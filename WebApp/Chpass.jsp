<HTML>
<HEAD>
<TITLE> Change Password </TITLE>
</HEAD>
<body>
<%
response.setHeader("Cache-Control", "private, no-store, no-cache, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setHeader("Expires", "0");
	
if(session.getAttribute("EmpID")==null)
	{
		response.sendRedirect("login.jsp");
	}
%>
<script  src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
    var res=0;
    $('#Myform').on('submit', function(e){ 
      e.preventDefault();
      var pas=$("#pass").val();
      
      var cfpas=$("#cfpass").val();
      if(pas==cfpas){
        res=true;
       formSubmit();
        return true;
      }
      else{
        $("#error").text("Password doesnt match!!!!");
        res=false;
        return false;
      }
      
    });     
  });
  function formSubmit(){
    var pass = document.getElementById("pass").value;
    $.ajax({
      url: 'http://localhost:8080/WebApp/Chpass',
      method: 'post',
      data: { pass: pass},
      success:
      function (response) {
        console.log("response->"+response);
       if(response==1){
        window.location.href = "http://localhost:8080/WebApp/roo.jsp";
       }
       else if(response==0){
        window.location.href = "http://localhost:8080/WebApp/ree.jsp";
       }

 },

      error: function (httpRequest, textStatus, errorThrown) {  // detailed error messsage 
                alert("Error: " + textStatus + " " + errorThrown + " " + httpRequest);
                
            }
      });
}

</script>

 


<h3>------ Change Password ------</h3>
<form   id="Myform">
<table>
<tr>
<td>Enter New Password :</td>
<td><input type="text" class="form-control" name="pass" id="pass" required></td></tr>
<tr>
<td>Confirm New Password :</td>
<td><input type="text" class="form-control" name="cfpass" id="cfpass" required></td></tr>
<td><span id="error" style="color:red"></span> </td>
</TABLE><br>
<input type="submit" value="Change">
</form>

</BODY>
</HTML>