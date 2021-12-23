package jdbc05;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import jdbc04.MemberDao;
import jdbc04.MemberDto;

public class RentDao {
	RentDao(){}
	private static RentDao itc = new RentDao();
	public static RentDao getInstance() {return itc;}
//	
//	String url = "jdbc:oracle:thin:@localhost:1521:xe";
//	String driver = "oracle.jdbc.OracleDriver";
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
//	DBmanager dbm = new DBmanager();
	
	public ArrayList<RentDto> select(){
		ArrayList<RentDto> list = new ArrayList<RentDto>();
		con = DBmanager.getConnection();
		// 테이블에 rentdate 필드 : Data형식 -> Dto 의 rentDate : String 으로 변환해서 저장
		// Select 문 안에서 to_Char() 함수가 사용이 되야 가능합니다
//		String sql="SELECT * FROM rentlist ORDER BY num DESC";
//		String sql="SELECT ???rentdate???, num, booknum, membernum, discount" + 
//				" FROM rentlist ORDER BY num DESC";
		
		String sql="SELECT TO_CHAR(rentdate, 'YYYY-MM-DD') AS rd, num, booknum, membernum, discount" + 
				" FROM rentlist ORDER BY num DESC";
		
//		try {
//			pstmt = con.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//			while(rs.next()) {
//				RentDto rdto = new RentDto();
//				rdto.setRentdate(rs.getString("rentdate"));
//				rdto.setNum(rs.getInt("num"));
//				rdto.setBooknum(rs.getInt("booknum"));
//				rdto.setMembernum(rs.getInt("membernum"));
//				rdto.setDiscount(rs.getInt("discount"));
//				list.add(rdto);
//			}
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				RentDto rdto = new RentDto();
//				rdto.setRentdate(rs.getString("rentdate"));
				rdto.setRentdate(rs.getString("rd"));
				rdto.setNum(rs.getInt("num"));
				rdto.setBooknum(rs.getInt("booknum"));
				rdto.setMembernum(rs.getInt("membernum"));
				rdto.setDiscount(rs.getInt("discount"));
				list.add(rdto);
			}
		} catch (SQLException e) {e.printStackTrace();
		}finally {
			DBmanager.close(con, pstmt, rs);
		}
		return list;
	}
	
	public int insert(RentDto rdto) {
		int result = 0;
		con = DBmanager.getConnection();
		String sql = "INSERT INTO rentlist VALUES(sysdate, rent_seq.nextVal, ?, ?, ?)";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rdto.getBooknum());
			pstmt.setInt(2, rdto.getMembernum());
			pstmt.setInt(3, rdto.getDiscount());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBmanager.close(con, pstmt, rs);
		}
		return result;
	}
	
	public RentDto getRent(int num) {
		RentDto rdto = null;
		String sql="SELECT TO_CHAR(rentdate, 'YYYY-MM-DD') AS rd, num, booknum, " + 
				"membernum, discount FROM rentlist WHERE num=?";
		con = DBmanager.getConnection();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				rdto = new RentDto();
//				rdto.setRentdate(rs.getString("rentdate"));
				rdto.setRentdate(rs.getString("rd"));
				rdto.setNum(num);
				rdto.setBooknum(rs.getInt("booknum"));
				rdto.setMembernum(rs.getInt("membernum"));
				rdto.setDiscount(rs.getInt("discount"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBmanager.close(con, pstmt, rs);
		}
		return rdto;
	}
	
	public int update(RentDto rdto) {
		int result = 0;
		con = DBmanager.getConnection();
		String sql="UPDATE rentlist SET rentdate= to_date(''||?||'','YYYYMMDD'), booknum=?," +
				" membernum=?, discount=? WHERE num =?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString( 1, rdto.getRentdate() );
			pstmt.setInt(2,  rdto.getBooknum() );
			pstmt.setInt(3,  rdto.getMembernum() );
			pstmt.setInt(4,  rdto.getDiscount() );
			pstmt.setInt(5, rdto.getNum() );
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBmanager.close(con, pstmt, rs);
		}
		return result;
	}
	
	public int delete(int num) {
		int result = 0;
		con = DBmanager.getConnection();
		String sql = "DELETE FROM rentlist WHERE num=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {e.printStackTrace();
		}finally {
			DBmanager.close(con, pstmt, rs);
		}
		return result;
	}

//	public RentDto checkBooknum(int booknum) {
//		/**/
//		// 
//		RentDao rdao = RentDao.getInstance();
//		RentDto rdto = null;
//		int num;
//		boolean result = false;
//		
//		rdto = rdao.checkBooknum(num);
//		if(rdto == null){
//			System.out.println("해당 회원이 없습니다");
//			return rdto;
//		}else {
//			result = rdao.insert(num);
//		}
//		return result;
//	}
	public boolean checkBooknum(int booknum) {
		/**/
		// 무엇이든 결과값이 있다면 result를 true로
		boolean result = false;
		con = DBmanager.getConnection();
		String sql = "SELECT * FROM booklist WHERE num=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, booknum);
			rs = pstmt.executeQuery();
			if(rs.next())result=true;
		}catch(SQLException e) {e.printStackTrace();
		}finally {DBmanager.close(con, pstmt, rs);
		}
		return result;
	}

	public boolean checkMembernum(int membernum) {
		/**/
		// 
		boolean result = false;
		con = DBmanager.getConnection();
		String sql = "SELECT * FROM memberlist WHERE num=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, membernum);
			rs = pstmt.executeQuery();
			if(rs.next())result=true;
		}catch(SQLException e) {e.printStackTrace();
		}finally {DBmanager.close(con, pstmt, rs);
		}
		return result;
	}

	public ArrayList<RentDetailDto> selectAll() {
		
		// 
		ArrayList<RentDetailDto> list = new ArrayList<RentDetailDto>();
		/*String sql = "SELECT TO_CHAR(r.rentdate, 'YYYY-MM-DD') AS rentdate, r.num AS rentnum,"
				+ "m.num AS membernum, m.name AS membername,"
				+ "b.rentprice - r.discount AS rentprice2,"
				+ "b.num AS booknum, b.subject AS subject "
				+ "FROM rentlist r, booklist b, memberlist m "
				+ "WHERE r.booknum = b.num AND r.membernum = m.num "
				+ "ORDER BY r.num DESC ";*/
		String sql = "SELECT * FROM rentdetail";
		con = DBmanager.getConnection();
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				RentDetailDto rdto = new RentDetailDto();
				rdto.setRentdate(rs.getString("rentdate"));
				rdto.setRentnum(rs.getInt("rentnum"));
				rdto.setMembernum(rs.getInt("membernum"));
				rdto.setMembername(rs.getString("membername"));
				rdto.setRentprice2(rs.getInt("rentprice2"));
				rdto.setBooknum(rs.getInt("booknum"));
				rdto.setSubject(rs.getString("subject"));
				list.add(rdto);
			}
		} catch (SQLException e) {e.printStackTrace();
		}finally {DBmanager.close(con, pstmt, rs);
		}
		return list;
	}

}
