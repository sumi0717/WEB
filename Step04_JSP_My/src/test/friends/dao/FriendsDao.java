package test.friends.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import test.friends.dto.FriendsDto;
import test.util.DBConnect;

public class FriendsDao {
	private static FriendsDao fdao;
	
	private FriendsDao() {
		
	}
	public static FriendsDao getInstance() {
		if(fdao==null) {
			fdao=new FriendsDao();
		}
		return fdao;
	}
	
	//친구 한명의 정보를 수정하는 메소드
	public boolean update(FriendsDto fdto) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		int flag=0;
		try {
			conn=new DBConnect().getConn();
			String sql="UPDATE friends set name=?, addr=?"
					+ " where num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, fdto.getName());
			pstmt.setString(2, fdto.getAddr());
			pstmt.setInt(3, fdto.getNum());
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
	//친구 정보를 삭제하는 메소드
	public boolean delete(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn=new DBConnect().getConn();
			String sql="delete from friends where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			flag=pstmt.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
								
			}catch(SQLException se) {
				se.printStackTrace();
			}finally {
				try {
					if(pstmt!=null)pstmt.close();
					if(conn!=null)conn.close();
				}catch(Exception e) {}
			}
		}
		if(flag>0) {
			return true;
		}else {
			return false;
		}
	}
	
	//친구 한명의 정보를 리턴하는 메소드
	public FriendsDto getData(int num) {
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		FriendsDto fdto=null;
		try {
			conn= new DBConnect().getConn();
			String sql="select num,name,addr from friends where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery(); //쿼리임 리턴하는거라서
			if(rs.next()) {
				fdto=new FriendsDto();
				fdto.setNum(num);
				fdto.setName(rs.getString("name"));
				fdto.setAddr(rs.getString("addr"));
			}
		}catch(SQLException se) {
			se.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(rs!=null)rs.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {}
		}
		return fdto;
	}
	//친구 정보를 저장하는 메소드
	public boolean insert(FriendsDto fdto) {
		Connection conn=null;
		PreparedStatement pstmt = null;
		int flag=0;
		try {
			conn=new DBConnect().getConn();
			String sql="Insert Into friends (num, name, addr)"
					+ " VALUES(SEQ_FRIENDS_NO.NEXTVAL, ?,?)";
			//Member 시퀀스여서 안댐.
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, fdto.getName());
			pstmt.setString(2, fdto.getAddr());
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
	//친구 목록 리턴하기
	public List<FriendsDto> getList(){
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<FriendsDto> list=new ArrayList<>();
		
		try {
			conn=new DBConnect().getConn();
			String sql="Select num,name,addr From friends"
					+ " ORDER By num asc";
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				//커서가 위치한 곳의 정보 읽어내기
				int num= rs.getInt("num");
				String name=rs.getString("name");
				String addr=rs.getString("addr");
				//친구 정보를 FriendsDto 객체에 담기
				FriendsDto fdto= new FriendsDto(num,name,addr);
				//리스트에 누적 시키기
				list.add(fdto);
				
			}
		}catch(SQLException se) {
			se.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {}
		}
		return list;
	}
}
