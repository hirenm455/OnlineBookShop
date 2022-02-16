import java.io.FileInputStream;
import java.sql.*;
// PreparedStatement interface.

//The setBinaryStream() method of PreparedStatement is used to set Binary information into the parameterIndex. 
//1) public void setBinaryStream(int paramIndex,InputStream stream)
//throws SQLException
//2) public void setBinaryStream(int paramIndex,InputStream stream,long length)
//throws SQLException




//mysql> create table imagetable (col1 blob);
//current directory should have pic.gif

public class BlobTest 
	{
	public static void main(String[] args) throws Exception
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","","");
		PreparedStatement pstmt = con.prepareStatement("insert into imagetable values(?)");
		//FileInputStream fis1 = ;  //d:/pic.gif
		//The methods returns and estimated of the number of remaining bytes that can be read from
		//this input stream without blocking

		pstmt.setBinaryStream(1, new FileInputStream("src\\pic.gif")  //d:/pic.gif
);
		pstmt.executeUpdate();
		con.close();
        System.out.println("image inserted succes...");
		}

}
