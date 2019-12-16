<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,connect.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Welcome - BugTracker.com/Reporting Bugs</title>
<link href="mystyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
<table align="center" width="700" bgcolor="#FFFFFF" height="779">

<tr><td height="70"><jsp:include page="header.jsp"/></td></tr>
<tr style="background-color: rgb(255, 128, 0); height: 60px"><td>
<jsp:include page="menu.jsp"/>
</td></tr>
<tr><td height="500" valign="top">
<table width="100%" align="center">
  <tr>
    <td width="200" valign="top">
	
	<table width=150 align="center">
	<%
	if("error".equals((String)request.getParameter("msg")))
	out.print("<div align=center class=errortext>Field Blank or Some Database Error!</div>");
	%>
      <tr>
        <td bgcolor="#F2F2F2" height="25" align="center"><a href="reportbug.jsp">Report A New Bug</a></td>
      </tr>
      <tr>
        <td bgcolor="#F2F2F2" height="25" align="center"><a href="viewbugs.jsp">View Status</a></td>
      </tr>
      <tr>
        <td bgcolor="#F2F2F2" height="25" align="center"><a href="logout.jsp">Logout</a></td>
      </tr>
      <tr>
        <td bgcolor="#F2F2F2" height="25">&nbsp;</td>
      </tr>
    </table>
	
	</td>
    <td><form id="form1" name="form1" method="post" action="ReportBug">
      <table width="400" cellpadding="3" align="center">
        <tr>
          <td colspan="2" class="whitehead" bgcolor="#0063C6" height="20" align="center">Reporting Bug</td>
          </tr>
        <tr>
          <td>Product</td>
          <td><select name="prodid" class="inputtext">
		  <%
		  try{
		  	Connection con=ConnectionProvider.getConnection();
		   	Statement stmt = con.createStatement();
		   	String query = "select * from products";
		   	ResultSet rs = stmt.executeQuery(query);
			while(rs.next())
			{
				out.print("<option value=");
				out.print(rs.getString("prodid")+">");
				out.print(rs.getString("prodname")+" - "+rs.getString("version"));
				out.print("</option>");		
			}
		}catch(Exception e){
			
		}  
		 %></select></td>
        </tr>
		<tr>
          <td>Environment</td>
          <td>
		  <select name="env" class="inputtext">
		  <option value="Windows 7">Windows 7</option>
		  <option value="Windows 2000">Windows 2000</option>
		  <option value="Solaris">Solaris</option>
		  <option value="Linux">Linux</option>
		  </select>		  </td>
        </tr>
		<tr>
          <td>Type</td>
          <td>
		  <select name="type" class="inputtext">
		  <option value="GUI">GUI</option>
		  <option value="Server">Server</option>
		  <option value="Database">Database</option>
		  <option value="Network">Network</option>
		  </select>		  </td>
        </tr>
        <tr>
          <td valign="top">Bug Description </td>
          <td><textarea cols="40" rows="8" class="inputtext" name="description"></textarea></td>
        </tr>
        <tr>
          <td colspan="2">
		  <input type="hidden" name="authorid" value="<%=(String)session.getAttribute("loginid")%>" />
  		  <input type="hidden" name="author" value="<%=(String)session.getAttribute("user")%>" />
		  </td>
          </tr>
        <tr>
          <td colspan="2" align="center"><input type="submit" value="Submit" class="inputtext" />
		  <input type="reset" value="Reset" class="inputtext"/>
		  </td>
          </tr>
      </table>
        </form>	</td>
  </tr>
</table>
</td></tr>
<tr><td ><div align="center" class="greysmall"><hr />
All Rights are reserved with ABC Softwares Pvt. Ltd.</div></td></tr>
</table>
</body>
</html>
