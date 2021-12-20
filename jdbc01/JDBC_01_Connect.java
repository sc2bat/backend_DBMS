package jdbc01;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBC_01_Connect {

	public static void main(String[] argrs) {
		/**/
		// url : jdbc:oracle:thin:@localhost:1521:xe
		// driver : oracle.jdbc.OracleDirver
		// id: scott
		// password : tiger
		
		// JDBC 를 통한 데티어 베이스와 연결하게 해주는 클래스 : Connection
		// import 해줘야 됨 ctrl shift o 
		Connection con = null;
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
//		String driver= "oracle.jdbc.driver.OracleDriver";
		String driver= "oracle.jdbc.OracleDriver";
		String id = "scott";
		String pw = "tiger";
		
		
//		oracle database 우클릭
//		java build path
//		Add External JARs
//		경로 C:\oraclexe\app\oracle\product\11.2.0\server\jdbc\lib
//		적용 후 저장
		
//		Class.forName("oracle.jdbc.driver.OracleDriver"); 원래 명칭
		try {
			// 데이터베이스 연결을 위해 드라이버 클래스를 설정합니다
//			Class.forName("oracle.jdbc.driver.OracleDriver");
			Class.forName(driver);
			
			// 외부와 연결하기 때문에 예외처리를 해야함
			// 연결 url 을 목적지로 id 와 pw 를 이용하여 연결을 실제 시행합니다
			// 연결된 연결객체는 변수 con 에 저장합니다
//			con = DriverManager.getConnection(
//					"jdbc:oracle:thin:@localhost:1521:xe",
//					"scott", "tiger");
			con = DriverManager.getConnection(url, id, pw);
			System.out.println("연결이 성공하였습니다");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("ojdbc6.jar 파일을 확인하세요");
		} catch (SQLException e) {
			// 예외처리 실패사유 추가
			e.printStackTrace();
			System.out.println("연결 정보를 확인하세요");
		}
		
//		con.close();
		try {
			if(con != null)con.close();
			System.out.println("데이터베이스 종료");
		} catch (SQLException e) {
			// 연결한 적이 없는데 연결을 종료하면 에러이기에 예외처리
			e.printStackTrace();
			System.out.println("연결이 종료되지 않았습니다.");
		}
	}

}
