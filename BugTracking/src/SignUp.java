import java.io.IOException;
import java.sql.*;

import javax.servlet.*;
import javax.servlet.http.*;

import connect.ConnectionProvider;

public class SignUp extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String name=(String)request.getParameter("name");
		String email=(String)request.getParameter("email");
		String loginid=(String)request.getParameter("loginid");
		String password=(String)request.getParameter("password");
		String repassword=(String)request.getParameter("repassword");


		String type=(String)request.getParameter("type");


		if("".equals(name)||"".equals(email)||"".equals(loginid)||"".equals(password)||"".equals(repassword)||!(password.equals(repassword))){
			if("User".equals(type)){
			RequestDispatcher rd=request.getRequestDispatcher("signup.jsp?msg=blank");
			rd.forward(request, response);
			}else{
				RequestDispatcher rd=request.getRequestDispatcher("addexpert.jsp?msg=blank");
				rd.forward(request, response);
			}
				
		}else{	
			System.out.println("inside else.................");
			try{
				Connection con=ConnectionProvider.getConnection();
				String insertquery = "insert into login values(?,?,?,?,?)" ;
			    PreparedStatement stmt = con.prepareStatement(insertquery);
			    stmt.setString(1,loginid);
			    stmt.setString(2,password);
			    stmt.setString(3,name);
			    stmt.setString(4,email);
			    stmt.setString(5,type);
				stmt.executeUpdate();
			    stmt.close();
				con.close();
				if("User".equals(type)){
					HttpSession session=request.getSession();
					session.setAttribute("login", "yes");
					session.setAttribute("type", type);
					session.setAttribute("user", name);
					session.setAttribute("loginid", loginid);
					RequestDispatcher rd=request.getRequestDispatcher("user.jsp");
					rd.forward(request, response);
				}else{
					RequestDispatcher rd=request.getRequestDispatcher("admin.jsp");
					rd.forward(request, response);
				}
					
			}
			catch(Exception e){
				
				if("User".equals(type)){
					RequestDispatcher rd=request.getRequestDispatcher("signup.jsp?msg=error");
					rd.forward(request, response);
				}else{
					RequestDispatcher rd=request.getRequestDispatcher("addexpert.jsp?msg=error");
					rd.forward(request, response);
				}
			}
		}
		
	}

}
