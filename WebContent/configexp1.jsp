<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,connect.*" errorPage="" %>
<%
String prodid=(String)request.getParameter("prodid");
String expertid=(String)request.getParameter("expertid");
Connection con=ConnectionProvider.getConnection();
try{
	
	Statement stmt = con.createStatement();
	String query = "insert into experts values('"+expertid+"','"+prodid+"')";
	String query1="update bug set assign_to='"+expertid+"' where PRODID='"+prodid+"'";
	System.out.println("query1  :"+query1);
	con.setAutoCommit(false);
	int y=stmt.executeUpdate(query1);
	int x=stmt.executeUpdate(query);
	    con.commit();
	    if(x >0 && y > 0)
	    {
		RequestDispatcher rd=request.getRequestDispatcher("configexp.jsp?msg=success");
		rd.forward(request, response);
		}
	}catch(Exception e){
		con.rollback();
		RequestDispatcher rd=request.getRequestDispatcher("configexp.jsp?msg=error");
		rd.forward(request, response);
	}	
%>