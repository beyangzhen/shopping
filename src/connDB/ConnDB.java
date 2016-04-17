package connDB;

import java.sql.*;

public class ConnDB {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public ResultSet executeQuery(String sql) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
    		String url = "jdbc:mysql://localhost:3306/db_shopping";
	    	String username = "root";
	    	String pwd = "123";
		   	conn = DriverManager.getConnection(url, username, pwd);
		   	pstmt = conn.prepareStatement(sql);
		   	rs = pstmt.executeQuery();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return rs;
	}
	
	public int executeUpdate(String sql) {
		int result = 0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
    		String url = "jdbc:mysql://localhost:3306/db_shopping";
	    	String username = "root";
	    	String pwd = "123";
		   	conn = DriverManager.getConnection(url, username, pwd);
		   	pstmt = conn.prepareStatement(sql);
		   	result = pstmt.executeUpdate();
		} catch(Exception e) {
			result = 0;
		}
		
		return result;
	}
	
	public void close() {
		try {
			if(conn != null) {
				conn.close();
			}
			if(pstmt != null) {
				pstmt.close();
			}
			if(rs != null) {
				rs.close();
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
    
