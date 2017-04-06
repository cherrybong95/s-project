package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MockDAO {
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
			String sql="select count(*) from board_b";
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
