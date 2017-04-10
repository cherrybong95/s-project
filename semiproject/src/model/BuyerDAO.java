package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

public class BuyerDAO {
   private static BuyerDAO dao = new BuyerDAO();
   private DataSource dataSource;

   private BuyerDAO() {
      dataSource = DataSourceManager.getInstance().getDataSource();
   }

   public static BuyerDAO getInstance() {
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
  public BuyerVO BuyerLogin(String id,String password) throws SQLException{
	  BuyerVO vo=new BuyerVO();
	  Connection con=null;
	  PreparedStatement pstmt=null;
	  ResultSet rs=null;
	  try{
		  con=getConnection();
		  /*select b.buyer_id,b.buyer_name,m.mcode 
			from buyer b,member_code m 
			where b.mcode=m.mcode
			and b.buyer_id='1234' and b.password='1234';*/
		  System.out.println(id);
		  String sql="select b.buyer_id,b.buyer_name,b.buyer_add,b.buyer_tel,m.mcode from buyer b,member_code m where b.mcode=m.mcode and b.buyer_id=? and b.password=? ";
		  pstmt=con.prepareStatement(sql);
		  pstmt.setString(1, id);
		  pstmt.setString(2, password);
		  rs=pstmt.executeQuery();
		  if(rs.next()){
			  vo=new BuyerVO(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5));
		  }else{
			  vo=null;
		  }
	  }finally{
		  closeAll(rs,pstmt,con);
	  }
	  return vo;
  }
  public void joinBuyer(BuyerVO bvo) throws SQLException{
      Connection con = null;
      PreparedStatement pstmt = null;
      try {
         con = getConnection();
         System.out.println("오라클 데이터베이스 연결");
         String sql = "insert into buyer(buyer_id, password, buyer_name, buyer_add, buyer_tel, mcode) values(?, ?, ?, ?, ?, ?)";
         pstmt = con.prepareStatement(sql);
         pstmt.setString(1, bvo.getBuyer_id());
         pstmt.setString(2, bvo.getPassword());
         pstmt.setString(3, bvo.getBuyer_name());
         pstmt.setString(4, bvo.getBuyer_add());
         pstmt.setString(5, bvo.getBuyer_tel());
         pstmt.setString(6, bvo.getMcode());
         pstmt.executeUpdate();
         System.out.println("회원가입완료");
      } finally {
         closeAll(pstmt, con);
      }
   }
   public boolean checkId(String id) throws SQLException{
      boolean flag=false;
      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      try {
         con = getConnection();
         System.out.println("오라클 데이터베이스 연결");
         String sql = "select count(*) from buyer where buyer_id=?";
         pstmt = con.prepareStatement(sql);
         pstmt.setString(1, id);
         rs = pstmt.executeQuery();
         if (rs.next() && rs.getInt(1)>0) {
            flag=true;
         }
      } finally {
         closeAll(rs, pstmt, con);
      }
      return flag;
   }
   public void updateBuyerInfo(BuyerVO bvo) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			System.out.println("오라클 데이터베이스 연결");
			System.out.println(bvo.toString());
			String sql = "update buyer set password=?, buyer_name=?, buyer_add=?, buyer_tel=? where buyer_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bvo.getPassword());
			pstmt.setString(2, bvo.getBuyer_name());
			pstmt.setString(3, bvo.getBuyer_add());
			pstmt.setString(4, bvo.getBuyer_tel());
			pstmt.setString(5, bvo.getBuyer_id());
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
			String sql = "select count(*) from buyer where buyer_id=? and password=?";
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
	public void deleteMember(String id) throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			System.out.println("오라클 데이터베이스 연결");
			String sql = "delete from buyer where buyer_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			System.out.println("회원탈퇴완료");
		} finally {
			closeAll(pstmt, con);
		}
	}
}