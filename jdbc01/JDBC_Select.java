package jdbc01;

import java.sql.*;

public class JDBC_Select {

	public static void main(String[] argrs) {
		/**/
		//
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String driver= "oracle.jdbc.OracleDriver";
		String id = "scott";
		String pw = "tiger";
		
		Connection con = null;
		PreparedStatement pstmt = null; // con에 SQL 실행해주는 객체
		ResultSet rs = null; // SQL 실행결과를 저장하는 객체
		
		try {Class.forName(driver);
			con = DriverManager.getConnection(url, id, pw);
//			System.out.println("데이터베이스 연결에 성공했습니다");
			String sql = "SELECT * FROM CUSTOMER";
			// pstmt 에 sql 을 장착하고 실행해서, 그 결과를 rs 에 저장합니다
			// 저장 결과를 하나씩 레코드별로 필드별로 하나씩 꺼내서 
			// 콘솔창에 출력합니다
			
		} catch(ClassNotFoundException e) {e.printStackTrace();
		} catch(SQLException e) {e.printStackTrace();} 
		
		try {if(con != null)con.close();
			if(pstmt != null)pstmt.close();
			if(rs != null)rs.close();
		} catch(SQLException e) {e.printStackTrace();}
		
		
		
	}

}
