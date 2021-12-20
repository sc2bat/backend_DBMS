package jdbc02;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Book_01_Select {

	public static void main(String[] argrs) {
		/**/
		//
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String driver= "oracle.jdbc.OracleDriver";
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {Class.forName(driver);
			con = DriverManager.getConnection(url, "scott", "tiger");
			System.out.println("연결성공");
			
//			String sql = "SELECT * FROM booklist";
			String sql = "SELECT * FROM booklist ORDER BY num DESC";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();	
			
			System.out.println("도서번호\t출판년도\t입고가격\t출고가격\t등급\t제목");
			System.out.println("------------------------------------------------------------");
			
			while(rs.next()) {
//				int num = rs.getInt("num");
//				String makeyear = rs.getString("makeyear");
//				String inprice = rs.getString("inprice");
//				String rentprice = rs.getString("rentprice");
//				String grade = rs.getString("grade");
//				String subject = rs.getString("subject");
//				System.out.printf("%d\t\t%s\t\t%s\t%s\t\t%s\t%s\n", num, makeyear, inprice, rentprice, grade, subject);
				int num = rs.getInt("num");
				int makeyear = rs.getInt("makeyear");
				int inprice = rs.getInt("inprice");
				int rentprice = rs.getInt("rentprice");
				String grade = rs.getString("grade");
				String subject = rs.getString("subject");
				System.out.printf("%d\t\t%d\t\t%d\t%d\t\t%s\t%s\n", num, makeyear, inprice, rentprice, grade, subject);
			}
			
		} catch(ClassNotFoundException e) {e.printStackTrace();
		} catch(SQLException e) {e.printStackTrace();} 
		
		try {if(con != null)con.close();
			if(pstmt != null)pstmt.close();
		} catch(SQLException e) {e.printStackTrace();}

	}

}
