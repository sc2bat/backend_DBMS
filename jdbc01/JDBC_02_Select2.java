package jdbc01;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JDBC_02_Select2 {

	public static void main(String[] argrs) {
		/**/
		//
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String driver= "oracle.jdbc.OracleDriver";
		String id = "scott";
		String pw = "tiger";
		
		Connection con = null;
		PreparedStatement pstmt = null; // con에 SQL 실행해주는 객체
		ResultSet rs = null; // SQL 실행결과를 저장하는 객체
		
		try {Class.forName(driver);
			con = DriverManager.getConnection(url, id, pw);
			System.out.println("데이터베이스 연결에 성공했습니다");
			String sql = "SELECT * FROM CUSTOMER";
			// 데이터베이스 연결후에는 SQL 명령을 사용하기 위해 String 변수에 SQL 명령을
			// 준비합니다. 데이터베이스에 제공되어질 명령이므로 String 형으로 준비합니다
			
			// SQL 문을 장착한 con 을 pstmt 에 전달합니다
			pstmt = con.prepareStatement(sql);
			//pstmt = con.prepareStatement("select * from customer");
			
			// pstmt 에 sql 을 장착하고 실행해서, 그 결과를 rs 에 저장합니다
			rs = pstmt.executeQuery();
			
			System.out.println("번호 \t 이름 \t\t 이메일 \t\t\t 전화번호");
			System.out.println("------------------------------------------");
			
			//rs.next() : 최초 실행은 객체의 시작부분(데이터 없는곳)에서 첫번째 레코드로 이동하는 메소드
			// 그다음부터는 다음 레코드로 이동
			// rs.next() 메소드가 실행될 때 다음 레코드가 있으면 true, 없으면 false 를 리턴
			while(rs.next()) {
				// 결과의 처음부터 끝까지 반복 실행 : 레코드 단위로 반복 실행
				// rs.getInt() : number 형 필드값을 추출하는 메소드. 괄호안에 필드이름을 정확히 써야하빈다.
				// 문자형 자료는 getString() 을 이용합니다
				// 필드명에 오타가 있거나 안맞으면 '부적합한 열이름' 이라는 에러가 발생합니다
				int num = rs.getInt("num");
				// rs.getString() : varchar2 형 필드값을 추출하는 메소드
				// 모든 자료형에 대해 get~() 메소드가 모두 존재합니다
				String name = rs.getString("name");
				String email = rs.getString("email");
				String tel = rs.getString("tel");
				System.out.printf("%d \t %s \t %s \t %s\n", num, name, email, tel);
			}
			
//			번호 	 이름 		 이메일 			 전화번호
//			------------------------------------------
//			1 	 홍길동 	 abc1@abc.com 	 010-1234-5234
//			2 	 홍길서 	 abc2@abc.com 	 010-2234-4234
//			3 	 홍길남 	 abc3@abc.com 	 010-3234-3234
//			4 	 홍길북 	 abc4@abc.com 	 010-4234-2234
//			5 	 아무개 	 abc5@abc.com 	 010-5234-1234
			
			// 1. pstmt 에 sql 을 장착하고 실행해서, 그 결과를 rs 에 저장합니다
			// 2. 저장 결과를 하나씩 레코드별로 필드별로 하나씩 꺼내서 콘솔창에 출력합니다
			
		} catch(ClassNotFoundException e) {e.printStackTrace();
		} catch(SQLException e) {e.printStackTrace();} 
		
		try {if(con != null)con.close();
			if(pstmt != null)pstmt.close();
			if(rs != null)rs.close();
		} catch(SQLException e) {e.printStackTrace();}
		
		
		
	}

}
