package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MockDAO;
import model.ProductVO;

public class getPurchaseFormController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("getPurchaseFormController 실행");
		String pno=request.getParameter("pno");
		String amount=request.getParameter("amount");
		System.out.println(amount);
		
		ArrayList<ProductVO> vo=new ArrayList<ProductVO>();
		
		ProductVO vo2=MockDAO.getInstance().findProductByNo(pno);
		vo.add(vo2);
		
		request.setAttribute("vo", vo);
		request.setAttribute("amount", amount);
		return "/cart/purchaseForm.jsp";
	}

}
