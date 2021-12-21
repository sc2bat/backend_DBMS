package jdbc04;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class test {

	public static void main(String[] argrs) {
		/**/
		//
//		Calendar today = Calendar.getInstance();
//		System.out.println(today);
		System.out.println("테스트");
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분 ss초");
		System.out.println(formatter);
		Date now = Calendar.getInstance().getTime();
		System.out.println(now);
		String formatedNow = formatter.format(now);
		System.out.println(now);


//		출처: https://hianna.tistory.com/607 [어제 오늘 내일]
	}

}
