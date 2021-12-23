package jdbc05;

import java.util.ArrayList;
import java.util.Scanner;


public class RentDriver {

	public static void main(String[] argrs) {
		/**/
		//
		while(true) {
			Scanner sc = new Scanner(System.in);
			System.out.println("\n--- 메뉴 선택 ---");
			System.out.printf("1.데이터열람 2. 데이터추가 3. 데이터수정 4. 데이터 삭제");
			System.out.printf("5. 데이터상세열람 6. 프로그램 종료 >> 메뉴 선택");
			String choice = sc.nextLine();
			if(choice.equals("6")) {
				System.out.println("프로그램 종료");
				break;
			}
			switch(choice) {
				case "1" :
					select();
					break;
				case "2" :
					insert();
					break;
				case "3" :
					update();
					break;
				case "4" :
					delete();
					break;
				case "5" :
					selectAll();
					break;
				default : System.out.println("메뉴 선택이 잘못되었습니다");
			}
		}
		System.out.println("프로그램을 종료합니다");
	}

	private static void selectAll() {
		/**/
		// 
		Scanner sc = new Scanner(System.in);
		RentDao rdao = RentDao.getInstance();
		ArrayList<RentDetailDto> list =rdao.selectAll();
		System.out.println("날짜\t\t\t순번\t회원번호\t성명\t\t매출금액\t도서번호\t도서제목");
		System.out.println("--------------------------------------------------");
		for(RentDetailDto dto : list)
			System.out.printf("%s\t\t%d\t%d\t\t%s\t\t%d\t\t%d\t\t%s\n", dto.getRentdate(),
					dto.getRentnum(), dto.getMembernum(), dto.getMembername(),
					dto.getRentprice2(), dto.getBooknum(), dto.getSubject());			
		System.out.println("--------------------------------------------------");
	}

	private static void delete() {
		// 
		Scanner sc = new Scanner(System.in);
		RentDao rdao = RentDao.getInstance();
		RentDto rdto = null;
		System.out.printf("삭제할 대여건의 number 를 입력하세요");
		String input;
		while(true) {
			input = sc.nextLine();
			if(input.equals("")) {
				System.out.println("number 입력은 필수입니다");
			}else {
				break;
			}
		}
		int num = Integer.parseInt(input);
		rdto = rdao.getRent(num);
		if(rdto==null) {
			System.out.println("입력한 number 의 대여건이 없습니다");
			return;
		}
		
		int result = rdao.delete(num);
		if(result == 1) {
			System.out.println("레코드 삭제 성공");
		}else {
			System.out.println("레코드 삭제 실패");
		}
	}

