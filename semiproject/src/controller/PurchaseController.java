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
		System.out.println("구매(Purchase) 컨트롤러 시작");
		//상품정보 받아옴
		String no=request.getParameter("pno"); //상품번호
		int pno=Integer.parseInt(no);
		int amount=Integer.parseInt(request.getParameter("amount")); //수량
		System.out.println(amount);
		//배송정보 입력받아옴
		String receiver=request.getParameter("receiver");//수령인
		String destination=request.getParameter("destination");//수령지
		String contact=request.getParameter("contact");//전화번호

		int tno=0; //거래번호 변수
		
		HttpSession session=request.getSession();
		BuyerVO mvo = (BuyerVO)session.getAttribute("mvo");
		
		if(session!=null&mvo!=null){
			//거래 테이블에 등록시키고 현재 거래번호를 반환함
			tno=MockDAO.getInstance().purchaseProduct(pno,amount,mvo.getBuyer_id());
			//거래번호에 매칭하도록 배송정보를 저장함
			MockDAO.getInstance().addDeliveryInfo(receiver, destination, contact, tno);
			if(mvo.getCart().findIndexByNo(pno)!=-1){
				mvo.getCart().removeProduct(pno);
				}
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