import java.io.IOException;

import javax.servlet.*;
import javax.servlet.http.*;

import connect.ConnectionProvider;

import java.sql.*;
public class Login extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String loginid=request.getParameter("loginid");
		String password=request.getParameter("password");
		String type=request.getParameter("type");
		ServletContext ctx=getServletContext();

		boolean flag=false;
		try{
		

		    Connection con=ConnectionProvider.getConnection();
		    
		    	System.out.println("Connection is got  "+con);
		    		Statement stmt = con.createStatement();
		   	String query = "select * from login where loginid ='" + loginid + "' and type='"+type+"'";
		   	ResultSet rs = stmt.executeQuery(query);
			while(rs.next())
			{
				String pass= rs.getString("password");
			 	if( pass.equals(password)) {
					flag=true;
					break;
				}		
			}	
			if (flag){
			
				HttpSession session=request.getSession();
				session.setAttribute("login", "yes");
				session.setAttribute("type", rs.getString("type"));
				session.setAttribute("user", rs.getString("name"));
				session.setAttribute("loginid", rs.getString("loginid"));
				RequestDispatcher rd=null;
				if("Admin".equals(type))
					rd=request.getRequestDispatcher("admin.jsp");
				else if("Expert".equals(type))
					rd=request.getRequestDispatcher("expert.jsp");
				else if("User".equals(type))
					rd=request.getRequestDispatcher("user.jsp");
				
				rd.forward(request, response);
			}
			else{
				RequestDispatcher rd=request.getRequestDispatcher("login.jsp?msg=loginerror");
				rd.forward(request, response);
			}
		}catch(Exception e)
		{
			e.printStackTrace();	
		}
				
	}

}
