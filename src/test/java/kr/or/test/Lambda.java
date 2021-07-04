package kr.or.test;

import java.util.function.IntSupplier;

/**
 * 이 클래스는 람다식을 테스트하는 클래스입니다.
 * @author 김영제
 *
 */
public class Lambda {
	
	public static int plus(int x, int y, String lambda) {
		int result = 0;
		if(lambda.equals("nonLambda")) {
			IntSupplier intSupplier = new IntSupplier() {
			
				@Override
				public int getAsInt() {
					int sum=x+y;
					return sum;
				}
			};
			result = intSupplier.getAsInt();	
		}
		//람다식 적용 후
		if(lambda.equals("lambda")) {
			IntSupplier intSupplier = ()->x*y;
			result = intSupplier.getAsInt();
		}
		return result;
	}
	public static void main(String[] args) {
		System.out.println("람다식 적용 전: "+plus(3,4,"nonLambda"));
		System.out.println("람다식 적용 후: "+plus(3,4,"lambda"));
		
	}
}
