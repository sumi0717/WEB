package test.gallery.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import test.file.dto.FileDto;
import test.gallery.dto.GalleryDto;
import test.mybatis.SqlMapConfig;


public class GalleryDao {
	private static GalleryDao dao;
	private static SqlSessionFactory factory;
	private GalleryDao() {}
	public static GalleryDao getInstance() {
		if(dao==null) {
			dao=new GalleryDao();
			factory=SqlMapConfig.getSqlSession();
		}
		return dao;
	}
	
	//사진 파일 추가 메소드
	public boolean insert(GalleryDto dto) {
		SqlSession session = null;
		int flag = 0;
		try {
			session = factory.openSession(true);
			flag=session.insert("gallery.insert", dto);
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
	
	//사진 파일 목록 출력 메소드
	public List<GalleryDto> getList(){
		SqlSession session=null;
		List<GalleryDto> list=null;
		try {
			session=factory.openSession();
			/*
			 *  .selectList() 인 경우에는 
			 *  resultType : List 의 Generic type 이다. 
			 */
			list=session.selectList("gallery.getList");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	}//getList()
}//class
