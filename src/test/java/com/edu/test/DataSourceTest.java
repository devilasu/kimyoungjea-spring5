package com.edu.test;


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
	//디버그용 로그 객체변수생성
	private Logger logger = LoggerFactory.getLogger(DataSourceTest.class);
			
	@Test
	public void junitTest() {
		logger.debug("JUnit 테스트");
	}

}
