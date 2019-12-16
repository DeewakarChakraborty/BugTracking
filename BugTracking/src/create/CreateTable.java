package create;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.Statement;
import java.util.Scanner;

import connect.ConnectionProvider;

public class CreateTable 
{
	public static void create(String path)
	{
		
		try
		{
		path =path+"\\"+"tables_sql.txt";
		
		
		System.out.println("******Path of Commands***************"+path);
		FileInputStream fin=new FileInputStream(path);
		Scanner sc=new Scanner(fin);
		sc.useDelimiter("/");
		String name=" ";
		
		Connection con=ConnectionProvider.getConnection();
		
		Statement st=con.createStatement();
		
		int i=1;

		while(sc.hasNext())
		{
			name=sc.next();
			st.executeUpdate(name);
			System.out.println(" Token "+ i++ +"  "+name);
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}
}	
