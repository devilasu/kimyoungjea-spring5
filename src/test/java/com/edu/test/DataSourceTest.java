package com.edu.test;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

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
	DataSource dataSource;
	//Inject는 자바8부터 지원, 이전자바7에서는 @Autowired로 객체를 만들었다.
	
	//디버그용 로그 객체변수생성
	private Logger logger = LoggerFactory.getLogger(DataSourceTest.class);
		
	@Test
	public void oldQueryTest() throws Exception{
		//직접 커넥션 세팅
		Connection connection = null;
		connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE","XE","apmsetup");
		Statement stmt = connection.createStatement();
		connection = null; //메모리 초기화
		
		stmt.executeQuery("INSERC INTO tbl_board VALUES("+"(select count(*) from tbl_board)+1"+",'강제 수정된 글입니다.','수정 테스트 '");
		
	}
	
	@Test
	public void dbConnerctionTest(){
		//데이터베이스 커넥션 테스트-설정은 root-context.xml
		
		try {
			Connection connection = dataSource.getConnection();
			logger.debug("데이터베이스 접속이 성공하였습니다. DB종류는 "+connection.getMetaData());
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
