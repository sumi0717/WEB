package test.gallery.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import test.gallery.dto.GalleryDto;
import test.util.DbcpBean;

public class GalleryDao {
	private static GalleryDao dao;
	private GalleryDao() {}
	public static GalleryDao getInstance() {
		if(dao==null) {
			dao=new GalleryDao();
		}
		return dao;
	}
	
	public boolean insert(GalleryDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문 작성하기
			String sql = "INSERT INTO board_gallery"
					+ " (num, writer, caption, imagePath, regdate)"
					+ " VALUES(board_gallery_seq.NEXTVAL,?,?,?,SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			
			//? 에 바인딩할 내용 결정하기 
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getCaption());
			pstmt.setString(3, dto.getImagePath());
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
	
	
	public List<GalleryDto> getList(){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//select된 결과를 담을 객체(지역변수 만들기
		List<GalleryDto> list=new ArrayList<>();
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문 작성하기
			String sql = "SELECT num,writer,caption, imagePath,regdate"
					+ " FROM board_gallery"
					+ " ORDER BY num DESC";
			pstmt = conn.prepareStatement(sql);
			//?에 값 바인딩

			rs = pstmt.executeQuery();
			//반복문 돌면서 ResultSet에 있는 내용 추출
			while (rs.next()) {
				GalleryDto dto=new GalleryDto();
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setCaption(rs.getString("caption"));
				dto.setImagePath(rs.getString("imagePath"));
				dto.setRegdate(rs.getString("regdate"));
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
		}//try
		return list;
	}//getList()
}//class
