<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,connect.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitionasl//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Welcome - BugTracker.com/List of Bugs</title>
<link href="mystyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
<table align="center" width="700" bgcolor="#FFFFFF" height="779">
<tr><td height="70"><jsp:include page="header.jsp"/></td></tr>
<tr style="background-color: rgb(255, 128, 0); height: 60px"><td>
<jsp:include page="menu.jsp"/>
</td></tr>

<tr><td height="300" valign="top"><br />
<table align="center" cellpadding="2" width="691">
<tr bgcolor="#0054A8" class="whitetext" align="center">  
<td>Bug ID</td>
<td>Product</td>
<td>Env.</td>
<td>Type</td>
<td>Synopsis</td>
<td>Status</td>
<td>&nbsp;</td>
</tr>
<%
try{
String u=(String)session.getAttribute("loginid");
System.out.println(u);
	Connection con=ConnectionProvider.getConnection();
	Statement stmt = con.createStatement();
	String query = "select * from bug where AUTHORID='"+u+"' order by bugid asc";
	ResultSet rs = stmt.executeQuery(query);
	int i=2;
	while(rs.next()){
	if(i%2==0)
	out.println("<tr bgcolor=#CEE7FF>");
	else
	out.println("<tr bgcolor=#E8F3FF >");
	i++;
	out.print("<td class=smalltext>"+rs.getString("bugid")+"</td>");
	out.print("<td class=smalltext>"+rs.getString("prodname")+"</td>");
	out.print("<td class=smalltext>"+rs.getString("env")+"</td>");
	out.print("<td class=smalltext>"+rs.getString("type")+"</td>");
	out.print("<td class=smalltext>");
	String des=rs.getString("description");
	if(des.length()>40)
	des=des.substring(0,40)+". . .";
	out.println(des);
	out.print("</td>");
	out.print("<td class=smalltext>"+rs.getString("status")+"</td>");
	out.print("<td class=smalltext><a href='bugdetails.jsp?bugid="+rs.getString("bugid")+"'>Detail</a></td>");	
	out.println("</tr>");		
	}
	out.println("</table>");
	out.print("<div align=left> Total Bugs: "+(i-2)+"</div>");
}catch(Exception e){
	System.out.print(e);
}  
%>

<div align="center"><hr width="100" /><a href="user.jsp">Back</a><hr width="100" /></div>
</td></tr>
<tr><td ><div align="center" class="greysmall"><hr /><font color="#ff0000"> 
All Rights are reserved with ABC Softwares Pvt. Ltd.</font></div></td></tr>
</table>
</body>
</html>
