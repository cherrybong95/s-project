package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BuyerVO;
import model.MockDAO;
import model.ProductVO;
import model.TransactionDTO;

public class PurchaseController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("Purchase 컨트롤러 시작");
		//상품정보 받아옴
		String no=request.getParameter("pno"); //상품번호
		int pno=Integer.parseInt(no);
		int amount=Integer.parseInt(request.getParameter("amount")); //수량
		
		//배송정보 입력받아옴
		String receiver=request.getParameter("receiver");//수령인
		String destination=request.getParameter("destination");//수령지
		String contact=request.getParameter("contact");//전화번호
		System.out.println("수령인"+receiver);
		System.out.println(destination);
		System.out.println(contact);
		
		int tno=0; //거래번호 변수
		
		HttpSession session=request.getSession();
		BuyerVO mvo = (BuyerVO)session.getAttribute("mvo");
		
		if(session!=null&mvo!=null){
			System.out.println(mvo.getBuyer_name()+"님+"+pno+"상품+"+amount+"개 구매하기 완료!");

			//거래 테이블에 등록시키고 현재 거래번호를 반환함
			tno=MockDAO.getInstance().purchaseProduct(pno,amount,mvo.getBuyer_id());
			System.out.println("머붙이라고"+tno);
			
			//상품번호에 해당하는 상품정보를 받아옴
		//	ProductVO pvo=MockDAO.getInstance().findProductByNo(no);
			
			//거래번호에 매칭하도록 배송정보를 저장함
			MockDAO.getInstance().addDeliveryInfo(receiver, destination, contact, tno);
			System.out.println("배송정보 등록완료");
			
			//상품을 주문하고 나서 거래테이블에 등록됨.
			//System.out.println("등록된 상품조회: "+pvo);
			
			//상품을 주문하고 나서 거래테이블에 등록된 것을 보여줌
			
			
			}
		return "redirect:DispatcherServlet?command=purchasedInfo&tno="+tno+"&pno="+no+"&amount="+amount;
	}
}


/*
■ 2차 구현 - 체크된 정보 배열로 받기
	ArrayList<Integer> checkedNumArr=new ArrayList<Integer>();

	for(in2t i=0;i<checkedNumArr.size();i++)
		checkedNumArr.add(Integer.parseInt(checkedNum.split(",")));
		
	HttpSession session=request.getSession();
	BuyerVO mvo = (BuyerVO)session.getAttribute("mvo");
		
	for(in2t i=0;i<checkedNumArr.length;i++){
	if(session!=null&mv2o!=null){
		ArrayList<ProductVO> checkedProductlist=mvo.getCart().checkedProductList(checkedNumArr[i].split(","), price, amount);
	
	if(session!=null&mvo!=null){
		JSONArray jsonArray=new JSONArray();
*/