package test.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import test.member.dto.MemberDto;
import test.util.DBConnect;

public class MemberDao {
	private static MemberDao dao;

	private MemberDao() {
	}

	public static MemberDao getInstance() {
		if (dao == null) {
			dao = new MemberDao();
		}
		return dao;
	}

	//회원 한명의 정보를 수정하는 메소드
	public boolean update(MemberDto dto) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		int flag=0;
		try {
			conn=new DBConnect().getConn();
			String sql="UPDATE member SET name=?,addr=?"
					+ " WHERE num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAddr());
			pstmt.setInt(3, dto.getNum());
			flag=pstmt.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {}
		}
		if(flag>0) {
			return true;
		}else {
			return false;
		}
	}

	// 회원 정보를 삭제하는 메소드
	public boolean delete(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DBConnect().getConn();
			String sql = "DELETE From member WHERE num=?";
			pstmt = conn.prepareStatement(sql);
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

	// 회원 한명의 정보를 리턴하는 메소드
	public MemberDto getData(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberDto dto = null;
		try {
			conn = new DBConnect().getConn();
			String sql = "SELECT num,name,addr FROM member WHERE num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				// MemberDto 객체를 생성해서 회원 정보를 담는다.
				dto = new MemberDto();
				dto.setNum(num);
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
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
		return dto;
	}

	// 회원 정보를 저장하는 메소드
	public boolean insert(MemberDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DBConnect().getConn();
			String sql = "Insert Into member (num,name,addr)" 
			+ " VALUES(MEMBER_SEQ.NEXTVAL, ?,?)";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAddr());
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

	public List<MemberDto> getList() {
		// 필요한 지역변수 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		// 회원 정보를 저장할 List 객체 생성
		List<MemberDto> list = new ArrayList<>();
		try {
			conn = new DBConnect().getConn();
			String sql = "SELECT num,name,addr FROM member" + " ORDER BY num ASC";
			pstmt = conn.prepareStatement(sql);
			// 쿼리문 수행하고 ResultSet 리턴 받기
			rs = pstmt.executeQuery();
			while (rs.next()) {
				// 커서가 위치한 곳의 회원정보 읽어내기
				int num = rs.getInt("num");
				String name = rs.getString("name");
				String addr = rs.getString("addr");
				// 회원정보를 MemberDto 객체에 담아서
				MemberDto dto = new MemberDto(num, name, addr);
				// List 에 누적 시키기
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
