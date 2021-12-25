package jdbc_qwer.B;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class Book_04_Delete {

	public static void main(String[] argrs) {
		/**/
		//
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String driver = "oracle.jdbc.OracleDriver";
		String id = "scott";
		String pw = "tiger";
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, id, pw	);
			System.out.println("연결 성공");
			
			String sql = "DELETE FROM booklist WHERE num=?";
			pstmt = con.prepareStatement(sql);
			Scanner sc = new Scanner(System.in);
			System.out.println("삭제할 도서 번호");
			int num = Integer.parseInt(sc.nextLine());
			
			pstmt.setInt(1, num);
			
			int result = pstmt.executeUpdate();
			if(result==1) {
				System.out.println("삭제 완료");
			}else {
				System.out.println("삭제 실패");
			}
			
		} catch (ClassNotFoundException e) {e.printStackTrace();
			System.out.println("ojdbc6.jar 파일 확인요망");
		} catch (SQLException e) {e.printStackTrace();
			System.out.println("연결 정보 확인요망");
		}
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
