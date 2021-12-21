package jdbc04;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

public class MemberDao {
	// 싱글톤
	// 생성자를 private 로 외부에서 사용할 수 없게
	// dao 를 외부에서 새로 만들어 사용하지 못하도록 싱글톤으로 제작
//	private MemberDao(){	}
	MemberDao(){	}
	private static MemberDao itc = new MemberDao();
	public static MemberDao getInstance() {return itc;}
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String driver= "oracle.jdbc.OracleDriver";
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	// 연결을 별도의 함수로
	// db에 연결은 이곳에서 하고 연결된것을 리턴
	private Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, "scott", "tiger");
		} catch (ClassNotFoundException e) {e.printStackTrace();
		} catch (SQLException e) {e.printStackTrace();
		}
		return conn;
	}
	
	// 연결을 끊는 메소드
	// 
	private void close() {
		try {
			if(con != null)con.close();
			if(pstmt != null)pstmt.close();
			if(rs != null) rs.close();
		} catch(SQLException e) {e.printStackTrace();
		}
	}
	
	private void test(String sql) {
		try {
			pstmt = con.prepareStatement(sql);
			
		} catch (SQLException e) {e.printStackTrace();
		}finally {
			close();
		}
	}
	
	
	public ArrayList<MemberDto> select(){
		// 전체 멤버를 조회해서 멤버리스트를 리턴
		ArrayList<MemberDto> list = new ArrayList<MemberDto>();
		String sql="";
		
//		try {
//			Class.forName(driver);
//			con = DriverManager.getConnection(url, "scott", "tiger");
//			
//		} catch (ClassNotFoundException e) {
//			e.printStackTrace();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
		sql = "SELECT * FROM memberlist ORDER BY num DESC";
		con = getConnection();
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberDto mdto = new MemberDto();
				mdto.setNum(rs.getInt("num"));
				mdto.setName(rs.getString("name"));
				mdto.setPhone(rs.getString("phone"));
				mdto.setBirth(rs.getDate("birth"));
				mdto.setBpoint(rs.getInt("bpoint"));
				mdto.setAge(rs.getInt("age"));
				mdto.setGender(rs.getString("gender"));
				mdto.setJoindate(rs.getDate("joindate"));
				list.add(mdto);
			}
				
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
				
		
//		try {
//			pstmt = con.prepareStatement(sql);
//		} catch (SQLException e) {e.printStackTrace();
//		}finally {
//			close();
//		}
//		test(sql);
		
		return list;
	}
	public int insert(MemberDto mdto){
		// 1 명의 자료를 전달받아서 테이블에 레코드로 추가
		int result = 0;
//		String sql="INSERT INTO memberlist VALUES(member_seq.nextVal, ?, ?, ?, ?, ?, ?, ?)";
//		con = getConnection();
////		java.sql.Date now = new java.sql.Date();
////		Calendar today = Calendar.getInstance();
//		try {
//			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, mdto.getName());
//			pstmt.setString(2, mdto.getPhone());
//			pstmt.setDate(3, mdto.getBirth());
//			pstmt.setString(4, null);
////			pstmt.setDate(5, now);
//			pstmt.setDate(5, null);
//			pstmt.setString(6, mdto.getGender());
//			pstmt.setInt(7, mdto.getAge());
		String sql="INSERT INTO memberlist(num, name, phone, birth, gender, age)"+
				" VALUES(member_seq.nextVal, ?, ?, ?, ?, ?)";
		con = getConnection();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mdto.getName());
			pstmt.setString(2, mdto.getPhone());
			pstmt.setDate(3, mdto.getBirth());
			pstmt.setString(4, mdto.getGender());
			pstmt.setInt(5, mdto.getAge());
			
			result = pstmt.executeUpdate();
				
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return result;
	}
	public MemberDto getMember(int num){
		// 회원번호 하나를 전달받아서 해당 회원의 정보를 MemberDto 형태로 리턴
		MemberDto mdto = null;
		String sql="SELECT * FROM memberlist WHERE num=?";
		con = getConnection();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				mdto = new MemberDto();
				mdto.setNum(rs.getInt("num"));
				mdto.setName(rs.getString("name"));
				mdto.setPhone(rs.getString("phone"));
				mdto.setBirth(rs.getDate("birth"));
				mdto.setBpoint(rs.getInt("bpoint"));
				mdto.setAge(rs.getInt("age"));
				mdto.setGender(rs.getString("gender"));
			}
				
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return mdto;
	}
	public int update(MemberDto mdto){
		// 1 명의 자료를 전달받아서 해당 레코드를 수정
		
		int result = 0;
		String sql="UPDATE memberlist SET name=?, phone=?, birth=?, bpoint=?, "+
				"age=?, gender=? WHERE num=?";
		con = getConnection();
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mdto.getName());
			pstmt.setString(2, mdto.getPhone());
			pstmt.setDate(3, mdto.getBirth());
			pstmt.setInt(4, mdto.getBpoint());
			pstmt.setInt(5, mdto.getAge());
			pstmt.setString(6, mdto.getGender());
			pstmt.setInt(7, mdto.getNum());
			
			result = pstmt.executeUpdate();
				
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return result;
	}
	public int delete(int num){
		// 1명의 회원번호를 전달받아서 해당 회원의 레코드를 삭제
		int result = 0;
		String sql="";
		con = getConnection();
		
		close();
		return result;
		
	}
	

	

	
//	public void select() {}
//	public void insert() {}
//	public void update() {}
//	public void delete() {}
}
