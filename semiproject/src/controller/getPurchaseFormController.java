package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BuyerVO;
import model.MockDAO;
import model.ProductVO;

public class getPurchaseFormController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("getPurchaseFormController 실행");
		String pno=request.getParameter("pno");
		String flag = request.getParameter("flag");
		String amount=request.getParameter("amount");
		HttpSession session=request.getSession(false);
		BuyerVO mvo = (BuyerVO)session.getAttribute("mvo");
		ArrayList<ProductVO> purchaseList=new ArrayList<ProductVO>();
		if (session != null  && mvo != null) {
			if (flag != null) { // 구매로 바로왔을 경우
				ProductVO pvo=MockDAO.getInstance().findProductByNo(pno);
				System.out.println(pno);
				pvo.setTotal_amount(Integer.parseInt(amount));
				purchaseList.add(pvo);
			} else {
				purchaseList = mvo.getCart().getPurchaseList(Integer.parseInt(pno)); // 장바구니에서 주문리스트 가져옴
			}
		}
		System.out.println(purchaseList.toString());
		request.setAttribute("purchaseList", purchaseList);
		//request.setAttribute("amount", amount);
		return "/cart/purchaseForm.jsp";
	}

}
