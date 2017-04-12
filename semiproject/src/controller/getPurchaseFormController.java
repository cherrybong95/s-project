package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BuyerVO;
import model.ProductVO;

public class getPurchaseFormController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("getPurchaseFormController 실행");
		String pno=request.getParameter("pno");
		HttpSession session=request.getSession(false);
		BuyerVO mvo = (BuyerVO)session.getAttribute("mvo");
		ArrayList<ProductVO> purchaseList=null;
		if(session != null && mvo != null){
			purchaseList = mvo.getCart().getPurchaseList(Integer.parseInt(pno));
		}

		request.setAttribute("purchaseList", purchaseList);
		//request.setAttribute("amount", amount);
		return "/cart/purchaseForm.jsp";
	}

}
