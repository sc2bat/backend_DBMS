package jdbc02;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class Book_02_Insert {

	public static void main(String[] argrs) {
		/**/
		//

		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String driver= "oracle.jdbc.OracleDriver";
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, "scott", "tiger");
			System.out.println("연결성공");
			
			Scanner sc = new Scanner(System.in);
			System.out.println("제목을 입력하세요");
			String subject = sc.nextLine();
			
			String sql = "SELECT * FROM booklist WHERE subject LIKE '%?%'";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int num = rs.getInt("num");
				int makeyear = rs.getInt("makeyear");
				int inprice = rs.getInt("inprice");
				int rentprice = rs.getInt("rentprice");
				String grade = rs.getString("grade");
				subject = rs.getString("subject");
				
				System.out.printf("%d\t\t%d\t\t%d\t%d\t\t%s\t%s\n", num, makeyear, inprice, rentprice, grade, subject);
				
			}
			
			if(rs.next() == false) {
				System.out.println("종료");
			}
			
			
		} catch(ClassNotFoundException e) {e.printStackTrace();
		} catch(SQLException e) {e.printStackTrace();} 
		
		try {if(con != null)con.close();
			if(pstmt != null)pstmt.close();
		} catch(SQLException e) {e.printStackTrace();}

	}

}
