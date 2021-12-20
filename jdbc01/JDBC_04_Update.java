package jdbc01;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class JDBC_04_Update {

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
			System.out.println("수정할 회원의 번호를 입력하세요");
			String num = sc.nextLine();
			
			System.out.println("수정할 항목을 선택하세요. 1. 이메일 2. 전화번호");
			String input = sc.nextLine();
			
			String sql = "";
			switch(input) {
			case "1":
				System.out.println("수정할 이메일을 입력하세요");
				String email = sc.nextLine();
				sql = "UPDATE customer SET email=? WHERE num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, email);
				pstmt.setInt(2, Integer.parseInt(num));
				break;
			case "2":
				System.out.println("수정할 전화번호를 입력하세요");
				String tel = sc.nextLine();
				sql = "UPDATE customer SET tel=? WHERE num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, tel);
				pstmt.setInt(2, Integer.parseInt(num));
				break;
			}
			
			int result = pstmt.executeUpdate();
			if(result==1) {
				System.out.println("수정 성공");
			}else {
				System.out.println("수정 실패");
			}
			
		} catch(ClassNotFoundException e) {e.printStackTrace();
		} catch(SQLException e) {e.printStackTrace();} 
		
		try {if(con != null)con.close();
			if(pstmt != null)pstmt.close();
		} catch(SQLException e) {e.printStackTrace();}
		
		
		
	}

}
