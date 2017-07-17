package com.simpact.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.sql.DataSource;
import java.sql.Connection;

/**
 * Created
 * User: simpact
 * Date: 2017-06-21
 * Time: 오전 11:04
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class DataSourceTest {

	@Autowired
	private DataSource dataSource;

	@Test
	public void testConnection() throws Exception{
		Connection conn = dataSource.getConnection(); //커넥션 객체의 값
		System.out.println("DB연결성공(conn) = " + conn);
	}
}
