<%
	session=request.getSession();
	session.invalidate();
	response.sendRedirect("Control.do");
	%>
