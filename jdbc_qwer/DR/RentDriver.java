package jdbc_qwer.DR;

import java.util.*;

public class RentDriver {

	public static void main(String[] argrs) {
//		rentdate num booknum membernum discount
		while(true) {
			Scanner sc = new Scanner(System.in);
			System.out.println("1.대여목록 2.대여추가 3.대여수정 4.대여삭제 5.대여상세열람 6.종료");
			String c = sc.nextLine();
			if(c.equals("6")) {
				System.out.println("종료");
				return;
			}
			switch(c) {
			case "1" : select(); break;
			case "2" : insert(); break;
			case "3" : update(); break;
			case "4" : delete(); break;
			case "5" : selectAll(); break;
			default : System.out.println("메뉴 선택 잘못됨");
			}
		}
	}

	private static void select() {
		Scanner sc = new Scanner(System.in);
		RentDao rdao = RentDao.getInstance();
		ArrayList<RentDto> rlist = rdao.select();
		System.out.println("날짜\t 순번 \t도서번호 \t회원번호 \t할인금액");
		System.out.println("---------------------------------------------------------------------");
		for(RentDto rdto : rlist) {
			System.out.printf("%s \t%d \t%d \t%d \t %d\n",
					rdto.getRdate(), rdto.getRnum(), rdto.getBnum(), rdto.getMnum(), rdto.getD());
		}
		System.out.println("---------------------------------------------------------------------");
	}
	private static void insert() {
		Scanner sc = new Scanner(System.in);
		RentDao rdao = RentDao.getInstance();
		RentDto rdto = new RentDto();
		System.out.println("대여 기록 입력");
		System.out.println("대여할 도서번호 입력");
		int booknum = 0;
		while(true) {
			booknum = Integer.parseInt(sc.nextLine());
			boolean s = rdao.checkB(booknum);
			if(s) {
				break;
			}else {
				System.out.println("번호에 해당하는 도서번호가 없음 재입력");
			}
		}
		rdto.setBnum(booknum);
		System.out.println("대여할 회원번호 입력");
		int membernum = 0;
		while(true) {
			membernum = Integer.parseInt(sc.nextLine());
			boolean s = rdao.checkM(membernum);
			if(s) {
				break;
			}else {
				System.out.println("번호에 해당되는 회원 없음 재입력");
			}
		}
		rdto.setMnum(membernum);
		System.out.println("할인금액 입력");
		String input = sc.nextLine();
		int discount = 0;
		if( !input.equals("")) {
			discount = Integer.parseInt(input);
		}
		rdto.setD(discount);
		int result = rdao.insert(rdto);
		if(result ==1) {
			System.out.println("기록 추가 성공");
		}else {
			System.out.println("기록 추가 실패");
		}
		
	}
	private static void update() {
		Scanner sc = new Scanner(System.in);
		RentDao rdao = RentDao.getInstance();
		RentDto rdto = null;
		System.out.println("수정할 대여번호 입력");
		String input;
		while(true) {
			input = sc.nextLine();
			if(input.equals("")) {
				System.out.println("수정할 대여번호 입력 필수");
			}else break;
		}
		int num = Integer.parseInt(input);
		rdto = rdao.getRent(num);
		if(rdto == null) {
			System.out.println("입력한 번호에 해당하는 대여번호 없음");
			return;
		}
		System.out.printf("대여날짜 %s 수정\n", rdto.getRdate());
		String rdate = sc.nextLine();
		if( !rdate.equals(""))rdto.setRdate(rdate);
		
		System.out.printf("도서번호 %d 수정\n", rdto.getBnum());
		int booknum = 0;
		while(true) {
			String bookinput = sc.nextLine();
			if(bookinput.equals("")) {
				break;
			}else {
				booknum = Integer.parseInt(bookinput);
				boolean s = rdao.checkB(booknum);
				if(s) {
					rdto.setBnum(booknum);
					break;
				}else {
					System.out.println("입력한 도서번호 존재하지 않음");
				}
			}
		}
		
		System.out.printf("회원번호 %d 수정\n", rdto.getMnum());
		int membernum = 0;
		while(true) {
			String memberinput = sc.nextLine();
			if(memberinput.equals("")) {
				break;
			}else {
				membernum = Integer.parseInt(memberinput);
				boolean s = rdao.checkM(membernum);
				if(s) {
					rdto.setMnum(membernum);
					break;
				}else {
					System.out.println("입력한 회원번호 존재하지 않음");
				}
			}
		}
		
		System.out.printf("할인금액 %d 수정\n", rdto.getD());
		String discount = sc.nextLine();
		if(!discount.equals("")) {
			rdto.setD(Integer.parseInt(discount));
		}
		int result = rdao.update(rdto);
		if(result ==1) {
			System.out.println("수정 성공");
		}else {
			System.out.println("수정 실패");
		}
	}
	private static void delete() {
		Scanner sc = new Scanner(System.in);
		RentDao rdao = RentDao.getInstance();
		RentDto rdto = new RentDto();
		System.out.println("삭제할 대여번호 입력");
		String input;
		while(true) {
			input = sc.nextLine();
			if(input.equals("")) {
				System.out.println("삭제할 대여번호 입력 필수");
			}else break;
		}
		int num = Integer.parseInt(input);
		rdto = rdao.getRent(num);
		if(rdto == null) {
			System.out.println("입력한 번호에 해당하는 대여기록 없음");
			return;
		}
		int result = rdao.delete(rdto);
		if(result ==1) {
			System.out.println("삭제 성공");
		} else {
			System.out.println("삭제 실패");
		}
	}
	private static void selectAll() {	}

}
