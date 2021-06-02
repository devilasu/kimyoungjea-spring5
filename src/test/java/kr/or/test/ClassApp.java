package kr.or.test;
/**
 * 1.이 클래스는 클래스 상속(extends)에 연습,
 * 2.오브젝트(객체)생성과 new 키워드(예약어) 생성자메서드 사용 연습
 * 3.추상클래스(Abstract)에 대한 연습
 * @author 김영제
 *
 */

//오브젝트생성에 필요한 new 키워드 생성자 메스다 사용한 실습 클래스
class Circle{
	private int radius; //멤버변수 반지름
	public Circle(int radius) {//생성자
		this.radius=radius;
	}
	public double getArea() {
		return radius*radius*3.14; //원의 넓이 반환
	}
}
//클래스 상속에 대한 연습
class Employee{
	int mSalary;
	String mDept;
	public void doJob() {
		System.out.println("환영합니다. 직원분들");
	}
}
class Salesman extends Employee{
	public Salesman() {
		mDept = "판매부서";
	}
	public void doJob() {
		System.out.println("환영합니다. "+mDept +"입니다!");
	}
}

class Development extends Employee{
	public Development() {mDept="개발부서";}
	public void doJob() {
		System.out.println("환영합니다. "+mDept+"입니다!");
	}
}

//추상클래스
abstract class GraphicObject{
	int x,y;
	abstract void draw();
	//구현내용이 없고 메서드명만 존재.
	//추상메서드를 만드는 이유는 메서드가 수십개 수백개일때 개발자 구현할때 어려움이 존재
}
//스프링에서는 추상클래스보다는 인터페이스를 더 많이 사용합니다.
class Triangle extends GraphicObject{

	@Override
	void draw() {
		// TODO Auto-generated method stub
		System.out.println("  *  ");
		System.out.println(" * * ");
		System.out.println("*****");
	}
	
}
class Rectangle extends GraphicObject{
	@Override
	void draw() {
		System.out.println("*****");
		System.out.println("*****");
		System.out.println("*****");
		System.out.println("*****");
	}
	
}

public class ClassApp {

	public static void main(String[] args) {
		GraphicObject triangleObject = new Triangle();
		GraphicObject rectangleObject = new Rectangle();
		triangleObject.draw();
		rectangleObject.draw();
	}
}
