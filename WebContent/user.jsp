<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
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
<tr style="background-color: rgb(255, 128, 0); height: 60px" ><td>
<jsp:include page="menu.jsp"/>
</td></tr>
<tr><td height="450" valign="top">
<table width="690" height="291">
  <tr>
    <td width="200" valign="top">
	<p>&nbsp;</p>
	<table width=150>
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
      <tr>
        <td bgcolor="#F2F2F2" height="25">&nbsp;</td>
      </tr>
    </table></td>
    <td><p><font color="#800080">Report a Bug:</font></p>
      <ul> 
        <li><font color="#ff0000">Select Product, Environment and Type for the Bug being reported by you.</font></li></ul><ul> 
        <li><font color="#ff0000">Try to describe your bug precisely and write the steps to reproduce the bug again.</font></li></ul><ul> 
        <li><font color="#ff0000">Also specify some erroneous behaviour of the program when bug appears. </font></li> 
      </ul></td>
  </tr>
  <tr>
    <td valign="top">&nbsp;</td>
    <td><div align="right"><img src="images/bug.jpg" width="134" height="74" /></div></td>
  </tr>
</table>
</td></tr>
<tr><td ><div align="center" class="greysmall"><hr /><font color="#ff0000"> 
All Rights are reserved with ABC Softwares Pvt. Ltd.</font></div></td></tr>
</table>
</body>
</html>
