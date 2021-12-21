package jdbc04;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Scanner;

public class Memberdriver2 {

	public static void main(String[] argrs) {
		/**/
		//
		
		Scanner sc = new Scanner(System.in);
		while(true) {
			System.out.println();
			System.out.printf("1.데이터 열람 2.데이터 추가 3. 데이터수정 4. 데이터 삭제 5. 프로그램 종료 >> 메뉴 선택");
			String choice = sc.nextLine();
			if(choice.equals("5")) {
				break;
			}
			MemberDao mdao = new MemberDao();
			switch(choice) {
			case "1":
//				mdao.select();
				select(sc);
				break;
			case "2":
				insert(sc);
				break;
			case "3":
				update(sc);
				break;
//			case "4":
////				mdao.delete();
//				break;
			default : System.out.println("메뉴 선택이 잘못되었습니다");
			}
		}
	}

	private static void update(Scanner sc) {
		// 
		MemberDao mdao = MemberDao.getInstance();
		MemberDto mdto = null;
		
		int num;
		String input;
		while(true) {
			System.out.printf("수정할 회원번호를 입려하세요");
			input = sc.nextLine();
			if( input.equals("")) {
				System.out.println("회원번호 입력은 필수 입니다");
			}else break;
		}
		
		num = Integer.parseInt(input);
		
		mdto = mdao.getMember(num);
		if(mdto==null) {
			System.out.println("입력하신 회원 번호에 해당하는 회원이 없습니다");
			return;
		}
		
		// 이름입력 후 빈칸이 아니라면 mdto 에 저장
		System.out.println("수정할 이름을 입려하세요");
		String name = sc.nextLine();
		if(!name.equals("")) {
			mdto.setName(name);
		}
		// 전화번호 후 빈칸이 아니라면 mdto 에 저장
		System.out.println("수정할 전화번호을 입려하세요");
		String phone = sc.nextLine();
		if(!phone.equals("")) {
			mdto.setPhone(phone);
		}
		// 성별입력 후 빈칸이 아니라면 mdto 에 저장
		System.out.println("수정할 성별을 입려하세요");
		String gender = sc.nextLine();
		if(!gender.equals("")) {
			mdto.setGender(gender);
		}
		// 포인트 후 빈칸이 아니라면 mdto 에 저장
		System.out.println("수정할 포인트를 입려하세요");
		String bpoint = sc.nextLine();
		if(!bpoint.equals("")) {
			mdto.setBpoint(Integer.parseInt(bpoint));
		}
		// 생일입력 후 빈칸이 아니라면 mdto 에 저장
		System.out.println("수정할 날짜를 입려하세요");
		String birth = sc.nextLine();
		if(!birth.equals("")) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date d = null;
			while(true) {
				try {
					d = sdf.parse(sc.nextLine());
					break;
				}catch(ParseException e) {
					System.out.println("날자를 입력예로 맞춰 다시 입력하세요 (2015-12-31)");
				}
			}
			java.sql.Date birth2 = new java.sql.Date(d.getTime());
			mdto.setBirth(birth2);
			// 나이 계산 후 빈칸이 아니라면 mdto 에 저장
			System.out.println("나이 계산");
			if(!birth.equals("")) {
				Calendar c = Calendar.getInstance();
				Calendar today = Calendar.getInstance();
				c.setTime(d); // c.setTime(birth); Date 자료를 Calendar 자료로 변환
				int age = today.get(Calendar.YEAR) - c.get(Calendar.YEAR) + 1;
				mdto.setAge(age);
			}
		}
		
		int result = mdao.update(mdto);
		if(result ==1) {
			System.out.println("레코드 수정 성공");
		}else {
			System.out.println("레코드 수정 실패");
		}
		
	}

	private static void insert(Scanner sc) {
		//
		MemberDao mdao = MemberDao.getInstance();
		MemberDto mdto = new MemberDto();
		// 회원번호는 Sequence 를 이용하빈다
		System.out.println("이름을 입력하세요");
		mdto.setName(sc.nextLine());
		
		System.out.println("전화번호를 입력하세요");
		mdto.setPhone(sc.nextLine());
		
		System.out.println("성별을 입력하세요(M/F) : ");
		mdto.setGender(sc.nextLine());
		
		// 생일 입력 - java.util.Date() 형식의 입력 후 java.sql.Date() 로의 변환이 필요합니다
		// java.util.Date() 의 입력을 위해선 SimpleDateFormat 의 parse 동작이 필요합니다
		System.out.printf("생일을 입력하세요 (YYYY-MM-DD)");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date d = null;
		while(true) {
			try {
				d = sdf.parse(sc.nextLine());
				break;
			}catch(ParseException e) {
				System.out.println("날자를 입력예로 맞춰 다시 입력하세요 (2015-12-31)");
			}
		}
//		java.util.Date 를 java.sql.Date 로 변환
		java.sql.Date birth = new java.sql.Date(d.getTime());
		//dto 에 입력
		mdto.setBirth(birth);
		
		// 나이는 생년월일로 자동 계산
		Calendar c = Calendar.getInstance();
		Calendar today = Calendar.getInstance();
		c.setTime(d); // c.setTime(birth); Date 자료를 Calendar 자료로 변환
		int age = today.get(Calendar.YEAR) - c.get(Calendar.YEAR) + 1;
		mdto.setAge(age);
		
		int result = mdao.insert(mdto);
		if(result ==1) {
			System.out.println("레코드 추가 성공");
		}else {
			System.out.println("레코드 추가 실패");
		}
		
	}

	private static void select(Scanner sc) {
		// 
		MemberDao mdao = MemberDao.getInstance();
		ArrayList<MemberDto> list = mdao.select();
		System.out.println("번호\t이름\t\t전화\t\t\t\t생일\t\t포인트\t\t나이\t성별\t가입일");
		System.out.println("--------------------------------------------------------------------");
		for (MemberDto mdto : list) {
			System.out.printf("%d \t %s \t %s \t %s \t %6d \t %3d \t %s \t %s\n", 
					mdto.getNum(), mdto.getName(), mdto.getPhone(),
					mdto.getBirth(), mdto.getBpoint(), mdto.getAge(), 
					mdto.getGender(), mdto.getJoindate());
		}
		System.out.println("--------------------------------------------------------------------");
	}
}
