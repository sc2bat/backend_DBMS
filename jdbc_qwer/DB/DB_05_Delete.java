package jdbc_qwer.DB;

import java.sql.*;
import java.util.Scanner;

public class DB_05_Delete {

	public static void main(String[] argrs) {
		/**/
		//
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String driver = "oracle.jdbc.OracleDriver";
		String id = "scott";
		String pw = "tiger";
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, id, pw);
			System.out.println("연결 성공");
			
			Scanner sc = new Scanner(System.in);
			System.out.println("삭제할 번호");
			int num = Integer.parseInt(sc.nextLine());
			
			String sql = "DELETE FROM customer WHERE num=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			
			int result = pstmt.executeUpdate();
			if(result==1) {
				System.out.println("삭제 성공");
			}else {
				System.out.println("삭제 실패");
			}
			
			
		} catch (ClassNotFoundException e) {e.printStackTrace();
		} catch (SQLException e) {e.printStackTrace();
		}
	}

}
