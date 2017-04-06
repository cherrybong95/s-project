package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberVO;
import model.MockDAO;
import model.ProductVO;

public class ShowCartListController implements Controller {

   @Override
   public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      MemberVO mvo=MockDAO.getInstance().createMember();
      HttpSession session=request.getSession(false);
      if(session !=null && mvo!=null){
         ArrayList<ProductVO> list=mvo.getCart().getProductList();
         System.out.println(list);
         session.setAttribute("mvo", mvo);
         request.setAttribute("list",list);
      }
      return "/cart/showCartList.jsp";
   }

}