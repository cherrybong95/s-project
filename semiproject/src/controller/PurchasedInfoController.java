package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BuyerVO;
import model.MockDAO;
import model.ProductVO;
import model.TransactionDTO;

/**
 * 주문을 하고난 뒤 확정된 주문상품,배송정보를 한번 더 보여주기 위한 컨트롤러
 * @author KOSTA
 *
 */
public class PurchasedInfoController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//확정된 주문정보들을 받아옴
		String tno=request.getParameter("tno"); //거래번호
		String no=request.getParameter("pno"); //상품번호(문자)
		int pno=Integer.parseInt(no); //상품번호(숫자)
		int amount=Integer.parseInt(request.getParameter("amount")); //주문한 수량
		
		//상품번호에 해당하는 상품정보를 pvo로 받음
		ProductVO pvo=MockDAO.getInstance().findProductByNo(no);
		
		//BuyerVO타입의 구매자 세션을 받아옴.
		HttpSession session=request.getSession();
		BuyerVO mvo = (BuyerVO)session.getAttribute("mvo");
		
		//거래DTO(VO)타입으로 상품정보와 주문한 수량을 저장시킨 객체 dto를 생성한다.
		TransactionDTO tdto=new TransactionDTO(); 
		tdto.setPvo(pvo);
		tdto.setAmount(amount);
		
		MockDAO.getInstance().getMakerAccountById(pvo.getMaker_id(),tdto); //판매자 계좌번호를 거래DTO(VO) 객체에 저장
		MockDAO.getInstance().showPurchasedProduct(mvo.getBuyer_id(),tdto); //주문정보를 거래DTO(VO) 객체에 저장
		MockDAO.getInstance().declineTotalCount(pno,amount); //주문번호에 해당되는 상품의 재고수량을 주문수량 줄임
		
		request.setAttribute("tdto", tdto); //request영역에 tdto를 set시킴
		return "cart/purchase_result.jsp"; //확정된 주문상품,배송정보를 한번 더 보여주기 위한 view
	}

}
