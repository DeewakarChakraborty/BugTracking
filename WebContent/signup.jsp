<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Welcome - BugTracker.com/Sign Up!</title>
<link href="mystyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
<table align="center" width="700" bgcolor="#FFFFFF" height="713">

<tr><td height="70"><jsp:include page="header.jsp"/></td></tr>
<tr><td>
<jsp:include page="menu.jsp"/>
</td></tr>
<tr><td height="300" align="center" valign="top"><p style="background-color: rgb(192, 183, 116);">&nbsp;</p>
<%
if("blank".equals((String)request.getParameter("msg")))
out.println("<div class=errortext>Field Blank | Password and Re-Enter Password mismatch.</div>");
else if("error".equals((String)request.getParameter("msg")))
out.println("<div class=errortext>Login Already exists.</div>");
%>
    <form id="form1" name="form1" method="post" action="SignUp">
      <table width="300">
        <tr>
          <td colspan="2" bgcolor="#0063C6" height="20" class="whitehead">Sign Up Form</td>
          </tr>
        <tr>
          <td align="left">Login ID </td>
          <td><input type="text" name="loginid" size="20" class="inputtext"/></td>
        </tr>
        <tr>
          <td align="left">Password</td>
          <td><input type="password" name="password" size="20" class="inputtext"/></td>
        </tr>
        <tr>
          <td align="left">Re-Enter Password </td>
          <td><input type="password" name="repassword" size="20" class="inputtext"/></td>
        </tr>
        <tr>
          <td align="left">Name</td>
          <td><input type="text" name="name" size="20" class="inputtext"/></td>
        </tr>
        <tr>
          <td align="left">E-Mail</td>
          <td><input type="text" name="email" size="20" class="inputtext"/></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td><input type="hidden" name="type" value="User"/></td>
        </tr>
        <tr>
          <td colspan="2">
		  <input type="submit" value="Submit" class="inputtext" />
		  <input type="reset" value="Reset" class="inputtext"/>
		  </td>
          </tr>
      </table>
      </form>
    </td></tr>
<tr><td ><div align="center" class="greysmall"><hr />
All Rights are reserved with ABC Softwares Pvt. Ltd.</div></td></tr>
</table>
</body>
</html>
