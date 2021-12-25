package jdbc_qwer.BD;

import java.util.ArrayList;
import java.util.Scanner;

public class Book_Driver {

	public static void main(String[] argrs) {
		/**/
		//
		Scanner sc = new Scanner(System.in);
		while(true) {
			System.out.printf("1.데이터 열람 2.데이터 추가 3.데이터 수정 4. 데이터 삭제");
			System.out.println(" 5. 프로그램 종료");
			int choice = sc.nextInt();
			if(choice==5) {
//				System.out.println("테스트");
				System.out.println("프로그램 종료");
				return;
			}
			BookDao bdao = new BookDao();
			switch(choice) {
			case 1:
				select(sc, bdao);
				break;
			case 2:
				insert(sc, bdao);
				break;
			case 3:
				update(sc, bdao);
				break;
			case 4:
				delete(sc, bdao);
				break;
			default : System.out.println("메뉴 선택이 잘못됨");
			}
		}
	}

	private static void select(Scanner sc, BookDao bdao) {
		System.out.println("도서번호\t 출판년도\t 입고가격 \t대여가격 \t등급 \t제목");
		System.out.println("-----------------------------------------------------");
		ArrayList<BookDto> list = bdao.select(); 
		for(BookDto bdto : list) {
			System.out.printf("%d\t\t%d\t\t%d\t%d\t\t%s\t%s\n",
					bdto.getNum(), bdto.getMakeyear(), bdto.getInprice(),
					bdto.getRentprice(), bdto.getGrade(), bdto.getSubject());
		}
		System.out.println("-----------------------------------------------------");
	}
	
	private static void insert(Scanner sc, BookDao bdao) {
		/**/
		//
		String block = sc.nextLine();
		System.out.println("데이터 추가");
		System.out.println("제목");
		String subject = sc.nextLine();
		
		System.out.println("출판년도");
		int makeyear = Integer.parseInt(sc.nextLine());
		System.out.println("입고가격");
		int inprice = Integer.parseInt(sc.nextLine());
		System.out.println("대여가격");
		int rentprice = Integer.parseInt(sc.nextLine());
		System.out.println("등급");
		String grade = sc.nextLine();
		
		BookDto bdto = new BookDto();
		bdto.setSubject(subject);
		bdto.setMakeyear(makeyear);
		bdto.setInprice(inprice);
		bdto.setRentprice(rentprice);
		bdto.setGrade(grade);
		int result = bdao.insert(bdto);
		if(result==1) {
			System.out.println("데이터 추가 성공");
		}else {
			System.out.println("데이터 추가 실패");
		}
		
	}
	
	private static void update(Scanner sc, BookDao bdao) {
		// 
		String block = sc.nextLine();
		int num = 0;
		while(true) {
			System.out.printf("수정할 도서번호를 입력 : ");
			String input = sc.nextLine();
			if(input.equals("")) {
				System.out.println("도서번호 입력");
			}else {
				num = Integer.parseInt(input);
				break;
			}
		}
		
		BookDto bdto = bdao.getBook(num);
		if(bdto == null) {
			System.out.println("입력한 번호의 도서 없음");
			return;
		}
		
		System.out.printf("num %d 도서의 데이터 수정\n", num);
		System.out.println("제목 입력");
		String subject = sc.nextLine();
		if( !subject.equals("")) {
			bdto.setSubject(subject);
		}
		System.out.println("출판년도 입력");
		String makeyear = sc.nextLine();
		if( !makeyear.equals("")) {
			bdto.setMakeyear(Integer.parseInt(makeyear));
		}
		System.out.println("입고가격 입력");
		String inprice = sc.nextLine();
		if( !inprice.equals("")) {
			bdto.setInprice(Integer.parseInt(inprice));
		}
		System.out.println("대여가격 입력");
		String rentprice = sc.nextLine();
		if( !rentprice.equals("")) {
			bdto.setRentprice(Integer.parseInt(rentprice));
		}
		System.out.println("등급 입력");
		String grade = sc.nextLine();
		if( !grade.equals("")) {
			bdto.setGrade(grade);
		}
		
		int result = bdao.update(bdto);
		if(result ==1) {
			System.out.println("데이터 수정 성공");
		}else {
			System.out.println("데이터 수정 실패");
		}
	}
	
	private static void delete(Scanner sc, BookDao bdao) {
		String block = sc.nextLine();
		int num = 0;
		while(true) {
			System.out.println("삭제할 도서 번호 입력");
			String input = sc.nextLine();
			if(input.equals("")) {
				System.out.println("입력한 도서번호 없음");
			}else {
				num = Integer.parseInt(input);
				System.out.println("도서번호 " + num + "삭제");
				break;
			}
		}
		int result = bdao.delete(num);
		if(result==1) {
			System.out.printf("num %d 도서 삭제 완료", num);
		}else {
			System.out.printf("num %d 도서 삭제 실패", num);
		}
		System.out.println();
	}

}
