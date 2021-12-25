package jdbc_qwer.BD;

import java.sql.*;
import java.util.ArrayList;

public class BookDao {
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String driver = "oracle.jdbc.OracleDriver";
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public ArrayList<BookDto> select() {
		ArrayList<BookDto> list = new ArrayList<BookDto>();
		String sql = "SELECT * FROM booklist";
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, "scott", "tiger");
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BookDto bdto = new BookDto();
				int num = rs.getInt("num");
				bdto.setNum(num);
				bdto.setSubject(rs.getString("subject"));
				bdto.setGrade(rs.getString("grade"));
				bdto.setMakeyear(rs.getInt("makeyear"));
				bdto.setInprice(rs.getInt("inprice"));
				bdto.setRentprice(rs.getInt("rentprice"));
				
				list.add(bdto);
			}
			
			
		} catch (ClassNotFoundException e) {e.printStackTrace();
		} catch (SQLException e) {e.printStackTrace();
		} finally {
				try {
					if(con != null)con.close();
					if(pstmt != null)pstmt.close();
					if(rs != null)rs.close();
				} catch (SQLException e) {e.printStackTrace();
				}
		}
		return list;
	}


	public int insert(BookDto bdto) {
		int result = 0;
		String sql = "INSERT INTO booklist VALUES(book_seq.nextVal, ?, ?, ?, ? ,?)";
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, "scott", "tiger");
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, bdto.getSubject());
			pstmt.setInt(2, bdto.getMakeyear());
			pstmt.setInt(3, bdto.getInprice());
			pstmt.setInt(4, bdto.getRentprice());
			pstmt.setString(5, bdto.getGrade());
			
			result = pstmt.executeUpdate();
			
		} catch (ClassNotFoundException e) {e.printStackTrace();
		} catch (SQLException e) {e.printStackTrace();
		} finally {
				try {
					if(con != null)con.close();
					if(pstmt != null)pstmt.close();
					if(rs != null)rs.close();
				} catch (SQLException e) {e.printStackTrace();
				}
		}
		return result;
	}


	public int update(BookDto bdto) {
		int result = 0;
		String sql = "UPDATE booklist SET subject=?, makeyear=?, inprice=?, "
				+ "rentprice=?, grade=? WHERE num=?";
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, "scott", "tiger");
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, bdto.getSubject());
			pstmt.setInt(2, bdto.getMakeyear());
			pstmt.setInt(3, bdto.getInprice());
			pstmt.setInt(4, bdto.getRentprice());
			pstmt.setString(5, bdto.getGrade());
			pstmt.setInt(6, bdto.getNum());
			result = pstmt.executeUpdate();
		} catch (ClassNotFoundException e) {e.printStackTrace();
		} catch (SQLException e) {e.printStackTrace();
		} finally {
				try {
					if(con != null)con.close();
					if(pstmt != null)pstmt.close();
					if(rs != null)rs.close();
				} catch (SQLException e) {e.printStackTrace();
				}
		}
		return result;
	}


	public BookDto getBook(int num) {
		/**/
		// 
		BookDto bdto = null;
		String sql = "SELECT * FROM booklist WHERE num=?";
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, "scott", "tiger");
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bdto = new BookDto();
				bdto.setNum(rs.getInt("num"));
				bdto.setSubject(rs.getString("subject"));
				bdto.setMakeyear(rs.getInt("makeyear"));
				bdto.setInprice(rs.getInt("inprice"));
				bdto.setRentprice(rs.getInt("rentprice"));
				bdto.setGrade(rs.getString("grade"));
			}
		} catch (ClassNotFoundException e) {e.printStackTrace();
		} catch (SQLException e) {e.printStackTrace();
		} finally {
				try {
					if(con != null)con.close();
					if(pstmt != null)pstmt.close();
					if(rs != null)rs.close();
				} catch (SQLException e) {e.printStackTrace();
				}
		}
		
		
		return bdto;
	}


	public int delete(int num) {
		/**/
		// 
		int result = 0;
		String sql = "DELETE FROM booklist WHERE num=?";
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, "scott", "tiger");
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();
		} catch (ClassNotFoundException e) {e.printStackTrace();
		} catch (SQLException e) {e.printStackTrace();
		} finally {
				try {
					if(con != null)con.close();
					if(pstmt != null)pstmt.close();
					if(rs != null)rs.close();
				} catch (SQLException e) {e.printStackTrace();
				}
		}
		return result;
	}
	
	
	
	
	
	
}
