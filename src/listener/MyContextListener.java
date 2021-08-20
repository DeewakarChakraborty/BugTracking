package listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import connect.ConnectionProvider;
import create.CreateTable;

public class MyContextListener implements ServletContextListener
{
	public void contextDestroyed(ServletContextEvent sce) 
	{
		
		System.out.println("Context is destryoed......................");
	}

	public void contextInitialized(ServletContextEvent sce) 
	{
		ServletContext ctx=sce.getServletContext();
		
		String path=ctx.getRealPath("tables");
		
		String permit=ctx.getInitParameter("permit");
		
		ConnectionProvider.load(path);
		
		
			if(permit.equals("yes"))
			{
				CreateTable.create(path);
				
				System.out.println("******************Table Created Successfully**********");
			}
			else
			{
				System.out.println("************No permistion to create table**************");
			}
		
	}

}
