package jdbc_qwer.B;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class Book_03_Update {

	public static void main(String[] argrs) {
		/**/
		//
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String driver = "oracle.jdbc.OracleDriver";
		String id = "scott";
		String pw = "tiger";
		
		Connection con = null;
		PreparedStatement pstmt = null;
		Scanner sc = new Scanner(System.in);
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, id, pw	);
			System.out.println("연결 성공");
			
			String sql = "UPDATE booklist SET subject=?, makeyear=?, "
					+ "inprice=?, rentprice=?, grade=? WHERE num=?";
			pstmt = con.prepareStatement(sql);
			
			System.out.println("수정할 도서 번호");
			int num = Integer.parseInt(sc.nextLine());
			System.out.println("수정 도서 제목");
			String subject = sc.nextLine();
			System.out.println("수정 도서 출판년도");
			int makeyear = Integer.parseInt(sc.nextLine());
			System.out.println("수정 도서 구매가격");
			int inprice= Integer.parseInt(sc.nextLine());
			System.out.println("수정 도서 대여가격");
			int rentprice= Integer.parseInt(sc.nextLine());
			System.out.println("수정 도서 등급");
			String grade = sc.nextLine();
			
			pstmt.setInt(6, num);
			pstmt.setString(1, subject);
			pstmt.setInt(2, makeyear);
			pstmt.setInt(3, inprice);
			pstmt.setInt(4, rentprice);
			pstmt.setString(5, grade);
			int result = pstmt.executeUpdate();
			
			if(result==1) {
				System.out.println("수정 성공");
			}else {
				System.out.println("수정 실패");
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
