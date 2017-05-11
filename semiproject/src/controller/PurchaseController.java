package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BuyerVO;
import model.MockDAO;
import model.ProductVO;
import model.TransactionDTO;

/**
 * 장바구니에 담은 상품들을 주문하는 창에서 주문완료 버튼을 눌렀을 때 처리하는 컨트롤러.
 * 거래 테이블에 거래 정보를 담고 거래번호에 매칭되도록 기존 배송정보 혹은 새로 입력받은 정보를 저장시킨다.
 * @author KOSTA
 *
 */
public class PurchaseController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("구매(Purchase) 컨트롤러 시작");
		
		//상품정보 받아옴
		String no=request.getParameter("pno"); //상품번호(문자)
		int pno=Integer.parseInt(no); //상품번호(숫자)
		int amount=Integer.parseInt(request.getParameter("amount")); //사용자가 주문한 수량

		//배송정보 입력받아옴
		String receiver=request.getParameter("receiver");//수령인
		String destination=request.getParameter("destination");//수령지
		String contact=request.getParameter("contact");//전화번호

		int tno=0; //거래번호 변수
		
		//BuyerVO타입의 구매자 세션을 받아옴.
		HttpSession session=request.getSession();
		BuyerVO mvo = (BuyerVO)session.getAttribute("mvo");
		
		if(session!=null&mvo!=null){//세션과 구매자 정보가 있을 때에만
			tno=MockDAO.getInstance().purchaseProduct(pno,amount,mvo.getBuyer_id()); //거래 테이블에 등록시키고 현재 거래번호를 반환함
			MockDAO.getInstance().addDeliveryInfo(receiver, destination, contact, tno); //거래번호에 매칭하도록 배송정보를 저장함
			if(mvo.getCart().findIndexByNo(pno)!=-1) //일치되는 요소가 있을 때
				mvo.getCart().removeProduct(pno); //카트에서 삭제
			}
		return "redirect:DispatcherServlet?command=purchasedInfo&tno="+tno+"&pno="+no+"&amount="+amount;
		//한번만 구매할 수 있도록 redirect방식을 이용해서 주문한 내역을 보여주는 페이지로 넘어간다.
		//이때, 거래번호와 상품정보, 수량을 실어 보낸다.
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