package jdbc_qwer.DR;

import java.sql.*;
import java.util.*;

public class RentDao {
	RentDao(){}
	private static RentDao itc = new RentDao();
	public static RentDao getInstance() {return itc;}
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public ArrayList<RentDto> select() {
		/**/
		// 
		ArrayList<RentDto> rlist = new ArrayList<RentDto>();
		con = Dbm.getConnection();
		String sql = "SELECT TO_CHAR(rentdate, 'yyyy-mm-dd') AS rd, num, booknum, membernum, discount"
				+ " FROM rentlist ORDER BY num DESC";
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				RentDto rdto = new RentDto();
//				rdto.setRdate(rs.getString("rentdate"));
//				rdto.setRdate(rs.getString("TO_CHAR(rentdate, 'yyyy-mm-dd')"));
				rdto.setRdate(rs.getString("rd"));
				rdto.setRnum(rs.getInt("num"));
				rdto.setBnum(rs.getInt("booknum"));
				rdto.setMnum(rs.getInt("membernum"));
				rdto.setD(rs.getInt("discount"));
				rlist.add(rdto);
			}
		} catch (SQLException e) {e.printStackTrace();
		} finally {
			Dbm.close(con, pstmt, rs);
		}
		return rlist;
	}

	public boolean checkB(int booknum) {
		boolean result = false;
		con = Dbm.getConnection();
		String sql = "SELECT * FROM booklist WHERE num=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, booknum);
			rs = pstmt.executeQuery();
			if(rs.next())result=true;
		} catch (SQLException e) {e.printStackTrace();
		} finally {
			Dbm.close(con, pstmt, rs);
		}
		return result;
	}
	public boolean checkM(int membernum) {
		boolean result = false;
		con = Dbm.getConnection();
		String sql = "SELECT * FROM memberlist WHERE num=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, membernum);
			rs = pstmt.executeQuery();
			if(rs.next())result=true;
		} catch (SQLException e) {e.printStackTrace();
		} finally {
			Dbm.close(con, pstmt, rs);
		}
		return result;
	}

	public int insert(RentDto rdto) {
		int result = 0;
		con = Dbm.getConnection();
		String sql = "INSERT INTO rentlist VALUES(sysdate, rent_seq.nextVal, ?, ?, ?)";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rdto.getBnum());
			pstmt.setInt(2, rdto.getMnum());
			pstmt.setInt(3, rdto.getD());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {e.printStackTrace();
		} finally {
			Dbm.close(con, pstmt, rs);
		}
		return result;
	}

	public RentDto getRent(int num) {
		RentDto rdto = null;
		String sql = "SELECT TO_CHAR(rentdate, 'yyyy-mm-dd') AS rd, "
				+ " num, booknum, membernum, discount FROM rentlist WHERE num=?";
		con = Dbm.getConnection();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,  num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				rdto = new RentDto();
				rdto.setRdate(rs.getString("rd"));
				rdto.setRnum(num);
				rdto.setBnum(rs.getInt("booknum"));
				rdto.setMnum(rs.getInt("membernum"));
				rdto.setD(rs.getInt("discount"));
			}
		} catch (SQLException e) {e.printStackTrace();
		} finally {
			Dbm.close(con, pstmt, rs);
		}
		return rdto;
	}

	public int update(RentDto rdto) {
		int result = 0;
		con = Dbm.getConnection();
		String sql = "UPDATE rentlist SET rentdate=TO_DATE(''||?||'', 'YYYY-MM-DD'), "
				+ "booknum=?, membernum=?, discount=? WHERE num=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,  rdto.getRdate());
			pstmt.setInt(2, rdto.getBnum());
			pstmt.setInt(3, rdto.getMnum());
			pstmt.setInt(4, rdto.getD());
			pstmt.setInt(5, rdto.getRnum());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {e.printStackTrace();
		} finally {
			Dbm.close(con, pstmt, rs);
		}
		return result;
	}

	public int delete(RentDto rdto) {
		int result = 0;
		con = Dbm.getConnection();
		String sql = "DELETE FROM rentlist WHERE num=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rdto.getRnum());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {e.printStackTrace();
		}
		return result;
	}


}
