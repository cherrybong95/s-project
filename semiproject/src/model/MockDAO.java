package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MockDAO {
	private static MockDAO instance=new MockDAO();
	public static MockDAO getInstance(){return instance;}
	public ArrayList<ProductVO> getProductList() throws SQLException{
		ArrayList<ProductVO> productList=new ArrayList<ProductVO>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ProductVO pvo1=new ProductVO(1,"팔찌",100,10,"팔찌입니다","간지나는 팔찌입니다","java");
		ProductVO pvo2=new ProductVO(2,"안경",100,10,"안경입니다","간지나는 안경입니다","java");
		productList.add(pvo1);
		productList.add(pvo2);
		return productList;
		
	}
	public int getContentNo() throws SQLException {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int totalContent=0;
		try{
			con=DataSourceManager.getInstance().getDataSource().getConnection();
			String sql="select count(*) from product";
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
			sql.append("from (select no,title,id,to_char(time_post,'yyyy/mm/dd HH24:mi') posted_time,hits,row_number() over (order by no desc) as rnum from board_b) b, member_b m ");
			sql.append("where b.id=m.id and b.rnum between ? and ?");
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
	
}
