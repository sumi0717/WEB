package test.users.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import test.users.dto.UsersDto;
import test.util.DbcpBean;

public class UserDao {
	private static UserDao dao;

	private UserDao() {
	};

	// UserDao 객체의 참조값을 리턴해주는 static 메소드
	public static UserDao getInstance() {
		if (dao == null) {
			dao = new UserDao();
		}
		return dao;
	}

	// 인자로 전달된 회원정보가 유효한 정보인지 여부를 리턴하는 메소드
	public boolean isValid(UsersDto dto) {// id, pwd 일치여부 확인하려는 메소드(로그인
		// id, pwd 둘 중 하나라도 일치하지 않으면, 리턴되지 않도록 해야함
		// 따라서 셀렉트 구문, id, pwd를 OR이 아닌 AND로 묶어줘야 함
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		// select된 결과를 담을 객체(지역변수 만들기
		boolean isValid = false;
		// 정보가 맞으면(셀렉트 구문 조건이 일치하면) isValid는 true로 바뀜
		try {
			conn = new DbcpBean().getConn();
			// 실행할 sql 문 작성하기
			String sql = "SELECT * FROM users" + " WHERE id=? AND pwd=?";
			pstmt = conn.prepareStatement(sql);
			// ?에 값 바인딩
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			rs = pstmt.executeQuery();

			// select 된 row가 있으면
			if (rs.next()) {
				// 여기로 실행순서가 들어오면, true므로 정보 리턴되고,
				// 없으면 여기로 실행순서 들어오지 않고 return으로 넘어감.
				isValid = true; // isValid에 true를 넣어준다
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();

			} catch (Exception e) {
			}
		}
		// 아이디, 비밀번호의 유효성 여부를 리턴
		// select된 row가 없으면 실행순서 바로 여기로 들어오게 됨!
		return isValid;

	}

	// 회원 함녕의 정보 삭제하기
	public boolean delete(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			// 실행할 sql 문 작성하기
			String sql = "DELETE FROM users" + " WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			// ? 에 바인딩할 내용 결정하기
			pstmt.setString(1, id);
			flag = pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}

	
	// 회원 정보를 수정하는 메소드
	public boolean update(UsersDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			// 실행할 sql 문 작성하기
			String sql = "UPDATE users SET pwd=?,email=?" + " WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			// ? 에 바인딩할 내용 결정하기
			pstmt.setString(1, dto.getPwd());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getId());
			flag = pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}

	// 회원 한명의 정보를 리턴하는 메소드
	public UsersDto getData(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		// select 된 결과를 담을 지역변수 만들기
		UsersDto dto = null;
		try {
			conn = new DbcpBean().getConn();
			// 실행할 select 문
			String sql = "SELECT pwd,email,regdate" + " FROM users" + " WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			// ? 에 값 바인딩
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			// select 된 결과가 있다면 ResultSet 에 있는 내용 추출
			if (rs.next()) {
				dto = new UsersDto();
				dto.setId(id);
				dto.setPwd(rs.getString("pwd"));
				dto.setEmail(rs.getString("email"));
				dto.setRegdate(rs.getString("regdate"));
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		// 회원 한명의 정보가 담겨 있는 UsersDto 객체 리턴해주기
		return dto;
	}
	//인자로 전달되는 아이디가 users 테이블에 존재하는 지 여부를 리턴해서
	//결론적으로 인자로 전달되는 아이디가 사용 가능한 지 여부를 리턴해주는 메소드
	public boolean canUseId(String inputId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//select된 결과를 담을 객체(지역변수 만들기
		boolean canUse=true;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문 작성하기
			String sql = "SELECT * from users WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			//?에 값 바인딩
			pstmt.setString(1, inputId);
			
			rs = pstmt.executeQuery();
			//select 된 row가 있으면
			if (rs.next()) {
				//이미 존재하는 아이디므로 사용 불가
				canUse=false;
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();

			} catch (Exception e) {
			}
		}
		//사용 가능 여부를 리턴
		return canUse;

	}

	// 회원 정보를 DB에 저장하는 메소드
	public boolean insert(UsersDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			// 실행할 sql 문 작성하기
			String sql = "INSERT INTO users" + " (id,pwd,email,regdate)" + " VALUES(?,?,?,SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			// ? 에 바인딩할 내용 결정하기
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getEmail());

			flag = pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}

}
