import java.io.*;
import java.util.*;

class Token
{
	public static void main(String args[])throws Exception
	{
	
		Scanner sc=new Scanner(new FileInputStream("D:\\project\\working\\IMS\\WEB-INF\\tables\\tables_sql.txt"));
		
		sc.useDelimiter("/");
		String name=" ";
		int i=1;

		while(sc.hasNext())
		{
			name=sc.next();

			System.out.println(" Token "+ i++ +"  "+name);
		}
		
	}
}