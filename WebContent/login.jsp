<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*, javax.servlet.*" errorPage="" %>
<%
String login = (String)session.getAttribute("login");
if("yes".equals(login)){
	RequestDispatcher rd=null;
	
	if("Admin".equals((String)request.getParameter("type")) && "Admin".equals((String)session.getAttribute("type")))
		rd=request.getRequestDispatcher("admin.jsp");
	else if("Expert".equals((String)request.getParameter("type")) && "Expert".equals((String)session.getAttribute("type")))
		rd=request.getRequestDispatcher("expert.jsp");
	else if("User".equals((String)request.getParameter("type")) && "User".equals((String)session.getAttribute("type")))
		rd=request.getRequestDispatcher("user.jsp");
	else
		rd=request.getRequestDispatcher("loginerror.jsp");
	rd.forward(request, response);	
}
else{
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Welcome - BugTracker.com/Login</title>
<link href="mystyle.css" rel="stylesheet" type="text/css" />
</head>
<body background="images/waterbackground4.jpg">
<table align="center" width="700" bgcolor="#f2efb7" height="779">

<tr><td height="70"><jsp:include page="header.jsp"/></td></tr>
<tr style="background-color: rgb(255, 128, 0); height: 60px"><td>
<jsp:include page="menu.jsp"/>
</td></tr>
<tr><td height="470" valign="top">
<table width="690" height="467">
  <tr>
    <td align="center" bgcolor="" width="40%" >
	<table width="200" cellspacing="5" align="center" bgcolor="#99FFCC">
	<%
	if("Admin".equals((String)request.getParameter("type"))){
	out.println("<tr><td bgcolor=#F2F2F2 height=25>Sign in as Administrator</td></tr>");
	out.println("<tr><td><p align=justify>An Administrator can assign various reported bugs to different Technical Experts and update the status of bugs.</td></tr>");
	out.println("<tr><td bgcolor=#F2F2F2 height=25>&nbsp;</td></tr>");
	}
	else if("Expert".equals((String)request.getParameter("type"))){
	out.println("<tr><td bgcolor=#F2F2F2 height=25>Sign in as Technical Expert</td></tr>");
	out.println("<tr><td><p align=justify>A Technical Expert can give comments on the Reported Bugs and try to fix them.</td></tr>");
	out.println("<tr><td bgcolor=#F2F2F2 height=25>&nbsp;</td></tr>");
	}
	else if("User".equals((String)request.getParameter("type"))){
	out.println("<tr><td bgcolor=#F2F2F2 height=25>Sign in Reporting Bugs</td></tr>");
	out.println("<tr><td><p align=justify>A Normal User can sign in for Reporting Bugs to the Sofware Management Team.</td></tr>");
	out.println("<tr><td bgcolor=#F2F2F2 height=25>New User Please <a href=signup.jsp>Signup</a></td></tr>");
	}	
	%>
	</table>	</td>
    <td align="center"><form id="form" name="form" method="post" action="Login"><br /><br />
	<%
		if("loginerror".equals((String)request.getParameter("msg")))
		out.println("<div class=errortext align=center>Invalid Login ID or Password.</div>");
		%>  
      <table width="200" bgcolor="" cellpadding="3" align="center">
	   <tr>
          <td colspan="2" align="center" bgcolor="#0063C6" height="20" class="whitehead">Login</td>
        </tr>
        <tr>
          <td>Login ID</td>
          <td><input type="text" name="loginid" class="inputtext"/></td>
        </tr>
        <tr>
          <td>Password</td>
          <td><input type="password" name="password" class="inputtext"/></td>
        </tr>
        <tr>
          <td>Type</td>
          <td><%=(String)request.getParameter("type")%>
		  <input type="hidden" name="type" value="<%=(String)request.getParameter("type")%>" />        </tr>
		<tr>
          <td colspan="2" >&nbsp;</td>
          </tr>
        <tr>
          <td colspan="2" align="center">
		  <input type="submit" name="Submit" value="Submit" class="inputtext" />
		  <input type="reset" name="Reset" value="Reset" class="inputtext"/>		  </td>
          </tr>
      </table>
        </form>
      <p>&nbsp;</p>      </td>
  </tr>
  <tr>
    <td valign="middle" align="center">&nbsp;</td>
    <td><div align="center"><img src="images/BEETLE.TIF" width="134" height="74" /></div></td>
  </tr>
</table>
</td>
</tr>
<tr><td ><div align="center" class="greysmall"><hr />
All Rights are reserved with ABC Softwares Pvt. Ltd.</div></td></tr>
</table>
</body>
</html>
<%}%>
