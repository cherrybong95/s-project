package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BuyerVO;
import model.MockDAO;
import model.ProductVO;

public class AddCartController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String path = "index.jsp";
		
		// 나중에 세션 존재하는지 확인하고 세션 네임 확인해서 mvo에 추가하면 됨!
		String amount=request.getParameter("amount");
		String pno = request.getParameter("pno");
		HttpSession session = request.getSession(false);
		BuyerVO mvo = (BuyerVO) session.getAttribute("mvo"); //세션으로부터 buyer 회원 정보를 받아온다.
		if(session !=null && mvo!=null) { //정보가 존재한다면
			//상품번호로 상품을 찾고, 상품에 수량을 setting해서 받아온다.
			ProductVO pvo = MockDAO.getInstance().findProductByNo(pno, Integer.parseInt(amount)); 
			//상품을 카트에 추가한다.
			mvo.getCart().addProduct(pvo);
			path = "redirect:cart/addCart_result.jsp?pno="+pno;
		}
		return path;
	}
}
