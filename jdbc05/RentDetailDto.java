package jdbc05;

public class RentDetailDto {
	private String rentdate;
	private int rentnum;
	private int membernum;
	private String membername;
	private int rentprice2;
	private int booknum;
	private String subject;
	
	public String getRentdate() {
		return rentdate;
	}
	public void setRentdate(String rentdate) {
		this.rentdate = rentdate;
	}
	public int getRentnum() {
		return rentnum;
	}
	public void setRentnum(int rentnum) {
		this.rentnum = rentnum;
	}
	public int getMembernum() {
		return membernum;
	}
	public void setMembernum(int membernum) {
		this.membernum = membernum;
	}
	public String getMembername() {
		return membername;
	}
	public void setMembername(String membername) {
		this.membername = membername;
	}
	public int getRentprice2() {
		return rentprice2;
	}
	public void setRentprice2(int rentprice2) {
		this.rentprice2 = rentprice2;
	}
	public int getBooknum() {
		return booknum;
	}
	public void setBooknum(int booknum) {
		this.booknum = booknum;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	
	
}
