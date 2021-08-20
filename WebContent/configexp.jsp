<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,connect.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Welcome - BugTracker.com/Administrator/Configuring Experts.</title>
<link href="mystyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
<table align="center" width="700" bgcolor="#FFFFFF">

<tr><td height="70"><jsp:include page="header.jsp"/></td></tr>
<tr><td>
<jsp:include page="menu.jsp"/>
</td></tr>
<tr><td height="300" valign="top">
<table width="100%">
  <tr>
    <td width="200" valign="top">
	<p>&nbsp;</p>
	<table width=150>
      <tr>
        <td bgcolor="#F2F2F2" height="25" align="center"><a href="bugsadmin.jsp">View Bugs</a></td>
      </tr>
      <tr>
      <td bgcolor="#F2F2F2" height="25" align="center"><a href="configexp.jsp">Configure Experts</a></td>
      </tr>
      <tr>
        <td bgcolor="#F2F2F2" height="25" align="center"><a href="addexpert.jsp">Add Expert</a></td>
      </tr>
      <tr>
        <td bgcolor="#F2F2F2" height="25">&nbsp;</td>
      </tr>
      <tr>
        <td bgcolor="#F2F2F2" height="25">&nbsp;</td>
      </tr>
    </table></td>
    <td valign="top">
	<p>&nbsp;</p>
	<form name="form1" method="post" action="configexp1.jsp">
	<table width="400" >
	
	<%
	if("success".equals((String)request.getParameter("msg"))){
	out.print("<tr><td colspan=2 bgcolor=#FFD7AE class=smalltext align=center height=25><font color=blue>Expert Configured Successfully!</font></td></tr>");
	}else if("error".equals((String)request.getParameter("msg"))){
		out.print("<tr><td colspan=2 bgcolor=#FFD7AE class=smalltext align=center height=25><font color=red>Expert already configured for this Product.</font></td></tr>");
	}
	
	
	%>
      <tr>
        <td colspan="2" bgcolor="#F2F2F2" height="25">Configuring Experts for Software Teams. </td>
      </tr>
      <tr>
        <td>Product</td>
        <td>
		<select name="prodid" class="inputtext">
		<%
		Connection con=ConnectionProvider.getConnection();
		Statement stmt = con.createStatement();
		String query = "select * from products";
		ResultSet rs = stmt.executeQuery(query);
		while(rs.next()){
			out.print("<option value="+rs.getString("prodid")+">"+rs.getString("prodname")+"-"+rs.getString("version")+"</option>");
		
		}
		rs.close();
		%>
		</select>		</td>
      </tr>
      <tr>
        <td>Technical Expert </td>
        <td>
		<select name="expertid" class="inputtext">
		<%
		query = "select * from login where type='Expert'";
		rs = stmt.executeQuery(query);
		while(rs.next()){
			out.print("<option value="+rs.getString("loginid")+">"+rs.getString("name")+"</option>");
		
		}
		rs.close();
		con.close();
		%>
		</select>		</td>
      </tr>
      <tr>
        <td colspan="2" align="center" bgcolor="#F2F2F2" height="25"><input type="submit" name="Submit" value="Submit" class="inputtext"/></td>
        </tr>
    </table>
	</form>		</td>
  </tr>
  <tr>
    <td valign="top">&nbsp;</td>
    <td valign="top"><div align="right"><img src="images/bug.jpg" width="134" height="74" /></div></td>
  </tr>
</table>
</td></tr>
<tr><td ><div align="center" class="greysmall"><hr />
All Rights are reserved with ABC Softwares Pvt. Ltd.</div></td></tr>
</table>
</body>
</html>
