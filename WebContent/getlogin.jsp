<%@ page import="java.util.ArrayList"%>
<%@ page import="com.jsoft.login.LoginMaster"%>
<jsp:useBean id="o" class="com.jsoft.login.Operation"></jsp:useBean>
<%
	try
	{
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		ArrayList<LoginMaster> arrFlag = o.checkLogin(username,password);
		if(arrFlag!=null && arrFlag.size()>0)
		{
			LoginMaster lb = null;
			lb = arrFlag.get(0);
			session.setAttribute("LOGINBEAN",lb);
			//response.sendRedirect("Control.do?_home");
		}
		else
		{
			%>
				<font color="red">Invalid Login Details</font>
			<%
		}
	}
	catch(Exception e)
	{
		out.println(e);
	}
%>