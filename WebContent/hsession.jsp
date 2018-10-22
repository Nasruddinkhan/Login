<%@ page import="java.util.ArrayList"%>
<%@ page import="com.jsoft.login.LoginMaster"%>
<jsp:useBean id="o" class="com.jsoft.login.Operation"></jsp:useBean>
<%
	String name=null;
	String username=null;
	LoginMaster _lb = (LoginMaster)session.getAttribute("LOGINBEAN");
	if(_lb==null)
	{
		response.sendRedirect("Control.do");
	}
	else
	{
		name= (String)_lb.getName();
		username = (String)_lb.getUsername();
	}
%>