package jdbc_qwer.DM;

import java.sql.*;
import java.util.ArrayList;

public class MemberDao {
	MemberDao(){}
	private static MemberDao itc = new MemberDao();
	public static MemberDao getInstance() {
		return itc;
	}
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String driver = "oracle.jdbc.OracleDriver";
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	private Connection getConnection() {
		Connection c = null;
		try {
			Class.forName(driver);
			c = DriverManager.getConnection(url, "scott", "tiger");
		} catch (ClassNotFoundException e) {e.printStackTrace();
		} catch (SQLException e) {e.printStackTrace();
		}
		return c;
	}
	private void close() {
			try {
				if(con != null)con.close();
				if(pstmt != null)pstmt.close();
				if(rs != null)rs.close();
			} catch (SQLException e) {e.printStackTrace();
			}
	}
	
	
	// select() 
	public ArrayList<MemberDto> select() {
		ArrayList<MemberDto> mlist = new ArrayList<MemberDto>();
//		String sql = "SELECT * FROM memberlist";
		String sql = "SELECT * FROM memberlist ORDER BY num DESC";
		con = getConnection();
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberDto mdto = new MemberDto();
				mdto.setN(rs.getInt("num"));
				mdto.setName(rs.getString("name"));
				mdto.setP(rs.getString("phone"));
				mdto.setB(rs.getDate("birth"));
				mdto.setBp(rs.getInt("bpoint"));
				mdto.setG(rs.getString("gender"));
				mdto.setA(rs.getInt("age"));
				mdto.setJd(rs.getDate("joindate"));
				mlist.add(mdto);
			}
		} catch (SQLException e) {e.printStackTrace();
		} finally {
			close();
		}
		return mlist;
	}
	public int insert(MemberDto mdto) {
		int result = 0;
		//num name phone birth bpoint joindate gender age
		String sql = "INSERT INTO memberlist VALUES(member_seq.nextVal "
				+ ", ?, ?, ?, ?, sysdate, ?, ?)";
		con = getConnection();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mdto.getName());
			pstmt.setString(2, mdto.getP());
			pstmt.setDate(3, mdto.getB());
			pstmt.setInt(4, mdto.getBp());
			pstmt.setString(5, mdto.getG());
			pstmt.setInt(6, mdto.getA());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	public MemberDto getMember(int num) {
		//num name phone birth bpoint joindate gender age
		MemberDto mdto = null;
		String sql = "SELECT * FROM memberlist WHERE num=?";
		con = getConnection();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num); 
			rs = pstmt.executeQuery();
			if(rs.next()) {
				mdto = new MemberDto();
				mdto.setN(rs.getInt("num"));
				mdto.setName(rs.getString("name"));
				mdto.setP(rs.getString("phone"));
				mdto.setB(rs.getDate("birth"));
				mdto.setBp(rs.getInt("bpoint"));
				mdto.setJd(rs.getDate("joindate"));
				mdto.setG(rs.getString("gender"));
				mdto.setA(rs.getInt("age"));
			}
		} catch (SQLException e) {e.printStackTrace();
		} finally {
			close();
		}
		return mdto;
	}
	public int update(MemberDto mdto) {
		// 
		int result = 0;
		String sql = "UPDATE memberlist SET name=?, phone=?, birth=?, bpoint=?, "
				+ " joindate=?, gender=?, age=? WHERE num=?";
		con = getConnection();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mdto.getName());
			pstmt.setString(2, mdto.getP());
			pstmt.setDate(3, mdto.getB());
			pstmt.setInt(4, mdto.getBp());
			pstmt.setDate(5, mdto.getJd());
			pstmt.setString(6, mdto.getG());
			pstmt.setInt(7, mdto.getA());
			pstmt.setInt(8, mdto.getN());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	public int delete(int num) {
		int result = 0;
		String sql = "DELETE FROM memberlist WHERE num=?";
		con = getConnection();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {e.printStackTrace();
		} finally {
			close();
		}
		
		return result;
	}
	
	
	
	
}
