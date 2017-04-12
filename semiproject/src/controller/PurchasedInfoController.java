package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BuyerVO;
import model.MockDAO;
import model.ProductVO;
import model.TransactionDTO;

public class PurchasedInfoController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String tno=request.getParameter("tno"); //거래번호
		String no=request.getParameter("pno"); //상품번호
		int pno=Integer.parseInt(no);
		int amount=Integer.parseInt(request.getParameter("amount"));
		
		ProductVO pvo=MockDAO.getInstance().findProductByNo(no);//상품번호에 해당하는 상품정보를 pvo로 받음
		
		HttpSession session=request.getSession();
		BuyerVO mvo = (BuyerVO)session.getAttribute("mvo");
		
		TransactionDTO tdto=new TransactionDTO();
		tdto.setPvo(pvo);
		tdto.setAmount(amount);
		MockDAO.getInstance().showPurchasedProduct(mvo.getBuyer_id(),tdto); //주문정보를 거래테이블에 저장시킴
		MockDAO.getInstance().declineTotalCount(pno,amount); //주문번호에 해당되는 상품의 재고수량을 주문수량 줄임
		
		request.setAttribute("tdto", tdto);
		return "cart/purchase_result.jsp";
	}

}
