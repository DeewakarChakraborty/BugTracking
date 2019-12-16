import java.io.IOException;

import java.sql.*;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connect.ConnectionProvider;

public class ReportBug extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String prodid=(String)request.getParameter("prodid");
		String prodname="";
		String env=(String)request.getParameter("env");
		String type=(String)request.getParameter("type");
		String description=(String)request.getParameter("description");
		String authorid=(String)request.getParameter("authorid");
		String author=(String)request.getParameter("author");
		if("".equals(description)){
			RequestDispatcher rd=request.getRequestDispatcher("reportbug.jsp?msg=error");
			rd.forward(request, response);
		}
		else{
			
		try{
			Connection con=ConnectionProvider.getConnection();
		    Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery("select max(bugid) from bug");
			int bugid;
			if(rs.next()){
				bugid=rs.getInt(1);
			}else{
				bugid=0;
			}
			bugid++;
			rs.close();
			
			rs=stmt.executeQuery("select prodname, version from products where prodid='"+prodid+"'");
			if(rs.next()){
				prodname=rs.getString(1)+" - "+rs.getString(2);
			}
			rs.close();
			stmt.close();
		    			
			String insertquery = "insert into bug values(?,?,?,?,?,?,?,?,?,?,?,?)" ;
			PreparedStatement prestmt = con.prepareStatement(insertquery);
		    
			prestmt.setInt(1,bugid);
		    prestmt.setString(2,authorid);
		    prestmt.setString(3,author);
		    prestmt.setString(4,prodid);
		    prestmt.setString(5,prodname);
		    prestmt.setString(6,env);
		    prestmt.setString(7,type);
		    prestmt.setString(8,description);
		    
		    Calendar cal = new GregorianCalendar();
		    int year = cal.get(Calendar.YEAR);            
		    int mm = cal.get(Calendar.MONTH);           
		    int dd = cal.get(Calendar.DAY_OF_MONTH);
		    java.sql.Date date=new java.sql.Date(year, mm, dd);
		    System.out.println(date);
		    prestmt.setDate(9,date);
		    prestmt.setString(10,"-");
		    prestmt.setString(11,"New");
		    prestmt.setString(12,"-");
		    prestmt.executeUpdate();
		    prestmt.close();
			con.close();
			
			RequestDispatcher rd=request.getRequestDispatcher("viewbugs.jsp");
			rd.forward(request, response);
			
		}catch(Exception e){			System.out.println(e);
			RequestDispatcher rd=request.getRequestDispatcher("reportbug.jsp?msg=error");
			rd.forward(request, response);
		}
		}

	}

}
