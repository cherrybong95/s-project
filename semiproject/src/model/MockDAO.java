package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MockDAO {
	private static MockDAO instance=new MockDAO();
	public static MockDAO getInstance(){return instance;}
	
	//--------------------장바구니
	//MemberVO mvo = new MemberVO();
	//--------------------임시멤버
/*	public MemberVO createMember(){
		mvo.setId("java");
		mvo.setMname("박다혜");
		return mvo;
	}*/
	//--------------------상품넘버로 상품찾기
	public ProductVO findProductByNo(String pno) throws SQLException{
		ProductVO pvo = null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try{
			con=DataSourceManager.getInstance().getDataSource().getConnection();
			String sql="select pno,pname,price from semi_product where pno=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(pno));
			rs=pstmt.executeQuery();
			if(rs.next()){
					pvo=new ProductVO();
					pvo.setPno(rs.getInt(1));
					pvo.setPname(rs.getString(2));
					pvo.setPrice(rs.getInt(3));
				}
			}finally{
				closeAll(rs,pstmt,con);
			}
		return pvo;
	}
	
	
	
	public int getContentNo() throws SQLException {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int totalContent=0;
		try{
			con=DataSourceManager.getInstance().getDataSource().getConnection();
			String sql="select count(*) from semi_product";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()){
				totalContent=rs.getInt(1);
			}
		}finally{
			closeAll(rs,pstmt,con);
		}
		return totalContent;
	}
	public ListVO getAllList(PagingBean pb) throws SQLException {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<ProductVO> productList=new ArrayList<ProductVO>();
		ProductVO pvo=null;
		ListVO listVO=new ListVO();
		try{
			con=DataSourceManager.getInstance().getDataSource().getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append("select p.pno,p.pname,p.price,p.total_amount,p.simple_info,p.detail_info,maker_id ");
			sql.append("from (select pno,pname,price,total_amount,simple_info,detail_info,maker_id,row_number() over(order by pno desc) as rnum from semi_product) p "); 
			sql.append("where rnum between ? and ?");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, pb.getStartRowNumber());
			pstmt.setInt(2, pb.getEndRowNumber());
			rs=pstmt.executeQuery();
			while(rs.next()){
				pvo=new ProductVO(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getString(5), rs.getString(6),rs.getString(7));
				productList.add(pvo);
				System.out.println(pvo);
			}
			listVO.setList(productList);
			listVO.setPagingBean(pb);
			System.out.println("시작페이지번호"+pb.getStartPageOfPageGroup());
			System.out.println("끝페이지번호"+pb.getEndPageOfPageGroup());
		}finally{
			closeAll(rs,pstmt,con);
		}
		
		return listVO;
	}
	
	private void closeAll(ResultSet rs, PreparedStatement pstmt, Connection con) {
	
			try {
				if(rs!=null)
				rs.close();
				if(pstmt!=null)
					pstmt.close();
				if(con!=null)
					con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}

	public ProductVO getProductDetail(int productNo) throws SQLException {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ProductVO pvo=null;
		try{
			con=DataSourceManager.getInstance().getDataSource().getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append("select pno,pname,price,total_amount,simple_info,detail_info,maker_id ");
			sql.append("from semi_product ");
			sql.append("where pno=?");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, productNo);
			rs=pstmt.executeQuery();
			while(rs.next()){
				pvo=new ProductVO(rs.getInt(1),rs.getString(2),rs.getInt(3),rs.getInt(4),rs.getString(5),rs.getString(6),rs.getString(7));
			}
		}finally{
			closeAll(rs, pstmt, con);
		}
		return pvo;
	}
	public ListVO findProductById(String id, PagingBean pb) throws SQLException{
		ListVO listVO=new ListVO();
		
		ArrayList<ProductVO> list=new ArrayList<ProductVO>();
		ProductVO pvo = null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try{
			con=DataSourceManager.getInstance().getDataSource().getConnection();
			String sql="select p.pno,p.pname,p.price,p.detail_info "
					+ "from (select pno,pname,price,detail_info, row_number() over(order by pno desc) as rnum from semi_product where maker_id=?) p "
					+ "where rnum between ? and ?  ";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, pb.getStartRowNumber());
			pstmt.setInt(3, pb.getEndRowNumber());
			rs=pstmt.executeQuery();
			while(rs.next()){
					pvo=new ProductVO();
					pvo.setPno(rs.getInt(1));
					pvo.setPname(rs.getString(2));
					pvo.setPrice(rs.getInt(3));
					pvo.setDetail_info(rs.getString(4));
					
					list.add(pvo);
					
				}
				listVO.setList(list);
				listVO.setPagingBean(pb);
			}finally{
				closeAll(rs,pstmt,con);
			}
		return listVO;
	}
	//
	public int getTotalContentNoById(String id) throws SQLException{
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int totalNo=0;
		try{
			con=DataSourceManager.getInstance().getDataSource().getConnection();
			String sql="select count(*) from semi_product where maker_id=? ";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()){
				totalNo=rs.getInt(1);
			}
		}finally{
			closeAll(rs,pstmt,con);
		}
		
		return totalNo;
	}
	
	
	public void deleteProduct(int no) throws SQLException{
		Connection con=null;
		PreparedStatement pstmt=null;
		try{
			con=DataSourceManager.getInstance().getDataSource().getConnection();
			String sql="delete from semi_product where pno=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, no);		
			pstmt.executeUpdate();			
		}finally{
			closeAll(pstmt, con);
		}
	}
	public void closeAll(PreparedStatement pstmt,Connection con) throws SQLException{
		if(pstmt!=null)
			pstmt.close();
		if(con!=null)
			con.close(); 
	}


}
