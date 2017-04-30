package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

public class MakerDAO {
	private static MakerDAO dao = new MakerDAO();
	private DataSource dataSource;

	private MakerDAO() {
		dataSource = DataSourceManager.getInstance().getDataSource();
	}

	public static MakerDAO getInstance() {
		return dao;
	}

	public Connection getConnection() throws SQLException {
		return dataSource.getConnection(); // 컨넥션을 빌려온다
	}

	public void closeAll(PreparedStatement pstmt, Connection con) throws SQLException {
		closeAll(null, pstmt, con);
	}

	public void closeAll(ResultSet rs, PreparedStatement pstmt, Connection con) throws SQLException {
		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();
		if (con != null)
			con.close();
	}

	public MakerVO MakerLogin(String id, String password) throws SQLException {
		//로그인을 하는 메서드. return type을 VO로 주어, 모든 정보를 받아오게했다.
		MakerVO vo = new MakerVO();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			System.out.println(id);
			String sql = "select m.maker_id,m.maker_name,m.maker_bname,m.maker_add,m.maker_tel,m.maker_account,c.mcode "
					+ "from maker m,member_code c where m.mcode=c.mcode and " 
					// member_code 테이블과 조인을 하고,
					+ "m.maker_id=? and m.password=? ";
					//id와 password가 맞는지 확인한다.
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				vo = new MakerVO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getString(7)); //만약 아이디와 비밀번호가 맞는 값이 테이블에 있다면 vo에 값을 넣어주고,
			} else {
				vo = null; //없다면 null을 반환한다.
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return vo;
	}

	public void joinMaker(MakerVO mvo) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			System.out.println("오라클 데이터베이스 연결");
			String sql = "insert into maker(maker_id, password, maker_name, maker_bname, maker_add, maker_tel, maker_account, mcode) values(?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mvo.getMaker_id());
			pstmt.setString(2, mvo.getPassword());
			pstmt.setString(3, mvo.getMaker_name());
			pstmt.setString(4, mvo.getMaker_bname());
			pstmt.setString(5, mvo.getMaker_add());
			pstmt.setString(6, mvo.getMaker_tel());
			pstmt.setString(7, mvo.getMaker_account());
			pstmt.setString(8, mvo.getMcode());
			pstmt.executeUpdate();
			System.out.println("회원가입완료");
		} finally {
			closeAll(pstmt, con);
		}
	}

	public boolean checkId(String id) throws SQLException {
		boolean flag = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			System.out.println("오라클 데이터베이스 연결");
			String sql = "select count(*) from maker where maker_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next() && rs.getInt(1) > 0) {
				flag = true;
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return flag;
	}

	public void updateMakerInfo(MakerVO mvo) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			System.out.println("오라클 데이터베이스 연결");
			String sql = "update maker set password=?, maker_name=?, maker_bname=?, maker_add=?, maker_tel=?, maker_account=? where maker_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mvo.getPassword());
			pstmt.setString(2, mvo.getMaker_name());
			pstmt.setString(3, mvo.getMaker_bname());
			pstmt.setString(4, mvo.getMaker_add());
			pstmt.setString(5, mvo.getMaker_tel());
			pstmt.setString(6, mvo.getMaker_account());
			pstmt.setString(7, mvo.getMaker_id());
			pstmt.executeUpdate();
			System.out.println("회원정보수정완료");
		} finally {
			closeAll(pstmt, con);
		}
	}

	public boolean checkPassword(String id, String password) throws SQLException {
		boolean flag = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			System.out.println("오라클 데이터베이스 연결");
			String sql = "select count(*) from maker where maker_id=? and password=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			if (rs.next() && rs.getInt(1) > 0) {
				flag = true;
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return flag;
	}
	public boolean checkProduct(String id) throws SQLException{
		boolean flag=true;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try{
			con=getConnection();
			String sql="select p.pno from semi_product p,maker m where p.maker_id=m.maker_id and m.maker_id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs= pstmt.executeQuery();
			if(rs.next()){
				flag=false;
			}
		}finally{
			closeAll(rs,pstmt,con);
		}
		return flag;
	}
	public void deleteMember(String id) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			System.out.println("오라클 데이터베이스 연결");
			String sql = "delete from maker where maker_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			System.out.println("회원탈퇴완료");
		} finally {
			closeAll(pstmt, con);
		}
	}
	public int countMakerMember() throws SQLException{
		int i=0;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try{
			con=getConnection();
			String sql="select count(*) from Maker";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()){
				i=rs.getInt(1);
			}
		}finally{
			closeAll(rs,pstmt,con);
		}
		return i;
	}
	 public String findPassById(String id, String tel) throws SQLException{
		  //비밀번호 찾기 메서드.
	      String password = null;
	      Connection con=null;
	      PreparedStatement pstmt=null;
	      ResultSet rs=null;
	      try{
	         con=getConnection();
	         String sql="select password from Maker where maker_id=? and maker_tel=?";
	         //회원에게 전화번호와 아이디를 받아오고 그 값에 맞는 비밀번호를 테이블에서 가져온다.
	         pstmt=con.prepareStatement(sql);
	         pstmt.setString(1, id);
	         pstmt.setString(2, tel);
	         rs=pstmt.executeQuery();
	         if(rs.next()){
	            password = rs.getString(1);
	         }
	      }finally{
	         closeAll(rs,pstmt,con);
	      }
	      return password; // 비밀번호 반환.
	   }
	 public String findIdByTel(String name, String tel) throws SQLException{
		  //아이디 찾기 메서드.
	      String id = null;
	      Connection con=null;
	      PreparedStatement pstmt=null;
	      ResultSet rs=null;
	      try{
	         con=getConnection();
	         String sql="select maker_id from Maker where maker_name=? and maker_tel=?";
	         //회원에게  이름과 전화번호를 받아오고, 그값에 맞는 아이디를 테이블에서 가져온다.
	         pstmt=con.prepareStatement(sql);
	         pstmt.setString(1, name);
	         pstmt.setString(2, tel);
	         rs=pstmt.executeQuery();
	         if(rs.next()){
	            id = rs.getString(1);
	         }
	      }finally{
	         closeAll(rs,pstmt,con);
	      }
	      return id; //아이디 반환
	   }
}
