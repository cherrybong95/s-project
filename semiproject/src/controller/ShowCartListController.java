package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BuyerVO;
import model.MockDAO;
import model.ProductVO;

/**
 * 장바구니 내역을 보여주는 컨트롤러
 * @author KOSTA
 *
 */
public class ShowCartListController implements Controller {

   @Override
   public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
     String path="index.jsp";
     
      HttpSession session=request.getSession(false);
      BuyerVO mvo = (BuyerVO) session.getAttribute("mvo");
      if(session !=null && mvo!=null){
         ArrayList<ProductVO> list=mvo.getCart().getProductList();
         
         session.setAttribute("mvo", mvo);
         request.setAttribute("list",list);
         
         
         path="/cart/showCartList.jsp";
      }
      return path;
   }

}