package jdbc01;

import java.sql.*;
import java.util.Scanner;

public class JDBC_05_Delete {

	public static void main(String[] argrs) {
		/**/
		//
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String driver= "oracle.jdbc.OracleDriver";
		String id = "scott";
		String pw = "tiger";
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {Class.forName(driver);
			con = DriverManager.getConnection(url, id, pw);
			System.out.println("연결성공");
			
			Scanner sc = new Scanner(System.in);
			System.out.println("삭제할 회원의 번호를 입력하세요");
			String num = sc.nextLine();
			
			String sql = "DELETE FROM customer WHERE num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(num));
			int result = pstmt.executeUpdate();
			if(result==1) {
				System.out.println("삭제 완료");
			}else{
				System.out.println("삭제 실패");
			}
			
		} catch(ClassNotFoundException e) {e.printStackTrace();
		} catch(SQLException e) {e.printStackTrace();} 
		
		try {if(con != null)con.close();
			if(pstmt != null)pstmt.close();
		} catch(SQLException e) {e.printStackTrace();}

	}

}
