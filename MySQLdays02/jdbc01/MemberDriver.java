package jdbc01;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Scanner;

public class MemberDriver {

	public static void main(String[] argrs) {
		/**/
		//
		while(true) {
			Scanner sc = new Scanner(System.in);
			System.out.println("1.회원열람 2.회원추가 3.회원수정 4.회원삭제 5.종료");
			String choice = sc.nextLine();
			if(choice.equals("5")) {
				System.out.println("종료");
				return;
			}
			switch(choice) {
			case "1" : selectAll(); break;
			case "2" : insert(); break;
			case "3" : update(); break;
			case "4" : delete(); break;
			default : System.out.println("메뉴 번호 선택 잘못됨");
			}
		}
	}

	private static void selectAll() {
		MemberDao mdao = MemberDao.getInstance();
		ArrayList<MemberDto> list = mdao.selectAll();
		System.out.println("번호\t 이름 \t전화 \t생일 \t포인트 \t나이 \t성별 \t가입일");
		System.out.println("--------------------------------------------------------------------------");
		for(MemberDto dto : list) {
			System.out.printf("%d \t%s \t%s \t%s \t%d \t%d \t%s \t%s \n"
					,dto.getNum(), dto.getName(), dto.getPhone(), dto.getBirth(),
					dto.getBpoint(), dto.getAge(), dto.getGender(), dto.getJoindate());
		}
		System.out.println("--------------------------------------------------------------------------");
	}
	private static void insert() {
		Scanner sc = new Scanner(System.in);
		MemberDao mdao = MemberDao.getInstance();
		MemberDto mdto = new MemberDto();
		System.out.println("회원 추가 시작");
		System.out.println("회원 이름 입력");
		String name = sc.nextLine();
		mdto.setName(name);
		System.out.println("회원 전화번호 입력");
		String phone = sc.nextLine();
		mdto.setPhone(phone);
		System.out.println("회원 생년월일 입력");
		String birth = sc.nextLine();
		mdto.setBirth(birth);
		// 나이 계산
		String year = birth.substring(0, 4);
		Calendar today = Calendar.getInstance();
		int age = today.get(Calendar.YEAR) - Integer.parseInt(year) +1;
		mdto.setAge(age);
		System.out.println("회원 포인트 입력");
		mdto.setBpoint(Integer.parseInt(sc.nextLine()));
		System.out.println("회원 성별 입력 M/F");
		mdto.setGender(sc.nextLine());
		int result = mdao.insert(mdto);
		if(result ==1 ) {
			System.out.println("회원 추가 성공");
		}else {
			System.out.println("회원 추가 실패");
		}
	}
	private static void update() {
		Scanner sc = new Scanner(System.in);
		MemberDao mdao = MemberDao.getInstance();
		MemberDto mdto = new MemberDto();
		System.out.println("수정할 회원 번호 입력");
		String input = sc.nextLine();
//		int num = Integer.parseInt(input);
		mdto = mdao.selectOne(Integer.parseInt(input));
		if(mdto == null) {
			System.out.println("입력하신 회원번호의 회원이 존재하지 않습니다");
			return;
		}
		System.out.printf("회원번호 %d 수정 시작\n", mdto.getNum());
		System.out.printf("이름 %s 수정\n", mdto.getName());
		String name = sc.nextLine();
		if( !name.equals(""))mdto.setName(name);
		System.out.printf("전화번호 %s 수정\n", mdto.getPhone());
		String phone = sc.nextLine();
		if( !phone.equals(""))mdto.setPhone(phone);
		System.out.printf("생년월일 %s 수정\n", mdto.getBirth());
		String birth = sc.nextLine();
		if( !birth.equals("")) {
			mdto.setBirth(birth);
			Calendar today = Calendar.getInstance();
			int age = today.get(Calendar.YEAR)-Integer.parseInt(birth.substring(0, 4))+1;
			mdto.setAge(age);
		}
		System.out.printf("포인트 %d 수정\n", mdto.getBpoint());
		String bpoint = sc.nextLine();
		if( !bpoint.equals(""))mdto.setBpoint(Integer.parseInt(bpoint));
		System.out.printf("성별 %s 수정\n", mdto.getGender());
		String gender = sc.nextLine();
		if( !gender.equals(""))mdto.setGender(gender);
		
		int result = mdao.update(mdto);
		if(result ==1) {
			System.out.println("수정 성공");
		}else {
			System.out.println("수정 실패");
		}
	}
	private static void delete() {
		Scanner sc = new Scanner(System.in);
		MemberDao mdao = MemberDao.getInstance();
		MemberDto mdto = new MemberDto();
		System.out.println("삭제할 회원번호 입력");
		String input;
		while(true) {
			input = sc.nextLine();
			if(input.equals("")){
				System.out.println("입력 필수");
			}else {
				break;
			}
		}
		int num = Integer.parseInt(input);
		mdto = mdao.selectOne(num);
		if(mdto ==null) {
			System.out.println("입력한 회원번호 없음");
			return;
		}
		int result = mdao.delete(num);
		if(result ==1) {
			System.out.println("회원 삭제 성공");
		}else {
			System.out.println("회원 삭제 실패");
		}
		
	}
	private static void selectOne() {
	}

}
