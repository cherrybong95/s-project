package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberVO;
import model.MockDAO;
import model.ProductVO;

public class AddCartController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String path="index.jsp";
		//나중에 세션 존재하는지 확인하고 세션 네임 확인해서 mvo에 추가하면 됨!
			String pno=request.getParameter("pno"); 
			MemberVO mvo = MockDAO.getInstance().createMember(); //세션으로부터 회원정보를 받아온다.
			ProductVO pvo=MockDAO.getInstance().findProductByNo(pno); //상품번호로 상품을 찾음
			System.out.println(pvo);
			mvo.getCart().addProduct(pvo); //카트에 추가한다.
			System.out.println(mvo.getCart().getProductList());
			path="redirect:cart/addCart_result.jsp";
		return path;
	}
}
