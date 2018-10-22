<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<script type="text/javascript" src="resources/js/jquery-2.1.3.min.js"></script>
<script type="text/javascript">
function validForm(frm)
{
	var username = frm.username;
	var password = frm.password;
	if(username.value=="")
		{
			alert("Please enter username");
			username.focus();
			return false;
		}
	if(password.value=="")
	{
		alert("Please enter password");
		password.focus();
		return false;
	}
	return true;
}

$(document).ready(function(){
	//alert("In");
$("#frm_login").submit(function(){
	//alert("In submit");
	if(validForm(document.frm_login))
	{
		var datavalue=$("#frm_login").serialize();
		$.ajax({
			type: "post", 
			url: "Control.do",
			data:datavalue,
			success: function(msg) {
			
			if(msg.indexOf("Invalid") >= 0)
			{
				$("#errmsg").html(msg).slideDown('slow');
			}
			else
			{
				$("#loginform").hide();
				window.location.href="Control.do?_home";
				//$("#success").html(msg).show();
			}
			},
			beforeSend: function(){
			$('#btn_submit').attr("disabled", true);
			$('#btn_submit').attr("value", "Please Wait...");
			},
			complete:function(){$('#frm_login').each(function(){
				this.reset();   //Here form fields will be cleared.
				$('#btn_submit').attr("disabled", false);
				$('#btn_submit').attr("value", "Login");
			});
			}
			});
	}
	});
});

</script>
</head>
<body>
<form name="frm_login" id="frm_login" onsubmit="return false;">
<div id="errmsg"></div>
<table align="center" width="400" bordercolor="#CCCCCC" border="1" style="border-collapse: collapse;" cellpadding="3px">
	<tr bgcolor="#000000">
		<td colspan="2" align="center"><font color="#ffffff">Login Here</font></td>
	</tr>
	<tr>
		<td>Username:</td>
		<td>
			<input type="text" name="username" id="username"/>
		</td>
	</tr>
	<tr>
		<td>Password:</td>
		<td><input type="password" name="password" id="password"/></td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" name="btn_submit" id="btn_submit" value="Login"/>
		<input type="hidden" name="_gtlogin" id="_gtlogin"/>
		</td>
	</tr>
</table>
</form>
</body>
</html>