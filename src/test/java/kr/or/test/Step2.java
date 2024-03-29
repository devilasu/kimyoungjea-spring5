package kr.or.test;

/**
 * 
 * @author 김영제
 *
 */

class MemberVO{
	private String name;
	private int age;
	private String phoneNum;
	public String getName() {
		return name;
	}
	@Override
	public String toString() {
		return "MemberVO [name=" + name + ", age=" + age + ", phoneNum=" + phoneNum + "]";
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	
}

class MemberService{
	//컴파일때부터 메모리에 로딩됨. 클래스 상태로 사용가능.
	public void printMember(MemberVO[] members) {
		int cnt =0;
		for(MemberVO member:members) {
			cnt +=1;
			System.out.println("회원의 이름은 "+member.getName() + " 나이는 "+member.getAge()+ " 폰번호는 "+ member.getPhoneNum());
			System.out.println(cnt+"번째 레코드는 " + member.toString());
			
		}
	}
}


public class Step2 {
	public static void main(String[] args) {
		MemberVO memberVO = new MemberVO();
		memberVO.setName("홍길동");
		memberVO.setAge(45);
		memberVO.setPhoneNum("000-0000-0000");
		MemberVO memberVO2 = new MemberVO();
		memberVO2.setName("성춘향");
		memberVO2.setAge(18);
		memberVO2.setPhoneNum("111-1111-1111");
		MemberVO memberVO3 = new MemberVO();
		memberVO3.setName("각시탈");
		memberVO3.setAge(28);
		memberVO3.setPhoneNum("222-2222-2222");
		//배열 클래스 오브젝트 생성
		MemberVO[] members = new MemberVO[3];
		members[0]=memberVO;
		members[1]=memberVO2;
		members[2]=memberVO3;
		//개선된 출력
		MemberService memberService = new MemberService();
		memberService.printMember(members);
	}
}
