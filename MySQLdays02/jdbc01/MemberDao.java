package jdbc01;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Scanner;

public class MemberDao {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	private MemberDao() {}
	private static MemberDao itc = new MemberDao();
	public static MemberDao getInstance() {return itc;}
	
	public ArrayList<MemberDto> selectAll(){
		ArrayList<MemberDto> list = new ArrayList<MemberDto>();
//		String sql = "SELECT * FROM memberlist ORDER BY num";
		String sql = "SELECT num, name, phone, DATE_FORMAT(birth,'%Y%m%d') AS birth, "
				+ " bpoint, DATE_FORMAT(joindate,'%Y%m%d') AS jd, age, gender "
				+ " FROM scott.memberlist ORDER BY num DESC";
		con = Dbman.getConnection();
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberDto mdto = new MemberDto();
				mdto.setNum(rs.getInt("num"));
				mdto.setName(rs.getString("name"));
				mdto.setPhone(rs.getString("phone"));
				mdto.setBirth(rs.getString("birth"));
				mdto.setBpoint(rs.getInt("bpoint"));
				mdto.setJoindate(rs.getString("jd"));
				mdto.setAge(rs.getInt("age"));
				mdto.setGender(rs.getString("gender"));
				list.add(mdto);
			}
			
		} catch (SQLException e) {e.printStackTrace();
		} finally {
			Dbman.close(con, pstmt, rs);
		}
		return list;
		}
	
	public int insert(MemberDto mdto){
		int result = 0;
//		String sql = "INSERT INTO memberlist(name, phone, birth, bpoint, age, gender) "
//				+ " VALUES(?, ?, ?, ?, ?, ?)";
		String sql = "INSERT INTO memberlist(name, phone, birth, bpoint, age, gender) "
				+ " VALUES(?, ?, STR_TO_DATE(CONCAT('', ?, ''), '%Y-%m-%d'), ?, ?, ?)";
		// concat('', ?, '') -> '' : 작은 따옴표 두개, 큰 따옴표 하나 아님
		con = Dbman.getConnection();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mdto.getName());
			pstmt.setString(2, mdto.getPhone());
			pstmt.setString(3, mdto.getBirth());
			pstmt.setInt(4, mdto.getBpoint());
			pstmt.setInt(5, mdto.getAge());
			pstmt.setString(6, mdto.getGender());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {e.printStackTrace();
		} finally {
			Dbman.close(con, pstmt, rs);
		}
		return result;
	}
	
	public int update(MemberDto mdto){
		int result = 0;
//		String sql = "UPDATE memberlist SET name=?, phone=?, birth=?, bpoint=?, "
//				+ " age=?, gender=?, joindate=? WHERE num=?";
		String sql = "UPDATE memberlist SET name=?, phone=?, "
				+ " birth=STR_TO_DATE(CONCAT('', ?, ''), '%Y-%m-%d'), bpoint=?, "
				+ " age=?, gender=?, joindate=STR_TO_DATE(CONCAT('', ?, ''), '%Y-%m-%d') "
				+ " WHERE num=?";
		con = Dbman.getConnection();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mdto.getName());
			pstmt.setString(2, mdto.getPhone());
			pstmt.setString(3, mdto.getBirth());
			pstmt.setInt(4, mdto.getBpoint());
			pstmt.setInt(5, mdto.getAge());
			pstmt.setString(6, mdto.getGender());
			pstmt.setString(7, mdto.getJoindate());
			pstmt.setInt(8, mdto.getNum());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {e.printStackTrace();
		} finally {
			Dbman.close(con, pstmt, rs);
		}
		return result;
	}
	
	public int delete(int num){
		int result = 0;
		String sql = "DELETE FROM memberlist WHERE num=?";
		con = Dbman.getConnection();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {e.printStackTrace();
		} finally {
			Dbman.close(con, pstmt, rs);
		}
		return result;
	}
	
	public MemberDto selectOne(int num){
		MemberDto mdto = null;
//		String sql = "SELECT * FROM memberlist WHERE num=?";
		String sql = "SELECT num, name, phone, bpoint, age, gender, "
				+ " DATE_FORMAT(birth, '%Y-%m-%d') AS birth, "
				+ " DATE_FORMAT(joindate, '%Y-%m-%d') AS joindate "
				+ " FROM memberlist WHERE num=? ORDER BY num DESC";
		con = Dbman.getConnection();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				mdto = new MemberDto();
				mdto.setNum(rs.getInt("num"));
				mdto.setName(rs.getString("name"));
				mdto.setPhone(rs.getString("phone"));
				mdto.setBirth(rs.getString("birth"));
				mdto.setBpoint(rs.getInt("bpoint"));
				mdto.setJoindate(rs.getString("joindate"));
				mdto.setAge(rs.getInt("age"));
				mdto.setGender(rs.getString("gender"));
			}
		} catch (SQLException e) {e.printStackTrace();
		} finally {
			Dbman.close(con, pstmt, rs);
		}
		return mdto;
	}
}
