package jdbc02;

import java.sql.*;
import java.util.Scanner;


public class Book_03_Update33 {

	public static void main(String[] argrs) {
		/**/
		//
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String driver = "oracle.jdbc.OracleDriver";
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Scanner sc = new Scanner(System.in);
		int start = 3;
		
		while(start == 3) {
			System.out.println("booklist 수정 시작 1. 시작 2. 종료 3. 계속");
			start = sc.nextInt();
			if(start==2) {
				System.out.println("종료되었습니다");
				return;
			}
			String block = sc.nextLine();
			try {
				Class.forName(driver);
				con = DriverManager.getConnection(url, "scott", "tiger");
				
				System.out.println("수정할 도서의 도서번호를 입력하세요 : ");
				String num = sc.nextLine();
				System.out.print("수정할 항목을 선택하세요  1. 출판년도 2. 입고가격 3. 대여가격 4. 등급");
				String input = sc.nextLine();
				
				String sql = null;
				switch(input) {
				case "1":
					System.out.println("수정할 출판년도를 입력하세요");
					String makeyear = sc.nextLine();
					sql = "UPDATE booklist SET makeyear=? WHERE num=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, Integer.parseInt(makeyear));
					pstmt.setInt(2, Integer.parseInt(num));
					break;
				case "2":
					System.out.println("수정할 입고가격을 입력하세요");
					String inprice = sc.nextLine();
					sql = "UPDATE booklist SET inprice=? WHERE num=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, Integer.parseInt(inprice));
					pstmt.setInt(2, Integer.parseInt(num));
					break;
				case "3":
					System.out.println("수정할 대여 가격을 입력하세요");
					String rentprice = sc.nextLine();
					sql = "UPDATE booklist SET rentprice=? WHERE num=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, Integer.parseInt(rentprice));
					pstmt.setInt(2, Integer.parseInt(num));
					break;
				case "4":
					System.out.println("수정할 등급을 입력하세요");
					String grade = sc.nextLine();
					sql = "UPDATE booklist SET grade=? WHERE num=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, Integer.parseInt(grade));
					pstmt.setInt(2, Integer.parseInt(num));
					break;
				}
				
				int result = pstmt.executeUpdate();
				if(result == 1) {
					System.out.println("수정 완료");
					start = 3;
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

}
