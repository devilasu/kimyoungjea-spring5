package kr.or.test;
/**
 * 내부변수와 배열 사용에 대해서 실습 클래스 
 * @author 김영제
 *
 */


public class Step1 {
	//전역변수(멤버변수)는 클래스 전체에 영향을 주는 변수
	//내부변수는 메서드내에서만, 영향을 주는 변수
	public static void main(String[] args) {
		String name;
		int age;
		String phoneNum;
		name="홍길동";
		age=45;
		phoneNum = "000-0000-0000";
		printMember(name,age,phoneNum);
		name="성춘향";
		age=18;
		phoneNum="111-1111-1111";
		printMember(name,age,phoneNum);
		name="각시탈";
		age=28;
		phoneNum="222-2222-2222";
		printMember(name,age,phoneNum);
		
	}
	
	private static void printMember(String name, int age, String phoneNum) {
		System.out.println("회원의 이름은: "+name+" | 나이는: "+age+" | 연락처는: "+phoneNum);
		age++;
		System.out.println("회원의 이름은: "+name+" | 나이는: "+age+" | 연락처는: "+phoneNum);
	}
}
