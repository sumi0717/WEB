package test.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import test.board.dto.BoardDto;
import test.util.DbcpBean;

public class BoardDao { // Dao를 싱글톤으로 작성할 수 있도록 만든 것
	private static BoardDao dao;
	private BoardDao() {}
	public static BoardDao getInstance() {
		if(dao==null) {
			dao=new BoardDao();
		}
		return dao;
	} 
	
	//글 하나의 정보를 수정하는 메소드
	public boolean update(BoardDto dto) {
		//dto에 정보 다 배열되어 있으므로 int num, string writer, string content 이렇게 일일이 전달 안하고 
		//dto 객체를 불러와서 수정하면 됨
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문 작성하기
			String sql = "UPDATE board_guest "
					+ "SET writer=?,title=?,content=?"
					+ " WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩할 내용 결정하기 
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setInt(4, dto.getNum()); //이 타이틀 작성자 등의 순서는, sql문의 순서와 대응된다.
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
	
	//글 하나의 정보를 삭제하는 메소드
	public boolean delete(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문 작성하기
			String sql = "DELETE FROM board_guest "
					+ "WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩할 내용 결정하기 
			pstmt.setInt(1, num);
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
	
	//글 하나의 정보를 리턴하는 메소드
	public BoardDto getData(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//select된 결과를 담을 객체(지역변수 만들기
		BoardDto dto=null;
		
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문 작성하기
			String sql = "SELECT num,writer,title,content,regdate"
					+ " FROM board_guest"
					+ " WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			//?에 값 바인딩
			pstmt.setInt(1,num);
			rs = pstmt.executeQuery();
			//반복문 돌면서 ResultSet에 있는 내용 추출
			while (rs.next()) {
				dto=new BoardDto();
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
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
		//BoardDto 객체 리턴해주기
		return dto;

	}
	
	//글정보 저장하는 메소드
	public boolean insert(BoardDto dto) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		int flag=0;
		try {
			//Connection Pool 로 부터 Connection 객체 가져오기 
			conn=new DbcpBean().getConn();
			//실행할 Sql문 작성하기
			String sql="INSERT INTO board_guest"
					+ " (num,writer,title,content,regdate)"
					+ " VALUES(board_guest_seq.NEXTVAL,?,?,?,SYSDATE)";
			pstmt=conn.prepareStatement(sql);
			// ? 에 값 바인딩하기 
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			// insert 문 수행하고 추가된 row 의 갯수 리턴 받기 
			flag=pstmt.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				// Connection Pool 에 Connection 객체 반납하기 
				if(conn!=null)conn.close();
			}catch(Exception e) {}
		}
		if(flag>0) {
			return true;
		}else {
			return false;
		}
	}
	//글 목록 리턴하는 메소드
	public List<BoardDto> getList(){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		//select된 결과를 담을 객체(지역변수 만들기
		List<BoardDto> list=new ArrayList<>();
		
		
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문 작성하기
			String sql = "SELECT num,writer,title,content,"
					+ "TO_CHAR(regdate, 'YYYY.MM.DD AM HH:MI') AS regdate"
					+ " FROM board_guest"
					+ " ORDER BY num ASC";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			//반복문 돌면서 ResultSet에 있는 내용 추출
			while (rs.next()) {
				//BoardDto 객체를 생성해서
				BoardDto dto=new BoardDto();
				//ResultSet에 있는 글 하나의 정보를 담는다
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				//ArrayList 객체에 BoardDto 객체 누적 시키기
				list.add(dto);
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

		return list;
	}
	
}
