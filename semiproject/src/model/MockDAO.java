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
			String sql="select pno,pname,price,detail_info,total_amount,simple_info from semi_product where pno=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(pno));
			rs=pstmt.executeQuery();
			if(rs.next()){
					pvo=new ProductVO();
					pvo.setPno(rs.getInt(1));
					pvo.setPname(rs.getString(2));
					pvo.setPrice(rs.getInt(3));
					pvo.setDetail_info(rs.getString(4));
					pvo.setTotal_amount(rs.getInt(5));
					pvo.setSimple_info(rs.getString(6));
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
	public void updateProduct(ProductVO pvo) throws SQLException{
		Connection con=null;
		PreparedStatement pstmt=null;
		try{
			con=DataSourceManager.getInstance().getDataSource().getConnection();
			String sql="update semi_product set pname=?,price=?, total_amount=?, simple_info=? where pno=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, pvo.getPname());
			pstmt.setInt(2, pvo.getPrice());
			pstmt.setInt(3,pvo.getTotal_amount());
			pstmt.setString(4, pvo.getSimple_info());
			//pstmt.setString(5, pvo.getDetail_info());
			pstmt.setInt(5, pvo.getPno());
			pstmt.executeUpdate();
			System.out.println(pvo+"55674");
		}finally{
			closeAll(pstmt, con);
		}
	}
	//id에 따른 전체 거래정보가져오기
	public ArrayList<TransactionDTO> getTransactionInfo(String id) throws SQLException {
		ArrayList<TransactionDTO> transactionList=new ArrayList<TransactionDTO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			con = DataSourceManager.getInstance().getDataSource().getConnection();
			/*
			 * select t.tno,t.pno,p.pname, t.amount,t.tdate,t.pro_state 
				from transaction t, semi_product p
				where t.pno=p.pno and buyer_id='java' order by tno desc;
			 */
			StringBuilder sql=new StringBuilder();
			sql.append("select t.tno,t.pno,p.pname,p.price,p.simple_info, t.amount,t.tdate,t.pro_state ");
			sql.append("from transaction t, semi_product p ");
			sql.append("where t.pno=p.pno and buyer_id=? order by tno desc");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			while(rs.next()){
				TransactionDTO tdto= new TransactionDTO();
				tdto.setTno(rs.getInt("tno"));
				tdto.setTdate(rs.getString("tdate"));
				tdto.setAmount(rs.getInt("amount"));
				tdto.setPro_state(rs.getString("pro_state"));
				ProductVO pvo=new ProductVO();
				pvo.setPno(rs.getInt("pno"));
				pvo.setPname(rs.getString("pname"));
				pvo.setPrice(rs.getInt("price"));
				pvo.setSimple_info(rs.getString("simple_info"));
				tdto.setPvo(pvo);
				transactionList.add(tdto);
			}
		}finally{
			closeAll(rs, pstmt, con);
		}
		return transactionList;
	}
	//거래번호로 상세 거래정보찾기
	public TransactionDTO findTransactionInfoByTno(int tno) throws SQLException {
		TransactionDTO tdto=null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			con = DataSourceManager.getInstance().getDataSource().getConnection();
			/*
			 * select t.tno, t.pno, p.pname,p.price,p.simple_info, t.amount, t.tdate, t.pro_state 
				from transaction t, semi_product p 
				where t.pno=p.pno and t.tno=1 
			 */
			StringBuilder sql=new StringBuilder();
			sql.append("select t.tno, t.pno, p.pname,p.price,p.simple_info, t.amount, t.tdate, t.pro_state ");
			sql.append("from transaction t, semi_product p ");
			sql.append("where t.pno=p.pno and t.tno=? ");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, tno);
			rs=pstmt.executeQuery();
			if(rs.next()){
				tdto=new TransactionDTO();
				ProductVO pvo = new ProductVO();
				tdto.setTno(rs.getInt("tno"));
				pvo.setPno(rs.getInt("pno"));
				pvo.setPname(rs.getString("pname"));
				pvo.setPrice(rs.getInt("price"));
				pvo.setSimple_info(rs.getString("simple_info"));
				tdto.setPvo(pvo);
				tdto.setAmount(rs.getInt("amount"));
				tdto.setPro_state(rs.getString("pro_state"));
				tdto.setTdate(rs.getString("tdate"));
			}
		}finally{
			closeAll(rs, pstmt, con);
		}
		return tdto;
	}
    //거래번호로 배송정보 불러오기
	public DeliveryVO findDeliveryInfoByTno(int tno) throws SQLException {
		DeliveryVO dvo=null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			con = DataSourceManager.getInstance().getDataSource().getConnection();
			/*
			 * select t.tno, d.receiver, d.destination,d.contact 
				from delivery d, transaction t
				where t.tno=d.tno and t.tno=1 ;
			 */
			StringBuilder sql=new StringBuilder();
			sql.append("select t.tno, d.receiver, d.destination,d.contact ");
			sql.append("from delivery d, transaction t ");
			sql.append("where t.tno=d.tno and t.tno=?");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, tno);
			rs=pstmt.executeQuery();
			if(rs.next()){
				dvo=new DeliveryVO();
				dvo.setTno(rs.getInt("tno"));
				dvo.setReceiver(rs.getString("receiver"));
				dvo.setDestination(rs.getString("destination"));
				dvo.setContact(rs.getString("contact"));
			}
		}finally{
			closeAll(rs, pstmt, con);
		}
		return dvo;
	}
	//입금대기목록 가져오기
	public ArrayList<OrderVO> getDepositList(String maker_id,String pro_state) throws SQLException {
		ArrayList<OrderVO> orderStateList=new ArrayList<OrderVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			con = DataSourceManager.getInstance().getDataSource().getConnection();
			/*
			 * select row_number() over(order by a.tdate asc)as rnum,
			 * a.pno,a.pname,a.price*a.amount,a.tdate,a.buyer_id,b.buyer_id,a.pro_state from(
			 * select p.pno,p.pname,p.price,t.amount,t.tdate,t.buyer_id,t.pro_state
			 * * from TRANSACTION where pro_state='입금대기' )t, semi_product p
			 * where t.tno=p.pno and p.maker_id='java' )a, buyer b where
			 * a.buyer_id=b.buyer_id;
			 */
			StringBuilder sql=new StringBuilder();
			sql.append("select row_number() over(order by a.tdate asc)as rnum, ");
			sql.append("a.pno,a.pname,a.price*a.amount as total_price,a.tno,a.tdate,a.buyer_id,b.buyer_tel,a.pro_state from( ");
			sql.append("select p.pno,p.pname,p.price,t.amount,t.tno,t.tdate,t.buyer_id,t.pro_state from( select ");
			sql.append("* from TRANSACTION where pro_state=? )t, semi_product p ");
			sql.append("where t.tno=p.pno and p.maker_id=? )a, buyer b where ");
			sql.append("a.buyer_id=b.buyer_id");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, pro_state);
			pstmt.setString(2, maker_id);
			rs=pstmt.executeQuery();
			while(rs.next()){
					OrderVO ovo=new OrderVO();
					ovo.setOno(rs.getInt("rnum"));
					ovo.setPno(rs.getInt("pno"));
					ovo.setPname(rs.getString("pname"));
					ovo.setTotal_price(rs.getString("total_price"));
					ovo.setTno(rs.getInt("tno"));
					ovo.setTdate(rs.getString("tdate"));
					ovo.setBuyer_id(rs.getString("buyer_id"));
					ovo.setBuyer_tel(rs.getString("buyer_tel"));
					ovo.setPro_state(rs.getString("pro_state"));
					orderStateList.add(ovo);
			}
		}finally{
			closeAll(rs, pstmt, con);
		}
		return orderStateList;
	}

	public void updateChange(int tno, String update_state) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try{
			con = DataSourceManager.getInstance().getDataSource().getConnection();
			/*
			 * update TRANSACTION set pro_state = '결제완료' where tno=7;
			 */
			String sql="update TRANSACTION set pro_state = ? where tno=?";
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, update_state);
			pstmt.setInt(2, tno);
			pstmt.executeUpdate();
			
		}finally{
			closeAll(null,pstmt, con);
		}
	}

}
