package kr.or.test;
/**
 * 이 클래스는 자바에서 예외처리하는 실습.
 * @author 김영제
 *
 */
public class ExceptionTest {
	
	public static void main(String[] args) {
		//외부 클래스형 변수에 값을 저장해서 출력하는 프로그램
		MemberVO memberVO = new MemberVO();
		//동일 패키지 안의 클래스는 import없이 사용 가능.
		memberVO.setName("홍길동");
		memberVO.setAge(10);
		memberVO.setPhoneNum("000-0000-0000");
		
		System.out.println("한거번에 출력하고 싶을때 toString()를 만든다. \n" + memberVO.toString());
		
		//배열 변수 선언
		String[] stringArray = {"10", "2a", "100"};
		int indexValue = 0;
		for (int cnt=0; cnt<=4;cnt++) {
			/**
			 * try{구현내용}
			 * catch(에러발생 기존정의된 상황){에러발생 처리}
			 * finally{에러유무와 상관없이 무조건 실행}
			 */
			try {
			indexValue = Integer.parseInt(stringArray[cnt]);
			}catch(NumberFormatException err) {//Exception 대신에 선별적으로 예외사항을 잡습니다.
				System.out.println(err.toString());
			}catch(Exception err) {
				System.out.println(err.toString());
			}finally {
				System.out.println(cnt+"번째 for문 종료되었습니다.");}
		}
		System.out.println("프로그램이 정상 종료되었습니다.");
	}

}
