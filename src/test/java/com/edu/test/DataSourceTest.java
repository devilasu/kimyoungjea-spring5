package com.edu.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.edu.service.IF_MemberService;
import com.edu.vo.MemberVO;


/**
 * 이 클래스는 오라클과 연동해서 CRUD를 테스트하는 클래스입니다.
 * Junit CRUD만들어서 공개 +회원관리
 * @author 김영제
 *
 */
// RunWith는 톰캣이 실행된 상황에서도 JUnit으로 테스트할 수 있는 것?
@RunWith(SpringJUnit4ClassRunner.class)
//경로에서 **(모든폴더명시), *(모든파일명시)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@WebAppConfiguration
public class DataSourceTest {
	//dataSource 객체는 데이터베이스 객체를 pool로 저장해서 사용할때 dataSource를 사용합니다
	
	@Inject//객체의 메모리 관리를 스프링이 대신 해줌.
	private DataSource dataSource;
	//Inject는 자바8부터 지원, 이전자바7에서는 @Autowired로 객체를 만들었다.
	
	//디버그용 로그 객체변수생성
	private Logger logger = LoggerFactory.getLogger(DataSourceTest.class);
	
	//스프링 코딩 시작 순서
	//M-V-C 사이에 데이터를 임시저장하는 공간(VO클래스-맴버변수+Get/Set메서드) 생성
	// 보통 ValueObject클래스는 DB테이블과 1:1로 매칭이 됩니다.
	//1. MemberVO.java. VO클래스 생성
	//2. DB(마이바티스)쿼리를 만듭니다. (VO사용됨)
	@Inject
	private IF_MemberService memberService;
	
	@Test
	public void selectMember() throws Exception{
		//회원관리 테이블에서 레코드 출력
		List<MemberVO> listMember = memberService.selectMember();
		listMember.toString();
	}
	@Test
	public void oldQueryTest() throws Exception{
		//직접 커넥션 세팅
		Connection connection = null;
		connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE","XE","apmsetup");
		logger.info("데이터베이스 직접접속이 성공하였습니다. DB종류는 " +connection.getMetaData().getDatabaseProductName());;
		//직접쿼리를 날립니다. 날리기전 쿼리문장 객체생석 statement
		//쿼리문장객체를 만드는 이유? 보안(SQL인젝션공격 방지)
		Statement stmt = connection.createStatement();
		//stmt객체가 없으면, 개발자가 SQL인젝션 방지코딩을 넣어야 한다.
		//테이블에 입력되어 있는 레코드를 select 쿼리 stmt문장으로 가져옴
		
		//insert쿼리 문장을 만듭니다
		//더미데이터를 입력하는 방법.
		/*
		 * for(int cnt = 0; cnt <100;cnt++)//deptno 자리수가 2자리수로 고정이기때문에 100이상의 수가 들어가지
		 * 못한다. stmt.
		 * executeQuery("INSERT INTO dept02 VALUES((select count(*) from dept02),'디자인','경기도')"
		 * );
		 */
		ResultSet rs = stmt.executeQuery("select * from dept");
		//위에서 만든 쿼리를 실행
		while(rs.next())
		{
			logger.info(rs.getString("deptno")+ "  " + rs.getString("dname"));
		}
		stmt = null;
		connection = null; //메모리 초기화
		rs = null;
		
	}
	
	@Test
	public void dbConnerctionTest(){
		//데이터베이스 커넥션 테스트-설정은 root-context.xml
		
		try {
			Connection connection = dataSource.getConnection();
			logger.info("데이터베이스 접속이 성공하였습니다. DB종류는 "+connection.getMetaData());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			logger.debug("데이터베이스 접속이 실패하였습니다.");
		}
		
	}
	@Test
	public void junitTest() {
		logger.debug("JUnit 테스트");
	}
}
