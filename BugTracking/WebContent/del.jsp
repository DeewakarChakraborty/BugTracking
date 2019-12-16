<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,connect.*" errorPage="" %>
<%
String bugid=(String)request.getParameter("bugid");
try{
	Connection con=ConnectionProvider.getConnection();
	Statement stmt = con.createStatement();
	String query = "delete from bug where bugid="+bugid;
	stmt.executeUpdate(query);
	query="delete from solutions where bugid="+bugid;
	stmt.executeUpdate(query);
		RequestDispatcher rd=request.getRequestDispatcher("bugsadmin.jsp");
		rd.forward(request, response);
	}catch(Exception e){
		RequestDispatcher rd=request.getRequestDispatcher("bugsadmin.jsp");
		rd.forward(request, response);
	}	
%>