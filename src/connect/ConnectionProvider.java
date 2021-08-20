package connect;
import java.io.FileInputStream;
import java.sql.*;
import java.util.Properties;

public class ConnectionProvider
{

	private static Connection con;
	private static Statement st;
	private static String user;
	private static String password;
	private static String driver;
	private static String url;
	
		public static void load(String path)
		{
			
			try
			{
			path=path+"\\"+"db.properties";
			FileInputStream fin=new FileInputStream(path);
			Properties p=new Properties();
			p.load(fin);
			user=p.getProperty("user");
			password=p.getProperty("password");
			driver=p.getProperty("driver");
			url=p.getProperty("url");
			
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
	
	
		public static synchronized Connection getConnection()
		{
			try
			{

			if(con == null)
			{
				
		Class.forName(driver);
		Connection con=DriverManager.getConnection(url,user,password);

		System.out.println("Connecitn ..........."+con);
				return con;
			}

			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			return con;
		}
}