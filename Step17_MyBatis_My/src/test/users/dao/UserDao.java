package test.users.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import test.mybatis.SqlMapConfig;
import test.users.dto.UsersDto;

public class UserDao {
	private static UserDao dao;
	private static SqlSessionFactory factory;
	private UserDao() {}
	//UsersDao 객체의 참조값을 리턴해주는 static 메소드 
	public static UserDao getInstance() {
		if(dao==null) {
			dao=new UserDao();
			factory=SqlMapConfig.getSqlSession();
		}
		return dao;
	}
	
	//인자로 전달되는 아이디가 users 테이블에 존재하는 지 여부를 리턴해서
	//결론적으로 인자로 전달되는 아이디가 사용 가능한 지 여부를 리턴해주는 메소드
	//셀렉트
	public boolean canUseId(String inputId) {// id, pwd 일치여부 확인하려는 메소드(로그인
		SqlSession session=null;
		String result=null;
		try {
			//SqlSession 객체의 참조값 얻어오기 
			session=factory.openSession();
			// result는 id가 null인지 아닌지 판별. 결과는 스트링 result type.
					//users는 mapper의 이름, 
					//isExist는 sql id. inputId는 파라미터(스트링타입)
			result=session.selectOne("users.isExist", inputId);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		if(result==null) {// select 된 결과가 없으면 사용가능 
			return true;
		}else {
			return false;
		}
	}
	
	//회원 정보를 수정하는 메소드
	public boolean update(UsersDto dto) {
		SqlSession session = null;
		int flag = 0;
		try {
			//auto commit 되는 SqlSession 객체의 참조값 얻어오기 
			session = factory.openSession(true);
			flag=session.update("users.update", dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	//회원 한명의 정보 삭제하기
	public boolean delete(String id) {
		SqlSession session = null;
		int flag = 0;
		try {
			session = factory.openSession(true);
			flag=session.delete("users.delete", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	//회원 한명의 정보를 리턴하는 메소드
	public UsersDto getData(String id) {
		SqlSession session=null;
		UsersDto dto=null;
		try {
			session=factory.openSession();
			/*
			 * Mapper namespace : users
			 * sql id : getData
			 * parameterType : string
			 * resultType : test.users.dto.UsersDto 
			 * 
			 * select 된 row 가 하나인 경우는 .selectOne()
			 * select 된 row 가 여러개인 경우는 .selectList()
			 */
			dto=session.selectOne("users.getData", id);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return dto;
	}
	
	//인자로 전달된 회원정보가 유효한 정보인지 여부를 리턴하는 메소드
	public boolean isValid(UsersDto dto) {
		SqlSession session=null;
		String result=null;
		try {
			session=factory.openSession();
			// dto 에 담긴 아이디 비밀번호가 유효한 정보이면 
			// result 가 null 이 아니다. 
			result=session.selectOne("users.isValid", dto);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		if(result==null) {
			return false;
		}else {
			return true;
		}
	}
	
	//회원정보를 DB 에 저장하는 메소드
	public boolean insert(UsersDto dto) {
		SqlSession session = null;
		int flag = 0;
		//제대로 들어갔으면 1(true)이 리턴될 것이고, 아니면 0(false)
		try {
			session = factory.openSession(true);
			flag=session.insert("users.insert", dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}
	
}


