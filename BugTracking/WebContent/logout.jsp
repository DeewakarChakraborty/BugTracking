<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%
session.invalidate();
RequestDispatcher rd=request.getRequestDispatcher("default.jsp");
rd.forward(request, response);
%>
