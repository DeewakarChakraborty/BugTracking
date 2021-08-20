<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Welcome - BugTracker.com/Administrator</title>
<link href="mystyle.css" rel="stylesheet" type="text/css" />
</head>
<body background="images/waterbackground4.jpg">
<table align="center" width="700" bgcolor="#99CCFF" height="779">

<tr><td height="70"><jsp:include page="header.jsp"/></td></tr>
<tr><td>
<jsp:include page="menu.jsp"/>
</td></tr>
<tr><td height="470" valign="top">
<table width="100%">
  <tr>
    <td width="200" valign="top">
	<p>&nbsp;</p><p><br /></p><p><br /></p>
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
        <td bgcolor="#F2F2F2" height="25" align="center"><a href="">Logout</a></td>
      </tr>
      <tr>
        <td bgcolor="#F2F2F2" height="25">&nbsp;</td>
      </tr>
    </table></td>
    <td><p style="color: rgb(255, 120, 0);">As an Administrator you can</p>
      <ul> 
        <li style="color: rgb(255, 0, 0);">View all reported bugs, assign bugs to different Technical Experts to fix it. </li></ul><ul> 
        <li style="color: rgb(255, 0, 0);">Configure different Technical Experts for different Teams for a particular Software Product. </li> 
      </ul></td>
  </tr>
  <tr>
    <td valign="top">&nbsp;</td>
    <td><div align="center"><img src="images/bug.jpg" alt="bug" width="134" height="74" /></div></td>
  </tr>
</table>
</td></tr>
<tr><td ><div align="center" class="greysmall"><hr /><font color="#ff0000"> 
All Rights are reserved with Dcuat India Pvt. Ltd.</font></div></td></tr>
</table>
</body>
</html>
