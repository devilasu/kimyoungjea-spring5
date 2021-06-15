package kr.or.test;

/**
 * 싱글톤: 1개의 클래스가 1개 객체만 생성해서 사용하겠따고 명시
 * 객체를 2번 생성할 필요가 없는 로직일 때
 * 대표적인 싱글톤객체는 Calendar클래스, DB접속 클래스 등.
 * @author 김영제
 *
 */

class Singleton {//테스트용 싱글톤 클래스
	private static Singleton instance = new Singleton();//정적필드 인스턴스
	private Singleton() {}// private 생성자
	public static Singleton getInstance() {
		return instance;
	}

}

public class SingletonApp{
	public static void main(String[] args) {
		//Calendar calendar = new Calendar(); //불가능
		Singleton st1 = Singleton.getInstance();
		Singleton st2 = Singleton.getInstance();
		if(st1 == st2) {
			System.out.println("동일 객체");
		}
		else {
			System.out.println("다른객체");
		}
	}
}
