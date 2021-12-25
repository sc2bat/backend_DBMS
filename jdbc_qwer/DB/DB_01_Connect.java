package jdbc_qwer.DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DB_01_Connect {

	public static void main(String[] argrs) {
		/**/
		//
		Connection con = null;
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String driver = "oracle.jdbc.OracleDriver";
		String id = "scott";
		String pw = "tiger";
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, id, pw);
			
			System.out.println("연결 성공");
		} catch (ClassNotFoundException e) {e.printStackTrace();
			System.out.println("ojdbc6.jar 파일 확인요망");
		} catch (SQLException e) {e.printStackTrace();
			System.out.println("연결 정보 확인요망");
		}
		
//		if(con != null) {
//			try {
//				con.close();
//				System.out.println("데이터 베이스 종료");
//			} catch (SQLException e) {e.printStackTrace();
//			System.out.println("연결 종료 안됨");
//			}
//		}
		try {
			if(con != null) {
			con.close();
			System.out.println("데이터 베이스 종료");
			}
		} catch (SQLException e) {e.printStackTrace();
			System.out.println("연결 종료 안됨");
		}
		
		
	}

}
