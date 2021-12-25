package jdbc_qwer.DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class DB_04_Update {

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
		Scanner sc = new Scanner(System.in);
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, id, pw);
			System.out.println("연결 성공");
			
			String sql = "UPDATE customer SET name=?, email=?, tel=? WHERE num=?";
			pstmt = con.prepareStatement(sql);
			
			System.out.println("수정할 번호");
			int num = Integer.parseInt(sc.nextLine());
			System.out.println("수정할 이름");
			String name = sc.nextLine();
			System.out.println("수정할 이메일");
			String email = sc.nextLine();
			System.out.println("수정할 전화번호");
			String tel = sc.nextLine();
			
			pstmt.setInt(4, num);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			pstmt.setString(3, tel);
			
			int result = pstmt.executeUpdate();
			if(result==1) {
				System.out.println("업데이트 성공");
			}else {
				System.out.println("업데이트 실패");
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
