package jdbc01;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class JDBC_03_Insert2 {

	public static void main(String[] argrs) {
		/**/
		//
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String driver= "oracle.jdbc.OracleDriver";
		String id = "scott";
		String pw = "tiger";
		
		Connection con = null;
		PreparedStatement pstmt = null; 
		//insert 명령의 경우 결과값이 따로 없어서 ResultSet 은 사용하지 않습니다
		//ResultSet rs = null; 
		
		try {Class.forName(driver);
			con = DriverManager.getConnection(url, id, pw);
			System.out.println("연결 성공.");
			
			Scanner sc = new Scanner(System.in);
			// 시퀀스 생성으로 번호 불필요
//			System.out.print("저장할 번호를 입력하세요 : ");
//			int num = Integer.parseInt(sc.nextLine());
			System.out.print("이름을 입력하세요 : ");
			String name = sc.nextLine();
			System.out.print("이메일을 입력하세요 : ");
			String email = sc.nextLine();
			System.out.print("전화번호를 입력하세요 : ");
			String tel = sc.nextLine();
			
			// INSERT INTO customer VALUES (6, '김하나', 'abc5@naver.com', '010-1111-1111');
			//String sql = "INSERT INTO customer VALUES (6, '김하나', 'abc5@naver.com', '010-1111-1111');";
			
			// 아래는 옛날 방식
			//String sql = "INSERT INTO customer VALUES (" + num + ", '" + name + "', '" + email + "', '" + tel + "')";
			
			// 요즘 방식
//			String sql = "INSERT INTO customer VALUES(?, ?, ?, ?)";
			String sql = "INSERT INTO customer VALUES(num_seq.nextVal, ?, ?, ?)";
			
			// 먼저 sql 명령을 SELECT 때와 같이 pstmt. 에 장착합니다
			pstmt = con.prepareStatement(sql);
			
			// ? 의 순서에 맞춰서 입력값들을 세팅합니다
			//pstmt.setInt(1, num); // 시퀀스 생성으로 불필요
//			pstmt.setString(2, name);
//			pstmt.setString(3, email);
//			pstmt.setString(4, tel);
			
			// 시퀀스 생성으로 번호 밀림
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			pstmt.setString(3, tel);
			
			// SQL SELECT 명령만 executeQuery 를 사용하고,
			// 나머지는 executeUpdate 메소드를 사용합니다
			// executeUpdate 의 결과는 sql 명령이 정상 동작했을 때 1, 실패했을때 0이 리턴됩니다
			int result = pstmt.executeUpdate();
			
			if(result==1) {
				System.out.println("레코드 추가 성공");
			}else {
				System.out.println("레코드 추가 실패");
			}
			
			
		} catch(ClassNotFoundException e) {e.printStackTrace();
		} catch(SQLException e) {e.printStackTrace();} 
		
		try {if(con != null)con.close();
			if(pstmt != null)pstmt.close();
		} catch(SQLException e) {e.printStackTrace();}
		
		
		
	}

}