	private static void update() {
		// 
		Scanner sc = new Scanner(System.in);
		RentDao rdao = RentDao.getInstance();
		RentDto rdto = null;
		// 수정할 대여번호 입력	
		System.out.printf("수정할 대여건의 number 를 입력하세요");
		String input;
		while(true) {
			input = sc.nextLine();
			if(input.equals("")) {
				System.out.println("number 입력은 필수입니다");
			}else {
				break;
			}
		}
		int num = Integer.parseInt(input);
		rdto = rdao.getRent(num);
		if(rdto==null) {
			System.out.println("입력한 number 의 대여건이 없습니다");
			return;
		}
		
		// 수정할 대여날짜 입력
		System.out.printf("대여일자 : %s \n수정할 날짜를 입력하세요 (YYYY-MM-DD)", rdto.getRentdate());
		String rentdate = sc.nextLine();
		if(!rentdate.equals(""))rdto.setRentdate(rentdate);
		
		
		// 수정할 회원번호 입력
		System.out.printf("도서번호 : %d \n수정할 도서 번호를 입력하세요 ", rdto.getBooknum());
		System.out.println();
		int booknum = 0;
		while(true) {
			input = sc.nextLine();
			if(input.equals("")) {
				break;
			}else {
				booknum = Integer.parseInt(sc.nextLine());
				boolean state = rdao.checkBooknum(booknum);
				if(state) {
					rdto.setBooknum(booknum);
					break;
				}else{
					System.out.println("입력한 도서번호가 존재하지 않습니다. 재입력해주세요");
				}
			}
		}
		
		// 수정할 회원번호 입력
		System.out.printf("회원번호 : %d \n수정할 회원 번호를 입력하세요 ", rdto.getMembernum());
		int membernum = 0;
		while(true) {
			input = sc.nextLine();
			if(input.equals("")) {
				break;
			}else {
				membernum = Integer.parseInt(sc.nextLine());
				boolean state = rdao.checkMembernum(membernum);
				if(state) {
					rdto.setMembernum(membernum);
					break;
				}else{
					System.out.println("입력한 회원번호의 회원이 존재하지 않습니다. 재입력해주세요");
				}
			}
		}
		// 수정할 할인금액
		System.out.printf("할인금액 : %d 수정할 할인금액을 입력하세요", rdto.getDiscount());
		String discount = sc.nextLine();
		if(!discount.equals("")) {
			rdto.setDiscount(Integer.parseInt(discount));
		}
		int result = rdao.update(rdto);
		if(result == 1) {
			System.out.println("레코드 수정 성공");
		}else {
			System.out.println("레코드 수정 실패");
		}
		// to_date("||?||", 'YYYYMMDD')
		
	}

	private static void insert() {
		// 유효성 확인때문에 많은 코드
		Scanner sc = new Scanner(System.in);
		RentDao rdao = RentDao.getInstance();
		RentDto rdto = new RentDto();
		
		// rentdate 는 오라클의 sysdate 또는 default 값을 이용
		// 대여할 도서의 번호 입력
		System.out.printf("대여도서의 번호를 입력하세요 ");
		int booknum = 0;
		while(true) {
			booknum = Integer.parseInt(sc.nextLine());
			// 외래키의 규칙으로 입력한 값의 유무 확인
			boolean state = rdao.checkBooknum(booknum);
			if(state) {
				break;
			}else{
				System.out.println("입력한 도서번호의 도서가 존재하지 않습니다. 재입력해주세요");
			}
		}
		rdto.setBooknum(booknum);
		
		// 대여하는 회원 번호 입력
		System.out.printf("대여하는 회원 번호를 입력하세요 ");
		int membernum = 0;
		while(true) {
			membernum = Integer.parseInt(sc.nextLine());
			// 외래키의 규칙으로 입력한 값의 유무 확인
			boolean state = rdao.checkMembernum(membernum);
			if(state) {
				break;
			}else{
				System.out.println("입력한 회원번호의 회원이 존재하지 않습니다. 재입력해주세요");
			}
		}
		rdto.setMembernum(membernum);
		
		// 할인금액 입력
		System.out.printf("할인금액를 입력하세요 ");
		String input = sc.nextLine();
		int discount = 0;
		if( !input.equals("")) {
			discount = Integer.parseInt(input);
		}
		rdto.setDiscount(discount);
		
		int result = rdao.insert(rdto);
		if(result==1) {
			System.out.println("레코드 추가 성공");
		}else {
			System.out.println("레코드 추가 실패");
		}
	}

	private static void select() {
		// 
		Scanner sc = new Scanner(System.in);
		RentDao rdao = RentDao.getInstance();
		ArrayList<RentDto> list = rdao.select();
		System.out.println("날짜\t\t\t순번\t도서번호\t회원번호\t할인금액");
		System.out.println("------------------------------------------------------------------");
		for(RentDto dto : list) {
			System.out.printf("%s\t\t%d\t%s\t\t%s\t\t%d\n", 
					dto.getRentdate(), dto.getNum(), dto.getBooknum(), dto.getMembernum(),
					dto.getDiscount());
		}
		System.out.println("------------------------------------------------------------------");
	}

}
