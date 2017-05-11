package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MockDAO {
	private static MockDAO instance=new MockDAO();
	public static MockDAO getInstance(){return instance;}
	

	//--------------------상품넘버로 상품찾기
	public ProductVO findProductByNo(String pno) throws SQLException{
		ProductVO pvo = null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try{
			con=DataSourceManager.getInstance().getDataSource().getConnection();
			String sql="select pno,pname,price,detail_info,total_amount,simple_info,maker_id from semi_product where pno=?";
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
					pvo.setMaker_id(rs.getString("maker_id"));
				}
			}finally{
				closeAll(rs,pstmt,con);
			}
		return pvo;
	}
	/**
	 * 상품 넘버(pno)로 상품을 찾고
	 *  찾은 상품에 입력받은 수량을 setting한다.
	 * 
	 * @param pno
	 * @param amount
	 * @return
	 * @throws SQLException
	 */
	public ProductVO findProductByNo(String pno, int amount) throws SQLException{
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
					pvo.setTotal_amount(amount);

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
	/**
	 * buyer_id에 해당하는 전체 거래정보중에서
	 * 현재 페이지에 해당하는 거래정보 목록만 검색하여 반환한다.
	 * 
	 * @param id
	 * @param pb
	 * @return
	 * @throws SQLException
	 */
	public ArrayList<TransactionDTO> getTransactionInfo(String id, PagingBean pb) throws SQLException {
		ArrayList<TransactionDTO> transactionList=new ArrayList<TransactionDTO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			con = DataSourceManager.getInstance().getDataSource().getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append("select t.rnum, t.tno,t.pro_state,t.tdate,t.amount,p.pno,p.pname,p.price,p.simple_info,p.detail_info,t.amount*p.price as total_price from(  ");
			sql.append("select row_number() over(order by tdate desc) as rnum, tno,pno,pro_state,tdate,amount  from transaction where buyer_id=? ");
			sql.append(")t, semi_product p where t.pno=p.pno and rnum between ? and ? order by rnum asc");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			pstmt.setInt(2, pb.getStartRowNumber());
			pstmt.setInt(3, pb.getEndRowNumber());
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
				pvo.setDetail_info(rs.getString("detail_info"));
				tdto.setPvo(pvo);
				transactionList.add(tdto);
			}
		}finally{
			closeAll(rs, pstmt, con);
		}
		return transactionList;
	}
	/**
	 * 거래번호로
	 * 거래테이블의 상품번호와 상품테이블의 상품번호를 JOIN하여 
	 * 거래정보(거래번호, 상품번호, 거래 날짜, 거래수량, 거래 상태)와 상품정보를
	 * TransactionDTO객체로 반환한다.
	 * @param tno
	 * @return
	 * @throws SQLException
	 */
	public TransactionDTO findTransactionInfoByTno(int tno) throws SQLException {
		TransactionDTO tdto=null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String maker_id="";
		try{
			con = DataSourceManager.getInstance().getDataSource().getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append("select t.tno, t.pno, p.pname,p.price,p.simple_info,p.detail_info, t.amount, t.tdate, t.pro_state,p.maker_id ");
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
				pvo.setDetail_info(rs.getString("detail_info"));
				tdto.setPvo(pvo);
				tdto.setAmount(rs.getInt("amount"));
				tdto.setPro_state(rs.getString("pro_state"));
				tdto.setTdate(rs.getString("tdate"));
				maker_id=rs.getString("maker_id");
			}
			pstmt.close();
			rs.close();
			String sql2="select maker_account from maker where maker_id=?";
			pstmt=con.prepareStatement(sql2);
			pstmt.setString(1, maker_id);
			rs=pstmt.executeQuery();
			if(rs.next()){
				tdto.setMaker_account(rs.getString(1));
			}
		}finally{
			closeAll(rs, pstmt, con);
		}
		return tdto;
	}
    /**
     * 거래번호로 거래테이블과 배송테이블을 JOIN하여
     * 거래번호에 해당하는 배송정보를 반환한다.
     * @param tno
     * @return
     * @throws SQLException
     */
	public DeliveryVO findDeliveryInfoByTno(int tno) throws SQLException {
		DeliveryVO dvo=null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			con = DataSourceManager.getInstance().getDataSource().getConnection();
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
	/**
	 * 판매자 아이디에 해당하는 주문목록중에서
	 * 상태명에 해당하는 주문목록을 반환한다.
	 * ex) 입금대기상태목록, 결제대기상태목록
	 * @param maker_id
	 * @param pro_state
	 * @return
	 * @throws SQLException
	 */
	public ArrayList<OrderVO> getDepositList(String maker_id,String pro_state) throws SQLException {
		ArrayList<OrderVO> orderStateList=new ArrayList<OrderVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			con = DataSourceManager.getInstance().getDataSource().getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append("select row_number() over(order by a.tdate asc)as rnum, a.pno,a.pname,a.price*a.amount as total_price,a.tno,a.tdate,a.buyer_id,b.buyer_tel,a.pro_state  ");
			sql.append("from( select p.pno,p.pname,p.price,t.amount,t.tno,t.tdate,t.buyer_id,t.pro_state ");
			sql.append("from( select * from TRANSACTION where pro_state=? ");
			sql.append(")t, semi_product p where t.pno=p.pno and p.maker_id=? )a, buyer b ");
			sql.append("where a.buyer_id=b.buyer_id ");
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
	/**
	 * 거래번호에 해당하는 주문상태를 변경한다.
	 * @param tno
	 * @param update_state
	 * @throws SQLException
	 */
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
	
	/**
	 * 상품을 주문한 고객의 기존 정보를 가져오는 메서드
	 * @param buyer_id : 구매자 아이디
	 * @return
	 * @throws SQLException
	 */
	public BuyerVO getMemberInfo(String buyer_id) throws SQLException {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		BuyerVO bvo=null;
		
		try{
			con=DataSourceManager.getInstance().getDataSource().getConnection();
			String sql="select buyer_name,buyer_add,buyer_tel from buyer where buyer_id=?"; //구매자 아이디에 해당되는 회원 정보를 가져온다.
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, buyer_id);
			rs=pstmt.executeQuery();
			
			if(rs.next())
				bvo=new BuyerVO(rs.getString(1),rs.getString(2),rs.getString(3)); //이름,주소,전화번호
				
		}finally {
			closeAll(rs, pstmt, con);
		}
		
		return bvo;
	}
	
	/**
	 * 기존정보가 아닌 새롭게 입력된 배송정보를 거래번호에 매칭하여 입력시키는 메서드.
	 * @param receiver : 수령인
	 * @param destination : 수령지
	 * @param contact : 수령인 연락처
	 * @param tno : 해당 거래번호
	 * @throws SQLException
	 */
	public void addDeliveryInfo(String receiver,String destination,String contact,int tno) throws SQLException {
		Connection con=null;
		PreparedStatement pstmt=null;

		try{
			con=DataSourceManager.getInstance().getDataSource().getConnection();
			
			String sql="insert into delivery(tno,receiver,destination,contact) values(?,?,?,?)"; //배송테이블에 거래번호,수령인정보를 저장한다.
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, tno);
			pstmt.setString(2, receiver);
			pstmt.setString(3, destination);
			pstmt.setString(4, contact);
			pstmt.executeUpdate();
		}finally {
			closeAll(pstmt, con);
		}
	}
	
	/**
	 * 주문 완료 후 주문 완료 리스트에 올라가는 메서드
	 * @param pno : 상품번호 
	 * @param amount : 구매자가 주문한 상품의 수량
	 * @param buyer_id : 구매자 아이디
	 * @return
	 * @throws SQLException
	 */
	public int purchaseProduct(int pno,int amount,String buyer_id) throws SQLException {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int tno=0; //현재 거래번호를 저장할 변수
		try{
			con=DataSourceManager.getInstance().getDataSource().getConnection();

			String sql="select tno_seq.nextval from dual"; //배송테이블에 현재 거래번호를 넘기기 위한 sql문
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()){
				tno=rs.getInt(1);
			}
			pstmt.close();
			
		    sql="insert into transaction(tno,pno,amount,tdate,buyer_id) values(?,?,?,sysdate,?)"; //거래테이블에 거래정보를 등록한다.
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, tno);
			pstmt.setInt(2, pno);
			pstmt.setInt(3, amount);
			pstmt.setString(4, buyer_id);
			pstmt.executeUpdate();
		}finally {
			closeAll(rs,pstmt, con);
		}
		return tno;
	}
	
	
	
	/**
	 * 주문한 상품을 보여주는 메서드.
	 * @param pno : 상품 번호
	 * @param pname : 상품 이름
	 * @param price : 상품 단가
	 * @param amount : 상품 주문 수량
	 * @param buyer_id : 구매자 아이디
	 * @return
	 * @throws SQLException
	 */
	public void showPurchasedProduct(String buyer_id,TransactionDTO tdto) throws SQLException {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		//TransactionDTO tdto = null;

		try{
			con=DataSourceManager.getInstance().getDataSource().getConnection();
			StringBuilder sql=new StringBuilder();
			
			//거래테이블과 배송테이블의 조인을 통해
			//거래 시간의 내림차순으로 출력하고 전달받은 구매자 아이디에 해당되는
			//거래번호,거래날짜,수령인,수령인 연락처,수령지,거래상태를 출력해줌
			sql.append("select t.tno,t.tdate,d.receiver,d.contact,d.destination,t.pro_state ");
			sql.append("from transaction t, delivery d where t.buyer_id=? and t.tno=d.tno order by tdate desc");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, buyer_id);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				//배송VO의 객체(dvo)를 생성하고 수령인,수령인 연락처,수령지를 저장시킨후
				DeliveryVO dvo=new DeliveryVO(); 
				dvo.setReceiver(rs.getString(3)); // = dvo.setReceiver(rs.getString("d.receiver"));
				dvo.setContact(rs.getString(4)); // = dvo.setContact(rs.getString("d.contact"));
				dvo.setDestination(rs.getString(5));
				
				//거래DTO의 객체에 거래번호,거래날짜,배송vo객체와 거래상태를 저장시킴.
				tdto.setTno(rs.getInt(1)); // = tdto.setTno(rs.getInt("t.tno"));
				tdto.setTdate(rs.getString(2)); // = tdto.setTdate(rs.getString("t.tdate"));
				tdto.setDelivery(dvo);
				tdto.setPro_state(rs.getString(6));
			}
		}finally {
			closeAll(pstmt, con);
		}
	}

	/**
	 * 구매자가 상품을 주문하면 판매되고있는 상품의 재고량이 줄어드는 메서드
	 * @param pno : 상품 번호
	 * @param amount : 상품의 총 재고
	 * @throws SQLException
	 */
	public void declineTotalCount(int pno,int amount) throws SQLException{
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try{
			con=DataSourceManager.getInstance().getDataSource().getConnection();
			String sql="update semi_product set total_amount=total_amount-? where pno=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, amount);
			pstmt.setInt(2, pno);
			pstmt.executeUpdate();
			
		}finally{
			closeAll(rs, pstmt, con);
		}
	}
	
	/**
	 * buyer_id에 해당하는 
	 * 전체 거래정보의 수를 가져온다.
	 * @param buyer_id
	 * @return
	 * @throws SQLException
	 */
	public int getTotalPurchaseNo(String buyer_id) throws SQLException {
		int totalPurchaseNo=0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			con = DataSourceManager.getInstance().getDataSource().getConnection();
			String sql="select count(*) from transaction where buyer_id=? ";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, buyer_id);
			rs=pstmt.executeQuery();
			if(rs.next()){
				totalPurchaseNo=rs.getInt(1);
			}
		}finally{
			closeAll(rs, pstmt, con);
		}
		return totalPurchaseNo;
	}
	
	//장바구니에서 수량 수정
	public void updateAmount(String buyer_id, int pno, int amount) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try{
			con = DataSourceManager.getInstance().getDataSource().getConnection();
			/*
			 *update cart set amount='3' where buyer_id='java' and pno='6';
			 */
			String sql="update cart set amount=? where buyer_id=? and pno=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, amount);
			pstmt.setString(2, buyer_id);
			pstmt.setInt(3, pno);
			pstmt.executeUpdate();
		}finally{
			closeAll(null,pstmt, con);
		}
		
	}
	
	/**
	 * tdto에 판매자 계좌번호를 저장시키기 위함( PurchasedInfoController 에서 사용됨 )
	 * @param maker_id : 판매자 아이디
	 * @param tdto : 거래DTO(VO)타입으로 상품정보와 주문한 수량을 저장시킨 객체
	 * @throws SQLException
	 */
		public void getMakerAccountById(String maker_id, TransactionDTO tdto) throws SQLException {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			try{	
				con=DataSourceManager.getInstance().getDataSource().getConnection();
				
				String sql2="select maker_account from maker where maker_id=?"; //maker테이블에서 판매자 아이디에 해당되는 판매자 계좌정보를 보여줌.
				pstmt=con.prepareStatement(sql2);
				pstmt.setString(1, maker_id);
				rs=pstmt.executeQuery();
				if(rs.next()){
					tdto.setMaker_account(rs.getString(1)); //tdto에 판매자 계좌정보를 저장한다.
				}
		}finally{
			closeAll(rs, pstmt, con);
		}
		
		}

}
