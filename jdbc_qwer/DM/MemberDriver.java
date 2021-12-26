package jdbc_qwer.DM;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Scanner;

public class MemberDriver {

	public static void main(String[] argrs) {
		/**/
		//
		Scanner sc = new Scanner(System.in);
		while(true) {
			System.out.println("1.멤버열람 2.멤버추가 3.멤버수정 4.멤버삭제 5.종료");
			String c = sc.nextLine();
			if(c.equals("5")) {
				System.out.println("프로그램 종료");
				return;
			}
			MemberDao mdao = new MemberDao();
			switch(c) {
			case "1":
				select(sc);
				break;
			case "2":
				insert(sc);
				break;
			case "3":
				update(sc);
				break;
			case "4":
				delete(sc);
				break;
			default : System.out.println("메뉴선택 잘못됨");
			}
		}
	}
	
	private static void select(Scanner sc) {
		/**/
		// 
		MemberDao mdao = MemberDao.getInstance();
		ArrayList<MemberDto> mlist = mdao.select();
		System.out.println("번호 이름 전화 생일 포인트 성별 나이 가입일");
		System.out.println("---------------------------------------");
		for(MemberDto mdto : mlist) {
			System.out.printf("%d\t %s\t %s\t %s\t %d\t %s\t %d\t %s\n"
					, mdto.getN(), mdto.getName(), mdto.getP(),mdto.getB(),
					mdto.getBp(), mdto.getG(), mdto.getA(), mdto.getJd());
		}
		System.out.println("---------------------------------------");
	}
	
	private static void insert(Scanner sc) {
		MemberDao mdao = MemberDao.getInstance();
		MemberDto mdto = new MemberDto();
		System.out.println("멤버 추가");
		System.out.println("이름 입력");
		mdto.setName(sc.nextLine());
		System.out.println("전화번호 입력");
		mdto.setP(sc.nextLine());
		System.out.println("성별 입력 M/F");
		mdto.setG(sc.nextLine());
		System.out.println("포인트 입력");
		mdto.setBp(Integer.parseInt(sc.nextLine()));
		System.out.println("생일 입력 YYYY-MM-DD");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date d = null;
		while(true) {
			try {
				d=sdf.parse(sc.nextLine());
				break;
			} catch (ParseException e) {e.printStackTrace();
				System.out.println("올바르지 않은 날짜입력양식");
			}
		}
//		java.sql.Date birth = (java.sql.Date) new Date(d.getTime());
		java.sql.Date birth = new java.sql.Date(d.getTime());
		mdto.setB(birth);
		Calendar c = Calendar.getInstance();
		Calendar today = Calendar.getInstance();
		c.setTime(d);
		int age = today.get(Calendar.YEAR) - c.get(Calendar.YEAR) +1;
		mdto.setA(age);
		int result = mdao.insert(mdto);
		if(result ==1) {
			System.out.println("추가 성공");
		}else {
			System.out.println("추가 실패");
		}
	}
	
	private static void update(Scanner sc) {
		MemberDao mdao = MemberDao.getInstance();
		MemberDto mdto = null;
		int num;
		String input;
		while(true) {
			System.out.println("수정할 회원번호 입력");
			input = sc.nextLine();
			if(input.equals("")) {
				System.out.println("회원번호 필수 입력");
			}else break;
		}
		
		num = Integer.parseInt(input);
		mdto = mdao.getMember(num);
		
		if(mdto==null) {
			System.out.println("해당되는 회원번호 없음");
			return;
		}
		System.out.printf("num %d 회원 수정\n", mdto.getN());
		System.out.printf("이름 %s \n", mdto.getName());
		System.out.println("이름 변경");
		String name = sc.nextLine();
		if( !name.equals("")) {
			mdto.setName(name);
		}
		System.out.printf("전화번호 %s \n", mdto.getP());
		System.out.println("전화번호 변경");
		String phone = sc.nextLine();
		if( !phone.equals("")) {
			mdto.setP(phone);
		}
		System.out.printf("포인트 %s \n", mdto.getBp());
		System.out.println("포인트 변경");
		String bpoint = sc.nextLine();
		if( !bpoint.equals("")) {
			mdto.setBp(Integer.parseInt(bpoint));
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date d = null;
		
		System.out.printf("생년월일 %s \n", mdto.getB());
		System.out.println("생년월일 변경");
		while(true) {
			try {
				String birth = sc.nextLine();
				if( birth.equals("")) {break;	}
				d = sdf.parse(birth);
				break;
			} catch(ParseException e) {
				System.out.println("생년월일 재입력");
				e.printStackTrace();
			}
		}
		if(d != null) {
			java.sql.Date sd = new java.sql.Date(d.getTime());
			mdto.setB(sd);
			Calendar c = Calendar.getInstance();
			Calendar today = Calendar.getInstance();
			c.setTime(d);
			int age = today.get(Calendar.YEAR)-c.get(Calendar.YEAR) +1;
			mdto.setA(age);
		}
		
		
		SimpleDateFormat sdf_jdd = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date jdd = null;
		System.out.printf("가입일 %s \n", mdto.getJd());
		System.out.println("가입일 변경");
//		String joindate = sc.nextLine();
//		if( !joindate.equals("")) {
//			java.sql.Date jd = new java.sql.Date(joindate);
//			mdto.setJd(jd);
//		}
		while(true) {
			try {
				String jd = sc.nextLine();
				if( jd.equals("")) {break;	}
				jdd = sdf_jdd.parse(jd);
				break;
			} catch(ParseException e) {
				System.out.println("가입일 재입력");
				e.printStackTrace();
			}
		}
		if(jdd != null) {
			java.sql.Date jdate = new java.sql.Date(jdd.getTime());
			mdto.setJd(jdate);
		}
		
		System.out.printf("성별 %s \n", mdto.getG());
		System.out.println("성별 변경");
		String gender = sc.nextLine();
		if( !gender.equals("")) {
			mdto.setG(gender);
		}
		
		int result = mdao.update(mdto);
		if(result == 1) {
			System.out.println("수정 성공");
		}else {
			System.out.println("수정 실패");
		}
	}
	
	private static void delete(Scanner sc) {
		MemberDao mdao = MemberDao.getInstance();
		MemberDto mdto = null;
		int result, num;
		String input;		
		while(true) {
			System.out.println("삭제할 회원번호 입력");
			input = sc.nextLine();
			if(input.equals("")) {
				System.out.println("회원번호 입력 필수");
			} else {
				break;
			}
		}
		num = Integer.parseInt(input);
		mdto = mdao.getMember(num);
		if(mdto == null) {
			System.out.println("해당하는 회원번호 없음");
			return;
		}else {
			result = mdao.delete(num);
		}
		if(result == 1) {
			System.out.println("삭제 성공");
		}else {
			System.out.println("삭제 실패");
		}
	}
}
