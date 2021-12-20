package jdbc02;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class Book_04_Delete {

	public static void main(String[] argrs) {
		/**/
		//
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String driver = "oracle.jdbc.OracleDriver";
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, "scott", "tiger");
			
			Scanner sc = new Scanner(System.in);
			System.out.println("삭제할 도서의 도서번호를 입력하세요 : ");
			String num = sc.nextLine();
			
			String sql = "DELETE FROM booklist WHERE num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(num));
			int result = pstmt.executeUpdate();
			if(result==1) {
				System.out.println("삭제 완료");
			}else{
				System.out.println("삭제 실패");
			}
			
		} catch(ClassNotFoundException e) {e.printStackTrace();
		} catch(SQLException e) {e.printStackTrace();
		} 
		try {
			if(con != null)con.close();
			if(pstmt != null)pstmt.close();
		} catch(SQLException e) {e.printStackTrace();
		}

	}

}
